package flight;

#if hl

typedef HostGlyphRasterizerCapability = flight._hl.HostGlyphRasterizerCapability;

#elseif cpp

typedef HostGlyphRasterizerCapability = flight._cpp.HostGlyphRasterizerCapability;

#elseif (js && flight_esm)

typedef HostGlyphRasterizerCapability = flight._js.HostGlyphRasterizerCapability;

#elseif js

#error "flight.HostGlyphRasterizerCapability on js requires flight_esm."

#else

#error "flight.HostGlyphRasterizerCapability: no backend for this target."

#end
