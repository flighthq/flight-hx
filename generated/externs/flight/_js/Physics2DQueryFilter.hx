package flight._js;

abstract Physics2DQueryFilter(Dynamic) {
	public var categoryBits(get, set):Int;
	inline function get_categoryBits():Int return untyped this.categoryBits;
	inline function set_categoryBits(value:Int):Int return untyped this.categoryBits = value;
	public var includeDynamic(get, set):Bool;
	inline function get_includeDynamic():Bool return untyped this.includeDynamic;
	inline function set_includeDynamic(value:Bool):Bool return untyped this.includeDynamic = value;
	public var includeKinematic(get, set):Bool;
	inline function get_includeKinematic():Bool return untyped this.includeKinematic;
	inline function set_includeKinematic(value:Bool):Bool return untyped this.includeKinematic = value;
	public var includeSensors(get, set):Bool;
	inline function get_includeSensors():Bool return untyped this.includeSensors;
	inline function set_includeSensors(value:Bool):Bool return untyped this.includeSensors = value;
	public var includeStatic(get, set):Bool;
	inline function get_includeStatic():Bool return untyped this.includeStatic;
	inline function set_includeStatic(value:Bool):Bool return untyped this.includeStatic = value;
	public var maskBits(get, set):Int;
	inline function get_maskBits():Int return untyped this.maskBits;
	inline function set_maskBits(value:Int):Int return untyped this.maskBits = value;
}
