package flight;

#if hl

typedef Md2Frame = flight._hl.Md2Frame;

#elseif cpp

typedef Md2Frame = flight._cpp.Md2Frame;

#elseif (js && flight_esm)

typedef Md2Frame = flight._js.Md2Frame;

#elseif js

#error "flight.Md2Frame on js requires flight_esm."

#else

#error "flight.Md2Frame: no backend for this target."

#end
