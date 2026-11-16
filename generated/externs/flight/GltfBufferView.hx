package flight;

#if hl

typedef GltfBufferView = flight._hl.GltfBufferView;

#elseif cpp

typedef GltfBufferView = flight._cpp.GltfBufferView;

#elseif (js && flight_esm)

typedef GltfBufferView = flight._js.GltfBufferView;

#elseif js

#error "flight.GltfBufferView on js requires flight_esm."

#else

#error "flight.GltfBufferView: no backend for this target."

#end
