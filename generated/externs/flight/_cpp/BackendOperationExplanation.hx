package flight._cpp;

private extern class BackendOperationExplanation_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_backend_operation_explanation_implemented") static function get_implemented(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_backend_operation_explanation_implemented") static function set_implemented(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_field_get_backend_operation_explanation_operation") static function get_operation(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_backend_operation_explanation_operation") static function set_operation(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract BackendOperationExplanation(cpp.Star<cpp.Void>) {
	public var implemented(get, set):Bool;

	inline function get_implemented():Bool return BackendOperationExplanation_Ffi.get_implemented(this);

	inline function set_implemented(value:Bool):Bool { BackendOperationExplanation_Ffi.set_implemented(this, value); return value; }
	public var operation(get, set):String;
	inline function get_operation():String { var raw = BackendOperationExplanation_Ffi.get_operation(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); BackendOperationExplanation_Ffi.freeString(raw); return value; }
	inline function set_operation(value:String):String { var raw:cpp.ConstCharStar = cast value; BackendOperationExplanation_Ffi.set_operation(this, raw); return value; }
}
