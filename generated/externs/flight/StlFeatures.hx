package flight;

#if hl

typedef StlFeatures = flight._hl.StlFeatures;

#elseif cpp

typedef StlFeatures = flight._cpp.StlFeatures;

#elseif (js && flight_esm)

typedef StlFeatures = flight._js.StlFeatures;

#elseif js

#error "flight.StlFeatures on js requires flight_esm."

#else

#error "flight.StlFeatures: no backend for this target."

#end
