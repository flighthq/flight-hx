package flight._js;

abstract WrappedDiffusePbrExtension(Dynamic) {
	public var thickness(get, set):Float;
	inline function get_thickness():Float return untyped this.thickness;
	inline function set_thickness(value:Float):Float return untyped this.thickness = value;
	public var wrappedDiffuseColor(get, set):Int;
	inline function get_wrappedDiffuseColor():Int return untyped this.wrappedDiffuseColor;
	inline function set_wrappedDiffuseColor(value:Int):Int return untyped this.wrappedDiffuseColor = value;
	public var wrappedDiffuseStrength(get, set):Float;
	inline function get_wrappedDiffuseStrength():Float return untyped this.wrappedDiffuseStrength;
	inline function set_wrappedDiffuseStrength(value:Float):Float return untyped this.wrappedDiffuseStrength = value;
}
