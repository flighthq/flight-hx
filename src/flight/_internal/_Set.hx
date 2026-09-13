package flight._internal;

#if js
typedef _Set<T> = js.lib.Set<T>;
#else
#error "flight-compiler's transpiled SDK currently requires the JavaScript target runtime."
#end
