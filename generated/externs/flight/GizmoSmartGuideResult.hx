package flight;

#if hl

typedef GizmoSmartGuideResult = flight._hl.GizmoSmartGuideResult;

#elseif cpp

typedef GizmoSmartGuideResult = flight._cpp.GizmoSmartGuideResult;

#elseif (js && flight_esm)

typedef GizmoSmartGuideResult = flight._js.GizmoSmartGuideResult;

#elseif js

#error "flight.GizmoSmartGuideResult on js requires flight_esm."

#else

#error "flight.GizmoSmartGuideResult: no backend for this target."

#end
