package flight._internal.dom;

/** Dimension-explicit WebGPU extent dictionary. */
typedef GPUExtent3DDictStrict = {
  var width:Float;
  @:optional var height:Float;
  @:optional var depthOrArrayLayers:Float;
}
