package flight._internal;

#if js
typedef _UInt16Array<T = Dynamic> = js.lib.Uint16Array;
#else
#error "flight-compiler's transpiled SDK currently requires the JavaScript target runtime."
#end
