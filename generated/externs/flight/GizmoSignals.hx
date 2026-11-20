package flight;

#if hl

typedef GizmoSignals = flight._hl.GizmoSignals;

#elseif cpp

typedef GizmoSignals = flight._cpp.GizmoSignals;

#elseif (js && flight_esm)

typedef GizmoSignals = flight._js.GizmoSignals;

#elseif js

#error "flight.GizmoSignals on js requires flight_esm."

#else

#error "flight.GizmoSignals: no backend for this target."

#end
