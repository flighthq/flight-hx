package flight._js;

abstract LogSpan(Dynamic) {
	public var id(get, set):Float;
	inline function get_id():Float return untyped this.id;
	inline function set_id(value:Float):Float return untyped this.id = value;
	public var name(get, set):String;
	inline function get_name():String return untyped this.name;
	inline function set_name(value:String):String return untyped this.name = value;
}
