package flight._hl._fn;

extern class Buffer {
	@:hlNative("flight", "flight_create_byte_reader")
	public static function createByteReader(bytes:hl.Bytes, bytesLen:Int, offset:haxe.Int64):flight._hl.ByteReader;
	@:hlNative("flight", "flight_has_byte_reader_bytes")
	public static function hasByteReaderBytes(reader:flight._hl.ByteReader, count:Int):Bool;
	@:hlNative("flight", "flight_read_byte_reader_u16")
	public static function readByteReaderU16(reader:flight._hl.ByteReader):Int;
	@:hlNative("flight", "flight_read_byte_reader_u24")
	public static function readByteReaderU24(reader:flight._hl.ByteReader):Int;
	@:hlNative("flight", "flight_read_byte_reader_u24_big_endian")
	public static function readByteReaderU24BigEndian(reader:flight._hl.ByteReader):Int;
	@:hlNative("flight", "flight_read_byte_reader_u32")
	public static function readByteReaderU32(reader:flight._hl.ByteReader):Int;
	@:hlNative("flight", "flight_read_byte_reader_u32_big_endian")
	public static function readByteReaderU32BigEndian(reader:flight._hl.ByteReader):Int;
	@:hlNative("flight", "flight_read_byte_reader_u64")
	public static function readByteReaderU64(reader:flight._hl.ByteReader):haxe.Int64;
	@:hlNative("flight", "flight_read_byte_reader_u8")
	public static function readByteReaderU8(reader:flight._hl.ByteReader):Int;
	@:hlNative("flight", "flight_skip_byte_reader")
	public static function skipByteReader(reader:flight._hl.ByteReader, count:Int):Void;
	@:hlNative("flight", "flight_free_owned_byte_reader")
	public static function freeOwnedByteReader(ptr:flight._hl.ByteReader):Void;
}
