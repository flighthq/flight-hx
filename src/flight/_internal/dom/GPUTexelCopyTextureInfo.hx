package flight._internal.dom;

/** Typed texture region used by WebGPU copy and queue operations. */
typedef GPUTexelCopyTextureInfo = {
  var texture:GPUTexture;
  @:optional var mipLevel:Float;
  @:optional var origin:GPUOrigin3D;
  @:optional var aspect:String;
}
