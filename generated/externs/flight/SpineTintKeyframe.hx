package flight;

#if hl

typedef SpineTintKeyframe = flight._hl.SpineTintKeyframe;

#elseif cpp

typedef SpineTintKeyframe = flight._cpp.SpineTintKeyframe;

#elseif (js && flight_esm)

typedef SpineTintKeyframe = flight._js.SpineTintKeyframe;

#elseif js

#error "flight.SpineTintKeyframe on js requires flight_esm."

#else

#error "flight.SpineTintKeyframe: no backend for this target."

#end
