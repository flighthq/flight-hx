package flight;

#if hl

typedef RateLimitedLogSinkOptions = flight._hl.RateLimitedLogSinkOptions;

#elseif cpp

typedef RateLimitedLogSinkOptions = flight._cpp.RateLimitedLogSinkOptions;

#elseif (js && flight_esm)

typedef RateLimitedLogSinkOptions = flight._js.RateLimitedLogSinkOptions;

#elseif js

#error "flight.RateLimitedLogSinkOptions on js requires flight_esm."

#else

#error "flight.RateLimitedLogSinkOptions: no backend for this target."

#end
