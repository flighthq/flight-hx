package flight._hl;

private extern class MovieClip_NodeProperties {
	@:hlNative("flight", "flight_node_property_get_movie_clip_name")
	static function get_name(ptr:hl.Bytes):Null<NativeByteBuffer>;
	@:hlNative("flight", "flight_node_property_set_movie_clip_name")
	static function set_name(ptr:hl.Bytes, data:hl.Bytes, length:Int, present:Bool):Void;
	@:hlNative("flight", "flight_node_property_get_movie_clip_alpha")
	static function get_alpha(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_node_property_set_movie_clip_alpha")
	static function set_alpha(ptr:hl.Bytes, value:Single):Void;
	@:hlNative("flight", "flight_node_property_get_movie_clip_visible")
	static function get_visible(ptr:hl.Bytes):Bool;
	@:hlNative("flight", "flight_node_property_set_movie_clip_visible")
	static function set_visible(ptr:hl.Bytes, value:Bool):Void;
	@:hlNative("flight", "flight_node_property_get_movie_clip_blend_mode")
	static function get_blendMode(ptr:hl.Bytes):Null<NativeByteBuffer>;
	@:hlNative("flight", "flight_node_property_set_movie_clip_blend_mode")
	static function set_blendMode(ptr:hl.Bytes, data:hl.Bytes, length:Int, present:Bool):Void;
}

abstract MovieClip(hl.Bytes) {
	public var name(get, set):Null<String>;
	inline function get_name():Null<String> {
		final buffer = MovieClip_NodeProperties.get_name(this);
		if (buffer == null) return null;
		try {
			final value = buffer.toBytes().toString();
			buffer.dispose();
			return value;
		} catch (error:Dynamic) { buffer.dispose(); throw error; }
	}
	inline function set_name(value:Null<String>):Null<String> {
		if (value == null) {
			MovieClip_NodeProperties.set_name(this, null, 0, false);
		} else {
			final bytes = haxe.io.Bytes.ofString(value);
			MovieClip_NodeProperties.set_name(this, bytes.getData().bytes, bytes.length, true);
		}
		return value;
	}

	public var alpha(get, set):Single;
	inline function get_alpha():Single return MovieClip_NodeProperties.get_alpha(this);
	inline function set_alpha(value:Single):Single { MovieClip_NodeProperties.set_alpha(this, value); return value; }

	public var visible(get, set):Bool;
	inline function get_visible():Bool return MovieClip_NodeProperties.get_visible(this);
	inline function set_visible(value:Bool):Bool { MovieClip_NodeProperties.set_visible(this, value); return value; }

	public var blendMode(get, set):Null<String>;
	inline function get_blendMode():Null<String> {
		final buffer = MovieClip_NodeProperties.get_blendMode(this);
		if (buffer == null) return null;
		try {
			final value = buffer.toBytes().toString();
			buffer.dispose();
			return value;
		} catch (error:Dynamic) { buffer.dispose(); throw error; }
	}
	inline function set_blendMode(value:Null<String>):Null<String> {
		if (value == null) {
			MovieClip_NodeProperties.set_blendMode(this, null, 0, false);
		} else {
			final bytes = haxe.io.Bytes.ofString(value);
			MovieClip_NodeProperties.set_blendMode(this, bytes.getData().bytes, bytes.length, true);
		}
		return value;
	}

}
