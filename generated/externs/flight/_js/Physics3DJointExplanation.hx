package flight._js;

abstract Physics3DJointExplanation(Dynamic) {
	public var kind(get, set):String;
	inline function get_kind():String return untyped this.kind;
	inline function set_kind(value:String):String return untyped this.kind = value;
	public var index(get, set):Int;
	inline function get_index():Int return untyped this.index;
	inline function set_index(value:Int):Int return untyped this.index = value;
	public var hasSolver(get, set):Bool;
	inline function get_hasSolver():Bool return untyped this.hasSolver;
	inline function set_hasSolver(value:Bool):Bool return untyped this.hasSolver = value;
	public var bodiesResolvable(get, set):Bool;
	inline function get_bodiesResolvable():Bool return untyped this.bodiesResolvable;
	inline function set_bodiesResolvable(value:Bool):Bool return untyped this.bodiesResolvable = value;
}
