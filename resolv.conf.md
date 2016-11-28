resolv.conf：search、domain、nameserver解释


nameserver x.x.x.x该选项用来制定DNS服务器的，可以配置多个nameserver指定多个DNS。

domain mydomain.com这个用来指定本地的域名，在没有设置search的情况下，search默认为domain的值。这个值可以随便配，目前在我看来，domain除了当search的默认值外，没有其它用途。也就说一旦配置search，那domain就没用了。

search google.com baidu.com该选项可以用来指定多个域名，中间用空格或tab键隔开。它是干嘛的呢？
如：在没有配置该选项时，执行 ping news 
=> ping news.google.com ping news.baidu.com

