package flight;

#if hl

typedef CreateTextureOptions = flight._hl.CreateTextureOptions;

#elseif cpp

typedef CreateTextureOptions = flight._cpp.CreateTextureOptions;

#elseif (js && flight_esm)

typedef CreateTextureOptions = flight._js.CreateTextureOptions;

#elseif js

#error "flight.CreateTextureOptions on js requires flight_esm."

#else

#error "flight.CreateTextureOptions: no backend for this target."

#end
