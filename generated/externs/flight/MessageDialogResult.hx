package flight;

#if hl

typedef MessageDialogResult = flight._hl.MessageDialogResult;

#elseif cpp

typedef MessageDialogResult = flight._cpp.MessageDialogResult;

#elseif (js && flight_esm)

typedef MessageDialogResult = flight._js.MessageDialogResult;

#elseif js

#error "flight.MessageDialogResult on js requires flight_esm."

#else

#error "flight.MessageDialogResult: no backend for this target."

#end
