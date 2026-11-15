package flight;

#if hl

typedef AgxToneMapOptions = flight._hl.AgxToneMapOptions;

#elseif cpp

typedef AgxToneMapOptions = flight._cpp.AgxToneMapOptions;

#elseif (js && flight_esm)

typedef AgxToneMapOptions = flight._js.AgxToneMapOptions;

#elseif js

#error "flight.AgxToneMapOptions on js requires flight_esm."

#else

#error "flight.AgxToneMapOptions: no backend for this target."

#end
