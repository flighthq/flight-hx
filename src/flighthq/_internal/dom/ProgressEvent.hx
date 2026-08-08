// Maintained host-type declaration for DOM progress callbacks.
package flighthq._internal.dom;

interface ProgressEvent<T> {
  var lengthComputable(default, never):Bool;
  var loaded(default, never):Float;
  var target(default, never):Null<T>;
  var total(default, never):Float;
}
