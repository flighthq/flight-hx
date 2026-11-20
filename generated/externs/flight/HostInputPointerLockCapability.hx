package flight;

#if hl

typedef HostInputPointerLockCapability = flight._hl.HostInputPointerLockCapability;

#elseif cpp

typedef HostInputPointerLockCapability = flight._cpp.HostInputPointerLockCapability;

#elseif (js && flight_esm)

typedef HostInputPointerLockCapability = flight._js.HostInputPointerLockCapability;

#elseif js

#error "flight.HostInputPointerLockCapability on js requires flight_esm."

#else

#error "flight.HostInputPointerLockCapability: no backend for this target."

#end
