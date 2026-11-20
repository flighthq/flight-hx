package flight._js;

abstract Skeleton3DValidationDiagnostic(Dynamic) {
	public var jointCount(get, set):Int;
	inline function get_jointCount():Int return untyped this.jointCount;
	inline function set_jointCount(value:Int):Int return untyped this.jointCount = value;
	public var inverseBindMatricesLength(get, set):Int;
	inline function get_inverseBindMatricesLength():Int return untyped this.inverseBindMatricesLength;
	inline function set_inverseBindMatricesLength(value:Int):Int return untyped this.inverseBindMatricesLength = value;
	public var expectedInverseBindMatricesLength(get, set):Int;
	inline function get_expectedInverseBindMatricesLength():Int return untyped this.expectedInverseBindMatricesLength;
	inline function set_expectedInverseBindMatricesLength(value:Int):Int return untyped this.expectedInverseBindMatricesLength = value;
	public var message(get, set):String;
	inline function get_message():String return untyped this.message;
	inline function set_message(value:String):String return untyped this.message = value;
}
