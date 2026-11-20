package flight.esm.buffer;

#if (js && flight_esm)
@:jsRequire("@flighthq/buffer/contract")
extern class Contract {
  public static function createByteReader(bytes:js.lib.Uint8Array, ?offset:Null<Float>):flight.esm.types.buffer.Types.ByteReader;
  public static function hasByteReaderBytes(reader:flight.esm.types.buffer.Types.ByteReader, count:Float):Bool;
  public static function readByteReaderU16(reader:flight.esm.types.buffer.Types.ByteReader):Float;
  public static function readByteReaderU24(reader:flight.esm.types.buffer.Types.ByteReader):Float;
  public static function readByteReaderU24BigEndian(reader:flight.esm.types.buffer.Types.ByteReader):Float;
  public static function readByteReaderU32(reader:flight.esm.types.buffer.Types.ByteReader):Float;
  public static function readByteReaderU32BigEndian(reader:flight.esm.types.buffer.Types.ByteReader):Float;
  public static function readByteReaderU64(reader:flight.esm.types.buffer.Types.ByteReader):Float;
  public static function readByteReaderU8(reader:flight.esm.types.buffer.Types.ByteReader):Float;
  public static function skipByteReader(reader:flight.esm.types.buffer.Types.ByteReader, count:Float):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
