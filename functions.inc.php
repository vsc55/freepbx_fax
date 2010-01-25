<?php 
/* $Id */

function fax_applyhooks() {
	global $currentcomponent;
	// Add the 'process' function - this gets called when the page is loaded, to hook into 
	// displaying stuff on the page.
	$currentcomponent->addguifunc('fax_configpageload');
}

// This is called before the page is actually displayed, so we can use addguielem(). draws hook on the extensions/users page
function fax_configpageload() {
	global $currentcomponent;
	global $display;
	$extdisplay=isset($_REQUEST['extdisplay'])?$_REQUEST['extdisplay']:'';
	$extensions=isset($_REQUEST['extensions'])?$_REQUEST['extensions']:'';
	$users=isset($_REQUEST['users'])?$_REQUEST['users']:'';
	
	if ($display == 'extensions' || $display == 'users') {
		if($extdisplay!=''){
			$fax=fax_get_user($extdisplay);
			$faxenabled=$fax['faxenabled'];
			$faxemail=$fax['faxemail'];
		}//get settings in to variables
		$section = _('Fax');
		$toggleemail='if($(this).attr(\'checked\')){$(\'[id^=fax]\').removeAttr(\'disabled\');}else{$(\'[id^=fax]\').attr(\'disabled\',\'true\');$(this).removeAttr(\'disabled\');}';
		//check for fax prequsits, and alert the user if something is amiss
		$fax=fax_detect();
		if(!$fax['module']){//missing modules
			$currentcomponent->addguielem($section, new gui_label('error',_('<font color="red">'._('ERROR: Fax modules missing! Fax-related dialplan will <strong>NOT</strong> be generated! Please contact your vendor for more information.').'</font>')));
		}elseif($fax['module'] == 'res_fax' && $fax['license'] < 1){//missing licese
			$currentcomponent->addguielem($section, new gui_label('error',_('<font color="red">'._('ERROR: Fax license missing! Fax-related dialplan will <strong>NOT</strong> be generated! Please contact your vendor for more information.').'</font>')));
		}
		
		$currentcomponent->addguielem($section, new gui_checkbox('faxenabled',$faxenabled,_('Enabled'), _('Enable this user to recive faxes'),'true','',$toggleemail));
		$currentcomponent->addguielem($section, new gui_textbox('faxemail', $faxemail, _('Fax Email'), _('Enter an email address where faxes sent to this extension will be delivered.'), '!isEmail()', _('Please Enter a valid email address for fax delivery.'), TRUE, '', ($faxenabled == 'true')?'':'true'));
	}
}

function fax_configpageinit($pagename) {
	global $currentcomponent;
	// On a 'new' user, 'tech_hardware' is set, and there's no extension. 
	if (($_REQUEST['display'] == 'users'||$_REQUEST['display'] == 'extensions')&& isset($_REQUEST['extdisplay']) && $_REQUEST['extdisplay'] != '') {
	$currentcomponent->addprocessfunc('fax_configpageload', 1);
	$currentcomponent->addprocessfunc('fax_configprocess', 1);
	}
}

//prosses recived arguments
function fax_configprocess() {
	$action = isset($_REQUEST['action'])?$_REQUEST['action']:null;
	$ext = isset($_REQUEST['extdisplay'])?$_REQUEST['extdisplay']:$_REQUEST['extension'];
	$faxenabled = isset($_REQUEST['faxenabled'])?$_REQUEST['faxenabled']:null;
	$faxemail = isset($_REQUEST['faxemail'])?$_REQUEST['faxemail']:null;
	if ($action == 'edit'){fax_save_user($ext,$faxenabled,$faxemail);}
}

function fax_dahdi_faxdetect(){
  return true;

  //TODO Get this right
	/*
	 * kepping this always set to true for freepbx 2.7 as we cant currently properly detect this - MB
	 * 
	 */
	global $asterisk_conf;
	$faxdetect=false;
	$dadset=parse_ini_file($asterisk_conf['astetcdir'].'/'.(ast_with_dahdi()?'chan_dahdi':'zapata').'.conf');
	return (isset($dadset['faxdetect']) && ($dadset['faxdetect'] == 'incoming' || $dadset['faxdetect'] == 'both'));
}

function fax_delete_incoming($extdisplay){
	global $db;
	$opts=explode('/', $extdisplay);$extension=$opts['0'];$cidnum=$opts['1']; //set vars
	sql("DELETE FROM fax_incoming WHERE cidnum = '".$db->escapeSimple($cidnum)."' and extension = '".$db->escapeSimple($extension)."'");
}

function fax_destinations(){
	global $module_page;

	foreach (fax_get_destinations() as $row) {
		$extens[] = array('destination' => 'ext-fax,' . $row['user'] . ',1', 'description' => $row['name'].' ('.$row['user'].')', 'category' => _('Fax Recipient'));
	}
	return isset($extens)?$extens:null;
}

//check to see if any fax modules and licenses are loaded in to asterisk
function fax_detect(){
	global $amp_conf;
	global $astman;
	$fax=null;
	$appfax = $recivefax = false;//return false by default in case asterisk isnt reachable
	if ($amp_conf['AMPENGINE'] == 'asterisk' && isset($astman) && $astman->connected()) {
		//check for fax modules
		$app = $astman->send_request('Command', array('Command' => 'module show like app_fax.so'));
		if (preg_match('/1 modules loaded/', $app['data'])){$fax['module']='app_fax';}
		$response = $astman->send_request('Command', array('Command' => 'module show like app_nv_faxdetect.so'));
		if (preg_match('/1 modules loaded/', $response['data'])){$fax['module']='nv_faxdetect';}
		$recive = $astman->send_request('Command', array('Command' => 'module show like res_fax.so'));
		if (preg_match('/1 modules loaded/', $recive['data'])){$fax['module']='res_fax';}
		//get license count
		$lic = $astman->send_request('Command', array('Command' => 'fax show stats'));
		foreach(explode("\n",$lic['data']) as $licdata){
		$d=explode(':',$licdata);
		$data[trim($d['0'])]=isset($d['1'])?trim($d['1']):null;
		}
		$fax['license']=$data['Licensed Channels'];
	}
	return $fax;
}

function fax_get_config($engine){
	$fax=fax_detect();
	if($fax['module'] == 'app_fax' || $fax['module'] == 'res_fax'){ //dont continue unless we have a fax module in asterisk
		global $ext;
		global $amp_conf;
		$dests=fax_get_destinations();
		$sender_address=sql('SELECT value FROM fax_details WHERE `key` = \'sender_address\'','getRow');
		if($dests){
			$context='ext-fax';
			foreach ($dests as $row) {
				$exten=$row['user'];
				$ext->add($context, $exten, '', new ext_noop('Reciving Fax for Fax Recipient: '.$row['name'].' ('.$row['user'].'), From: ${CALLERID(all)}'));
				$ext->add($context, $exten, '', new ext_set('TO', '"'.$row['faxemail'].'"'));			
				$ext->add($context, $exten, 'receivefax', new ext_receivefax('${ASTSPOOLDIR}/fax/${UNIQUEID}.tif')); //recive fax, then email it on
			}
			$ext->add($context, 'h', '', new ext_execif('$["${TO}" != ""]','system','\'${ASTVARLIBDIR}/bin/fax-process.pl --to ${TO} --from "'.$sender_address['0'].'" --dest "${FROM_DID}" --subject "New fax from ${URIENCODE(${CALLERID(all)})}" --attachment fax_${URIENCODE(${CALLERID(number)})}.pdf --type application/pdf --file ${ASTSPOOLDIR}/fax/${UNIQUEID}.tif\''));
		}
		$ext->add('ext-did-0001', 'fax', '', new ext_goto('${FAX_DEST}'));
		$ext->add('ext-did-0002', 'fax', '', new ext_goto('${FAX_DEST}'));
		//write out res_fax.conf and res_fax_digium.conf
		fax_write_conf();
	}
  // generate ext-fax-legacy used for both legacy mode and app-fax feature code
  //
  $context='ext-fax-legacy';
  $exten = 's';
  $ext->add($context, $exten, '', new ext_noop('Reciving Fax for Fax Recipient: ${FAX_RX_EMAIL} , From: ${CALLERID(all)}'));
  $ext->add($context, $exten, 'receivefax', new ext_receivefax('${ASTSPOOLDIR}/fax/${UNIQUEID}.tif')); //recive fax, then email it on
  $ext->add($context, 'h', '', new ext_execif('$["${FAX_RX_EMAIL}" != ""]','system','\'${ASTVARLIBDIR}/bin/fax-process.pl --to ${FAX_RX_EMAIL} --from "'.$sender_address['0'].'" --dest "${FROM_DID}" --subject "New fax from ${URIENCODE(${CALLERID(all)})}" --attachment fax_${URIENCODE(${CALLERID(number)})}.pdf --type application/pdf --file ${ASTSPOOLDIR}/fax/${UNIQUEID}.tif\''));

  $modulename = 'fax';
  $fcc = new featurecode($modulename, 'simu_fax');
  $fc_simu_fax = $fcc->getCodeActive();
  unset($fcc);

  if ($fc_simu_fax != '') {
    $default_address = sql('SELECT value FROM fax_details WHERE `key` = \'FAX_RX_EMAIL\'','getRow');
    $ext->addInclude('from-internal-additional', 'app-fax'); // Add the include from from-internal
    $ext->add('app-fax', $fc_simu_fax, '', new ext_setvar('FAX_RX_EMAIL', $default_address[0]));
    $ext->add('app-fax', $fc_simu_fax, '', new ext_goto('1', 's', 'ext-fax-legacy'));
    $ext->add('app-fax', 'h', '', new ext_macro('hangupcall'));
  }
}


function fax_get_destinations(){
	global $db;
	$sql = "SELECT fax_users.user,fax_users.faxemail,users.name FROM fax_users, users where fax_users.faxenabled = 'true' and users.extension = fax_users.user";
	$results = $db->getAll($sql, DB_FETCHMODE_ASSOC);
	if(DB::IsError($results)) {
		die_freepbx($results->getMessage()."<br><br>Error selecting from fax");	
	}
	/*
	 *
	 * this may or may not work to include a system default destination
	 * Rememebr to reenable defautl destination in the gui as well
	 *	 	 	 
	//get system default fax destination
	$sql='SELECT * FROM fax_details WHERE `key` = ? OR `key` = ?';
	$system = $db->getAssoc($sql,  false, array('system_instance', 'system_fax2email'), DB_FETCHMODE_ASSOC);
	if ($system_fax2email != 'disabled'){// if system default is enabled
		if($system_fax2email == 'system'){
			$sys=array('user' => 'system', 'faxemail' => $systemfax2email, 'name' => 'System Default');
		}else{//find user, loop thru the $result of the previous fetch which lists all users/emails
			foreach($result as $res => $user){
				if ($user['user'] == $system_instance){
					$systemfax2email = $user['faxemail'];
					break;
				}
			} 
			$sys=array('user' => 'system', 'faxemail' => $systemfax2email, 'name' => 'System Default');
		}
		array_unshift($results, $sys);
	}
	*
	*
	*/
	return $results;
}

function fax_get_incoming($extension=null,$cidnum=null){
	global $db;
	if($extension !== null || $cidnum !== null){
		$sql="SELECT * FROM fax_incoming WHERE extension = ? AND cidnum = ?";
		$settings = $db->getRow($sql, array($extension, $cidnum), DB_FETCHMODE_ASSOC);
		if(isset($settings['legacy_email'])&&$settings['legacy_email']=='NULL'){$settings['legacy_email']=null;}//convert string to real value
	}else{
		$sql="SELECT fax_incoming.*, incoming.pricid FROM fax_incoming, incoming where fax_incoming.cidnum=incoming.cidnum and fax_incoming.extension=incoming.extension;";
		$settings=$db->getAll($sql, DB_FETCHMODE_ASSOC);
	}
	return $settings;
}

function fax_get_user($faxext){
	global $db;
	if($faxext){
		$sql="SELECT * FROM fax_users WHERE user = '".$faxext."'";
		$settings = $db->getRow($sql, DB_FETCHMODE_ASSOC);
	}else{
		$sql="SELECT * FROM fax_users";
		$settings = $db->getAll($sql, DB_FETCHMODE_ASSOC);
	}
	if(!is_array($settings)){$settings=array();}//make sure were retuning an array (even if its blank)
	return $settings;
}

function fax_get_settings(){
	$settings = sql('SELECT * FROM fax_details', 'getAssoc', 'DB_FETCHMODE_ASSOC');
	foreach($settings as $setting => $value){
		$set[$setting]=$value['0'];
	}
	if(!is_array($set)){$set=array();}//never return a null value
	return $set;
}


function fax_hook_core($viewing_itemid, $target_menuid){
	//hmm, not sure why engine_getinfo() isnt being called here?! should probobly read: $info=engine_getinfo();
	//this is what serves fax code to inbound routing
	$tabindex=null;
	$type=isset($_REQUEST['type'])?$_REQUEST['type']:'';
	$extension=isset($_REQUEST['extension'])?$_REQUEST['extension']:'';
	$cidnum=isset($_REQUEST['cidnum'])?$_REQUEST['cidnum']:'';
	$extdisplay=isset($_REQUEST['extdisplay'])?$_REQUEST['extdisplay']:'';
	
	//if were editing, get save parms. Get parms
	if ($type != 'setup'){
		if(!$extension && !$cidnum){//set $extension,$cidnum if we dont already have them
			$opts=explode('/', $extdisplay);$extension=$opts['0'];$cidnum=$opts['1'];
		}
		$fax=fax_get_incoming($extension,$cidnum);
	}else{
	$fax=null;
	}
	$html='';
	if($target_menuid == 'did'){
    $fax_dahdi_faxdetect=fax_dahdi_faxdetect();
    $fax_sip_faxdetect=fax_sip_faxdetect();
    $dahdi=ast_with_dahdi()?_('Dahdi'):_('Zaptel');
    $fax_detect=fax_detect();
    //ensure that we are using destination for both fax detect and the regular calls
		$html='<script type="text/javascript">$(document).ready(function(){
		$("input[name=Submit]").click(function(){
			if($("input[name=faxenabled]:checked").val()=="true" && !$("input[name=gotoFAX]:checked").val()){//ensure the user selected a fax destination
			alert('._('"You have selected Fax Detection on this route. Please select a valid destination to route calls detected as faxes to."').');return false; }	}) });</script>';
		$html .= '<tr><td colspan="2"><h5>';
		$html.=_('Fax Detect');
		$html.='<hr></h5></td></tr>';
		$html.='<tr>';
		$html.='<td><a href="#" class="info">';
		$html.=_("Detect Faxes").'<span>'._("Attemp to detect faxes on this DID.<ul><li>No: No attempts are made to auto-determain the call type; all calls sent to destination below. Use this option if this DID is used exclusevly for voice OR fax.</li><li>Yes: try to auto determain the type of call; route to the fax destination if call is a fax, otherwise send to regular destination. Use this option if you receive both voice and fax calls on this line</li>");
		if($fax['legacy_email']!==null){
    	$html.=_('<li>Legacy: Same as YES, only you can enter an email address as the destination. This option is ONLY for supporting migraded legecy fax routes. You should upgrade this route by chosing YES, and selecting a valid destination!</li>');
		}		
		$html.='</ul></span></a>:</td>';
		
		//dont allow detection to be set if we have no valid detection types
		if(!$fax_dahdi_faxdetect&&!$fax_sip_faxdetect){
			$js="if ($(this).val() == 'true'){alert('"._('No fax detection methods found or no valid licences. Faxing cannot be enabled.')."');return false;}";
			$html.='<td><input type="radio" name="faxenabled" value="false" CHECKED />No';
			$html.='<input type="radio" name="faxenabled" value="true"  onclick="'.$js.'"/>Yes</td></tr>';
			$html.='</table>';
		}else{//show detection options
			//js to show/hide the detection settings
				$js = "if(\$(this).val()=='true'){
								\$('.faxdetect').slideDown();\$('.legacyemail').hide();
							}else if(\$(this).val()=='false'){
								\$('.faxdetect').slideUp(); \$('.legacyemail').hide();
							}else if(\$(this).val()=='legacy'){
								\$('.legacyemail').slideDown();
								\$('.faxdest27').hide();\$('.legacyemail').show();
				}";
			$html.='<td><input type="radio" name="faxenabled" value="false" CHECKED onclick="'.$js.'"/>No';
			$html.='<input type="radio" name="faxenabled" value="true" '.($fax?'CHECKED':'').' onclick="'.$js.'"/>Yes';
			if($fax['legacy_email']!==null){
				$html.='<input type="radio" name="faxenabled" value="legacy" CHECKED onclick="'.$js.'"/>Legacy';
			}
      $html.='</td></tr>';
			$html.='</table>';
		}	
		//fax detection+destinations, hidden if there is fax is disabled
		$html.='<table class=faxdetect '.($fax?'':'style="display: none;"').'>';	
		$info=engine_getinfo();
		$html.='<tr><td width="156px"><a href="#" class="info">'._('Fax Detection type').'<span>'._("Type of fax detection to use.<ul><li>".$dahdi.": use ".$dahdi." fax detection; requires 'faxdetect=' to be set to 'incoming' or 'both' in ".$dahdi.".conf</li><li>Sip: use sip fax detection (t38). Requires asterisk 1.6.2 or greater and 'faxdetect=yes' in the sip config files</li><li>NV Fax Detect: Use NV Fax Detection; Requires NV Fax Detect to be installed and recognized by asterisk</li></ul>").'.</span></a>:</td>';
		$html.='<td><select name="faxdetection" tabindex="'.++$tabindex.'">';
		//$html.='<option value="Auto"'.($faxdetection == 'auto' ? 'SELECTED' : '').'>'. _("Auto").'</option>';<li>Auto: allow the system to chose the best fax detection method</li>		
		$html.='<option value="dahdi" '.($fax['detection'] == 'dahdi' ? 'SELECTED' : '').' '.($fax_dahdi_faxdetect?'':'disabled').'>'.$dahdi.'</option>';
		$html.='<option value="nvfax"'.($fax['detection'] == 'nvfax' ? 'SELECTED' : '').($fax_dahdi['module']=='nv_fax'?'':'disabled').'>'. _("NVFax").'</option>';
		$html.='<option value="sip" '.($fax['detection'] == 'sip' ? 'SELECTED' : '').' '.((($info['version'] >= "1.6.2") && $fax_sip_faxdetect)?'':'disabled').'>'. _("Sip").'</option>';
		$html.='</select></td></tr>';
		
		$html.='<tr><td><a href="#" class="info">'._("Fax Detection Time").'<span>'._('How long to wait and try to detect fax. Please note that callers to a '.$dahdi.' channel will hear ringing for this amount of time (i.e. the system wont "answer" the call, it will just play ringing)').'.</span></a>:</td>';
		$html.='<td><select name="faxdetectionwait" tabindex="'.++$tabindex.'">';
		if(!$fax['detectionwait']){$fax['detectionwait']=4;}//default wait time is 4 second
		for($i=2;$i < 11; $i++){
			$html.='<option value="'.$i.'" '.($fax['detectionwait']==$i?'SELECTED':'').'>'.$i.'</option>';	
		}
		$html.='</select></td></tr>';
		if($fax['legacy_email']!==null){	
			$html.='</table>';
			$html.='<table class="legacyemail" >';
			$html.='<tr ><td><a href="#" class="info">'._("Fax Email Destination").'<span>'._('Address to email faxes to on fax detection.<br />PLEASE NOTE: In this version of FreePBX, you can now set the fax destination from a list of destinations. Extensions/Users can be fax enabled in the user/extension screen and set an email address there. This will create a new destination type that can be selected. To upgrade this option to the full destination list, select YES to Detect Faxes and select a destination. After clicking submit, this route will be upgraded. This Legacy option will no longer be available after the change, it is provided to handle legacy migrations from previous versions of FreePBX only.').'.</span></a>:</td>';
			$html.='<td><input name="faxlegacyemail" value="'.$fax['legacy_email'].'"></td></tr>';
			$html.='</table>';
			$html.='<table class="faxdest27 faxdetect" style="display: none" >';
	}		
		$html.='<tr class="faxdest"><td><a href="#" class="info">'._("Fax Destination").'<span>'._('Where to send the call if we detect that its a fax').'.</span></a>:</td></tr>';
		$html.=$fax_detect?drawselects(isset($fax['destination'])?$fax['destination']:null,'FAX'):'';
		$html.='</table>';
		$html.='<table>';
	}
	return $html;

}

function fax_hookGet_config($engine){
	$fax=fax_detect();
	if($fax['module'] == 'app_fax' || $fax['module'] == 'res_fax'){ //dont continue unless we have a fax module in asterisk
		global $ext;
		global $engine;
		$routes=fax_get_incoming();
		foreach($routes as $current => $route){
			if($route['extension']=='' && $route['cidnum']){//callerID only
				$extension='s/'.$route['cidnum'];
				$context=($route['pricid']=='CHECKED')?'ext-did-0001':'ext-did-0002';
			}else{
				if(($route['extension'] && $route['cidnum'])||($route['extension']=='' && $route['cidnum']=='')){//callerid+did / any/any
					$context='ext-did-0001';
				}else{//did only
					$context='ext-did-0002';
				}
				$extension=($route['extension']!=''?$route['extension']:'s').($route['cidnum']==''?'':'/'.$route['cidnum']);
			}
      if ($route['legacy_email'] === null) {
			  $ext->splice($context, $extension, 'dest-ext', new ext_setvar('FAX_DEST','"'.$route['destination'].'"'));
      } else {
			  $ext->splice($context, $extension, 'dest-ext', new ext_setvar('FAX_DEST','"ext-fax-legacy,s,1"'));
        if ($route['legacy_email']) {
			    $fax_rx_email = $route['legacy_email'];
        } else {
          if (!isset($default_fax_rx_email)) {
            //TODO Need to add error checking
            //
			      $default_address = sql('SELECT value FROM fax_details WHERE `key` = \'fax_rx_email\'','getRow');
            $default_fax_rx_email = $default_address[0];
          }
          $fax_rx_email = $default_fax_rx_email;
        }
			  $ext->splice($context, $extension, 'dest-ext', new ext_setvar('FAX_RX_EMAIL',$fax_rx_email));
      }
		  $ext->splice($context, $extension, 'dest-ext', new ext_answer(''));
      if ($route['detection'] == 'nvfax') {
		    $ext->splice($context, $extension, 'dest-ext', new ext_playtones('ring'));
		    $ext->splice($context, $extension, 'dest-ext', new ext_nvfaxdetect($route['detectionwait']."|t"));
      } else {
		    $ext->splice($context, $extension, 'dest-ext', new ext_wait($route['detectionwait']));
      }
		}
	}
}

function fax_hookProcess_core(){
	$display=isset($_REQUEST['display'])?$_REQUEST['display']:'';
	$action=isset($_REQUEST['action'])?$_REQUEST['action']:'';
	$cidnum=isset($_REQUEST['cidnum'])?$_REQUEST['cidnum']:'';
	$extension=isset($_REQUEST['extension'])?$_REQUEST['extension']:'';
	$extdisplay=isset($_REQUEST['extdisplay'])?$_REQUEST['extdisplay']:'';
	$enabled=isset($_REQUEST['faxenabled'])?$_REQUEST['faxenabled']:'';
	$detection=isset($_REQUEST['faxdetection'])?$_REQUEST['faxdetection']:'';
	$detectionwait=isset($_REQUEST['faxdetectionwait'])?$_REQUEST['faxdetectionwait']:'';
	$dest=(isset($_REQUEST['gotoFAX'])?$_REQUEST['gotoFAX'].'FAX':null);
	$dest=isset($_REQUEST[$dest])?$_REQUEST[$dest]:'';
	$legacy_email=isset($_REQUEST['legacy_email'])?$_REQUEST['legacy_email']:NULL;
	if(!isset($legacy_email)||isset($dest)){$legacy_email=null;}
	
	if ($display == 'did' && isset($action) && $action!=''){
		fax_delete_incoming($extdisplay);	//remove mature entry on edit or delete
		if (($action == 'edtIncoming'||$action == 'addIncoming')&& $enabled=='true'){
			fax_save_incoming($cidnum,$extension,$enabled,$detection,$detectionwait,$dest,$legacy_email);
		}
	}
}


function fax_save_incoming($cidnum,$extension,$enabled,$detection,$detectionwait,$dest,$legacy_email){
	global $db;
	sql("INSERT INTO fax_incoming (cidnum, extension, detection, detectionwait, destination, legacy_email) VALUES ('".$db->escapeSimple($cidnum)."', '".$db->escapeSimple($extension)."', '".$db->escapeSimple($detection)."', '".$db->escapeSimple($detectionwait)."', '".$db->escapeSimple($dest)."','".$db->quoteSmart($legacy_email)."')");
}

function fax_save_settings($settings){
	global $db;
	foreach($settings as $key => $value){
		sql("REPLACE INTO fax_details (`key`, `value`) VALUES ('".$key."','".$db->escapeSimple($value)."')");
	}
}

function fax_save_user($faxext,$faxenabled,$faxemail){
	global $db;
	$faxext=$db->escapeSimple($faxext);
	$faxenabled=$db->escapeSimple($faxenabled);
	$faxemail=$db->escapeSimple($faxemail);
	sql('REPLACE INTO fax_users (user, faxenabled, faxemail) VALUES ("'.$faxext.'","'.$faxenabled.'","'.$faxemail.'")');
}

function fax_sip_faxdetect(){
	global $asterisk_conf;
  return true;
  //TODO Fix This Later
  	/*
	 * kepping this always set to true for freepbx 2.7 as we cant currently properly detect this - MB
	 * 
	 */
	//these files probobly shouldnt be hardcoded
	$files=array('sip_general_additional.conf','sip_general_custom.conf','sip_custom.conf');
	foreach($files as $file){$set.=parse_ini_file($file);}//read setting from files
	return ($set['faxdetect'] == 'yes');
}

//write out res_fax.conf and res_fax_digium.conf
function fax_write_conf(){
	global $amp_conf, $WARNING_BANNER;
	$set=fax_get_settings();
	//res_fax.conf
	$data=$WARNING_BANNER;
	$data.="[general]\n";
	$data.="#include res_fax_custom.conf\n";
	$data.='minrate='.$set['minrate']."\n";
	$data.='maxrate='.$set['maxrate']."\n";
	$file=fopen($amp_conf['ASTETCDIR'].'/res_fax.conf','w');
	fwrite($file, $data);
	fclose($file);
	
	//res_fax_digium.conf
	$data=$WARNING_BANNER;
	$data.="[general]\n";
	$data.="#include res_fax_digium_custom.conf\n";
	$data.='ecm='.$set['ecm']."\n";
	$file=fopen($amp_conf['ASTETCDIR'].'/res_fax_digium.conf','w');
	fwrite($file, $data);
	fclose($file);
}
?>
