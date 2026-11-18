package flight._js._fn;

@:jsRequire("@flighthq/buffer")
extern class Buffer {
	@:native("createByteReader")
	public static function createByteReader(bytes:Dynamic, offset:Null<Int>):flight._js.ByteReader;
	@:native("hasByteReaderBytes")
	public static function hasByteReaderBytes(reader:flight._js.ByteReader, count:Int):Bool;
	@:native("readByteReaderU16")
	public static function readByteReaderU16(reader:flight._js.ByteReader):Int;
	@:native("readByteReaderU24")
	public static function readByteReaderU24(reader:flight._js.ByteReader):Int;
	@:native("readByteReaderU24BigEndian")
	public static function readByteReaderU24BigEndian(reader:flight._js.ByteReader):Int;
	@:native("readByteReaderU32")
	public static function readByteReaderU32(reader:flight._js.ByteReader):Int;
	@:native("readByteReaderU32BigEndian")
	public static function readByteReaderU32BigEndian(reader:flight._js.ByteReader):Int;
	@:native("readByteReaderU64")
	public static function readByteReaderU64(reader:flight._js.ByteReader):Float;
	@:native("readByteReaderU8")
	public static function readByteReaderU8(reader:flight._js.ByteReader):Int;
	@:native("skipByteReader")
	public static function skipByteReader(reader:flight._js.ByteReader, count:Int):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeOwnedByteReader(ptr:flight._js.ByteReader):Void {}
}
