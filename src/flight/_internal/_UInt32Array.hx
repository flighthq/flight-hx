package flight._internal;

#if js
typedef _UInt32Array<T = Dynamic> = js.lib.Uint32Array;
#else
#error "flight-compiler's transpiled SDK currently requires the JavaScript target runtime."
#end
