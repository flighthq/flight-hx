package flight._hl;

private extern class ParticleEmitter3D_NodeProperties {
	@:hlNative("flight", "flight_node_property_get_particle_emitter3_d_name")
	static function get_name(ptr:hl.Bytes):Null<NativeByteBuffer>;
	@:hlNative("flight", "flight_node_property_set_particle_emitter3_d_name")
	static function set_name(ptr:hl.Bytes, data:hl.Bytes, length:Int, present:Bool):Void;
}

abstract ParticleEmitter3D(hl.Bytes) {
	public var name(get, set):Null<String>;
	inline function get_name():Null<String> {
		final buffer = ParticleEmitter3D_NodeProperties.get_name(this);
		if (buffer == null) return null;
		try {
			final value = buffer.toBytes().toString();
			buffer.dispose();
			return value;
		} catch (error:Dynamic) { buffer.dispose(); throw error; }
	}
	inline function set_name(value:Null<String>):Null<String> {
		if (value == null) {
			ParticleEmitter3D_NodeProperties.set_name(this, null, 0, false);
		} else {
			final bytes = haxe.io.Bytes.ofString(value);
			ParticleEmitter3D_NodeProperties.set_name(this, bytes.getData().bytes, bytes.length, true);
		}
		return value;
	}

}
