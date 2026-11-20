package flight._js;

abstract CommandPropertyEntry(Dynamic) {
	public var property(get, set):String;
	inline function get_property():String return untyped this.property;
	inline function set_property(value:String):String return untyped this.property = value;
}
