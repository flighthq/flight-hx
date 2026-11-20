package flight._js;

abstract AddNodeChildCommand(Dynamic) {
	public var index(get, set):Int;
	inline function get_index():Int return untyped this.index;
	inline function set_index(value:Int):Int return untyped this.index = value;
}
