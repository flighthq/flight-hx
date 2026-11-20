package flight._js;

abstract RiveAdvancedBlend(Dynamic) {
	public var mode(get, set):String;
	inline function get_mode():String return untyped this.mode;
	inline function set_mode(value:String):String return untyped this.mode = value;
}
