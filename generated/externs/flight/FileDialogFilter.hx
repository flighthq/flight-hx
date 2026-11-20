package flight;

#if hl

typedef FileDialogFilter = flight._hl.FileDialogFilter;

#elseif cpp

typedef FileDialogFilter = flight._cpp.FileDialogFilter;

#elseif (js && flight_esm)

typedef FileDialogFilter = flight._js.FileDialogFilter;

#elseif js

#error "flight.FileDialogFilter on js requires flight_esm."

#else

#error "flight.FileDialogFilter: no backend for this target."

#end
