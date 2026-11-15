package flight;

#if hl

typedef SvgPathDataFormatOptions = flight._hl.SvgPathDataFormatOptions;

#elseif cpp

typedef SvgPathDataFormatOptions = flight._cpp.SvgPathDataFormatOptions;

#elseif (js && flight_esm)

typedef SvgPathDataFormatOptions = flight._js.SvgPathDataFormatOptions;

#elseif js

#error "flight.SvgPathDataFormatOptions on js requires flight_esm."

#else

#error "flight.SvgPathDataFormatOptions: no backend for this target."

#end
