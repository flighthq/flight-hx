package flight;

#if hl

typedef GizmoCreateOptions = flight._hl.GizmoCreateOptions;

#elseif cpp

typedef GizmoCreateOptions = flight._cpp.GizmoCreateOptions;

#elseif (js && flight_esm)

typedef GizmoCreateOptions = flight._js.GizmoCreateOptions;

#elseif js

#error "flight.GizmoCreateOptions on js requires flight_esm."

#else

#error "flight.GizmoCreateOptions: no backend for this target."

#end
