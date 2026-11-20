package flight._js;

abstract CustomShaderMaterial(Dynamic) {
	public var shaderKey(get, set):String;
	inline function get_shaderKey():String return untyped this.shaderKey;
	inline function set_shaderKey(value:String):String return untyped this.shaderKey = value;
}
