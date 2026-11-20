package flight;

#if hl

typedef DialogVideo = flight._hl.DialogVideo;

#elseif cpp

typedef DialogVideo = flight._cpp.DialogVideo;

#elseif (js && flight_esm)

typedef DialogVideo = flight._js.DialogVideo;

#elseif js

#error "flight.DialogVideo on js requires flight_esm."

#else

#error "flight.DialogVideo: no backend for this target."

#end
