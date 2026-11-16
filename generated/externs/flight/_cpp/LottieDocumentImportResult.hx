package flight._cpp;

private extern class LottieDocumentImportResult_Ffi {
	@:native("flight_get_lottie_document_import_result_duration") static function get_duration(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_lottie_document_import_result_duration") static function set_duration(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_lottie_document_import_result_frame_rate") static function get_frameRate(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_lottie_document_import_result_frame_rate") static function set_frameRate(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract LottieDocumentImportResult(cpp.Star<cpp.Void>) {
	public var duration(get, set):Single;

	inline function get_duration():Single return LottieDocumentImportResult_Ffi.get_duration(this);

	inline function set_duration(value:Single):Single { LottieDocumentImportResult_Ffi.set_duration(this, value); return value; }
	public var frameRate(get, set):Single;

	inline function get_frameRate():Single return LottieDocumentImportResult_Ffi.get_frameRate(this);

	inline function set_frameRate(value:Single):Single { LottieDocumentImportResult_Ffi.set_frameRate(this, value); return value; }
}
