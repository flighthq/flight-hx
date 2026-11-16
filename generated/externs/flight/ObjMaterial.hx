package flight;

#if hl

typedef ObjMaterial = flight._hl.ObjMaterial;

#elseif cpp

typedef ObjMaterial = flight._cpp.ObjMaterial;

#elseif (js && flight_esm)

typedef ObjMaterial = flight._js.ObjMaterial;

#elseif js

#error "flight.ObjMaterial on js requires flight_esm."

#else

#error "flight.ObjMaterial: no backend for this target."

#end
