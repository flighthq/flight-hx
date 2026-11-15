package flight;

#if hl

typedef Physics2DDebugGeometryOptions = flight._hl.Physics2DDebugGeometryOptions;

#elseif cpp

typedef Physics2DDebugGeometryOptions = flight._cpp.Physics2DDebugGeometryOptions;

#elseif (js && flight_esm)

typedef Physics2DDebugGeometryOptions = flight._js.Physics2DDebugGeometryOptions;

#elseif js

#error "flight.Physics2DDebugGeometryOptions on js requires flight_esm."

#else

#error "flight.Physics2DDebugGeometryOptions: no backend for this target."

#end
