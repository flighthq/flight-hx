package flight;

#if hl

typedef StarlingPexSerializeOptions = flight._hl.StarlingPexSerializeOptions;

#elseif cpp

typedef StarlingPexSerializeOptions = flight._cpp.StarlingPexSerializeOptions;

#elseif (js && flight_esm)

typedef StarlingPexSerializeOptions = flight._js.StarlingPexSerializeOptions;

#elseif js

#error "flight.StarlingPexSerializeOptions on js requires flight_esm."

#else

#error "flight.StarlingPexSerializeOptions: no backend for this target."

#end
