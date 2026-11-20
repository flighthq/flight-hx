package flight._js;

abstract GltfAnimationTarget(Dynamic) {
	public var path(get, set):String;
	inline function get_path():String return untyped this.path;
	inline function set_path(value:String):String return untyped this.path = value;
}
