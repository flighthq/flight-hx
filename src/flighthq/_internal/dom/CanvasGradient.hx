// Maintained host-type declaration. The native interface is implemented by the
// cairo toolkit. A nominal receiver is required here: invoking addColorStop on
// Dynamic loses `this` on Neko and makes the implementation's pattern read
// fail even though the native object has that field.
package flighthq._internal.dom;

interface CanvasGradient {
  function addColorStop(offset:Float, color:String):Void;
}
