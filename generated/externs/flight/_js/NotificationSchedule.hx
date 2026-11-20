package flight._js;

abstract NotificationSchedule(Dynamic) {
	public var at(get, set):Float;
	inline function get_at():Float return untyped this.at;
	inline function set_at(value:Float):Float return untyped this.at = value;
}
