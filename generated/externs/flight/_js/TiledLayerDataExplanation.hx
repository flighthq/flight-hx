package flight._js;

abstract TiledLayerDataExplanation(Dynamic) {
	public var preservedAsZeroGrid(get, set):Bool;
	inline function get_preservedAsZeroGrid():Bool return untyped this.preservedAsZeroGrid;
	inline function set_preservedAsZeroGrid(value:Bool):Bool return untyped this.preservedAsZeroGrid = value;
	public var reason(get, set):String;
	inline function get_reason():String return untyped this.reason;
	inline function set_reason(value:String):String return untyped this.reason = value;
}
