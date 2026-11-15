package flight;

#if hl

typedef InputGamepadConnectData = flight._hl.InputGamepadConnectData;

#elseif cpp

typedef InputGamepadConnectData = flight._cpp.InputGamepadConnectData;

#elseif (js && flight_esm)

typedef InputGamepadConnectData = flight._js.InputGamepadConnectData;

#elseif js

#error "flight.InputGamepadConnectData on js requires flight_esm."

#else

#error "flight.InputGamepadConnectData: no backend for this target."

#end
