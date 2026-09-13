package flight._internal;

#if js
typedef _Map<K, V> = js.lib.Map<K, V>;
#else
#error "flight-compiler's transpiled SDK currently requires the JavaScript target runtime."
#end
