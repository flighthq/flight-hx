package flight;

#if hl

typedef Scene2DAudioResourceLoadProgress = flight._hl.Scene2DAudioResourceLoadProgress;

#elseif cpp

typedef Scene2DAudioResourceLoadProgress = flight._cpp.Scene2DAudioResourceLoadProgress;

#elseif (js && flight_esm)

typedef Scene2DAudioResourceLoadProgress = flight._js.Scene2DAudioResourceLoadProgress;

#elseif js

#error "flight.Scene2DAudioResourceLoadProgress on js requires flight_esm."

#else

#error "flight.Scene2DAudioResourceLoadProgress: no backend for this target."

#end
