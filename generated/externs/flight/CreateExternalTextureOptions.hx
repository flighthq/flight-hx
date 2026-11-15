package flight;

#if hl

typedef CreateExternalTextureOptions = flight._hl.CreateExternalTextureOptions;

#elseif cpp

typedef CreateExternalTextureOptions = flight._cpp.CreateExternalTextureOptions;

#elseif (js && flight_esm)

typedef CreateExternalTextureOptions = flight._js.CreateExternalTextureOptions;

#elseif js

#error "flight.CreateExternalTextureOptions on js requires flight_esm."

#else

#error "flight.CreateExternalTextureOptions: no backend for this target."

#end
