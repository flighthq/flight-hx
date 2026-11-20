package flight;

#if hl

typedef FileDialogHandle = flight._hl.FileDialogHandle;

#elseif cpp

typedef FileDialogHandle = flight._cpp.FileDialogHandle;

#elseif (js && flight_esm)

typedef FileDialogHandle = flight._js.FileDialogHandle;

#elseif js

#error "flight.FileDialogHandle on js requires flight_esm."

#else

#error "flight.FileDialogHandle: no backend for this target."

#end
