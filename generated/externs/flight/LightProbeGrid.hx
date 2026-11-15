package flight;

#if hl

typedef LightProbeGrid = flight._hl.LightProbeGrid;

#elseif cpp

typedef LightProbeGrid = flight._cpp.LightProbeGrid;

#elseif (js && flight_esm)

typedef LightProbeGrid = flight._js.LightProbeGrid;

#elseif js

#error "flight.LightProbeGrid on js requires flight_esm."

#else

#error "flight.LightProbeGrid: no backend for this target."

#end
