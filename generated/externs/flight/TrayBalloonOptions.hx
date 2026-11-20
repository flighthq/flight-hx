package flight;

#if hl

typedef TrayBalloonOptions = flight._hl.TrayBalloonOptions;

#elseif cpp

typedef TrayBalloonOptions = flight._cpp.TrayBalloonOptions;

#elseif (js && flight_esm)

typedef TrayBalloonOptions = flight._js.TrayBalloonOptions;

#elseif js

#error "flight.TrayBalloonOptions on js requires flight_esm."

#else

#error "flight.TrayBalloonOptions: no backend for this target."

#end
