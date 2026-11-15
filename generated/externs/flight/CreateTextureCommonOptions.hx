package flight;

#if hl

typedef CreateTextureCommonOptions = flight._hl.CreateTextureCommonOptions;

#elseif cpp

typedef CreateTextureCommonOptions = flight._cpp.CreateTextureCommonOptions;

#elseif (js && flight_esm)

typedef CreateTextureCommonOptions = flight._js.CreateTextureCommonOptions;

#elseif js

#error "flight.CreateTextureCommonOptions on js requires flight_esm."

#else

#error "flight.CreateTextureCommonOptions: no backend for this target."

#end
