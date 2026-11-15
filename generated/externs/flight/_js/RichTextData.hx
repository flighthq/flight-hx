package flight._js;

@:jsRequire("flight")
private extern class RichTextData_Ffi {
	@:native("flight_get_rich_text_data_background") static function get_background(ptr:Dynamic):Bool;
	@:native("flight_set_rich_text_data_background") static function set_background(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_rich_text_data_background_color") static function get_backgroundColor(ptr:Dynamic):Int;
	@:native("flight_set_rich_text_data_background_color") static function set_backgroundColor(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_rich_text_data_border") static function get_border(ptr:Dynamic):Bool;
	@:native("flight_set_rich_text_data_border") static function set_border(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_rich_text_data_border_color") static function get_borderColor(ptr:Dynamic):Int;
	@:native("flight_set_rich_text_data_border_color") static function set_borderColor(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_rich_text_data_condense_white") static function get_condenseWhite(ptr:Dynamic):Bool;
	@:native("flight_set_rich_text_data_condense_white") static function set_condenseWhite(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_rich_text_data_height") static function get_height(ptr:Dynamic):Float;
	@:native("flight_set_rich_text_data_height") static function set_height(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_rich_text_data_max_chars") static function get_maxChars(ptr:Dynamic):Int;
	@:native("flight_set_rich_text_data_max_chars") static function set_maxChars(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_rich_text_data_mouse_wheel_enabled") static function get_mouseWheelEnabled(ptr:Dynamic):Bool;
	@:native("flight_set_rich_text_data_mouse_wheel_enabled") static function set_mouseWheelEnabled(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_rich_text_data_multiline") static function get_multiline(ptr:Dynamic):Bool;
	@:native("flight_set_rich_text_data_multiline") static function set_multiline(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_rich_text_data_scroll_h") static function get_scrollH(ptr:Dynamic):Float;
	@:native("flight_set_rich_text_data_scroll_h") static function set_scrollH(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_rich_text_data_scroll_v") static function get_scrollV(ptr:Dynamic):Float;
	@:native("flight_set_rich_text_data_scroll_v") static function set_scrollV(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_rich_text_data_selectable") static function get_selectable(ptr:Dynamic):Bool;
	@:native("flight_set_rich_text_data_selectable") static function set_selectable(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_rich_text_data_text_color") static function get_textColor(ptr:Dynamic):Int;
	@:native("flight_set_rich_text_data_text_color") static function set_textColor(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_rich_text_data_width") static function get_width(ptr:Dynamic):Float;
	@:native("flight_set_rich_text_data_width") static function set_width(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_rich_text_data_word_wrap") static function get_wordWrap(ptr:Dynamic):Bool;
	@:native("flight_set_rich_text_data_word_wrap") static function set_wordWrap(ptr:Dynamic, value:Bool):Bool;
}

abstract RichTextData(Dynamic) {
	public var background(get, set):Bool;

	inline function get_background():Bool return RichTextData_Ffi.get_background(this);

	inline function set_background(value:Bool):Bool return RichTextData_Ffi.set_background(this, value);
	public var backgroundColor(get, set):Int;

	inline function get_backgroundColor():Int return RichTextData_Ffi.get_backgroundColor(this);

	inline function set_backgroundColor(value:Int):Int return RichTextData_Ffi.set_backgroundColor(this, value);
	public var border(get, set):Bool;

	inline function get_border():Bool return RichTextData_Ffi.get_border(this);

	inline function set_border(value:Bool):Bool return RichTextData_Ffi.set_border(this, value);
	public var borderColor(get, set):Int;

	inline function get_borderColor():Int return RichTextData_Ffi.get_borderColor(this);

	inline function set_borderColor(value:Int):Int return RichTextData_Ffi.set_borderColor(this, value);
	public var condenseWhite(get, set):Bool;

	inline function get_condenseWhite():Bool return RichTextData_Ffi.get_condenseWhite(this);

	inline function set_condenseWhite(value:Bool):Bool return RichTextData_Ffi.set_condenseWhite(this, value);
	public var height(get, set):Float;

	inline function get_height():Float return RichTextData_Ffi.get_height(this);

	inline function set_height(value:Float):Float return RichTextData_Ffi.set_height(this, value);
	public var maxChars(get, set):Int;

	inline function get_maxChars():Int return RichTextData_Ffi.get_maxChars(this);

	inline function set_maxChars(value:Int):Int return RichTextData_Ffi.set_maxChars(this, value);
	public var mouseWheelEnabled(get, set):Bool;

	inline function get_mouseWheelEnabled():Bool return RichTextData_Ffi.get_mouseWheelEnabled(this);

	inline function set_mouseWheelEnabled(value:Bool):Bool return RichTextData_Ffi.set_mouseWheelEnabled(this, value);
	public var multiline(get, set):Bool;

	inline function get_multiline():Bool return RichTextData_Ffi.get_multiline(this);

	inline function set_multiline(value:Bool):Bool return RichTextData_Ffi.set_multiline(this, value);
	public var scrollH(get, set):Float;

	inline function get_scrollH():Float return RichTextData_Ffi.get_scrollH(this);

	inline function set_scrollH(value:Float):Float return RichTextData_Ffi.set_scrollH(this, value);
	public var scrollV(get, set):Float;

	inline function get_scrollV():Float return RichTextData_Ffi.get_scrollV(this);

	inline function set_scrollV(value:Float):Float return RichTextData_Ffi.set_scrollV(this, value);
	public var selectable(get, set):Bool;

	inline function get_selectable():Bool return RichTextData_Ffi.get_selectable(this);

	inline function set_selectable(value:Bool):Bool return RichTextData_Ffi.set_selectable(this, value);
	public var textColor(get, set):Int;

	inline function get_textColor():Int return RichTextData_Ffi.get_textColor(this);

	inline function set_textColor(value:Int):Int return RichTextData_Ffi.set_textColor(this, value);
	public var width(get, set):Float;

	inline function get_width():Float return RichTextData_Ffi.get_width(this);

	inline function set_width(value:Float):Float return RichTextData_Ffi.set_width(this, value);
	public var wordWrap(get, set):Bool;

	inline function get_wordWrap():Bool return RichTextData_Ffi.get_wordWrap(this);

	inline function set_wordWrap(value:Bool):Bool return RichTextData_Ffi.set_wordWrap(this, value);
}
