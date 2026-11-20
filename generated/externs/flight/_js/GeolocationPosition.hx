package flight._js;

abstract GeolocationPosition(Dynamic) {
	public var latitude(get, set):Float;
	inline function get_latitude():Float return untyped this.latitude;
	inline function set_latitude(value:Float):Float return untyped this.latitude = value;
	public var longitude(get, set):Float;
	inline function get_longitude():Float return untyped this.longitude;
	inline function set_longitude(value:Float):Float return untyped this.longitude = value;
	public var accuracy(get, set):Float;
	inline function get_accuracy():Float return untyped this.accuracy;
	inline function set_accuracy(value:Float):Float return untyped this.accuracy = value;
	public var altitude(get, set):Float;
	inline function get_altitude():Float return untyped this.altitude;
	inline function set_altitude(value:Float):Float return untyped this.altitude = value;
	public var altitudeAccuracy(get, set):Float;
	inline function get_altitudeAccuracy():Float return untyped this.altitudeAccuracy;
	inline function set_altitudeAccuracy(value:Float):Float return untyped this.altitudeAccuracy = value;
	public var floorLevel(get, set):Float;
	inline function get_floorLevel():Float return untyped this.floorLevel;
	inline function set_floorLevel(value:Float):Float return untyped this.floorLevel = value;
	public var heading(get, set):Float;
	inline function get_heading():Float return untyped this.heading;
	inline function set_heading(value:Float):Float return untyped this.heading = value;
	public var speed(get, set):Float;
	inline function get_speed():Float return untyped this.speed;
	inline function set_speed(value:Float):Float return untyped this.speed = value;
	public var timestamp(get, set):Float;
	inline function get_timestamp():Float return untyped this.timestamp;
	inline function set_timestamp(value:Float):Float return untyped this.timestamp = value;
}
