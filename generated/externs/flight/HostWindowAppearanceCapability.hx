package flight;

#if hl

typedef HostWindowAppearanceCapability = flight._hl.HostWindowAppearanceCapability;

#elseif cpp

typedef HostWindowAppearanceCapability = flight._cpp.HostWindowAppearanceCapability;

#elseif (js && flight_esm)

typedef HostWindowAppearanceCapability = flight._js.HostWindowAppearanceCapability;

#elseif js

#error "flight.HostWindowAppearanceCapability on js requires flight_esm."

#else

#error "flight.HostWindowAppearanceCapability: no backend for this target."

#end
