package flight;

#if hl

typedef Scene2DImageResourceLoadProgress = flight._hl.Scene2DImageResourceLoadProgress;

#elseif cpp

typedef Scene2DImageResourceLoadProgress = flight._cpp.Scene2DImageResourceLoadProgress;

#elseif (js && flight_esm)

typedef Scene2DImageResourceLoadProgress = flight._js.Scene2DImageResourceLoadProgress;

#elseif js

#error "flight.Scene2DImageResourceLoadProgress on js requires flight_esm."

#else

#error "flight.Scene2DImageResourceLoadProgress: no backend for this target."

#end
