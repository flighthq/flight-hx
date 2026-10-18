// Generated from flight-compiler native-planning.json. Do not edit.
package flight;

#if (js && flight_esm)
typedef AbortSignal = js.html.AbortSignal;
#elseif cpp
typedef AbortSignal = flight._cpp_runtime.AbortSignal;
#else
typedef AbortSignal = Dynamic;
#end
