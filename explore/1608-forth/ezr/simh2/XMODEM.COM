1���1 �a���2P!Y5��s*N#"N>��:N��/��!  "Q �*W~���Q#�C:\��_�*Q|��My��ͼ��("W�Z�>��ͼ�s͍OK
Sent����,��ڦ*N#"N�Z��Ðͅ����͍O�͍Received�*N��F blocks$�2P�w�����7� 9ʳ�u��͡�W:S��!P4~�
���ó>2S�u��W�u��/���2M!  "Q �*W�u��w�Q#�7:\��]�u���*QM�����u�����:NG:M�����=¶"W!Y4:V��:Y��Ga�}�\ �}�³� �2Y!a"W�óx�w����_͡{����W��͡!P4~�
�ó\ �}<��CFILE CLOSE ERROR! May be corrupt.$:Z�7�:VGa�}�\ �}2Z��A� ��#!a"W:V�2Y�7�W�Oz��*Q�g!)�k|�g}�o�a"Q����*]-|*Tʯ����ړ� ����>�H�¦��җ��>	�H�ɷ»>�H���>�H¸��һ��+}��͡7�*T��>�O:]���:]�>��>�Hy���!  +|��� ���y����,ó ���2��2���2���2}�C>��T]<	�5��_��W{�0O>����R����* o�-:+:_<�2_�<�F�2_͇�F\ �}	���� ����͐��͇��~��E~#�����>�H��>	�H���͍ABORT:��{:[��J��*N|�´�s<�J�CEmpty file deleted$^C$10 block errors$10 ACK errors$lost blocks$disk write fail$UART Tx fail$sync fail$͇��{�           a�C ;\ �}<ʽ����͍File open
Sen�͐ing via�:]=ʨ��͐direct I/��͐RDR/PU��2_͐CO���CFile not found$Z!\6 ʳ�u����C��w:_<�͐ with CRC��:_<�͐ with checksum��no init from receiver$\ �}<�y͍File exists. Overwrite (Y/N)�!� 6�
�}�#5�J#~� �y�J�2Y�s͍File creat��}<��͐d
Recei�ͅ:]�´X����Ү����:\���2S���:S���F fail. Write protect? Dir full?$���>2`!� NP~#���}<��2ZN2V�K�%�|�A�/�94> � �*��!h w#�G* ��|�[>���2V:[G<��CMust specify /R or /S$�K���;��/¢�|ڢ!��#N#ڊ�G!�	�2\�<2^�͇�|���E÷�2���� ���o�g�O������!���!�����=2_�<2[��|�0��2]��|�1�	�<2`��|���͍=========================
XMODEM 2.3 By M. Eberhard
=========================
Usage:
 XMODEM filename options
^C aborts
Command line and XMODEM.CFG options:
 /R to receive or /S to send
 /C receive with checksums, otherwise CRC checking
    (Receiver sets error-check mode when sending)
 /E if RDR returns with Z set when not ready
 /M console message
 /O pp h1 ... hn outputs bytes h1-hn to port pp
--More-�ͨ�C /P ss dd qq rr tt defines direct I/O port
   ss = status port
   dd = data port
   qq = 00 if ready bits are true low, 01 if true high
   rr = Rx ready bit mask
   tt = Tx ready bit mask
 /Q for Quiet; else + for good block, - for retry
 /X0 use CON
 /X1 use RDR/PUN (default)
 /X2 use direct I/O, default 88-SIO
 /Zm for m MHz CPU. 0<m<10, default m=2
CON and RDR must not strip parity.
Values for /O and /P are 2-digit hex.$2�͍/& unrecognize�é͍Jun�:Z����F in XMODEM.CFG$�F in command line$:]�=�����:`!  	=��"T�s##w#y��6�#####r�����͍Bad valu�é�K��;�4����G�7���4��|��:�E�A���0�?��|��K� �K�	�K�:Z������}��}���7�6�!V~��]��7�5���
7?�C EM	OP&QKRQSPXUZc� XMODEM  CFG                                                                          