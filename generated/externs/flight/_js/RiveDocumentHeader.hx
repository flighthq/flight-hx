package flight._js;

abstract RiveDocumentHeader(Dynamic) {
	public var fileId(get, set):Float;
	inline function get_fileId():Float return untyped this["fileId"];
	inline function set_fileId(value:Float):Float return untyped this["fileId"] = value;
	public var majorVersion(get, set):Float;
	inline function get_majorVersion():Float return untyped this["majorVersion"];
	inline function set_majorVersion(value:Float):Float return untyped this["majorVersion"] = value;
	public var minorVersion(get, set):Float;
	inline function get_minorVersion():Float return untyped this["minorVersion"];
	inline function set_minorVersion(value:Float):Float return untyped this["minorVersion"] = value;
}
