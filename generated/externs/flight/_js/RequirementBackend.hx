package flight._js;

abstract RequirementBackend(Dynamic) {
	public var infrastructureImport(get, set):String;
	inline function get_infrastructureImport():String return untyped this.infrastructureImport;
	inline function set_infrastructureImport(value:String):String return untyped this.infrastructureImport = value;
	public var infrastructureSymbol(get, set):String;
	inline function get_infrastructureSymbol():String return untyped this.infrastructureSymbol;
	inline function set_infrastructureSymbol(value:String):String return untyped this.infrastructureSymbol = value;
	public var name(get, set):String;
	inline function get_name():String return untyped this.name;
	inline function set_name(value:String):String return untyped this.name = value;
}
