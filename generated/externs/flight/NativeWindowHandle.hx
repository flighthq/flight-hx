package flight;

#if hl

typedef NativeWindowHandle = flight._hl.NativeWindowHandle;

#elseif cpp

typedef NativeWindowHandle = flight._cpp.NativeWindowHandle;

#elseif (js && flight_esm)

typedef NativeWindowHandle = flight._js.NativeWindowHandle;

#elseif js

#error "flight.NativeWindowHandle on js requires flight_esm."

#else

#error "flight.NativeWindowHandle: no backend for this target."

#end
