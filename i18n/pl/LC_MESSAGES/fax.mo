��    {      �  �   �      h
  K   i
  w   �
     -  >   F     �  k  �  7   �     ,     K  $   ]  $   �     �      �  (   �     �     �           0     C     P  �   `  �   .     ,  n   :  �   �  
   �  !   �     �     �  (   �       Y   -     �     �     �     �     �     �     �     �     
          "  )   +  1   U     �  +   �     �  9   �  �   �  &   �  �   �     �     �     �     �       �        �     �  7     &   ;     b  3   �  I   �        7     (   N  f   w     �     �     �          	  M   &  �   t     (     +     B     W     [  '   t     �     �  �   �     _  p   h     �  )   �  &   
  $   1     V  �   [  E   J  �   �  0   9     j  S   �     �  <   �  D      >   b   �   �      �!     �!  �   �!  X   }"  X   �"  %   /#     U#     b#     h#  #   m#     �#     �#     �#  
   �#     �#     �#     �#     �#     �#  �  �#  U   �%  �   6&  *   �&  ]   �&     C'  �  F'  ?   �)     *     ,*  !   @*  8   b*     �*  "   �*  3   �*     �*     �*  '   +     ;+     T+     e+  �   y+    W,     m-  f   z-    �-     �.  2   �.  
   )/  (   4/  .   ]/     �/  ]   �/     �/     �/     0     &0     70     M0     k0     �0     �0     �0     �0  /   �0  0   �0     '1  E   <1     �1  D   �1  �   �1  ,   �2  �   �2  1   x3  +   �3  	   �3  5   �3     4  �   4     �4      5  N   #5  6   r5  *   �5  D   �5  b   6     |6  L   �6  2   �6  t   7     �7     �7     �7     �7  &   �7  ]   �7  �   C8  
   $9     /9     I9     i9     m9  +   �9     �9     �9  �   �9  
   :  �   �:  
   ;  @   ';  :   h;  3   �;     �;  3  �;  @   =  �   Q=  D   >  #   ]>  c   �>     �>  J   �>  h   6?  O   �?    �?     �@     A    A  w   *B  v   �B  )   C     CC     TC     ZC  )   fC     �C     �C     �C     �C  	   �C  	   �C     �C     D     #D     e   z   &   	   M   p   h       c          @           X               <          t   J   o       S       
   R      V   l   L   3       b   .   $   ?           8   H   5   +   r           ]   W   _       "   ;   a      7                   B       T   P          v       6         I   =   *   )           d   Y       A   f              n   ,         G          \      w             s   m   4   x   1             y   {   >          g              9   U      ^            O              D      K       /   !       E      0   %   2       -   C   Q           i      N          k   (   u   `      F       j   '   [       #       Z   :   q     fax detection; requires 'faxdetect=' to be set to 'incoming' or 'both' in  "You have selected Fax Detection on this route. Please select a valid destination to route calls detected as faxes to." %s FAX Migrations Failed %s FAX Migrations Failed, check notification panel for details A4 Address to email faxes to on fax detection.<br />PLEASE NOTE: In this version of FreePBX, you can now set the fax destination from a list of destinations. Extensions/Users can be fax enabled in the user/extension screen and set an email address there. This will create a new destination type that can be selected. To upgrade this option to the full destination list, select YES to Detect Faxes and select a destination. After clicking submit, this route will be upgraded. This Legacy option will no longer be available after the change, it is provided to handle legacy migrations from previous versions of FreePBX only. Adds configurations, options and GUI for inbound faxing Always Generate Detection Code Attachment Format Attempt to detect faxes on this DID. Auto generated migrated user for Fax Both Checking for failed migrations.. Checking if legacy fax needs migrating.. Dahdi Default Fax header Default Local Station Identifier Default Paper Size Detect Faxes Dial System FAX ERROR: No FAX modules detected!<br>Fax-related dialplan will <b>NOT</b> be generated.<br>This module requires Fax for Asterisk (res_fax_digium.so) or spandsp based app_fax (res_fax_spandsp.so) to function. ERROR: No Fax license detected.<br>Fax-related dialplan will <b>NOT</b> be generated!<br>This module has detected that Fax for Asterisk is installed without a license.<br>At least one license is required (it is available for free) and must be installed. Email address Email address that faxes appear to come from if 'system default' has been chosen as the default fax extension. Email address that faxes are sent to when using the "Dial System Fax" feature code. This is also the default email for fax detection in legacy mode, if there are routes still running in this mode that do not have email addresses specified. Enable Fax Enable this user to receive faxes Enabled Enclosed, please find a new fax Enclosed, please find a new fax from: %s Error Correction Mode Error Correction Mode (ECM) option is used to specify whether
			 to use ecm mode or not. Fax Fax Configuration Fax Destination Fax Detection Fax Detection Time Fax Detection Wait Fax Detection type Fax Email Destination Fax Enabled Fax Options Fax Ring Fax drivers supported by this module are: Fax for Asterisk (res_fax_digium.so) with licence Fax user %s Finished Migrating fax users to usermanager For Formats to convert incoming fax files to before emailing. Header information that is passed to remote side of the fax transmission and is printed on top of every page. This usually contains the name of the person or entity sending the fax. How long to wait and try to detect fax How long to wait and try to detect fax. Please note that callers to a Dahdi channel will hear ringing for this amount of time (i.e. the system wont "answer" the call, it will just play ringing). Inbound Fax Destination Change Inbound Fax Detection: %s (%s) Inherit Invalid Email for Inbound Fax Legacy Legacy: Same as YES, only you can enter an email address as the destination. This option is ONLY for supporting migrated legacy fax routes. You should upgrade this route by choosing YES, and selecting a valid destination! Letter Maximum transfer rate Maximum transfer rate used during fax rate negotiation. Migrating all fax users to usermanager Migrating fax_incoming table... Migrating fax_users table to add faxattachformat... Migrating faxemail field in the fax_users table to allow longer emails... Minimum transfer rate Minimum transfer rate used during fax rate negotiation. Moving simu_fax feature code from core.. NV Fax Detect: Use NV Fax Detection; Requires NV Fax Detect to be installed and recognized by asterisk NVFax New fax from: %s New fax received No No Inbound Routes to migrate No fax detection methods found or no valid license. Faxing cannot be enabled. No: No attempts are made to auto-determine the call type; all calls sent to destination set in the 'General' tab. Use this option if this DID is used exclusively for voice OR fax. On Outgoing Email address Outgoing fax results PDF Received & processed: %s Removing field %s from incoming table.. Reset SIP Select the default paper size.<br/>This specifies the size that should be used if the document does not specify a size.<br/> If the document does specify a size that size will be used. Settings Sip: use sip fax detection (t38). Requires asterisk 1.6.2 or greater and 'faxdetect=yes' in the sip config files Submit Successfully migrated fax_incoming table! Successfully migrated fax_users table! Successfully migrated faxemail field TIFF The following Inbound Routes had FAX processing that failed migration because they were accessing a device with no associated user. They have been disabled and will need to be updated. Click delete icon on the right to remove this notice. The outgoing Fax Machine Identifier. This is usually your fax number. This may be formatted as just 'user@example.com', or 'Fax User <user@example.com>'. The second option will display 'Fax User' in the 'From' field in most email clients. Type of fax detection to use (e.g. SIP or DAHDI) Type of fax detection to use. Unable to migrate %s, because [%s]. Please check your 'Fax Recipients' destinations Via WARINING: fax_users table may still be using the old schema! WARNING: Failed migration. Email length is limited to 50 characters. WARNING: fax_incoming table may still be using the 2.6 schema! When no fax modules are detected the module will not generate any detection dialplan by default. If the system is being used with phyical FAX devices, hylafax + iaxmodem, or other outside fax setups you can force the dialplan to be generated here. Where to send the faxes Yes Yes: try to auto determine the type of call; route to the fax destination if call is a fax, otherwise send to regular destination. Use this option if you receive both voice and fax calls on this line Your maximum transfer rate is set to 2400 in certain circumstances this can break faxing Your minimum transfer rate is set to 2400 in certain circumstances this can break faxing all migrations succeeded successfully already done blank done duplicate, removing old from core.. failed migrated migrating defaults.. not needed not present removed starting migration unknown error use  Project-Id-Version: PACKAGE VERSION
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2018-03-22 16:51-0400
PO-Revision-Date: 2017-04-28 10:46+0200
Last-Translator: Michal <mboltz@tlen.pl>
Language-Team: Polish <http://weblate.freepbx.org/projects/freepbx/fax/pl/>
Language: pl
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=3; plural=n==1 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2;
X-Generator: Weblate 2.4
  Wykrywanie faksów; Wymaga 'faxdetect =', aby ustawić na 'przychodzący' lub 'oba'  Wybrałeś wykrywanie faksu. Proszę wybrać odpowiednie miejsce docelowe do przekierowania połączeń zidentyfikowanych jako faks %s Przekierowanie faksu nie powiodło się %s Przekierowanie faksu nie powiodło się, sprawdź panel powiadomień aby poznać szegóły A4 Adres e-mailowy faksów na wykrywanie faksu. <br /> UWAGA: W tej wersji FreePBX można teraz ustawić docelowy numer faksu z listy miejsc docelowych. Rozszerzenia / Użytkownicy mogą być faksowani na ekranie użytkownika / rozszerzenia i ustawiać tam adres e-mail. Spowoduje to utworzenie nowego typu odbiorcy, który można wybrać. Aby uaktualnić tę opcję do pełnej listy odbiorców, wybierz opcję YES, aby wykryć faksy i wybrać cel. Po kliknięciu przycisku prześlij tę trasę zostanie zmodernizowana. Ta opcja Legacy nie będzie już dostępna po zmianie, jest dostępna do obsługi starszych migracji z poprzednich wersji FreePBX. Konfiguracje dodawania, opcje i GUI dla faksów przychodzących Zawsze generuj kod wykrywania format załącznika Próba wykrycia faksu na tym DID. Automatyczne generowanie migracji użytkownika dla faksu oba Sprawdzanie nieudanych przekazów. Sprawdzanie, czy starsze faksy wymagają migracji.. Dahdi Domyślny tytuł faksu Domyślna identyfikacja stacji lokalnej Domyślny format papieru Wykrywanie faksu Płyta systemu faks BŁĄD: Nie wykryto modułów FAX! <br> Dialekt faksowy będzie generowany <b> NIE </ b> <br> Ten moduł wymaga FAX dla Asterisk (res_fax_digium.so) lub spandsp na podstawie app_fax (res_fax_spandsp.so) do funkcjonowania. BŁĄD: Nie wykryto licencji faksowej <br> Dialekt faksowy zostanie <b> NIE </ b> wygenerowany! <br> Ten moduł wykrył, że Faks dla Asterisk jest zainstalowany bez licencji. <br> Co najmniej jedna licencja jest wymagana (jest dostępna bezpłatnie) i musi być zainstalowana. Adres e-mail Adres e-mail, który pochodzi z systemu domyślnego został wybrany jako domyślne rozszerzenie faksu. Adres e-mail, na który wysyłane są faksy podczas użycia kodu funkcji "Płyty Systemu Faks". Jest to również domyślny e-mail dla wykrywania faksu w trybie systemowym, jeśli są włączone inne ścieżki w tym module, nie ma sprecyzowanego adresu e-mail. Włączyć faks Dodać tego użytkownika do listy odbiorców faksu Włączone Ograniczono, proszę znaleźć nowy faks Ograniczono, proszę znaleźć nowy faks z: %s Tryb naprawy Error Correction Mode (ECM), opcja służy do określania czy
			 używać trybu ECM czy nie. faks konfiguracja faksu Miejsce docelowe faksu wykrywanie faksu Czas wykrywania faksu Oczekiwanie na wykrycie faksu Typ wykrywania faksu Miejsce docelowe mailafaksu Faks włączony Opcje faksu Dzwonek faksu Sterowniki faksu wspierane przez ten moduł to: Faks dla Astriks (res_fax_digium.so) z licencją Użytkownik faksu %s Zakończono przenoszenie listy użytkowników faksu do administratora dla Formaty konwersji przychodzących plików faksu na poprzedni e-mail. Nagłówek informacyjny jest przekazywany do zdalnej strony transmisji faksu i drukowany jest na górze każdej strony. Zazwyczaj zawiera on imię osoby lub podmiotu wysyłającego faks. Jak długo czekać i próbować wykryć faks Jak długo czekać i próbować wykryć faks. Proszę zapamiętać, że dzwoniący na kanał Dahdi usłyszą dzwonienie w tym czasie (system nie "odbierze" połączenia, będzie jedynie dzwonić). Zmiana miejsca docelowego faksów przychodzących Wykrywanie faksów przychodzących: %s (%s) Dziedzicz Nieprawidłowy e-mail dla poczty przychodzącej faksu Zapis Zapis: tak samo jak TAK, tylko można wprowadzić adres e-mail jako miejsce docelowe. Ta opcja jest jedynie do wspierania migracji dróg zapisu faksu. Należy uaktualnić tę drogę, wybierając TAK i wybierając ważny cel! List Maksymalna szybkość transmisji Maksymalna szybkość transmisji używana podczas negocjacji szybkości faksu. Migracja wszystkich użytkowników faksu do menadżera Migracja tabeli faksów przychodzących... Migracja tabeli użytkowania faksu do dodania formatu faksowania ... Migracja pola e-maili faksu w tabeli użytkowników faksu w celu zezwolenia dłuższych e-maili... Minimalne wskazania transferu Minimalna szybkość transferu używana podczas negocjacji stawek faksowych. Przeprowadzenie kodu funkcji simu_fax od rdzenia.. Wykryto NV Fax: Użyj wykrywanie Faxu NV; Wymaga zainstalowanej detekcji faxu NV by być rozpoznanym przez asterisk. NVFax Nowy faks od: %s Otrzymano nowy faks Nie Brak dróg przychodzących do migracji Nie znaleziono metod wykrywania faksu lub brak ważnej licencji. Faksowanie jest niemożliwe. Nie: Nie próbuje się automatycznie określić typu połączenia; wszystkie połączenia kierowane do połączenia określonego w zakładce "Ogólne". Użyj tej opcji, jeśli ten DID służy wyłącznie do głosu lub faksu. Włączone Adres poczty wychodzącej Rezultaty faksów wychodzących PDF Odebrane i przetworzone %s Usuwanie pola %s z tabeli przychodzących.. przestaw SIP Wybierz domyślny rozmiar papieru. <br/> Określa rozmiar, który powinien być używany, jeśli dokument nie określa rozmiaru. <br/> Jeśli dokument określa rozmiar, będzie on używany. Ustawienia SIP: Użyj detekcji faksu sip (t.38). Wymaga asteriska w wersji 1.6.2 lub wyższej oraz ustawienia w plikach konfiguracyjnych sip 'faxdetect=yes' Zatwierdź Migracja tabeli faksów przychodzących zakończona powodzeniem! Migracja tabeli użytkowników faksu zakończona sukcesem! Przeniesienie pola maila faksu zakończone sukcesem TIFF Następujące trasy przychodzące miały przetwarzanie FAX, które zakończyło się niepowodzeniem, ponieważ miały dostęp do urządzenia bez użytkownika skojarzonego. Zostały one wyłączone i będą musiały być aktualizowane. Kliknij ikonę usuwania po prawej, aby usunąć niniejsze zawiadomienie. Wychodzący identyfikator faksu. To zazwyczaj Twój numer faksu. Może być to sformułowane jak 'użytkownik@przykład.com' lub Użytkownik faksu <użytkownik@przykład.com>'. Druga opcja wyświetli 'Użytkownik faksu' w polu 'od' w większości maili klientów. Typ wykrywania faksów do wykorzystania (na przykład SIP lub DAHDI) Rodzaj wykrywania faksu do użycia. Nie możliwe do przeniesienia %s, z powodu [%s]. Proszę sprawdzić miejsce docelowe odbiorcy faksu przez Ostrzeżenie: tabela użytkowników faksu może używać starego schematu! Ostrzeżenie: przeniesienie zakończone niepowodzeniem. Długość maila ograniczona jest do 50 znaków. Ostrzeżenie: tabela faksów przychodzących może nadal używać schematu 2.6! Jeżeli moduł fax nie zostanie wykryty, nie zostanie wygenerowany domyślny dialplan detekcji fax. Jeżeli system jest używany z fizycznym urządzeniem FAX, hylafax + modem IAX lub inne urządzenie fax. Możesz wymusić aby dialplan został wygenerowany w tym miejscu. Gdzie wysłać faksy Tak Tak: spróbuj automatycznie określić typ połączenia; drogę do miejsca docelowego faksu jeśli połączenie jest faksem, w przeciwnym wypadku wyślij do stałego miejsca docelowego. Użyj tej opcji jeśli otrzymałeś zarówno połączenie głosowe i faks równocześnie Twój maksymalny wskaźnik transferu ustawiony jest na 2400 w tych okolicznościach może to przerwać wysyłanie faksu Twój minimalny wskaźnik transferu ustawiony jest na 2400 w tych okolicznościach może to przerwać wysyłanie faksu wszystkie migracje zakończono pomyślnie już zakończone pusty zakończone kopiowanie, usuwanie ze starego rdzenia.. zakończony niepowodzeniem przeniesione ustawienia domyślne migracji.. niepotrzebne nieobecne usunięto rozpoczęcie przenoszenia nieznany błąd użyj  