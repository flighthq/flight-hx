package flight._cpp;

private extern class HtmlView_NodeProperties {
	@:native("flight_node_property_get_html_view_name")
	static function get_name(ptr:cpp.Star<cpp.Void>):Null<NativeByteBuffer>;
	@:native("flight_node_property_set_html_view_name")
	static function set_name(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int, present:Bool):Void;
	@:native("flight_node_property_get_html_view_alpha")
	static function get_alpha(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_node_property_set_html_view_alpha")
	static function set_alpha(ptr:cpp.Star<cpp.Void>, value:Single):Void;
	@:native("flight_node_property_get_html_view_visible")
	static function get_visible(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_node_property_set_html_view_visible")
	static function set_visible(ptr:cpp.Star<cpp.Void>, value:Bool):Void;
	@:native("flight_node_property_get_html_view_blend_mode")
	static function get_blendMode(ptr:cpp.Star<cpp.Void>):Null<NativeByteBuffer>;
	@:native("flight_node_property_set_html_view_blend_mode")
	static function set_blendMode(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int, present:Bool):Void;
}

abstract HtmlView(cpp.Star<cpp.Void>) {
	public var name(get, set):Null<String>;
	inline function get_name():Null<String> {
		final buffer = HtmlView_NodeProperties.get_name(this);
		if (buffer == null) return null;
		try {
			final value = buffer.toBytes().toString();
			buffer.dispose();
			return value;
		} catch (error:Dynamic) { buffer.dispose(); throw error; }
	}
	inline function set_name(value:Null<String>):Null<String> {
		if (value == null) {
			HtmlView_NodeProperties.set_name(this, null, 0, false);
		} else {
			final bytes = haxe.io.Bytes.ofString(value);
			HtmlView_NodeProperties.set_name(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length, true);
		}
		return value;
	}

	public var alpha(get, set):Single;
	inline function get_alpha():Single return HtmlView_NodeProperties.get_alpha(this);
	inline function set_alpha(value:Single):Single { HtmlView_NodeProperties.set_alpha(this, value); return value; }

	public var visible(get, set):Bool;
	inline function get_visible():Bool return HtmlView_NodeProperties.get_visible(this);
	inline function set_visible(value:Bool):Bool { HtmlView_NodeProperties.set_visible(this, value); return value; }

	public var blendMode(get, set):Null<String>;
	inline function get_blendMode():Null<String> {
		final buffer = HtmlView_NodeProperties.get_blendMode(this);
		if (buffer == null) return null;
		try {
			final value = buffer.toBytes().toString();
			buffer.dispose();
			return value;
		} catch (error:Dynamic) { buffer.dispose(); throw error; }
	}
	inline function set_blendMode(value:Null<String>):Null<String> {
		if (value == null) {
			HtmlView_NodeProperties.set_blendMode(this, null, 0, false);
		} else {
			final bytes = haxe.io.Bytes.ofString(value);
			HtmlView_NodeProperties.set_blendMode(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length, true);
		}
		return value;
	}

}
