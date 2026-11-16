package flight._js;

abstract CameraShake(Dynamic) {
	public var trauma(get, set):Float;
	inline function get_trauma():Float return untyped this.trauma;
	inline function set_trauma(value:Float):Float return untyped this.trauma = value;
	public var decay(get, set):Float;
	inline function get_decay():Float return untyped this.decay;
	inline function set_decay(value:Float):Float return untyped this.decay = value;
	public var frequency(get, set):Float;
	inline function get_frequency():Float return untyped this.frequency;
	inline function set_frequency(value:Float):Float return untyped this.frequency = value;
	public var translationAmplitude(get, set):Float;
	inline function get_translationAmplitude():Float return untyped this.translationAmplitude;
	inline function set_translationAmplitude(value:Float):Float return untyped this.translationAmplitude = value;
	public var rotationAmplitude(get, set):Float;
	inline function get_rotationAmplitude():Float return untyped this.rotationAmplitude;
	inline function set_rotationAmplitude(value:Float):Float return untyped this.rotationAmplitude = value;
	public var time(get, set):Float;
	inline function get_time():Float return untyped this.time;
	inline function set_time(value:Float):Float return untyped this.time = value;
}
