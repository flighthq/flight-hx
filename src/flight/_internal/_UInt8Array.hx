package flight._internal;

#if js
typedef _UInt8Array<T = Dynamic> = js.lib.Uint8Array;
#else
#error "flight-compiler's transpiled SDK currently requires the JavaScript target runtime."
#end
