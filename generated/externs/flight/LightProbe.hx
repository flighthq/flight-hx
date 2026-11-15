package flight;

#if hl

typedef LightProbe = flight._hl.LightProbe;

#elseif cpp

typedef LightProbe = flight._cpp.LightProbe;

#elseif (js && flight_esm)

typedef LightProbe = flight._js.LightProbe;

#elseif js

#error "flight.LightProbe on js requires flight_esm."

#else

#error "flight.LightProbe: no backend for this target."

#end
