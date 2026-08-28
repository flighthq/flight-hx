package flight._internal;

#if !js
/** Native value object for the Blob subset used by Flight resource loaders. */
@:keep
class _Blob {
  public final type:String;
  public var size(get, never):Int;
  public final bytes:haxe.io.Bytes;

  public function new(?parts:Array<Dynamic>, ?options:Dynamic) {
    type = options == null || _Runtime.field(options, 'type') == null
      ? ''
      : Std.string(_Runtime.field(options, 'type')).toLowerCase();
    final output = new haxe.io.BytesBuffer();
    if (parts != null) for (part in parts) appendPart(output, part);
    bytes = output.getBytes();
  }

  public function arrayBuffer():_Promise<haxe.io.Bytes> return _Promise.resolve(bytes);

  public function text():_Promise<String> return _Promise.resolve(bytes.toString());

  public function slice(start:Int = 0, ?end:Int, ?contentType:String):_Blob {
    final from = normalizedIndex(start, bytes.length);
    final to = end == null ? bytes.length : normalizedIndex(end, bytes.length);
    final length = to > from ? to - from : 0;
    return new _Blob([bytes.sub(from, length)], {type: contentType == null ? '' : contentType});
  }

  function get_size():Int return bytes.length;

  static function normalizedIndex(value:Int, length:Int):Int {
    final index = value < 0 ? length + value : value;
    return index < 0 ? 0 : index > length ? length : index;
  }

  static function appendPart(output:haxe.io.BytesBuffer, part:Dynamic):Void {
    if (part == null) {
      output.addString('null');
      return;
    }
    if (Std.isOfType(part, _Blob)) {
      final blob:_Blob = cast part;
      output.addBytes(blob.bytes, 0, blob.bytes.length);
      return;
    }
    if (Std.isOfType(part, String)) {
      output.addString(cast part);
      return;
    }
    if (Std.isOfType(part, haxe.io.Bytes)) {
      final bytes:haxe.io.Bytes = cast part;
      output.addBytes(bytes, 0, bytes.length);
      return;
    }
    if (Std.isOfType(part, Array)) {
      for (value in (cast part : Array<Dynamic>)) output.addByte(Std.int(value) & 0xFF);
      return;
    }
    #if lime
    if (Std.isOfType(part, _LimeTypedArray)) {
      appendView(output, _LimeTypedArray.unwrap(cast part));
      return;
    }
    if (Std.isOfType(part, lime.utils.ArrayBufferView)) {
      appendView(output, cast part);
      return;
    }
    #end
    final buffer:Dynamic = _Runtime.field(part, 'buffer');
    final byteOffset:Dynamic = _Runtime.field(part, 'byteOffset');
    final byteLength:Dynamic = _Runtime.field(part, 'byteLength');
    if (Std.isOfType(buffer, haxe.io.Bytes)) {
      final bytes:haxe.io.Bytes = cast buffer;
      final offset = byteOffset == null ? 0 : Std.int(byteOffset);
      final length = byteLength == null ? bytes.length - offset : Std.int(byteLength);
      output.addBytes(bytes, offset, length);
      return;
    }
    output.addString(Std.string(part));
  }

  #if lime
  static function appendView(output:haxe.io.BytesBuffer, view:lime.utils.ArrayBufferView):Void {
    final bytes:haxe.io.Bytes = cast view.buffer;
    output.addBytes(bytes, view.byteOffset, view.byteLength);
  }
  #end
}
#end
