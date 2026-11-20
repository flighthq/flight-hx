package flight._js;

abstract TrayTooltipReading(Dynamic) {
	public var tooltip(get, set):String;
	inline function get_tooltip():String return untyped this.tooltip;
	inline function set_tooltip(value:String):String return untyped this.tooltip = value;
}
