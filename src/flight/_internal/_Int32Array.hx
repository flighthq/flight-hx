package flight._internal;

#if js
typedef _Int32Array<T = Dynamic> = js.lib.Int32Array;
#else
#error "flight-compiler's transpiled SDK currently requires the JavaScript target runtime."
#end
