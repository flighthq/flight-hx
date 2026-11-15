package flight;

#if hl

typedef ConvolutionEffect = flight._hl.ConvolutionEffect;

#elseif cpp

typedef ConvolutionEffect = flight._cpp.ConvolutionEffect;

#elseif (js && flight_esm)

typedef ConvolutionEffect = flight._js.ConvolutionEffect;

#elseif js

#error "flight.ConvolutionEffect on js requires flight_esm."

#else

#error "flight.ConvolutionEffect: no backend for this target."

#end
