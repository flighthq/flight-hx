package flight;

#if hl

typedef HostVideoCapability = flight._hl.HostVideoCapability;

#elseif cpp

typedef HostVideoCapability = flight._cpp.HostVideoCapability;

#elseif (js && flight_esm)

typedef HostVideoCapability = flight._js.HostVideoCapability;

#elseif js

#error "flight.HostVideoCapability on js requires flight_esm."

#else

#error "flight.HostVideoCapability: no backend for this target."

#end
