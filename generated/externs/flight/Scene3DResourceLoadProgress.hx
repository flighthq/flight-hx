package flight;

#if hl

typedef Scene3DResourceLoadProgress = flight._hl.Scene3DResourceLoadProgress;

#elseif cpp

typedef Scene3DResourceLoadProgress = flight._cpp.Scene3DResourceLoadProgress;

#elseif (js && flight_esm)

typedef Scene3DResourceLoadProgress = flight._js.Scene3DResourceLoadProgress;

#elseif js

#error "flight.Scene3DResourceLoadProgress on js requires flight_esm."

#else

#error "flight.Scene3DResourceLoadProgress: no backend for this target."

#end
