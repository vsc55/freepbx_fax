��    ]           �      �  K   �  w   5     �  k  �  7        T     s  $   �  $   �     �     �     �      �          !     .  �   >     <  n   J  �   �  
   �  !   �     �     �  (   �     '  Y   =     �     �     �     �     �     �     �               &     2     ;  +   G     s  9   w  �   �  &   g  �   �     Q     p  �   �     i     q     �  �   �     t     {  7   �  u   �  &   ?     f  7   |     �     �     �  M   �  �   '     �     �     �     
          '     -  �   1     �  p   �     d     k  E   p  �   �  0   _     �  S   �  �        �  �   �     �  R   �     �  �   �  X   �  X         y     �  �  �  [   .  �   �     B   T  E   H   �#  :   �#      $  "   ?$  0   b$     �$     �$     �$  3   �$  )   �$     '%     8%  ]  S%     �&  �   �&  .  I'  	   x(  >   �(  
   �(  0   �(  9   �(     7)     O)     �)     �)     �)     �)     *     **     I*     a*     �*     �*     �*     �*  _   �*     /+  Y   3+  �   �+  6   b,  (  �,  )   �-  $   �-  r  .     �/  8   �/     �/  =  �/     1     $1  _   C1  �   �1  [   q2  "   �2  c   �2     T3     g3     �3  �   �3  �   ,4     ,5     25     O5     n5     �5     �5     �5  !  �5     �6  �   �6  	   7     �7  p   �7  �   �7  K   �8  -   59  p   c9  �   �9  
   �:  l  �:     <  i   ;<     �<  M  �<  �   �=  �   �>     W?     k?         H       U          =   L                 +   7      )      "      6              V       .      M   #   :   -                 2           O   !       @   F   /   	   S   &   E   4      %   X   [   \                      P   ;   0   K       N           (              A   W                           9      D           
   J   T   ?       G      5                Z      ,   I   B      $   ]              Q         >   1      3   8       Y       <       R   '   C   *         fax detection; requires 'faxdetect=' to be set to 'incoming' or 'both' in  "You have selected Fax Detection on this route. Please select a valid destination to route calls detected as faxes to." A4 Address to email faxes to on fax detection.<br />PLEASE NOTE: In this version of FreePBX, you can now set the fax destination from a list of destinations. Extensions/Users can be fax enabled in the user/extension screen and set an email address there. This will create a new destination type that can be selected. To upgrade this option to the full destination list, select YES to Detect Faxes and select a destination. After clicking submit, this route will be upgraded. This Legacy option will no longer be available after the change, it is provided to handle legacy migrations from previous versions of FreePBX only. Adds configurations, options and GUI for inbound faxing Always Generate Detection Code Attachment Format Attempt to detect faxes on this DID. Auto generated migrated user for Fax Both Dahdi Default Fax header Default Local Station Identifier Default Paper Size Detect Faxes Dial System FAX ERROR: No Fax license detected.<br>Fax-related dialplan will <b>NOT</b> be generated!<br>This module has detected that Fax for Asterisk is installed without a license.<br>At least one license is required (it is available for free) and must be installed. Email address Email address that faxes appear to come from if 'system default' has been chosen as the default fax extension. Email address that faxes are sent to when using the "Dial System Fax" feature code. This is also the default email for fax detection in legacy mode, if there are routes still running in this mode that do not have email addresses specified. Enable Fax Enable this user to receive faxes Enabled Enclosed, please find a new fax Enclosed, please find a new fax from: %s Error Correction Mode Error Correction Mode (ECM) option is used to specify whether
			 to use ecm mode or not. Fax Fax Configuration Fax Destination Fax Detection Fax Detection Time Fax Detection Wait Fax Detection type Fax Email Destination Fax Enabled Fax Options Fax Ring Fax user %s Finished Migrating fax users to usermanager For Formats to convert incoming fax files to before emailing. Header information that is passed to remote side of the fax transmission and is printed on top of every page. This usually contains the name of the person or entity sending the fax. How long to wait and try to detect fax How long to wait and try to detect fax. Please note that callers to a Dahdi channel will hear ringing for this amount of time (i.e. the system wont "answer" the call, it will just play ringing). Inbound Fax Destination Change Inbound Fax Detection: %s (%s) Inbound faxes now use User Manager users. Therefore you will need to re-assign all of your destinations that used 'Fax Recipients' to point to User Manager users. You may see broken destinations until this is resolved Inherit Invalid Email for Inbound Fax Legacy Legacy: Same as YES, only you can enter an email address as the destination. This option is ONLY for supporting migrated legacy fax routes. You should upgrade this route by choosing YES, and selecting a valid destination! Letter Maximum transfer rate Maximum transfer rate used during fax rate negotiation. Migrated user %s but unable to set email address to %s because an email [%s] was already set for User Manager User %s Migrating all fax users to usermanager Minimum transfer rate Minimum transfer rate used during fax rate negotiation. New fax from: %s New fax received No No fax detection methods found or no valid license. Faxing cannot be enabled. No: No attempts are made to auto-determine the call type; all calls sent to destination set in the 'General' tab. Use this option if this DID is used exclusively for voice OR fax. On Outgoing Email address Outgoing fax results PDF Received & processed: %s Reset SIP Select the default paper size.<br/>This specifies the size that should be used if the document does not specify a size.<br/> If the document does specify a size that size will be used. Settings Sip: use sip fax detection (t38). Requires asterisk 1.6.2 or greater and 'faxdetect=yes' in the sip config files Submit TIFF The outgoing Fax Machine Identifier. This is usually your fax number. This may be formatted as just 'user@example.com', or 'Fax User <user@example.com>'. The second option will display 'Fax User' in the 'From' field in most email clients. Type of fax detection to use (e.g. SIP or DAHDI) Type of fax detection to use. Unable to migrate %s, because [%s]. Please check your 'Fax Recipients' destinations User Manager users '%s' have the ability to receive faxes but have no email address defined so they will not be able to receive faxes over email, Via When no fax modules are detected the module will not generate any detection dialplan by default. If the system is being used with phyical FAX devices, hylafax + iaxmodem, or other outside fax setups you can force the dialplan to be generated here. Where to send the faxes Whether to ring while attempting to detect fax. If set to no silence will be heard Yes Yes: try to auto determine the type of call; route to the fax destination if call is a fax, otherwise send to regular destination. Use this option if you receive both voice and fax calls on this line Your maximum transfer rate is set to 2400 in certain circumstances this can break faxing Your minimum transfer rate is set to 2400 in certain circumstances this can break faxing Zaptel use  Project-Id-Version: PACKAGE VERSION
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2021-11-07 02:38+0000
PO-Revision-Date: 2017-07-14 10:35+0200
Last-Translator: PETER <ftek@ymail.com>
Language-Team: Vietnamese <http://weblate.freepbx.org/projects/freepbx/fax/vi/>
Language: vi
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=1; plural=0;
X-Generator: Weblate 2.4
  Phát hiện fax, yêu cầu 'faxdetect=' phải cài đặt là 'incoming' hoặc 'both'  "Bạn vừa lựa chọn Phát hiện Fax trong tuyến này. Vui lòng chọn một điểm đích hợp lệ để định tuyến các cuộc gọi được phát hiện là fax." A4 Địa chỉ để gửi email fax đến phát hiện fax.<br /> XIN LƯU Ý: Trong phiên bản FreePBX này, bạn có thể cài đặt điểm đích fax từ danh sách các điểm đích. Các máy nhánh / Người dùng có thể được kích hoạt fax trong màn hình và cài đặt một địa chỉ email ở đó. Thao tác này sẽ tạo một kiểm điểm đích mới mà chúng có thể sẽ được chọn. Để nâng cấp tùy chọn này lên danh sách điểm đích đầy đủ, hãy chọn YES để xóa Fax và chọn một điểm đích. Sau khi nhấn vào Gửi, tuyến này sẽ được nâng cấp. Sau khi bạn thay đổi, Tùy chọn Legacy này sẽ không còn khả dụng, mà  nó chỉ được cung cấp để xử lý việc di chuyển legacy từ các phiên bản trước của FreePBX. Thêm các cấu hình, tùy chọn và GUI cho việc chuyển fax vào Luôn luôn khởi tạo mã phát hiện (Detection Code) Định dạng tệp đính kèm Cố xóa các fax trong DID này. Khởi tạo tự động người dùng cho Fax Cả hai Mô đun Dahdi Mặc định tiêu đề Fax Mặc định bộ nhận dạng trạm tại chỗ Mặc định kích thước trang giấy Phát hiện Fax Hệ thống quay số FAX ERROR: Không phát hiện giấy phép Fax nào. <br> Kế hoạch quay số liên quan đến Fax sẽ <b> NOT </ b> được khởi tạo! <br> Mô-đun này đã phát hiện rằng Fax cho Asterisk được cài đặt mà không có giấy phép. <br> Yêu cầu có ít nhất một giấy phép (miễn phí) và phải được cài đặt. Địa chỉ Email Địa chỉ email mà fax được gửi đi nếu 'mặc định hệ thống' được chọn như máy nhánh fax mặc định. Địa chỉ email mà fax được gửi đến khi sử dụng mã tính năng  "Dial System Fax". Điều này cũng sẽ mặc định email cho việc phát hiện fax tại chế độ legacy khi các tuyến vẫn đang chạy ở chế độ này mà không có địa chỉ email xác định. Bật Fax Bật người dùng này để họ có thể nhận các fax Đã bật Đã đính kèm, vui lòng tìm một fax mới Đã đính kèm, vui lòng tìm một fax mới từ: %s Chế độ sửa lỗi Tùy chọn Chế độ sửa lỗi (ECM)  được dùng để xác định có nên sửa dụng chế độ này hay không. Fax Cấu hình Fax Điểm đích của Fax Phát hiện Fax Thời gian phát hiện Fax Đợi phát hiện hiện Fax Kiểu phát hiện fax Điểm đích của Email Fax Fax đã được bật Các tùy chọn Fax Chuông Fax Người dùng Fax %s Đã hoàn thành việc di chuyển người dùng fax đến trình quản lý người dùng Cho Các định dạng để chuyển đổi các tệp fax đến trước khi gửi email. Thông tin tiêu đề được chuyển đến phía của truyền tải fax từ xa và được in tại đầu mỗi trang. Tiêu đề sẽ chứa tên của một người hoặc đối tượng gửi fax. Đợi và cố gắng phát hiện fax trong bao lâu Đợi và cố gắng phát hiện fax trong bao lâu. Vui lòng lưu ý rằng những người gọi đến kênh Dahdi sẽ nghe một hồi chuông trong khoảng thời gian đó ( cụ thể là hệ thống sẽ không 'trả lời' cuộc gọi' mà nó sẽ chỉ bật nhạc chuông). Thay đổi điểm đích Fax gửi vào Phát hiện Fax gửi vào: %s (%s) Các fax gửi vào đang sử dụng những người dùng Trình quản lý người dùng. Do đó bạn sẽ cần phải gán lại tất cả các điểm đích sử dụng 'Fax Recipients' để chỉ tới những người dùng Trình quản lý người dùng. Bạn có thể em những điểm đích bị lỗi cho đến khi chúng được xử lý xong Kế thừa Email không hợp lệ đối với các Fax gửi vào Phần mềm Legacy Legacy: Tương tự như YES, chỉ mình  bạn mới có thể nhập một địa chỉ email làm điểm đến. Tùy chọn này CHỈ nhằm hỗ trợ các tuyến fax legacy đã dịch chuyển. Bạn nên nâng cấp tuyến này bằng cách chọn YES, và chọn một điểm đích đến hợp lệ! Ký tự Tốc độ truyền tối đa Tốc độ truyền tối đa sử dụng trong quá trình thương lượng tốc độ fax. Đã dịch chuyển người dùng %s nhưng không thể cài đặt địa chỉ email về %s do một email [%s]  đã được cài đặt sẵn cho người dùng Trình quản lý người dùng %s Đang dịch chuyển tất cả người dùng fax đến trình quản lý người dùng Tốc độ truyền tối thiểu Tốc độ truyền tối thiểu sử dụng trong quá trình thương lượng tốc độ fax. Fax mới từ: %s Nhận được fax mới Không Không có phương pháp phát hiện fax nào được tìm thấy hoặc giấy phép không hợp lệ. Việc chuyển fax không thể kích hoạt được. Không: No sẽ tự động xác định kiểu cuộc gọi; Tất cả các cuộc gọi được gửi tới điểm đích được cài đặt trong tab 'General'. Sử dụng tùy chọn này nếu DID này dành riêng cho thư thoại hoặc fax. Trên Địa chỉ email gửi đi Các kết quả fax gửi đi Định dạng PDF Đã nhận & đã xử lý: %s Cài đặt lại SIP Chọn kích cỡ giấy mặc định.<br/> Điều này sẽ xác định kích cỡ sẽ được sử dụng nếu tài liệu không chỉ định kích thước rõ ràng.<br/> Nếu tài liệu không có kích thước cụ thể thì kích thước này sẽ được sử dụng. Cài đặt Sip: sử dụng phát hiện fax sip (t38). Yêu cầu Asterusk 1.6.2 hoặc cao hơn và trong các tệp cấu hình sip phải đặt "faxdetect=yes' Gửi đi TIFF Bộ nhận dạng máy fax gửi đi. Thường là số fax của bạn se được dùng để nhận dạng. Điều này có thể được định dạng chỉ là 'user@example.com', hoặc 'Fax User <user@example.com>'. Tùy chọn thứ hai sẽ hiển thị 'Fax User' tại trường 'From' trong hầu hết các trình duyệt email. Kiểu phát hiện fax được sử dụng ( cụ thể SIP hoặc DAHDI) Kiểu phát hiện fax được sử dụng. Không thể dịch chuyển %s vì [%s]. Vui lòng kiểm tra các điểm đích 'Fax Recipients'  của bạn Người dùng Trình quản lý người dùng '%s' có khả năng nhận các fax nhưng không có địa chỉ email nào được xác nhận vì vậy chúng sẽ không thể nhận các fax qua eamail, Thông qua Khi không phát hiện được mô đun fax nào, theo mặc định, mô đun sẽ khởi tạo bất kỳ phát hiện kế hoạch quay số nào. Nếu hệ thống đang sử dụng các thiết bị FAX vật lý nào, hylafax + iaxmodem, hay các thiết lập fax bên ngoài khác, sẽ buộc bạn phải khởi tạo kế hoạch quay số ở đây. Gửi các fax đến đâu Có nên đặt chuông khi đang cố phát hiện fax. Nếu cài đặt là no, chuông sẽ im lặng Có Yes: sẽ tự động xác định kiểu cuộc gọi; tuyến dẫn tới điểm đích fax nếu cuộc gọi là một fax, nếu không sẽ được gởi đến các điểm đích thông thường. Sử dụng tùy chọn này nếu bạn nhận cả các cuộc gọi thoại và cuộc gọi fax trên đường dây này Tốc độ truyền tối đa của bạn được cài đặt là 2400 trong một số trường hợp nhất định, điều này có thể làm hỏng việc gửi fax Tốc độ truyền tối thiểu của bạn được cài đặt là 2400 trong một số trường hợp nhất định, điều này có thể làm hỏng việc gửi fax Phần mềm Zaptel sử dụng  