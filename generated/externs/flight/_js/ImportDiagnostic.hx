package flight._js;

abstract ImportDiagnostic(Dynamic) {
	public var kind(get, set):String;
	inline function get_kind():String return untyped this.kind;
	inline function set_kind(value:String):String return untyped this.kind = value;
	public var origin(get, set):String;
	inline function get_origin():String return untyped this.origin;
	inline function set_origin(value:String):String return untyped this.origin = value;
}
