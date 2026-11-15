package flight;

#if hl

typedef CreateRenderTextureOptions = flight._hl.CreateRenderTextureOptions;

#elseif cpp

typedef CreateRenderTextureOptions = flight._cpp.CreateRenderTextureOptions;

#elseif (js && flight_esm)

typedef CreateRenderTextureOptions = flight._js.CreateRenderTextureOptions;

#elseif js

#error "flight.CreateRenderTextureOptions on js requires flight_esm."

#else

#error "flight.CreateRenderTextureOptions: no backend for this target."

#end
