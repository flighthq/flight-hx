package flight._internal;

#if js
typedef _Promise<T> = js.lib.Promise<T>;
#else
#error "flight-compiler's transpiled SDK currently requires the JavaScript target runtime."
#end
