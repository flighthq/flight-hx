package flight;

#if hl

typedef GltfOrthographicCamera = flight._hl.GltfOrthographicCamera;

#elseif cpp

typedef GltfOrthographicCamera = flight._cpp.GltfOrthographicCamera;

#elseif (js && flight_esm)

typedef GltfOrthographicCamera = flight._js.GltfOrthographicCamera;

#elseif js

#error "flight.GltfOrthographicCamera on js requires flight_esm."

#else

#error "flight.GltfOrthographicCamera: no backend for this target."

#end
