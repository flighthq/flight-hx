package flight;

#if hl

typedef HostProtocolRegistrationQueryCapability = flight._hl.HostProtocolRegistrationQueryCapability;

#elseif cpp

typedef HostProtocolRegistrationQueryCapability = flight._cpp.HostProtocolRegistrationQueryCapability;

#elseif (js && flight_esm)

typedef HostProtocolRegistrationQueryCapability = flight._js.HostProtocolRegistrationQueryCapability;

#elseif js

#error "flight.HostProtocolRegistrationQueryCapability on js requires flight_esm."

#else

#error "flight.HostProtocolRegistrationQueryCapability: no backend for this target."

#end
