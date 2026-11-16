package flight;

#if hl

typedef Scene3DFormatFeatureRequirements = flight._hl.Scene3DFormatFeatureRequirements;

#elseif cpp

typedef Scene3DFormatFeatureRequirements = flight._cpp.Scene3DFormatFeatureRequirements;

#elseif (js && flight_esm)

typedef Scene3DFormatFeatureRequirements = flight._js.Scene3DFormatFeatureRequirements;

#elseif js

#error "flight.Scene3DFormatFeatureRequirements on js requires flight_esm."

#else

#error "flight.Scene3DFormatFeatureRequirements: no backend for this target."

#end
