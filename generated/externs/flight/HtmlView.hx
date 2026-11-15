package flight;

#if hl

typedef HtmlView = flight._hl.HtmlView;

#elseif cpp

typedef HtmlView = flight._cpp.HtmlView;

#elseif (js && flight_esm)

typedef HtmlView = flight._js.HtmlView;

#elseif js

#error "flight.HtmlView on js requires flight_esm."

#else

#error "flight.HtmlView: no backend for this target."

#end
