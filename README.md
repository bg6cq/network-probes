# network-probes 检测网络协议的各种脚本

命令格式：

```
检测命令 target

exit code 0:  test passed
exit code 1:  test failed

100-dns-ns-ipv6.sh 检测target是否存在IPv6格式的NS记录，target是域名(一般为*.*) 
100-dns-aaaa.sh 检测target是否存在AAAA记录，target是域名(一般为www.*.*)
200-http-ipv4.sh 检测target是否可以通过ipv4的HTTP协议访问，target是完整的URL(一般为http://...)
200-http-ipv6.sh 检测target是否可以通过ipv6的HTTP协议访问，target是完整的URL(一般为http://...)
200-https-ipv4.sh 检测target是否可以通过ipv4的HTTPS协议访问，target是完整的URL(一般为https://...)
200-https-ipv6.sh 检测target是否可以通过ipv6的HTTPS协议访问，target是完整的URL(一般为https://...)
200-http2-ipv4.sh 检测target是否可以通过ipv4的HTTP2协议访问，target是完整的URL(一般为https://...)
200-http2-ipv6.sh 检测target是否可以通过ipv6的HTTP2协议访问，target是完整的URL(一般为https://...)

```
