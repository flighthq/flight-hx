package flight._cpp;

private extern class SvgStyle_Ffi {
	@:native("flight_field_get_svg_style_color")
	static function get_color(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_svg_style_color")
	static function set_color(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_field_get_svg_style_display")
	static function get_display(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_svg_style_display")
	static function set_display(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_field_get_svg_style_fill")
	static function get_fill(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_svg_style_fill")
	static function set_fill(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_svg_style_fill_opacity") static function get_fillOpacity(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_svg_style_fill_opacity") static function set_fillOpacity(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_field_get_svg_style_filter")
	static function get_filter(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_svg_style_filter")
	static function set_filter(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_field_get_svg_style_font_family")
	static function get_fontFamily(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_svg_style_font_family")
	static function set_fontFamily(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_svg_style_font_size") static function get_fontSize(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_svg_style_font_size") static function set_fontSize(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_field_get_svg_style_font_style")
	static function get_fontStyle(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_svg_style_font_style")
	static function set_fontStyle(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_field_get_svg_style_font_weight")
	static function get_fontWeight(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_svg_style_font_weight")
	static function set_fontWeight(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_svg_style_opacity") static function get_opacity(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_svg_style_opacity") static function set_opacity(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_field_get_svg_style_stroke")
	static function get_stroke(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_svg_style_stroke")
	static function set_stroke(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_field_get_svg_style_stroke_dasharray")
	static function get_strokeDasharray(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_svg_style_stroke_dasharray")
	static function set_strokeDasharray(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_svg_style_stroke_dashoffset") static function get_strokeDashoffset(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_svg_style_stroke_dashoffset") static function set_strokeDashoffset(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_field_get_svg_style_stroke_linecap")
	static function get_strokeLinecap(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_svg_style_stroke_linecap")
	static function set_strokeLinecap(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_field_get_svg_style_stroke_linejoin")
	static function get_strokeLinejoin(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_svg_style_stroke_linejoin")
	static function set_strokeLinejoin(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_svg_style_stroke_miterlimit") static function get_strokeMiterlimit(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_svg_style_stroke_miterlimit") static function set_strokeMiterlimit(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_svg_style_stroke_opacity") static function get_strokeOpacity(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_svg_style_stroke_opacity") static function set_strokeOpacity(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_svg_style_stroke_width") static function get_strokeWidth(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_svg_style_stroke_width") static function set_strokeWidth(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_field_get_svg_style_text_anchor")
	static function get_textAnchor(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_svg_style_text_anchor")
	static function set_textAnchor(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_field_get_svg_style_visibility")
	static function get_visibility(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_svg_style_visibility")
	static function set_visibility(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract SvgStyle(cpp.Star<cpp.Void>) {
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
		SvgStyle_Ffi.set_color(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
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
		SvgStyle_Ffi.set_display(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
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
		SvgStyle_Ffi.set_fill(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var fillOpacity(get, set):Single;

	inline function get_fillOpacity():Single return SvgStyle_Ffi.get_fillOpacity(this);

	inline function set_fillOpacity(value:Single):Single { SvgStyle_Ffi.set_fillOpacity(this, value); return value; }
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
		SvgStyle_Ffi.set_filter(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
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
		SvgStyle_Ffi.set_fontFamily(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var fontSize(get, set):Single;

	inline function get_fontSize():Single return SvgStyle_Ffi.get_fontSize(this);

	inline function set_fontSize(value:Single):Single { SvgStyle_Ffi.set_fontSize(this, value); return value; }
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
		SvgStyle_Ffi.set_fontStyle(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
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
		SvgStyle_Ffi.set_fontWeight(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var opacity(get, set):Single;

	inline function get_opacity():Single return SvgStyle_Ffi.get_opacity(this);

	inline function set_opacity(value:Single):Single { SvgStyle_Ffi.set_opacity(this, value); return value; }
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
		SvgStyle_Ffi.set_stroke(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
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
		SvgStyle_Ffi.set_strokeDasharray(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var strokeDashoffset(get, set):Single;

	inline function get_strokeDashoffset():Single return SvgStyle_Ffi.get_strokeDashoffset(this);

	inline function set_strokeDashoffset(value:Single):Single { SvgStyle_Ffi.set_strokeDashoffset(this, value); return value; }
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
		SvgStyle_Ffi.set_strokeLinecap(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
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
		SvgStyle_Ffi.set_strokeLinejoin(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var strokeMiterlimit(get, set):Single;

	inline function get_strokeMiterlimit():Single return SvgStyle_Ffi.get_strokeMiterlimit(this);

	inline function set_strokeMiterlimit(value:Single):Single { SvgStyle_Ffi.set_strokeMiterlimit(this, value); return value; }
	public var strokeOpacity(get, set):Single;

	inline function get_strokeOpacity():Single return SvgStyle_Ffi.get_strokeOpacity(this);

	inline function set_strokeOpacity(value:Single):Single { SvgStyle_Ffi.set_strokeOpacity(this, value); return value; }
	public var strokeWidth(get, set):Single;

	inline function get_strokeWidth():Single return SvgStyle_Ffi.get_strokeWidth(this);

	inline function set_strokeWidth(value:Single):Single { SvgStyle_Ffi.set_strokeWidth(this, value); return value; }
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
		SvgStyle_Ffi.set_textAnchor(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
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
		SvgStyle_Ffi.set_visibility(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
