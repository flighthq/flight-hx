package flight;

#if hl

typedef GizmoNode2DFeatures = flight._hl.GizmoNode2DFeatures;

#elseif cpp

typedef GizmoNode2DFeatures = flight._cpp.GizmoNode2DFeatures;

#elseif (js && flight_esm)

typedef GizmoNode2DFeatures = flight._js.GizmoNode2DFeatures;

#elseif js

#error "flight.GizmoNode2DFeatures on js requires flight_esm."

#else

#error "flight.GizmoNode2DFeatures: no backend for this target."

#end
