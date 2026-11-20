package flight;

#if hl

typedef PowerBatteryHealth = flight._hl.PowerBatteryHealth;

#elseif cpp

typedef PowerBatteryHealth = flight._cpp.PowerBatteryHealth;

#elseif (js && flight_esm)

typedef PowerBatteryHealth = flight._js.PowerBatteryHealth;

#elseif js

#error "flight.PowerBatteryHealth on js requires flight_esm."

#else

#error "flight.PowerBatteryHealth: no backend for this target."

#end
