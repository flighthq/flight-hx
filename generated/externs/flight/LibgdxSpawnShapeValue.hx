package flight;

#if hl

typedef LibgdxSpawnShapeValue = flight._hl.LibgdxSpawnShapeValue;

#elseif cpp

typedef LibgdxSpawnShapeValue = flight._cpp.LibgdxSpawnShapeValue;

#elseif (js && flight_esm)

typedef LibgdxSpawnShapeValue = flight._js.LibgdxSpawnShapeValue;

#elseif js

#error "flight.LibgdxSpawnShapeValue on js requires flight_esm."

#else

#error "flight.LibgdxSpawnShapeValue: no backend for this target."

#end
