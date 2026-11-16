package flight._js;

abstract Skeleton2DAnimationTarget(Dynamic) {
	public var boneIndex(get, set):Int;
	inline function get_boneIndex():Int return untyped this["boneIndex"];
	inline function set_boneIndex(value:Int):Int return untyped this["boneIndex"] = value;
	public var path(get, set):String;
	inline function get_path():String return untyped this["path"];
	inline function set_path(value:String):String return untyped this["path"] = value;
}
