package flight;

#if hl

typedef UnitySerializeOptions = flight._hl.UnitySerializeOptions;

#elseif cpp

typedef UnitySerializeOptions = flight._cpp.UnitySerializeOptions;

#elseif (js && flight_esm)

typedef UnitySerializeOptions = flight._js.UnitySerializeOptions;

#elseif js

#error "flight.UnitySerializeOptions on js requires flight_esm."

#else

#error "flight.UnitySerializeOptions: no backend for this target."

#end
