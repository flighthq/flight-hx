package flight;

#if hl

typedef ConnectivityReachabilityOptions = flight._hl.ConnectivityReachabilityOptions;

#elseif cpp

typedef ConnectivityReachabilityOptions = flight._cpp.ConnectivityReachabilityOptions;

#elseif (js && flight_esm)

typedef ConnectivityReachabilityOptions = flight._js.ConnectivityReachabilityOptions;

#elseif js

#error "flight.ConnectivityReachabilityOptions on js requires flight_esm."

#else

#error "flight.ConnectivityReachabilityOptions: no backend for this target."

#end
