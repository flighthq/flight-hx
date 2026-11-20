package flight._js;

abstract RenderTargetAxes(Dynamic) {
	public var width(get, set):Int;
	inline function get_width():Int return untyped this.width;
	inline function set_width(value:Int):Int return untyped this.width = value;
	public var height(get, set):Int;
	inline function get_height():Int return untyped this.height;
	inline function set_height(value:Int):Int return untyped this.height = value;
	public var colorAttachments(get, set):Int;
	inline function get_colorAttachments():Int return untyped this.colorAttachments;
	inline function set_colorAttachments(value:Int):Int return untyped this.colorAttachments = value;
	public var sampleCount(get, set):Int;
	inline function get_sampleCount():Int return untyped this.sampleCount;
	inline function set_sampleCount(value:Int):Int return untyped this.sampleCount = value;
}
