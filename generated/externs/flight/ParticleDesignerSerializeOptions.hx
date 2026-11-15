package flight;

#if hl

typedef ParticleDesignerSerializeOptions = flight._hl.ParticleDesignerSerializeOptions;

#elseif cpp

typedef ParticleDesignerSerializeOptions = flight._cpp.ParticleDesignerSerializeOptions;

#elseif (js && flight_esm)

typedef ParticleDesignerSerializeOptions = flight._js.ParticleDesignerSerializeOptions;

#elseif js

#error "flight.ParticleDesignerSerializeOptions on js requires flight_esm."

#else

#error "flight.ParticleDesignerSerializeOptions: no backend for this target."

#end
