// Maintained host-type declaration. js stays Dynamic (browser AudioParam);
// native is a nominal interface implemented by the host audio backend. The
// setter accessor lets the backend propagate live value changes (mixer volume
// sliders) to already-playing sources.
package flight._internal.dom;

#if js
typedef AudioParam = Dynamic;
#else
interface AudioParam {
  var value(default, set):Float;
  function setValueAtTime(value:Float, startTime:Float):AudioParam;
  function linearRampToValueAtTime(value:Float, endTime:Float):AudioParam;
  function cancelScheduledValues(startTime:Float):AudioParam;
}
#end
