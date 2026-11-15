package flight;

#if hl

typedef RiveSkeleton2DImport = flight._hl.RiveSkeleton2DImport;

#elseif cpp

typedef RiveSkeleton2DImport = flight._cpp.RiveSkeleton2DImport;

#elseif (js && flight_esm)

typedef RiveSkeleton2DImport = flight._js.RiveSkeleton2DImport;

#elseif js

#error "flight.RiveSkeleton2DImport on js requires flight_esm."

#else

#error "flight.RiveSkeleton2DImport: no backend for this target."

#end
