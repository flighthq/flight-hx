package flight;

#if hl

typedef HostClipboardChangeSubscriber = flight._hl.HostClipboardChangeSubscriber;

#elseif cpp

typedef HostClipboardChangeSubscriber = flight._cpp.HostClipboardChangeSubscriber;

#elseif (js && flight_esm)

typedef HostClipboardChangeSubscriber = flight._js.HostClipboardChangeSubscriber;

#elseif js

#error "flight.HostClipboardChangeSubscriber on js requires flight_esm."

#else

#error "flight.HostClipboardChangeSubscriber: no backend for this target."

#end
