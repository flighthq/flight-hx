package flight;

#if hl

typedef AssetDescriptor = flight._hl.AssetDescriptor;

#elseif cpp

typedef AssetDescriptor = flight._cpp.AssetDescriptor;

#elseif (js && flight_esm)

typedef AssetDescriptor = flight._js.AssetDescriptor;

#elseif js

#error "flight.AssetDescriptor on js requires flight_esm."

#else

#error "flight.AssetDescriptor: no backend for this target."

#end
