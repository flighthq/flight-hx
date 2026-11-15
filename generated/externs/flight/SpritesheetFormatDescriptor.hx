package flight;

#if hl

typedef SpritesheetFormatDescriptor = flight._hl.SpritesheetFormatDescriptor;

#elseif cpp

typedef SpritesheetFormatDescriptor = flight._cpp.SpritesheetFormatDescriptor;

#elseif (js && flight_esm)

typedef SpritesheetFormatDescriptor = flight._js.SpritesheetFormatDescriptor;

#elseif js

#error "flight.SpritesheetFormatDescriptor on js requires flight_esm."

#else

#error "flight.SpritesheetFormatDescriptor: no backend for this target."

#end
