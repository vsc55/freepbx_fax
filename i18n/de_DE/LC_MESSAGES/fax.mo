��    z      �  �   �      H
  K   I
  w   �
       >   &     e  k  h  7   �          +  $   =  $   b     �      �  (   �     �     �      �          #     0  �   @     >  n   L  �   �  
   �  !   �     �     �  (         )  Y   ?     �     �     �     �     �     �     �               (     4     =  +   I     u  9   y  �   �  &   i  �   �     S     r  �   �     k     s     �  �   �     v     }  @   �  7   �  u     &   �  I   �     �  7   	  (   A  f   j     �     �     �     �  M     �   a                    4     I     M  '   f     �     �     �  �   �     h  p   q     �  $   �       �     E     �   H  0   �     "  S   @  %   �  �   �     L   D   P   �   �      �!  R   �!     �!  �   �!  X   �"  X   #     v#  %   }#     �#     �#     �#  #   �#     �#     �#     �#  
   $     $     $     #$     6$     D$  �  I$  R   �%  �   J&  &   �&  [   '     i'    l'  D   p*     �*     �*  1   �*  3   +     I+  (   O+  0   x+  2   �+     �+     �+     ,     ',  )   4,    ^,     v-  x   �-    �-     /  *   ./  	   Y/      c/  (   �/     �/  Z   �/     0     !0     20     :0     G0     Y0     v0     �0     �0     �0     �0     �0  B   �0     1  Q   1  �   l1  6   2  �   U2  (   A3  '   j3    �3     �4  .   �4     �4  �   �4     �5     �5  Y   �5  a   @6  �   �6  3   R7  q   �7     �7  a   8  .   u8  t   �8     9     +9     >9  -   C9  {   q9  �   �9     �:     �:     �:     ;     );     -;  '   J;  #   r;     �;     �;  �   �;     }<  {   �<     =  )   =     :=    ?=  <   X>  �   �>  %   T?     z?  V   �?  )   �?  �   @     �@  O   �@  �   
A  "   �A  ]   B     xB    {B  f   C  f   �C     MD  *   TD     D     �D     �D  &   �D     �D     �D     �D     �D     E     E     E     ,E  	   ?E     2   T   `           m   _   B   -           (       %   	   '          ?   U   &   b                      W              !   7      V       ]   4   j      K   d   N          S   P       t       F       ;   )          R      i   f              C   h   <   k   l       5   ,                   +       X   w   r   ^   =      e       .   :   O   u   g   E   D      x       A   8             Q   #   [   \   J   o   y   >           "   a      n   M   s   *   9          1       @   $   Z   G       p   3          q   /                         
         H                      z   0   Y       v   6       L   c   I              fax detection; requires 'faxdetect=' to be set to 'incoming' or 'both' in  "You have selected Fax Detection on this route. Please select a valid destination to route calls detected as faxes to." %s FAX Migrations Failed %s FAX Migrations Failed, check notification panel for details A4 Address to email faxes to on fax detection.<br />PLEASE NOTE: In this version of FreePBX, you can now set the fax destination from a list of destinations. Extensions/Users can be fax enabled in the user/extension screen and set an email address there. This will create a new destination type that can be selected. To upgrade this option to the full destination list, select YES to Detect Faxes and select a destination. After clicking submit, this route will be upgraded. This Legacy option will no longer be available after the change, it is provided to handle legacy migrations from previous versions of FreePBX only. Adds configurations, options and GUI for inbound faxing Always Generate Detection Code Attachment Format Attempt to detect faxes on this DID. Auto generated migrated user for Fax Both Checking for failed migrations.. Checking if legacy fax needs migrating.. Dahdi Default Fax header Default Local Station Identifier Default Paper Size Detect Faxes Dial System FAX ERROR: No Fax license detected.<br>Fax-related dialplan will <b>NOT</b> be generated!<br>This module has detected that Fax for Asterisk is installed without a license.<br>At least one license is required (it is available for free) and must be installed. Email address Email address that faxes appear to come from if 'system default' has been chosen as the default fax extension. Email address that faxes are sent to when using the "Dial System Fax" feature code. This is also the default email for fax detection in legacy mode, if there are routes still running in this mode that do not have email addresses specified. Enable Fax Enable this user to receive faxes Enabled Enclosed, please find a new fax Enclosed, please find a new fax from: %s Error Correction Mode Error Correction Mode (ECM) option is used to specify whether
			 to use ecm mode or not. Fax Fax Configuration Fax Destination Fax Detection Fax Detection Time Fax Detection Wait Fax Detection type Fax Email Destination Fax Enabled Fax Options Fax Ring Fax user %s Finished Migrating fax users to usermanager For Formats to convert incoming fax files to before emailing. Header information that is passed to remote side of the fax transmission and is printed on top of every page. This usually contains the name of the person or entity sending the fax. How long to wait and try to detect fax How long to wait and try to detect fax. Please note that callers to a Dahdi channel will hear ringing for this amount of time (i.e. the system wont "answer" the call, it will just play ringing). Inbound Fax Destination Change Inbound Fax Detection: %s (%s) Inbound faxes now use User Manager users. Therefore you will need to re-assign all of your destinations that used 'Fax Recipients' to point to User Manager users. You may see broken destinations until this is resolved Inherit Invalid Email for Inbound Fax Legacy Legacy: Same as YES, only you can enter an email address as the destination. This option is ONLY for supporting migrated legacy fax routes. You should upgrade this route by choosing YES, and selecting a valid destination! Letter Maximum transfer rate Maximum transfer rate can not be less than Minimum transfer rate Maximum transfer rate used during fax rate negotiation. Migrated user %s but unable to set email address to %s because an email [%s] was already set for User Manager User %s Migrating all fax users to usermanager Migrating faxemail field in the fax_users table to allow longer emails... Minimum transfer rate Minimum transfer rate used during fax rate negotiation. Moving simu_fax feature code from core.. NV Fax Detect: Use NV Fax Detection; Requires NV Fax Detect to be installed and recognized by asterisk New fax from: %s New fax received No No Inbound Routes to migrate No fax detection methods found or no valid license. Faxing cannot be enabled. No: No attempts are made to auto-determine the call type; all calls sent to destination set in the 'General' tab. Use this option if this DID is used exclusively for voice OR fax. None On Outgoing Email address Outgoing fax results PDF Received & processed: %s Removing field %s from incoming table.. Removing old globals.. Reset SIP Select the default paper size.<br/>This specifies the size that should be used if the document does not specify a size.<br/> If the document does specify a size that size will be used. Settings Sip: use sip fax detection (t38). Requires asterisk 1.6.2 or greater and 'faxdetect=yes' in the sip config files Submit Successfully migrated faxemail field TIFF The following Inbound Routes had FAX processing that failed migration because they were accessing a device with no associated user. They have been disabled and will need to be updated. Click delete icon on the right to remove this notice. The outgoing Fax Machine Identifier. This is usually your fax number. This may be formatted as just 'user@example.com', or 'Fax User <user@example.com>'. The second option will display 'Fax User' in the 'From' field in most email clients. Type of fax detection to use (e.g. SIP or DAHDI) Type of fax detection to use. Unable to migrate %s, because [%s]. Please check your 'Fax Recipients' destinations Updating simu_fax in miscdest table.. User Manager users '%s' have the ability to receive faxes but have no email address defined so they will not be able to receive faxes over email, Via WARNING: Failed migration. Email length is limited to 50 characters. When no fax modules are detected the module will not generate any detection dialplan by default. If the system is being used with phyical FAX devices, hylafax + iaxmodem, or other outside fax setups you can force the dialplan to be generated here. Where to send the faxes Whether to ring while attempting to detect fax. If set to no silence will be heard Yes Yes: try to auto determine the type of call; route to the fax destination if call is a fax, otherwise send to regular destination. Use this option if you receive both voice and fax calls on this line Your maximum transfer rate is set to 2400 in certain circumstances this can break faxing Your minimum transfer rate is set to 2400 in certain circumstances this can break faxing Zaptel all migrations succeeded successfully already done blank done duplicate, removing old from core.. failed migrated migrating defaults.. not needed not present removed starting migration unknown error use  Project-Id-Version: PACKAGE VERSION
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-05-09 03:34+0530
PO-Revision-Date: 2019-04-10 16:00+0000
Last-Translator: florian alberts <alberts@ar-systems.de>
Language-Team: German <http://*/projects/freepbx/fax/de/>
Language: de_DE
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=n != 1;
X-Generator: Weblate 3.0.1
  Faxerkennung; erfordert 'Faxerkennung=' gesetzt auf 'eingehend' oder 'beides' in  „Sie haben für diese Route die Fax-Erkennung ausgewählt. Bitte wählen Sie ein gültiges Ziel aus, auf das eingehende Faxe abgeworfen werden können“ %s Fax-Migrationen sind fehlgeschlagen %s Fax-Migrationen sind fehlgeschlagen, auf dem Benachrichtigungstableau finden Sie Details A4 E-Mail-Adresse, an die Faxe bei Faxerkennung gesendet werden.<br />BITTE BEACHTEN SIE: In dieser Version von FreePBX können Sie das Fax-Ziel aus einer Zielliste auswählen. Sie können Faxempfang für Nebenstellen/Benutzer*innen aktiviertwerden auf der jeweiligen Konfigrationsseite aktivieren und eine E-Mail-Adresse angeben. Dadurch wird ein neues Ziel erzeugt, das dann ausgwählt werden kann. Um diese Option auf die vollständige Zielliste umzustellen, wählen Sie „Ja“ um Faxe zu erkennen und wählen Sie dann ein Ziel. Nachdem Sie auf „Absenden“ klicken, wird diese Route aktualisiert. Diese Alt-Option wird nach der Änderung nicht mehr zur Verfügung stehen, sie wird lediglich vorgehalten, um Migrationen von älteren FreePBX-Versionen zu ermöglichen. Fügt Konfigurationen, Optionen und GUI für eingehendes Faxen hinzu Erkennungs-Code immer erzeugen Anhängeformat Versuchen, auf dieser Durchwahl Faxe zu erkennen. Automatisch erzeugter, migrierter Benutzer für Fax Beide Prüfe auf fehlgeschlagene Migrationen.. Pürfen, ob ein altes Fax migriert werden muss.. Dahdi ( Digium\Asterisk Hardware Device Interface) Standard Fax-Kopfzeile Rufnummer des Faxanschlusses Standard Papiergröße Fax erkennen Wähle Nebenstelle des Standardfaxgeräts FEHLER: Keine Faxlizenz gefunden.<br />Es wird <b>KEIN</b> faxbezogener Wählplan erzeugt!<br />Dieses Modul hat festgestellt, dass „Fax for Asterisk“ ohne Lizenz installiert ist.<br /> Es ist erforderlich, dass mindestens eine Lizenz (kostenlos erhältlich) installiert ist. E-Mail-Addresse E-Mail-Adresse, von der Faxe zu kommen scheinen, falls „System-Standard“ als Standard-Faxnebenstelle gewählt wurde. Email Adresse an die Faxe gesendet werden, die über den "Wähle Nebenstelle des Standardfaxgeräts"-Funktionscode hereinlaufen. Gleichzeitig  ist es die Standardadresse für erkannte Faxnachrichten, sofern veraltete Routen existieren, für die keine eigene Email-Adresse hinterlegt ist. Fax aktivieren Faxempfang für diesen Benutzer aktivieren Aktiviert Anbei erhalten Sie ein neues Fax Anbei erhalten Sie ein neues Fax von: %s Fehlerkorrekturmodus Die Fehlerkorrekturmodus-Option (ECM) legt fest, ob der ECM-Modus genutzt wird oder nicht. Fax Faxkonfiguration Faxziel Faxerkennung Faxerkennungszeit Wartedauer für Faxerkennung Art der Fax-Erkennung Fax E-Mail-Ziel Fax aktiviert Faxoptionen Faxklingeln Fax-Benutzer %s Migration von Faxbenutzern in die Benutzerverwaltung abgeschlossen Für Formate, in die eingehende Faxe vor dem E-Mail-Versand konvertiert werden sollen. Kopfzeileninfo, die zur anderen Seite übertragen und auf jeder Seite oben angezeigt wird. Für gewöhnlich beinhaltet sie den Namen der Person oder die Entität des Versenders. Wie lange gewartet werden soll, um ein Fax zu erkennen Wie lange gewartet werden soll, um ein Fax zu erkennen. Bitte beachten Sie, dass Anrufer auf einem DAHDi-Kanal für diese Zeit ein Klingeln hören werden (d.h. das System nimmt den Anruf nicht an, sondern spielt nur den Klingelton ab). Änderung des Ziels für eingehende Faxe Erkennung für eingehendes Fax: %s (%s) Eingehende Faxe verwenden nun Benutzer aus der Benutzerverwaltung. Daher müssen Sie alle Ziele, die „Fax-Empfänger“ verwendet haben, auf Benutzer aus der Benutzerverwaltung umstellen. Bis dies behoben ist, bekommen Sie möglicherweise defekte Ziele angezeigt Erben Ungültige E-Mail-Adresse für eingehendes Fax Alt Veraltet: Wie bei "Ja", es kann aber eine Email Adresse eingegeben werden. Diese Option ist EINZIG für die Unterstützung migrierter veralteter Faxrouten. Sie sollten diese Route updaten, in dem Sie "Ja" und ein gültiges Ziel auswählen! Letter Maximale Übertragungsrate Die maximale Übertragungsrate kann nicht kleiner sein als die minimale Übertragungsrate Maximale Übertragungsrate, die während der Aushandlung der Faxübertragungsrate verwendet wird. Benutzer %s wurde migriert, aber die E-Mail-Adresse %s konnte nicht gesetzt werden, weil die Adresse [%s] bereits für den Benutzer %s in der Benutzerverwaltung hinterlegt war Migriere alle Faxbenutzer in die Benutzerverwaltung Migriere das Feld <i>faxemail</i> in der Tabelle <i>fax_users</i>, um längere E-Mail-Adressen zu ermöglichen... Minimale Übertragungsrate Minimale Übertragungsrate, die während der Aushandlung der Faxübertragungsrate verwendet wird. Entferne simu_fax Funktionscode aus dem Kern.. NV Faxerkennung: Benutze NV Faxerkennung; benötigt das Modul NV Fax Detect und muss Asterisk bekannt gemacht werden Neues Fax von: %s Neues Fax erhalten Nein Es sind keine eingehenden Routen zu migrieren Es wurde keine Faxerkennungsmethode erkannt oder es liegt keine gültige Lizenz vor. Das Faxen kann nicht aktiviert werden. Nein: Es wird nicht versucht, den Anruftyp automatisch zu bestimmen; alle Anrufe werden zu dem Ziel geleitet, das uner „Allgemein“ eingestellt ist. Verwenden Sie diese Option, wenn diese Durchwahl ausschließlich für Sprache ODER Fax verwendet wird. Kein*e An Ausgehende E-Mail-Adresse Ausgehende Faxergebnisse PDF Erhalten und verarbeitet: %s Entferne Feld %s von Tabelle incoming.. Entferne alte Globaleinstellungen.. Zurücksetzen SIP Wählen Sie die Standarpapiergröße.<br />Dies gibt die Größe an, die verwendet werden soll, wenn das Dokument keine Papiergröße vorgibt.<br />Wenn das Dokument eine Größe vorgibt, so wird diese verwendet. Einstellungen SIP: SIP-Faxerkennung (t38) verwenden. Erfordert Asterisk 1.6.2 oder neuer und „faxdetect=yes“ in der SIP-Konfiguration Absenden Erfolgreiche Migration von Fax-Email-Feld TIFF Die folgenden Inbound Routen weisen eine fehlerhafte Faxverarbeitung auf und können nicht migriert werden, da sie ein Gerät verwenden, dem kein User zugeordnet ist. Sie bleiben inaktiv und werden nicht erneuert. Drücken Sie den Löschbutton rechts, um diese Notiz zu entfernen. Die Nummer des Faxanschlusses. Normalerweise Ihre Faxnummer. Die Eingabe sollte entweder so  'user@example.com', oder  so 'Fax User <user@example.com>' aussehen. Mit der zweiten Option steht in den meisten Email Clients 'Fax User' im 'FROM'-Abschnitt. Art der Faxerkennung (SIP oder DAHDI) Art der Faxerkennung. Unmögliche Migration  %s1, aufgrund %s2. Prüfen Sie die Ziele Ihrer 'Fax-Adressaten' Update simu_fax in der Tabelle miscdest.. Der Benutzer %s im Benutzerverwaltungsmodul kann Faxe empfangen, es ist aber keine Email Adresse hinterlegt, folglich ist der Faxempfang via Email nicht möglich, über WARNUNG: Migration fehlgeschlagen. Email Länge ist auf 50 Zeichen beschränkt. Wenn keine Faxmodule erkannt werden, wird die Erkennung im Wählplan auch nicht verwendet. Sind physikalische Faxgeräte angeschlossen, hylafax und iaxmodem, oder andere entfernte Faxgeräte, können Sie den Wählplan hier modifizieren. Wohin das Fax gesendet werden soll Ob ein Klingeln während der Faxerkennung gesendet wird. Falls nein, herrscht so lange Stille Ja Ja: versuche den Typ des Gesprächs automatisch zu bestimmen; leite zum Faxzielgerät wenn es ein Fax ist, ansonsten Abwurf auf die eigentliche Nebenstelle. Diese Option sollten Sie nutzen, wenn sowohl Faxe als auch Sprachanrufe an dieser Nebenstelle eingehen Ihre maximale Transferrate ist auf 2400 gesetzt - in bestimmten Fällen kann dies das Fax unterbrechen Ihre minimale Transferrate ist auf 2400 gesetzt - in bestimmten Fällen kann dies das Fax unterbrechen Zaptel alle Migrationen erfolgreich abgeschlossen bereits erledigt leer erledigt doppelt, alte wird vom Kern entfernt.. fehlgeschlagen migriert migriere Standards.. nicht benötigt nicht vorhanden entfernt starte Migration Unbekannter Fehler Benutzen  