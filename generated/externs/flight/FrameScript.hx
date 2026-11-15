package flight;

#if hl

typedef FrameScript = flight._hl.FrameScript;

#elseif cpp

typedef FrameScript = flight._cpp.FrameScript;

#elseif (js && flight_esm)

typedef FrameScript = flight._js.FrameScript;

#elseif js

#error "flight.FrameScript on js requires flight_esm."

#else

#error "flight.FrameScript: no backend for this target."

#end
