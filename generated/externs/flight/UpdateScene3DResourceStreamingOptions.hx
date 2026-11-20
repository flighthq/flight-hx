package flight;

#if hl

typedef UpdateScene3DResourceStreamingOptions = flight._hl.UpdateScene3DResourceStreamingOptions;

#elseif cpp

typedef UpdateScene3DResourceStreamingOptions = flight._cpp.UpdateScene3DResourceStreamingOptions;

#elseif (js && flight_esm)

typedef UpdateScene3DResourceStreamingOptions = flight._js.UpdateScene3DResourceStreamingOptions;

#elseif js

#error "flight.UpdateScene3DResourceStreamingOptions on js requires flight_esm."

#else

#error "flight.UpdateScene3DResourceStreamingOptions: no backend for this target."

#end
