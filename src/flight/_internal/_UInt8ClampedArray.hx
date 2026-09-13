package flight._internal;

#if js
typedef _UInt8ClampedArray<T = Dynamic> = js.lib.Uint8ClampedArray;
#else
#error "flight-compiler's transpiled SDK currently requires the JavaScript target runtime."
#end
