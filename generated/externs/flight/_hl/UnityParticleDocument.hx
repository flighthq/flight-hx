package flight._hl;

private extern class UnityParticleDocument_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_unity_particle_document_name")
	static function get_name(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_unity_particle_document_name")
	static function set_name(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract UnityParticleDocument(hl.Bytes) {
	public var duration(get, set):Single;

	inline function get_duration():Single return this.getF32(88);

	inline function set_duration(value:Single):Single { this.setF32(88, value); return value; }
	public var gravityModifier(get, set):Single;

	inline function get_gravityModifier():Single return this.getF32(152);

	inline function set_gravityModifier(value:Single):Single { this.setF32(152, value); return value; }
	public var looping(get, set):Bool;

	inline function get_looping():Bool return this.getUI8(156) != 0;

	inline function set_looping(value:Bool):Bool { this.setUI8(156, value ? 1 : 0); return value; }
	public var maxParticles(get, set):Single;

	inline function get_maxParticles():Single return this.getF32(160);

	inline function set_maxParticles(value:Single):Single { this.setF32(160, value); return value; }
	public var name(get, set):String;
	inline function get_name():String { var raw = UnityParticleDocument_Ffi.get_name(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); UnityParticleDocument_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } UnityParticleDocument_Ffi.set_name(this, raw); return value; }
	public var physicsGravity(get, set):Single;

	inline function get_physicsGravity():Single return this.getF32(192);

	inline function set_physicsGravity(value:Single):Single { this.setF32(192, value); return value; }
	public var prewarm(get, set):Bool;

	inline function get_prewarm():Bool return this.getUI8(196) != 0;

	inline function set_prewarm(value:Bool):Bool { this.setUI8(196, value ? 1 : 0); return value; }
}
