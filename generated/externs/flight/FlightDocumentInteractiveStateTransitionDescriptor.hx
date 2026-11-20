package flight;

#if hl

typedef FlightDocumentInteractiveStateTransitionDescriptor = flight._hl.FlightDocumentInteractiveStateTransitionDescriptor;

#elseif cpp

typedef FlightDocumentInteractiveStateTransitionDescriptor = flight._cpp.FlightDocumentInteractiveStateTransitionDescriptor;

#elseif (js && flight_esm)

typedef FlightDocumentInteractiveStateTransitionDescriptor = flight._js.FlightDocumentInteractiveStateTransitionDescriptor;

#elseif js

#error "flight.FlightDocumentInteractiveStateTransitionDescriptor on js requires flight_esm."

#else

#error "flight.FlightDocumentInteractiveStateTransitionDescriptor: no backend for this target."

#end
