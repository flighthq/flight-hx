package flight;

#if hl

typedef CurveKeyframe = flight._hl.CurveKeyframe;

#elseif cpp

typedef CurveKeyframe = flight._cpp.CurveKeyframe;

#elseif (js && flight_esm)

typedef CurveKeyframe = flight._js.CurveKeyframe;

#elseif js

#error "flight.CurveKeyframe on js requires flight_esm."

#else

#error "flight.CurveKeyframe: no backend for this target."

#end
