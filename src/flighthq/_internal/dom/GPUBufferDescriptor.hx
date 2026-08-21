package flighthq._internal.dom;

/** Typed WebGPU buffer creation descriptor. */
typedef GPUBufferDescriptor = {
  var size:Float;
  var usage:Float;
  @:optional var mappedAtCreation:Bool;
  @:optional var label:String;
}
