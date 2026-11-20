package flight;

#if hl

typedef DownloadedUpdate = flight._hl.DownloadedUpdate;

#elseif cpp

typedef DownloadedUpdate = flight._cpp.DownloadedUpdate;

#elseif (js && flight_esm)

typedef DownloadedUpdate = flight._js.DownloadedUpdate;

#elseif js

#error "flight.DownloadedUpdate on js requires flight_esm."

#else

#error "flight.DownloadedUpdate: no backend for this target."

#end
