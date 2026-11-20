package flight._js;

abstract HapticsCapabilities(Dynamic) {
	public var amplitudeControl(get, set):Bool;
	inline function get_amplitudeControl():Bool return untyped this.amplitudeControl;
	inline function set_amplitudeControl(value:Bool):Bool return untyped this.amplitudeControl = value;
	public var customEvents(get, set):Bool;
	inline function get_customEvents():Bool return untyped this.customEvents;
	inline function set_customEvents(value:Bool):Bool return untyped this.customEvents = value;
	public var intensity(get, set):Bool;
	inline function get_intensity():Bool return untyped this.intensity;
	inline function set_intensity(value:Bool):Bool return untyped this.intensity = value;
	public var patterns(get, set):Bool;
	inline function get_patterns():Bool return untyped this.patterns;
	inline function set_patterns(value:Bool):Bool return untyped this.patterns = value;
	public var supported(get, set):Bool;
	inline function get_supported():Bool return untyped this.supported;
	inline function set_supported(value:Bool):Bool return untyped this.supported = value;
}
