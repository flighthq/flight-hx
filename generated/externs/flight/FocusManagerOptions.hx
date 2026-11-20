package flight;

#if hl

typedef FocusManagerOptions = flight._hl.FocusManagerOptions;

#elseif cpp

typedef FocusManagerOptions = flight._cpp.FocusManagerOptions;

#elseif (js && flight_esm)

typedef FocusManagerOptions = flight._js.FocusManagerOptions;

#elseif js

#error "flight.FocusManagerOptions on js requires flight_esm."

#else

#error "flight.FocusManagerOptions: no backend for this target."

#end
