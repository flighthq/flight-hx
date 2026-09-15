package flight._internal;

#if js
typedef _Proxy<T:{}> = js.lib.Proxy<T>;
#else
#error "Proxy-backed transpiled modules require a target runtime implementation."
#end
