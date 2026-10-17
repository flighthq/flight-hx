package flight;

// The scene session is intentionally the ownership boundary. JavaScript can expose Flight's
// structural objects directly, while hxcpp must keep flight-cpp's shared owners on the C++ side.
#if flight_hx
#error "flight.Scene2dApp: the optional transpiled-Haxe backend does not provide this native/web GL session."
#elseif (js && flight_esm)
typedef Scene2dApp = flight._js.Scene2dApp;
#elseif cpp
typedef Scene2dApp = flight._cpp.Scene2dApp;
#elseif js
#error "flight.Scene2dApp on js requires the flight_esm hostWeb pipeline."
#else
#error "flight.Scene2dApp requires cpp or js + flight_esm."
#end
