package flight;

#if hl

typedef VelocityField = flight._hl.VelocityField;

#elseif cpp

typedef VelocityField = flight._cpp.VelocityField;

#elseif (js && flight_esm)

typedef VelocityField = flight._js.VelocityField;

#elseif js

#error "flight.VelocityField on js requires flight_esm."

#else

#error "flight.VelocityField: no backend for this target."

#end
