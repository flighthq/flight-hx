package flight;

#if hl

typedef SafeAreaInsets = flight._hl.SafeAreaInsets;

#elseif cpp

typedef SafeAreaInsets = flight._cpp.SafeAreaInsets;

#elseif (js && flight_esm)

typedef SafeAreaInsets = flight._js.SafeAreaInsets;

#elseif js

#error "flight.SafeAreaInsets on js requires flight_esm."

#else

#error "flight.SafeAreaInsets: no backend for this target."

#end
