package flight;

#if hl

typedef HtmlViewRuntime = flight._hl.HtmlViewRuntime;

#elseif cpp

typedef HtmlViewRuntime = flight._cpp.HtmlViewRuntime;

#elseif (js && flight_esm)

typedef HtmlViewRuntime = flight._js.HtmlViewRuntime;

#elseif js

#error "flight.HtmlViewRuntime on js requires flight_esm."

#else

#error "flight.HtmlViewRuntime: no backend for this target."

#end
