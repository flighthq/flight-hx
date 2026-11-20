package flight._js;

abstract GltfAsset(Dynamic) {
	public var version(get, set):String;
	inline function get_version():String return untyped this.version;
	inline function set_version(value:String):String return untyped this.version = value;
}
