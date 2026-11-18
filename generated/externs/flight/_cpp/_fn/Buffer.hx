package flight._cpp._fn;

extern class Buffer {
	@:native("flight_create_byte_reader")
	public static function createByteReader(bytes:cpp.Star<cpp.Void>, bytesLen:Int, offset:haxe.Int64):flight._cpp.ByteReader;
	@:native("flight_has_byte_reader_bytes")
	public static function hasByteReaderBytes(reader:flight._cpp.ByteReader, count:Int):Bool;
	@:native("flight_read_byte_reader_u16")
	public static function readByteReaderU16(reader:flight._cpp.ByteReader):Int;
	@:native("flight_read_byte_reader_u24")
	public static function readByteReaderU24(reader:flight._cpp.ByteReader):Int;
	@:native("flight_read_byte_reader_u24_big_endian")
	public static function readByteReaderU24BigEndian(reader:flight._cpp.ByteReader):Int;
	@:native("flight_read_byte_reader_u32")
	public static function readByteReaderU32(reader:flight._cpp.ByteReader):Int;
	@:native("flight_read_byte_reader_u32_big_endian")
	public static function readByteReaderU32BigEndian(reader:flight._cpp.ByteReader):Int;
	@:native("flight_read_byte_reader_u64")
	public static function readByteReaderU64(reader:flight._cpp.ByteReader):haxe.Int64;
	@:native("flight_read_byte_reader_u8")
	public static function readByteReaderU8(reader:flight._cpp.ByteReader):Int;
	@:native("flight_skip_byte_reader")
	public static function skipByteReader(reader:flight._cpp.ByteReader, count:Int):Void;
	@:native("flight_free_owned_byte_reader")
	public static function freeOwnedByteReader(ptr:flight._cpp.ByteReader):Void;
}
