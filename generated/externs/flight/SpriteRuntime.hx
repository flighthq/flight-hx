package flight;

#if hl

typedef SpriteRuntime = flight._hl.SpriteRuntime;

#elseif cpp

typedef SpriteRuntime = flight._cpp.SpriteRuntime;

#elseif (js && flight_esm)

typedef SpriteRuntime = flight._js.SpriteRuntime;

#elseif js

#error "flight.SpriteRuntime on js requires flight_esm."

#else

#error "flight.SpriteRuntime: no backend for this target."

#end
