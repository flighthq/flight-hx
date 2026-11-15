package flight;

#if hl

typedef CreateTexture2DOptions = flight._hl.CreateTexture2DOptions;

#elseif cpp

typedef CreateTexture2DOptions = flight._cpp.CreateTexture2DOptions;

#elseif (js && flight_esm)

typedef CreateTexture2DOptions = flight._js.CreateTexture2DOptions;

#elseif js

#error "flight.CreateTexture2DOptions on js requires flight_esm."

#else

#error "flight.CreateTexture2DOptions: no backend for this target."

#end
