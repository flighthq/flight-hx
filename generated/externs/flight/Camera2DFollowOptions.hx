package flight;

#if hl

typedef Camera2DFollowOptions = flight._hl.Camera2DFollowOptions;

#elseif cpp

typedef Camera2DFollowOptions = flight._cpp.Camera2DFollowOptions;

#elseif (js && flight_esm)

typedef Camera2DFollowOptions = flight._js.Camera2DFollowOptions;

#elseif js

#error "flight.Camera2DFollowOptions on js requires flight_esm."

#else

#error "flight.Camera2DFollowOptions: no backend for this target."

#end
