package flight;

#if hl

typedef ShareTitleContent = flight._hl.ShareTitleContent;

#elseif cpp

typedef ShareTitleContent = flight._cpp.ShareTitleContent;

#elseif (js && flight_esm)

typedef ShareTitleContent = flight._js.ShareTitleContent;

#elseif js

#error "flight.ShareTitleContent on js requires flight_esm."

#else

#error "flight.ShareTitleContent: no backend for this target."

#end
