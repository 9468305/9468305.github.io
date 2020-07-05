---
layout: post
title: "Android InetAddress.isReachable()"
author: ChenQi
category: Tech
---

JDK 1.5 起，提供了用于检测主机地址是否存在的API：  
`java.net.InetAddress.isReachable()`

入口：

```java
package java.net;

public class InetAddress {

    /**
     * Test whether that address is reachable. Best effort is made by the
     * implementation to try to reach the host, but firewalls and server
     * configuration may block requests resulting in a unreachable status
     * while some specific ports may be accessible.
     * A typical implementation will use ICMP ECHO REQUESTs if the
     * privilege can be obtained, otherwise it will try to establish
     * a TCP connection on port 7 (Echo) of the destination host.
     * <p>
     * The timeout value, in milliseconds, indicates the maximum amount of time
     * the try should take. If the operation times out before getting an
     * answer, the host is deemed unreachable. A negative value will result
     * in an IllegalArgumentException being thrown.
     *
     * @param   timeout the time, in milliseconds, before the call aborts
     * @return a {@code boolean} indicating if the address is reachable.
     * @throws IOException if a network error occurs
     * @throws  IllegalArgumentException if {@code timeout} is negative.
     * @since 1.5
     */
    public boolean isReachable(int timeout) throws IOException {
        return isReachable(null, 0 , timeout);
    }

    public boolean isReachable(NetworkInterface netif, int ttl,
                               int timeout) throws IOException {
        if (ttl < 0)
            throw new IllegalArgumentException("ttl can't be negative");
        if (timeout < 0)
            throw new IllegalArgumentException("timeout can't be negative");

        return impl.isReachable(this, timeout, netif, ttl);
    }
}
```

阻塞式方法，先使用 ICMP ECHO REQUESTs，若失败则使用 TCP ECHO REQUESTs，尝试与远端主机建立端口7的TCP连接。  
实现位于：  
`java.net.Inet4AddressImpl.java`  
`java.net.Inet6AddressImpl.java`  

方法内部逻辑基本一致，再调用 `JNI` 底层：  
`private native boolean isReachable0()`  

往下就没再深究，大概率是C语言实现调用各具体平台API。运行时需要root权限。

--------
Android 1.0开始，基于 JDK 1.5，但具体实现有所不同。  
这部分源码有很多途径可查看。AOSP官网，Android SDK Source，androidxref.com。  
AndroidXRef 是一个专门用于在线阅读安卓源码的网站，提供了从1.6到9.0的所有版本。  
