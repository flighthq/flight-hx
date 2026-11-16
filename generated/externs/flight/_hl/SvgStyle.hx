package flight._hl;

private extern class SvgStyle_Ffi {
	@:hlNative("flight", "flight_field_get_svg_style_color")
	static function get_color(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_svg_style_color")
	static function set_color(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_svg_style_display")
	static function get_display(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_svg_style_display")
	static function set_display(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_svg_style_fill")
	static function get_fill(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_svg_style_fill")
	static function set_fill(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_svg_style_filter")
	static function get_filter(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_svg_style_filter")
	static function set_filter(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_svg_style_font_family")
	static function get_fontFamily(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_svg_style_font_family")
	static function set_fontFamily(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_svg_style_font_style")
	static function get_fontStyle(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_svg_style_font_style")
	static function set_fontStyle(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_svg_style_font_weight")
	static function get_fontWeight(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_svg_style_font_weight")
	static function set_fontWeight(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_svg_style_stroke")
	static function get_stroke(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_svg_style_stroke")
	static function set_stroke(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_svg_style_stroke_dasharray")
	static function get_strokeDasharray(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_svg_style_stroke_dasharray")
	static function set_strokeDasharray(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_svg_style_stroke_linecap")
	static function get_strokeLinecap(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_svg_style_stroke_linecap")
	static function set_strokeLinecap(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_svg_style_stroke_linejoin")
	static function get_strokeLinejoin(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_svg_style_stroke_linejoin")
	static function set_strokeLinejoin(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_svg_style_text_anchor")
	static function get_textAnchor(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_svg_style_text_anchor")
	static function set_textAnchor(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_svg_style_visibility")
	static function get_visibility(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_svg_style_visibility")
	static function set_visibility(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract SvgStyle(hl.Bytes) {
	public var color(get, set):String;
	inline function get_color():String {
		final bytes = SvgStyle_Ffi.get_color(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_color(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		SvgStyle_Ffi.set_color(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var display(get, set):String;
	inline function get_display():String {
		final bytes = SvgStyle_Ffi.get_display(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_display(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		SvgStyle_Ffi.set_display(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var fill(get, set):String;
	inline function get_fill():String {
		final bytes = SvgStyle_Ffi.get_fill(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_fill(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		SvgStyle_Ffi.set_fill(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var fillOpacity(get, set):Single;

	inline function get_fillOpacity():Single return this.getF32(80);

	inline function set_fillOpacity(value:Single):Single { this.setF32(80, value); return value; }
	public var filter(get, set):String;
	inline function get_filter():String {
		final bytes = SvgStyle_Ffi.get_filter(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_filter(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		SvgStyle_Ffi.set_filter(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var fontFamily(get, set):String;
	inline function get_fontFamily():String {
		final bytes = SvgStyle_Ffi.get_fontFamily(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_fontFamily(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		SvgStyle_Ffi.set_fontFamily(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var fontSize(get, set):Single;

	inline function get_fontSize():Single return this.getF32(136);

	inline function set_fontSize(value:Single):Single { this.setF32(136, value); return value; }
	public var fontStyle(get, set):String;
	inline function get_fontStyle():String {
		final bytes = SvgStyle_Ffi.get_fontStyle(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_fontStyle(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		SvgStyle_Ffi.set_fontStyle(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var fontWeight(get, set):String;
	inline function get_fontWeight():String {
		final bytes = SvgStyle_Ffi.get_fontWeight(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_fontWeight(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		SvgStyle_Ffi.set_fontWeight(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var opacity(get, set):Single;

	inline function get_opacity():Single return this.getF32(192);

	inline function set_opacity(value:Single):Single { this.setF32(192, value); return value; }
	public var stroke(get, set):String;
	inline function get_stroke():String {
		final bytes = SvgStyle_Ffi.get_stroke(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_stroke(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		SvgStyle_Ffi.set_stroke(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var strokeDasharray(get, set):String;
	inline function get_strokeDasharray():String {
		final bytes = SvgStyle_Ffi.get_strokeDasharray(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_strokeDasharray(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		SvgStyle_Ffi.set_strokeDasharray(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var strokeDashoffset(get, set):Single;

	inline function get_strokeDashoffset():Single return this.getF32(248);

	inline function set_strokeDashoffset(value:Single):Single { this.setF32(248, value); return value; }
	public var strokeLinecap(get, set):String;
	inline function get_strokeLinecap():String {
		final bytes = SvgStyle_Ffi.get_strokeLinecap(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_strokeLinecap(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		SvgStyle_Ffi.set_strokeLinecap(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var strokeLinejoin(get, set):String;
	inline function get_strokeLinejoin():String {
		final bytes = SvgStyle_Ffi.get_strokeLinejoin(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_strokeLinejoin(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		SvgStyle_Ffi.set_strokeLinejoin(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var strokeMiterlimit(get, set):Single;

	inline function get_strokeMiterlimit():Single return this.getF32(304);

	inline function set_strokeMiterlimit(value:Single):Single { this.setF32(304, value); return value; }
	public var strokeOpacity(get, set):Single;

	inline function get_strokeOpacity():Single return this.getF32(308);

	inline function set_strokeOpacity(value:Single):Single { this.setF32(308, value); return value; }
	public var strokeWidth(get, set):Single;

	inline function get_strokeWidth():Single return this.getF32(312);

	inline function set_strokeWidth(value:Single):Single { this.setF32(312, value); return value; }
	public var textAnchor(get, set):String;
	inline function get_textAnchor():String {
		final bytes = SvgStyle_Ffi.get_textAnchor(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_textAnchor(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		SvgStyle_Ffi.set_textAnchor(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var visibility(get, set):String;
	inline function get_visibility():String {
		final bytes = SvgStyle_Ffi.get_visibility(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_visibility(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		SvgStyle_Ffi.set_visibility(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
