package flight._js;

abstract ExposureAdjustment(Dynamic) {
	public var exposure(get, set):Float;
	inline function get_exposure():Float return untyped this.exposure;
	inline function set_exposure(value:Float):Float return untyped this.exposure = value;
}
