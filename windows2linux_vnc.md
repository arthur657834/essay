```
yum -y install tigervnc-server tigervnc-server-module

cp /lib/systemd/system/vncserver\@.service /etc/systemd/system/vncserver\@:1.service

vi /etc/systemd/system/vncserver\@:1.service
修改
ExecStart=/sbin/runuser -l <USER> -c "/usr/bin/vncserver %i"
PIDFile=/home/<USER>/.vnc/%H%i.pid

非root用户linoxide
ExecStart=/sbin/runuser -l linoxide -c "/usr/bin/vncserver %i"
PIDFile=/home/linoxide/.vnc/%H%i.pid

root用户
ExecStart=/sbin/runuser -l root -c "/usr/bin/vncserver %i"
PIDFile=/root/.vnc/%H%i.pid


systemctl enable vncserver@:1.service
vncpasswd
systemctl start vncserver@:1.service
systemctl status vncserver@:1.service

vncserver -kill :1
vncserver :1

netstat -lnt | grep 590*
grep vnc /var/log/messages

日志查看
tail -f /root/.vnc/lj-master-250\:1.log 


windows安装包下载:
http://www.realvnc.com/
10.1.50.250:1

centos7 开机图形化界面启动
ln -sf /lib/systemd/system/graphical.target /etc/systemd/system/default.target

systemctl set-default graphical.target
systemctl get-default
systemctl isolate graphical.target
在不重启的情况下，切换到图形界面下

```

