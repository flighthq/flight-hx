package flight;

#if hl

typedef HitTestResult = flight._hl.HitTestResult;

#elseif cpp

typedef HitTestResult = flight._cpp.HitTestResult;

#elseif (js && flight_esm)

typedef HitTestResult = flight._js.HitTestResult;

#elseif js

#error "flight.HitTestResult on js requires flight_esm."

#else

#error "flight.HitTestResult: no backend for this target."

#end
