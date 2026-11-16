package flight._js;

abstract ColladaDecodedSkin(Dynamic) {
	public var controllerId(get, set):String;
	inline function get_controllerId():String return untyped this["controllerId"];
	inline function set_controllerId(value:String):String return untyped this["controllerId"] = value;
	public var geometryRef(get, set):String;
	inline function get_geometryRef():String return untyped this["geometryRef"];
	inline function set_geometryRef(value:String):String return untyped this["geometryRef"] = value;
}
