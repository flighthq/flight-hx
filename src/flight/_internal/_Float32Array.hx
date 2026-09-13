package flight._internal;

#if js
typedef _Float32Array<T = Dynamic> = js.lib.Float32Array;
#else
#error "flight-compiler's transpiled SDK currently requires the JavaScript target runtime."
#end
