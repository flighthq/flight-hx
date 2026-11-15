package flight;

#if hl

typedef AsepriteSerializeOptions = flight._hl.AsepriteSerializeOptions;

#elseif cpp

typedef AsepriteSerializeOptions = flight._cpp.AsepriteSerializeOptions;

#elseif (js && flight_esm)

typedef AsepriteSerializeOptions = flight._js.AsepriteSerializeOptions;

#elseif js

#error "flight.AsepriteSerializeOptions on js requires flight_esm."

#else

#error "flight.AsepriteSerializeOptions: no backend for this target."

#end
