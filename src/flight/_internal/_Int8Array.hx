package flight._internal;

#if js
typedef _Int8Array<T = Dynamic> = js.lib.Int8Array;
#else
#error "Int8Array-backed transpiled modules require a target runtime implementation."
#end
