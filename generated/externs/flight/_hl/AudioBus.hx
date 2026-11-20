package flight._hl;

private extern class AudioBus_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_get_audio_bus_gain")
	static function get_gain(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_get_audio_bus_muted")
	static function get_muted(ptr:hl.Bytes):Bool;
	@:hlNative("flight", "flight_field_get_audio_bus_name")
	static function get_name(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_audio_bus_name")
	static function set_name(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_get_audio_bus_pan")
	static function get_pan(ptr:hl.Bytes):Single;
}

abstract AudioBus(hl.Bytes) {
	public var gain(get, never):Single;

	inline function get_gain():Single return AudioBus_Ffi.get_gain(this);

	public var muted(get, never):Bool;

	inline function get_muted():Bool return AudioBus_Ffi.get_muted(this);

	public var name(get, set):String;
	inline function get_name():String { var raw = AudioBus_Ffi.get_name(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); AudioBus_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } AudioBus_Ffi.set_name(this, raw); return value; }
	public var pan(get, never):Single;

	inline function get_pan():Single return AudioBus_Ffi.get_pan(this);

}
