# WebSocket 介绍
WebSocket protocol 是HTML5一种新的协议(protocol)。它是实现了浏览器与服务器全双工通信(full-duplex)。
许多网站实现即时通讯所用的技术都是轮询(polling)。这种传统的HTTP request的模式带来很明显的缺点 – 浏览器需要不断的向服务器发出请求(request)，然而HTTP request 的header是非常长的，里面包含的数据可能只是一个很小的值，这样会占用很多的带宽。而最比较新的技术去做轮询的效果是Comet – 用了AJAX。但这种技术虽然可达到全双工通信，但依然需要发出请求(reuqest)。

而websocket是在物理层非网络层建立一条客户端至服务器的长连接(握手)，以此来保证服务器向客户端的即时推送，既不耗费线程资源，又不会不断向服务器轮询请求

#握手协议

websocket是独立的基于TCP的协议， 其跟http协议的关系仅仅是 WebSocket 的握手被http 服务器当做 Upgrade request http包处理。 websocket 有自己的握手处理。 TCP连接建立后，client 发送websocket 握手请求. 请求包需求如下：

* 必须是有效的http request 格式o
* HTTP request method 必须是GET，协议应不小于1.1 如： Get /chat HTTP/1.1
* 必须包括Upgrade 头域，并且其值为“websocket”
* 必须包括"Connection" 头域，并且其值为 "Upgrade"
* 必须包括"Sec-WebSocket-Key"头域，其值采用base64编码的随机16字节长的字符序列， 服务器端根据该域来判断client 确实是websocket请求而不是冒充的，如http。响应方式是，首先要获取到请求头中的Sec-WebSocket-Key的值，再把这一段GUID "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"加到获取到的Sec-WebSocket-Key的值的后面，然后拿这个字符串做SHA-1 hash计算，然后再把得到的结果通过base64加密，就得到了返回给客户端的Sec-WebSocket-Accept的http响应头的值。
* 如果请求来自浏览器客户端，还必须包括Origin头域 。 该头域用于防止未授权的跨域脚本攻击，服务器可以从Origin决定是否接受该WebSocket连接。
* 必须包括"Sec-webSocket-Version" 头域，当前值必须是13.
* 可能包括"Sec-WebSocket-Protocol"，表示client（应用程序）支持的协议列表，server选择一个或者没有可接受的协议响应之。
* 可能包括"Sec-WebSocket-Extensions"， 协议扩展， 某类协议可能支持多个扩展，通过它可以实现协议增强
* 可能包括任意其他域，如cookie

客户端到服务端： 
GET /demo HTTP/1.1 
Host: example.com 
Connection: Upgrade 
Sec-WebSocket-Key2: 12998 5 Y3 1 .P00 
Upgrade: WebSocket 
Sec-WebSocket-Key1: 4@1 46546xW%0l 1 5 
Origin: http://example.com 
[8-byte security key] 
Server 接手到握手请求后应处理该请求包括：

* 处理请求包括处理GET 方法
* 验证Upgrader头域
* 验证Connection 头域
* 处理Sec-WebSocket-Key头域，方法见上；
* 处理Sec-WebSocket-Version
* 处理Origin头域，可选, 浏览器必须发送该头域
* 处理Sec-WebSocket-Protocol头域，可选
* 处理Sec-WebSocket-Extensions 头域，可选
* 处理其他头域，可选
* Server 发送握手响应，这里只介绍服务器接受该连接情况下，包括：
* http Status-Line
* Upgrade 头域 ，值必须是"websocket"
* Conntion头域，值必须是：“Upgrade”
* Sec-WebSocket-Accept” 头域，该头域的值即处理Sec-WebSocket-Key" 域后的结果。
* 可选的"Sec-WebSocket-Protocol"头域
* 可选的"Sec-WebSocket-Extensions"头域

服务端到客户端：
HTTP/1.1 101 WebSocket Protocol Handshake 
Upgrade: WebSocket 
Connection: Upgrade 
WebSocket-Origin: http://example.com 
WebSocket-Location: ws://example.com/demo 
[16-byte hash response]

从客户端到服务器端请求的信息里包含有”Sec-WebSocket-Key1”、“Sec-WebSocket-Key2”和”[8-byte securitykey]”这样的头信息。这是客户端浏览器需要向服务器端提供的握手信息，服务器端解析这些头信息，并在握手的过程中依据这些信息生成一个 16 位的安全密钥并返回给客户端，以表明服务器端获取了客户端的请求，同意创建 WebSocket 连接。一旦连接建立，客户端和服务器端就可以通过这个通道双向传输数据了。在成功握手后，客户端和服务器来回传输数据是以消息message为概念单位的。在传输介质上（on the wire），一个消息由一个或多个帧frame组成。WebSocket消息不需要对应到特定网络层的帧，因为分帧后的消息可能被中间设施合并或拆分。