package flight;

#if hl

typedef UnityCurveKey = flight._hl.UnityCurveKey;

#elseif cpp

typedef UnityCurveKey = flight._cpp.UnityCurveKey;

#elseif (js && flight_esm)

typedef UnityCurveKey = flight._js.UnityCurveKey;

#elseif js

#error "flight.UnityCurveKey on js requires flight_esm."

#else

#error "flight.UnityCurveKey: no backend for this target."

#end
