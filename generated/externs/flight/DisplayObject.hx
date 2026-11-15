package flight;

#if hl

typedef DisplayObject = flight._hl.DisplayObject;

#elseif cpp

typedef DisplayObject = flight._cpp.DisplayObject;

#elseif (js && flight_esm)

typedef DisplayObject = flight._js.DisplayObject;

#elseif js

#error "flight.DisplayObject on js requires flight_esm."

#else

#error "flight.DisplayObject: no backend for this target."

#end
