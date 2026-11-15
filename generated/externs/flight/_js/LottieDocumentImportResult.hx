package flight._js;

@:jsRequire("flight")
private extern class LottieDocumentImportResult_Ffi {
	@:native("flight_get_lottie_document_import_result_duration") static function get_duration(ptr:Dynamic):Float;
	@:native("flight_set_lottie_document_import_result_duration") static function set_duration(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_lottie_document_import_result_frame_rate") static function get_frameRate(ptr:Dynamic):Float;
	@:native("flight_set_lottie_document_import_result_frame_rate") static function set_frameRate(ptr:Dynamic, value:Float):Float;
}

abstract LottieDocumentImportResult(Dynamic) {
	public var duration(get, set):Float;

	inline function get_duration():Float return LottieDocumentImportResult_Ffi.get_duration(this);

	inline function set_duration(value:Float):Float return LottieDocumentImportResult_Ffi.set_duration(this, value);
	public var frameRate(get, set):Float;

	inline function get_frameRate():Float return LottieDocumentImportResult_Ffi.get_frameRate(this);

	inline function set_frameRate(value:Float):Float return LottieDocumentImportResult_Ffi.set_frameRate(this, value);
}
