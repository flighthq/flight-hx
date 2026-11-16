package flight;

#if hl

typedef ShapeBoundsCommand = flight._hl.ShapeBoundsCommand;

#elseif cpp

typedef ShapeBoundsCommand = flight._cpp.ShapeBoundsCommand;

#elseif (js && flight_esm)

typedef ShapeBoundsCommand = flight._js.ShapeBoundsCommand;

#elseif js

#error "flight.ShapeBoundsCommand on js requires flight_esm."

#else

#error "flight.ShapeBoundsCommand: no backend for this target."

#end
