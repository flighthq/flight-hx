package flight;

#if hl

typedef VoxelGrid = flight._hl.VoxelGrid;

#elseif cpp

typedef VoxelGrid = flight._cpp.VoxelGrid;

#elseif (js && flight_esm)

typedef VoxelGrid = flight._js.VoxelGrid;

#elseif js

#error "flight.VoxelGrid on js requires flight_esm."

#else

#error "flight.VoxelGrid: no backend for this target."

#end
