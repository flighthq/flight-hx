// Maintained host-type declaration. On js the browser supplies the real Web
// Audio node, reached through Dynamic exactly as before. Native targets use a
// nominal interface implemented by the host audio backend (hostLime
// LimeAudio); keeping it nominal gives emitted calls compile-time arity and
// receiver binding on Neko/hxcpp, the same reason AudioBuffer is nominal.
package flighthq._internal.dom;

#if js
typedef AudioNode = Dynamic;
#else
interface AudioNode {
  function connect(node:Dynamic):Dynamic;
  function disconnect(?node:Dynamic):Void;
}
#end
