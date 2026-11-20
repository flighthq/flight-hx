package flight._js;

abstract VertexColorMaterial(Dynamic) {
	public var tint(get, set):Int;
	inline function get_tint():Int return untyped this.tint;
	inline function set_tint(value:Int):Int return untyped this.tint = value;
}
