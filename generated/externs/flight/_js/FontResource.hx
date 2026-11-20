package flight._js;

abstract FontResource(Dynamic) {
	public var family(get, set):String;
	inline function get_family():String return untyped this.family;
	inline function set_family(value:String):String return untyped this.family = value;
}
