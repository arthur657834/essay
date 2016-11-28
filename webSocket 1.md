 ### webSocket是基于HTTP协议，或者说是借用了HTTP的协议来完成一部分的握手。

GET /chat HTTP/1.1
Host: xxxx.com
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Key: XXXXXX
Sec-WebSocket-Protocol: XXXX
Sec-WebSocket-Version: X
Origin: http://xxxx.com
以上就是一次webSocket的握手请求。

有两个参数：
    Upgrade：webSocket
    Connection：Upgrade

告诉服务器（Ngnix）接线员: attention please！爷发起的是webSocket协议，快帮我找一个对应的客服，不是那个蹩脚的HTTP客服。

Sec-WebSocket-Key: XXXXX
Sec-WebSocket-Protocol: A, B
Sec-WebSocket-Version: X

首先，Sec-WebSocket-Key 是一个Base64 encode的值，这个是浏览器随机生成的，告诉服务器：别忽悠我，我要验证你是不是webSocket客服。
然后，Sec_WebSocket-Protocol 是一个用户定义的字符串，用来区分同URL下，不同的服务所需要的子协议（客户端支持的子协议列表）。简单理解：今晚我要服务A，别搞错啦~
最后，Sec-WebSocket-Version 是告诉服务器所使用的Websocket版本 ：服务员，我要的是小学生，不是大学生噢→_→然后服务器会返回下列东西，表示已经接受到请求， 成功建立Websocket啦！
 
HTTP/1.1 101 Switching Protocols 
Upgrade: websocket 
Connection: Upgrade 
Sec-WebSocket-Accept: XXXX
Sec-WebSocket-Protocol: B
这部分就是HTTP最后负责的内容了，此后跟HTTP毫无关系。上诉内容中：
    Upgrade：webSocket
    Connection：Upgrade
告诉客户端，服务端已经成功升级成了webSocket协议了。
Sec-WebSocket-Accept: XXXX
这段内容是经过服务确认之后，根据客户端生成Sec-WebSocket-Key生成的值；简单理解，服务端：来，你个死傲娇，给你看我的ID info。
Sec-WebSocket-Protocol表示服务端从客户端提供的协议列表中，提供自身支持哪个（B）。
接下去的事，表示跟那个蹩脚的HTTP木有，完全木有，真的木有再有关系了，webSocket客服完全承包后续服务内容。