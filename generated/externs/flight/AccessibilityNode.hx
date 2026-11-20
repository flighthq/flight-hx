package flight;

#if hl

typedef AccessibilityNode = flight._hl.AccessibilityNode;

#elseif cpp

typedef AccessibilityNode = flight._cpp.AccessibilityNode;

#elseif (js && flight_esm)

typedef AccessibilityNode = flight._js.AccessibilityNode;

#elseif js

#error "flight.AccessibilityNode on js requires flight_esm."

#else

#error "flight.AccessibilityNode: no backend for this target."

#end
