package flight;

#if hl

typedef ObjMaterialHandler = flight._hl.ObjMaterialHandler;

#elseif cpp

typedef ObjMaterialHandler = flight._cpp.ObjMaterialHandler;

#elseif (js && flight_esm)

typedef ObjMaterialHandler = flight._js.ObjMaterialHandler;

#elseif js

#error "flight.ObjMaterialHandler on js requires flight_esm."

#else

#error "flight.ObjMaterialHandler: no backend for this target."

#end
