package flight._js;

abstract SfntFontTable(Dynamic) {
	public var tag(get, set):Int;
	inline function get_tag():Int return untyped this.tag;
	inline function set_tag(value:Int):Int return untyped this.tag = value;
}
