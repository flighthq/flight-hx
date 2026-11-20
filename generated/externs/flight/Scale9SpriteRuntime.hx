package flight;

#if hl

typedef Scale9SpriteRuntime = flight._hl.Scale9SpriteRuntime;

#elseif cpp

typedef Scale9SpriteRuntime = flight._cpp.Scale9SpriteRuntime;

#elseif (js && flight_esm)

typedef Scale9SpriteRuntime = flight._js.Scale9SpriteRuntime;

#elseif js

#error "flight.Scale9SpriteRuntime on js requires flight_esm."

#else

#error "flight.Scale9SpriteRuntime: no backend for this target."

#end
