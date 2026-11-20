package flight._js;

abstract GltfOrthographicCamera(Dynamic) {
	public var xmag(get, set):Float;
	inline function get_xmag():Float return untyped this.xmag;
	inline function set_xmag(value:Float):Float return untyped this.xmag = value;
	public var ymag(get, set):Float;
	inline function get_ymag():Float return untyped this.ymag;
	inline function set_ymag(value:Float):Float return untyped this.ymag = value;
	public var zfar(get, set):Float;
	inline function get_zfar():Float return untyped this.zfar;
	inline function set_zfar(value:Float):Float return untyped this.zfar = value;
	public var znear(get, set):Float;
	inline function get_znear():Float return untyped this.znear;
	inline function set_znear(value:Float):Float return untyped this.znear = value;
}
