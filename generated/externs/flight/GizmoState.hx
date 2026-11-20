package flight;

#if hl

typedef GizmoState = flight._hl.GizmoState;

#elseif cpp

typedef GizmoState = flight._cpp.GizmoState;

#elseif (js && flight_esm)

typedef GizmoState = flight._js.GizmoState;

#elseif js

#error "flight.GizmoState on js requires flight_esm."

#else

#error "flight.GizmoState: no backend for this target."

#end
