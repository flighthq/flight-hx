package flight;

#if hl

typedef BitmapConvolutionOptions = flight._hl.BitmapConvolutionOptions;

#elseif cpp

typedef BitmapConvolutionOptions = flight._cpp.BitmapConvolutionOptions;

#elseif (js && flight_esm)

typedef BitmapConvolutionOptions = flight._js.BitmapConvolutionOptions;

#elseif js

#error "flight.BitmapConvolutionOptions on js requires flight_esm."

#else

#error "flight.BitmapConvolutionOptions: no backend for this target."

#end
