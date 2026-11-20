package flight._hl;

private extern class ScreenInfo_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_screen_info_label")
	static function get_label(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_screen_info_label")
	static function set_label(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_screen_info_touch_support")
	static function get_touchSupport(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_screen_info_touch_support")
	static function set_touchSupport(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract ScreenInfo(hl.Bytes) {
	public var id(get, set):Float;

	inline function get_id():Float return this.getF64(64);

	inline function set_id(value:Float):Float { this.setF64(64, value); return value; }
	public var x(get, set):Float;

	inline function get_x():Float return this.getF64(72);

	inline function set_x(value:Float):Float { this.setF64(72, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return this.getF64(80);

	inline function set_y(value:Float):Float { this.setF64(80, value); return value; }
	public var width(get, set):Float;

	inline function get_width():Float return this.getF64(88);

	inline function set_width(value:Float):Float { this.setF64(88, value); return value; }
	public var height(get, set):Float;

	inline function get_height():Float return this.getF64(96);

	inline function set_height(value:Float):Float { this.setF64(96, value); return value; }
	public var workWidth(get, set):Float;

	inline function get_workWidth():Float return this.getF64(104);

	inline function set_workWidth(value:Float):Float { this.setF64(104, value); return value; }
	public var workHeight(get, set):Float;

	inline function get_workHeight():Float return this.getF64(112);

	inline function set_workHeight(value:Float):Float { this.setF64(112, value); return value; }
	public var scaleFactor(get, set):Float;

	inline function get_scaleFactor():Float return this.getF64(120);

	inline function set_scaleFactor(value:Float):Float { this.setF64(120, value); return value; }
	public var isPrimary(get, set):Bool;

	inline function get_isPrimary():Bool return this.getUI8(208) != 0;

	inline function set_isPrimary(value:Bool):Bool { this.setUI8(208, value ? 1 : 0); return value; }
	public var rotation(get, set):Float;

	inline function get_rotation():Float return this.getF64(128);

	inline function set_rotation(value:Float):Float { this.setF64(128, value); return value; }
	public var refreshRate(get, set):Float;

	inline function get_refreshRate():Float return this.getF64(136);

	inline function set_refreshRate(value:Float):Float { this.setF64(136, value); return value; }
	public var colorDepth(get, set):Float;

	inline function get_colorDepth():Float return this.getF64(144);

	inline function set_colorDepth(value:Float):Float { this.setF64(144, value); return value; }
	public var pixelDepth(get, set):Float;

	inline function get_pixelDepth():Float return this.getF64(152);

	inline function set_pixelDepth(value:Float):Float { this.setF64(152, value); return value; }
	public var physicalWidth(get, set):Float;

	inline function get_physicalWidth():Float return this.getF64(160);

	inline function set_physicalWidth(value:Float):Float { this.setF64(160, value); return value; }
	public var physicalHeight(get, set):Float;

	inline function get_physicalHeight():Float return this.getF64(168);

	inline function set_physicalHeight(value:Float):Float { this.setF64(168, value); return value; }
	public var isHdr(get, set):Bool;

	inline function get_isHdr():Bool return this.getUI8(209) != 0;

	inline function set_isHdr(value:Bool):Bool { this.setUI8(209, value ? 1 : 0); return value; }
	public var maxLuminance(get, set):Float;

	inline function get_maxLuminance():Float return this.getF64(176);

	inline function set_maxLuminance(value:Float):Float { this.setF64(176, value); return value; }
	public var depthPerComponent(get, set):Float;

	inline function get_depthPerComponent():Float return this.getF64(184);

	inline function set_depthPerComponent(value:Float):Float { this.setF64(184, value); return value; }
	public var dpi(get, set):Float;

	inline function get_dpi():Float return this.getF64(192);

	inline function set_dpi(value:Float):Float { this.setF64(192, value); return value; }
	public var label(get, set):String;
	inline function get_label():String { var raw = ScreenInfo_Ffi.get_label(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ScreenInfo_Ffi.freeString(raw); return value; }
	inline function set_label(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ScreenInfo_Ffi.set_label(this, raw); return value; }
	public var internal(get, set):Bool;

	inline function get_internal():Bool return this.getUI8(210) != 0;

	inline function set_internal(value:Bool):Bool { this.setUI8(210, value ? 1 : 0); return value; }
	public var touchSupport(get, set):String;
	inline function get_touchSupport():String { var raw = ScreenInfo_Ffi.get_touchSupport(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ScreenInfo_Ffi.freeString(raw); return value; }
	inline function set_touchSupport(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ScreenInfo_Ffi.set_touchSupport(this, raw); return value; }
	public var monochrome(get, set):Bool;

	inline function get_monochrome():Bool return this.getUI8(211) != 0;

	inline function set_monochrome(value:Bool):Bool { this.setUI8(211, value ? 1 : 0); return value; }
}
