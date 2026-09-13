package flight._internal;

#if js
typedef _Int16Array<T = Dynamic> = js.lib.Int16Array;
#else
#error "flight-compiler's transpiled SDK currently requires the JavaScript target runtime."
#end
