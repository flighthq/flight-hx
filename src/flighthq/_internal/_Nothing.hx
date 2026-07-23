// Maintained runtime support for generated Flight Haxe.
package flighthq._internal;

#if js
typedef _Nothing = jsasync.Nothing;
#else
typedef _Nothing = Dynamic;
#end
