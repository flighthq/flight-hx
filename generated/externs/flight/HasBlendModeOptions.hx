package flight;

#if hl

typedef HasBlendModeOptions = flight._hl.HasBlendModeOptions;

#elseif cpp

typedef HasBlendModeOptions = flight._cpp.HasBlendModeOptions;

#elseif (js && flight_esm)

typedef HasBlendModeOptions = flight._js.HasBlendModeOptions;

#elseif js

#error "flight.HasBlendModeOptions on js requires flight_esm."

#else

#error "flight.HasBlendModeOptions: no backend for this target."

#end
