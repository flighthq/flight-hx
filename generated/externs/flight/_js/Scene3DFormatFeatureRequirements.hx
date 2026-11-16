package flight._js;

abstract Scene3DFormatFeatureRequirements(Dynamic) {
	public var feature(get, set):String;
	inline function get_feature():String return untyped this["feature"];
	inline function set_feature(value:String):String return untyped this["feature"] = value;
}
