package flight;

#if hl

typedef ConnectivityReachability = flight._hl.ConnectivityReachability;

#elseif cpp

typedef ConnectivityReachability = flight._cpp.ConnectivityReachability;

#elseif (js && flight_esm)

typedef ConnectivityReachability = flight._js.ConnectivityReachability;

#elseif js

#error "flight.ConnectivityReachability on js requires flight_esm."

#else

#error "flight.ConnectivityReachability: no backend for this target."

#end
