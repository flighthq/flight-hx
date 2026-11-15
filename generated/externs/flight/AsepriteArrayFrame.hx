package flight;

#if hl

typedef AsepriteArrayFrame = flight._hl.AsepriteArrayFrame;

#elseif cpp

typedef AsepriteArrayFrame = flight._cpp.AsepriteArrayFrame;

#elseif (js && flight_esm)

typedef AsepriteArrayFrame = flight._js.AsepriteArrayFrame;

#elseif js

#error "flight.AsepriteArrayFrame on js requires flight_esm."

#else

#error "flight.AsepriteArrayFrame: no backend for this target."

#end
