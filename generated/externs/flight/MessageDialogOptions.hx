package flight;

#if hl

typedef MessageDialogOptions = flight._hl.MessageDialogOptions;

#elseif cpp

typedef MessageDialogOptions = flight._cpp.MessageDialogOptions;

#elseif (js && flight_esm)

typedef MessageDialogOptions = flight._js.MessageDialogOptions;

#elseif js

#error "flight.MessageDialogOptions on js requires flight_esm."

#else

#error "flight.MessageDialogOptions: no backend for this target."

#end
