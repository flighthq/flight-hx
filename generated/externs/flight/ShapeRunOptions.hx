package flight;

#if hl

typedef ShapeRunOptions = flight._hl.ShapeRunOptions;

#elseif cpp

typedef ShapeRunOptions = flight._cpp.ShapeRunOptions;

#elseif (js && flight_esm)

typedef ShapeRunOptions = flight._js.ShapeRunOptions;

#elseif js

#error "flight.ShapeRunOptions on js requires flight_esm."

#else

#error "flight.ShapeRunOptions: no backend for this target."

#end
