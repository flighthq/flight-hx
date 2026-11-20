package flight;

#if hl

typedef FileDialogHandleOperations = flight._hl.FileDialogHandleOperations;

#elseif cpp

typedef FileDialogHandleOperations = flight._cpp.FileDialogHandleOperations;

#elseif (js && flight_esm)

typedef FileDialogHandleOperations = flight._js.FileDialogHandleOperations;

#elseif js

#error "flight.FileDialogHandleOperations on js requires flight_esm."

#else

#error "flight.FileDialogHandleOperations: no backend for this target."

#end
