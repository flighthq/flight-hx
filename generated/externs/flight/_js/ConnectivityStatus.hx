package flight._js;

abstract ConnectivityStatus(Dynamic) {
	public var downlink(get, set):Float;
	inline function get_downlink():Float return untyped this.downlink;
	inline function set_downlink(value:Float):Float return untyped this.downlink = value;
	public var downlinkMax(get, set):Float;
	inline function get_downlinkMax():Float return untyped this.downlinkMax;
	inline function set_downlinkMax(value:Float):Float return untyped this.downlinkMax = value;
	public var effectiveType(get, set):String;
	inline function get_effectiveType():String return untyped this.effectiveType;
	inline function set_effectiveType(value:String):String return untyped this.effectiveType = value;
	public var rtt(get, set):Float;
	inline function get_rtt():Float return untyped this.rtt;
	inline function set_rtt(value:Float):Float return untyped this.rtt = value;
	public var saveData(get, set):Bool;
	inline function get_saveData():Bool return untyped this.saveData;
	inline function set_saveData(value:Bool):Bool return untyped this.saveData = value;
	public var metered(get, set):Bool;
	inline function get_metered():Bool return untyped this.metered;
	inline function set_metered(value:Bool):Bool return untyped this.metered = value;
}
