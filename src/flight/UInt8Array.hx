// Maintained public alias for the port's typed-array toolkit. Generated
// Flight signatures use the underscore type directly; consumer code should
// import this alias instead of reaching into flight._internal. Accepts the
// same sources as its JavaScript counterpart — a length, an iterable, another
// view — plus haxe.io.Bytes natively, wrapping without an element copy.
package flight;

typedef UInt8Array = flight._internal._UInt8Array;
