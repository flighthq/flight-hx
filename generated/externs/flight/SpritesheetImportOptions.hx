package flight;

#if hl

typedef SpritesheetImportOptions = flight._hl.SpritesheetImportOptions;

#elseif cpp

typedef SpritesheetImportOptions = flight._cpp.SpritesheetImportOptions;

#elseif (js && flight_esm)

typedef SpritesheetImportOptions = flight._js.SpritesheetImportOptions;

#elseif js

#error "flight.SpritesheetImportOptions on js requires flight_esm."

#else

#error "flight.SpritesheetImportOptions: no backend for this target."

#end
