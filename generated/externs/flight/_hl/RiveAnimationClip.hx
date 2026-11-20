package flight._hl;

private extern class RiveAnimationClip_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_rive_animation_clip_name")
	static function get_name(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_rive_animation_clip_name")
	static function set_name(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract RiveAnimationClip(hl.Bytes) {
	public var name(get, set):String;
	inline function get_name():String { var raw = RiveAnimationClip_Ffi.get_name(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); RiveAnimationClip_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } RiveAnimationClip_Ffi.set_name(this, raw); return value; }
	public var speed(get, set):Float;

	inline function get_speed():Float return this.getF64(104);

	inline function set_speed(value:Float):Float { this.setF64(104, value); return value; }
}
