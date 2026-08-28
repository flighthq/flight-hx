package lime.graphics;

class Image {
  public var buffer:ImageBuffer;
  public var data:lime.utils.UInt8Array;
  public var format:PixelFormat;
  public var height:Int;
  public var offsetX:Int;
  public var offsetY:Int;
  public var premultiplied:Bool;
  public var width:Int;

  public function new() {}
}
