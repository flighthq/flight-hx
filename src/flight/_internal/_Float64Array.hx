package flight._internal;

#if js
typedef _Float64Array<T = Dynamic> = js.lib.Float64Array;
#else
#error "flight-compiler's transpiled SDK currently requires the JavaScript target runtime."
#end
