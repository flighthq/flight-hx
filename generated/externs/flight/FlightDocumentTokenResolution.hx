package flight;

#if hl

typedef FlightDocumentTokenResolution = flight._hl.FlightDocumentTokenResolution;

#elseif cpp

typedef FlightDocumentTokenResolution = flight._cpp.FlightDocumentTokenResolution;

#elseif (js && flight_esm)

typedef FlightDocumentTokenResolution = flight._js.FlightDocumentTokenResolution;

#elseif js

#error "flight.FlightDocumentTokenResolution on js requires flight_esm."

#else

#error "flight.FlightDocumentTokenResolution: no backend for this target."

#end
