package flight;

#if hl

typedef ObjMaterialEntry = flight._hl.ObjMaterialEntry;

#elseif cpp

typedef ObjMaterialEntry = flight._cpp.ObjMaterialEntry;

#elseif (js && flight_esm)

typedef ObjMaterialEntry = flight._js.ObjMaterialEntry;

#elseif js

#error "flight.ObjMaterialEntry on js requires flight_esm."

#else

#error "flight.ObjMaterialEntry: no backend for this target."

#end
