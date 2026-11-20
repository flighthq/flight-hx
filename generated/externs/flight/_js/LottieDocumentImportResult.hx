package flight._js;

abstract LottieDocumentImportResult(Dynamic) {
	public var duration(get, set):Float;
	inline function get_duration():Float return untyped this.duration;
	inline function set_duration(value:Float):Float return untyped this.duration = value;
	public var frameRate(get, set):Float;
	inline function get_frameRate():Float return untyped this.frameRate;
	inline function set_frameRate(value:Float):Float return untyped this.frameRate = value;
}
