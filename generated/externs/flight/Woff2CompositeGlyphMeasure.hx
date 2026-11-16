package flight;

#if hl

typedef Woff2CompositeGlyphMeasure = flight._hl.Woff2CompositeGlyphMeasure;

#elseif cpp

typedef Woff2CompositeGlyphMeasure = flight._cpp.Woff2CompositeGlyphMeasure;

#elseif (js && flight_esm)

typedef Woff2CompositeGlyphMeasure = flight._js.Woff2CompositeGlyphMeasure;

#elseif js

#error "flight.Woff2CompositeGlyphMeasure on js requires flight_esm."

#else

#error "flight.Woff2CompositeGlyphMeasure: no backend for this target."

#end
