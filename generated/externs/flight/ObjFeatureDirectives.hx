package flight;

#if hl

typedef ObjFeatureDirectives = flight._hl.ObjFeatureDirectives;

#elseif cpp

typedef ObjFeatureDirectives = flight._cpp.ObjFeatureDirectives;

#elseif (js && flight_esm)

typedef ObjFeatureDirectives = flight._js.ObjFeatureDirectives;

#elseif js

#error "flight.ObjFeatureDirectives on js requires flight_esm."

#else

#error "flight.ObjFeatureDirectives: no backend for this target."

#end
