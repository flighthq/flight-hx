package flight._js;

abstract MorphShapeData(Dynamic) {
	public var progress(get, set):Float;
	inline function get_progress():Float return untyped this.progress;
	inline function set_progress(value:Float):Float return untyped this.progress = value;
}
