package flight;

#if hl

typedef PathBooleanExplanation = flight._hl.PathBooleanExplanation;

#elseif cpp

typedef PathBooleanExplanation = flight._cpp.PathBooleanExplanation;

#elseif (js && flight_esm)

typedef PathBooleanExplanation = flight._js.PathBooleanExplanation;

#elseif js

#error "flight.PathBooleanExplanation on js requires flight_esm."

#else

#error "flight.PathBooleanExplanation: no backend for this target."

#end
