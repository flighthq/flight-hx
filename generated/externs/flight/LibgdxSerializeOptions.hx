package flight;

#if hl

typedef LibgdxSerializeOptions = flight._hl.LibgdxSerializeOptions;

#elseif cpp

typedef LibgdxSerializeOptions = flight._cpp.LibgdxSerializeOptions;

#elseif (js && flight_esm)

typedef LibgdxSerializeOptions = flight._js.LibgdxSerializeOptions;

#elseif js

#error "flight.LibgdxSerializeOptions on js requires flight_esm."

#else

#error "flight.LibgdxSerializeOptions: no backend for this target."

#end
