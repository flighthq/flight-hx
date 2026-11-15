package flight;

#if hl

typedef TexturePackerSerializeOptions = flight._hl.TexturePackerSerializeOptions;

#elseif cpp

typedef TexturePackerSerializeOptions = flight._cpp.TexturePackerSerializeOptions;

#elseif (js && flight_esm)

typedef TexturePackerSerializeOptions = flight._js.TexturePackerSerializeOptions;

#elseif js

#error "flight.TexturePackerSerializeOptions on js requires flight_esm."

#else

#error "flight.TexturePackerSerializeOptions: no backend for this target."

#end
