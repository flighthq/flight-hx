package flight._internal.dom;

/** Typed byte layout for WebGPU texture transfers. */
typedef GPUTexelCopyBufferLayout = {
  @:optional var offset:Float;
  @:optional var bytesPerRow:Float;
  @:optional var rowsPerImage:Float;
}
