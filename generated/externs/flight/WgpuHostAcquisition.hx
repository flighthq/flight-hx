package flight;

#if hl

typedef WgpuHostAcquisition = flight._hl.WgpuHostAcquisition;

#elseif cpp

typedef WgpuHostAcquisition = flight._cpp.WgpuHostAcquisition;

#elseif (js && flight_esm)

typedef WgpuHostAcquisition = flight._js.WgpuHostAcquisition;

#elseif js

#error "flight.WgpuHostAcquisition on js requires flight_esm."

#else

#error "flight.WgpuHostAcquisition: no backend for this target."

#end
