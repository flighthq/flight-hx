package flight._cpp;

private extern class LottieDocumentImportResult_Ffi {
	@:native("flight_get_lottie_document_import_result_duration") static function get_duration(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_lottie_document_import_result_duration") static function set_duration(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_lottie_document_import_result_frame_rate") static function get_frameRate(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_lottie_document_import_result_frame_rate") static function set_frameRate(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract LottieDocumentImportResult(cpp.Star<cpp.Void>) {
	public var duration(get, set):Float;

	inline function get_duration():Float return LottieDocumentImportResult_Ffi.get_duration(this);

	inline function set_duration(value:Float):Float { LottieDocumentImportResult_Ffi.set_duration(this, value); return value; }
	public var frameRate(get, set):Float;

	inline function get_frameRate():Float return LottieDocumentImportResult_Ffi.get_frameRate(this);

	inline function set_frameRate(value:Float):Float { LottieDocumentImportResult_Ffi.set_frameRate(this, value); return value; }
}
