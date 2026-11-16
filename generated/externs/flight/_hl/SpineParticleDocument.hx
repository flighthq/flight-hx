package flight._hl;

private extern class SpineParticleDocument_Ffi {
	@:hlNative("flight", "flight_field_get_spine_particle_document_name")
	static function get_name(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_spine_particle_document_name")
	static function set_name(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract SpineParticleDocument(hl.Bytes) {
	public var continuous(get, set):Bool;

	inline function get_continuous():Bool return this.getUI8(36) != 0;

	inline function set_continuous(value:Bool):Bool { this.setUI8(36, value ? 1 : 0); return value; }
	public var duration(get, set):Single;

	inline function get_duration():Single return this.getF32(40);

	inline function set_duration(value:Single):Single { this.setF32(40, value); return value; }
	public var maxParticles(get, set):Single;

	inline function get_maxParticles():Single return this.getF32(104);

	inline function set_maxParticles(value:Single):Single { this.setF32(104, value); return value; }
	public var name(get, set):String;
	inline function get_name():String {
		final bytes = SpineParticleDocument_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		SpineParticleDocument_Ffi.set_name(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var premultiplied(get, set):Bool;

	inline function get_premultiplied():Bool return this.getUI8(136) != 0;

	inline function set_premultiplied(value:Bool):Bool { this.setUI8(136, value ? 1 : 0); return value; }
}
