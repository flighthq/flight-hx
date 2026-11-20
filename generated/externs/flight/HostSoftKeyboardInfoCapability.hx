package flight;

#if hl

typedef HostSoftKeyboardInfoCapability = flight._hl.HostSoftKeyboardInfoCapability;

#elseif cpp

typedef HostSoftKeyboardInfoCapability = flight._cpp.HostSoftKeyboardInfoCapability;

#elseif (js && flight_esm)

typedef HostSoftKeyboardInfoCapability = flight._js.HostSoftKeyboardInfoCapability;

#elseif js

#error "flight.HostSoftKeyboardInfoCapability on js requires flight_esm."

#else

#error "flight.HostSoftKeyboardInfoCapability: no backend for this target."

#end
