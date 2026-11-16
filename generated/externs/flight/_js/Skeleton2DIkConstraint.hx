package flight._js;

abstract Skeleton2DIkConstraint(Dynamic) {
	public var bendPositive(get, set):Bool;
	inline function get_bendPositive():Bool return untyped this["bendPositive"];
	inline function set_bendPositive(value:Bool):Bool return untyped this["bendPositive"] = value;
	public var compress(get, set):Bool;
	inline function get_compress():Bool return untyped this["compress"];
	inline function set_compress(value:Bool):Bool return untyped this["compress"] = value;
	public var mix(get, set):Float;
	inline function get_mix():Float return untyped this["mix"];
	inline function set_mix(value:Float):Float return untyped this["mix"] = value;
	public var stretch(get, set):Bool;
	inline function get_stretch():Bool return untyped this["stretch"];
	inline function set_stretch(value:Bool):Bool return untyped this["stretch"] = value;
	public var targetBoneIndex(get, set):Int;
	inline function get_targetBoneIndex():Int return untyped this["targetBoneIndex"];
	inline function set_targetBoneIndex(value:Int):Int return untyped this["targetBoneIndex"] = value;
}
