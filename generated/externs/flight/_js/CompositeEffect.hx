package flight._js;

abstract CompositeEffect(Dynamic) {
	public var operator_(get, set):String;
	inline function get_operator_():String return untyped this["operator"];
	inline function set_operator_(value:String):String return untyped this["operator"] = value;
}
