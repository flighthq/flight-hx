package flight;

#if hl

typedef SignalTimerState = flight._hl.SignalTimerState;

#elseif cpp

typedef SignalTimerState = flight._cpp.SignalTimerState;

#elseif (js && flight_esm)

typedef SignalTimerState = flight._js.SignalTimerState;

#elseif js

#error "flight.SignalTimerState on js requires flight_esm."

#else

#error "flight.SignalTimerState: no backend for this target."

#end
