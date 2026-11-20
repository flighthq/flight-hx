package flight;

#if hl

typedef StatusBarStyleStacks = flight._hl.StatusBarStyleStacks;

#elseif cpp

typedef StatusBarStyleStacks = flight._cpp.StatusBarStyleStacks;

#elseif (js && flight_esm)

typedef StatusBarStyleStacks = flight._js.StatusBarStyleStacks;

#elseif js

#error "flight.StatusBarStyleStacks on js requires flight_esm."

#else

#error "flight.StatusBarStyleStacks: no backend for this target."

#end
