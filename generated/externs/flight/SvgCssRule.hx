package flight;

#if hl

typedef SvgCssRule = flight._hl.SvgCssRule;

#elseif cpp

typedef SvgCssRule = flight._cpp.SvgCssRule;

#elseif (js && flight_esm)

typedef SvgCssRule = flight._js.SvgCssRule;

#elseif js

#error "flight.SvgCssRule on js requires flight_esm."

#else

#error "flight.SvgCssRule: no backend for this target."

#end
