package flight;

#if hl

typedef Scene3DRenderList = flight._hl.Scene3DRenderList;

#elseif cpp

typedef Scene3DRenderList = flight._cpp.Scene3DRenderList;

#elseif (js && flight_esm)

typedef Scene3DRenderList = flight._js.Scene3DRenderList;

#elseif js

#error "flight.Scene3DRenderList on js requires flight_esm."

#else

#error "flight.Scene3DRenderList: no backend for this target."

#end
