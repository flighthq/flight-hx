package flight;

#if hl

typedef SpritesheetPlayer = flight._hl.SpritesheetPlayer;

#elseif cpp

typedef SpritesheetPlayer = flight._cpp.SpritesheetPlayer;

#elseif (js && flight_esm)

typedef SpritesheetPlayer = flight._js.SpritesheetPlayer;

#elseif js

#error "flight.SpritesheetPlayer on js requires flight_esm."

#else

#error "flight.SpritesheetPlayer: no backend for this target."

#end
