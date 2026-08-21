package flighthq._internal.dom;

/** Typed WebGPU texture creation descriptor. */
typedef GPUTextureDescriptor = {
  var size:flighthq._internal._Union2<Array<Float>, GPUExtent3DDictStrict>;
  var format:String;
  var usage:Float;
  @:optional var mipLevelCount:Float;
  @:optional var sampleCount:Float;
  @:optional var dimension:String;
  @:optional var viewFormats:Array<String>;
  @:optional var label:String;
}
