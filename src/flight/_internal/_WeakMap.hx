package flight._internal;

#if js
typedef _WeakMap<K, V> = js.lib.WeakMap<V>;
#else
#error "flight-compiler's transpiled SDK currently requires the JavaScript target runtime."
#end
