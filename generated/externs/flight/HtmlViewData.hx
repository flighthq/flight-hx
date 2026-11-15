package flight;

#if hl

typedef HtmlViewData = flight._hl.HtmlViewData;

#elseif cpp

typedef HtmlViewData = flight._cpp.HtmlViewData;

#elseif (js && flight_esm)

typedef HtmlViewData = flight._js.HtmlViewData;

#elseif js

#error "flight.HtmlViewData on js requires flight_esm."

#else

#error "flight.HtmlViewData: no backend for this target."

#end
