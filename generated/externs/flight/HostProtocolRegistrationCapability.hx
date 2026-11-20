package flight;

#if hl

typedef HostProtocolRegistrationCapability = flight._hl.HostProtocolRegistrationCapability;

#elseif cpp

typedef HostProtocolRegistrationCapability = flight._cpp.HostProtocolRegistrationCapability;

#elseif (js && flight_esm)

typedef HostProtocolRegistrationCapability = flight._js.HostProtocolRegistrationCapability;

#elseif js

#error "flight.HostProtocolRegistrationCapability on js requires flight_esm."

#else

#error "flight.HostProtocolRegistrationCapability: no backend for this target."

#end
