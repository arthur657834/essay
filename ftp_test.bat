echo ftptest>> ftp.txt
echo 123456>> ftp.txt
echo ascii>> ftp.txt
echo type>> ftp.txt
echo bin>> ftp.txt
echo pwd>> ftp.txt
echo ls>> ftp.txt
echo dir>> ftp.txt
echo status>> ftp.txt
echo verbose>> ftp.txt
echo help>> ftp.txt
echo ?>> ftp.txt
echo prompt>> ftp.txt
echo mkdir test>> ftp.txt
echo put ftp.txt>> ftp.txt
echo append ftp1.txt>> ftp.txt
echo send ftp2.txt>> ftp.txt
echo mput ftp4.txt ftp3.txt>> ftp.txt
echo rmdir test>> ftp.txt
echo rename ftp.txt 1.txt>> ftp.txt
echo delete 1.txt>> ftp.txt
echo mdelete ftp1.txt ftp2.txt ftp3.txt ftp4.txt>> ftp.txt
echo quote 1>> ftp.txt
echo literal 1>> ftp.txt
echo remotehelp>> ftp.txt
echo trace>> ftp.txt
echo hash>> ftp.txt
echo glob>> ftp.txt
echo bell>> ftp.txt
echo debug 3>> ftp.txt
echo lcd C:\tmp>> ftp.txt
echo ls>> ftp.txt
echo cd picture>> ftp.txt
echo cd ..>> ftp.txt
echo get picture/grass.jpg>> ftp.txt
echo trace>> ftp.txt
echo hash>> ftp.txt
echo debug 3>> ftp.txt
echo glob>> ftp.txt
echo prompt>> ftp.txt
echo verbose>> ftp.txt
echo bell>> ftp.txt
echo bye>> ftp.txt
copy ftp.txt ftp1.txt
copy ftp.txt ftp2.txt
copy ftp.txt ftp3.txt
copy ftp.txt ftp4.txt
ftp -s:%~dp0ftp.txt 192.168.0.28
ping 127.0.0.1 -n 2
del C:\tmp\grass.jpg %~dp0ftp.txt %~dp0ftp1.txt %~dp0ftp2.txt %~dp0ftp3.txt %~dp0ftp4.txt
pause