package flight;

#if hl

typedef TextureAtlasFormatDescriptor = flight._hl.TextureAtlasFormatDescriptor;

#elseif cpp

typedef TextureAtlasFormatDescriptor = flight._cpp.TextureAtlasFormatDescriptor;

#elseif (js && flight_esm)

typedef TextureAtlasFormatDescriptor = flight._js.TextureAtlasFormatDescriptor;

#elseif js

#error "flight.TextureAtlasFormatDescriptor on js requires flight_esm."

#else

#error "flight.TextureAtlasFormatDescriptor: no backend for this target."

#end
