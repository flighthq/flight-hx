package flight._js;

abstract RequirementCatalogEntry(Dynamic) {
	public var backend(get, set):String;
	inline function get_backend():String return untyped this.backend;
	inline function set_backend(value:String):String return untyped this.backend = value;
	public var implementationImport(get, set):String;
	inline function get_implementationImport():String return untyped this.implementationImport;
	inline function set_implementationImport(value:String):String return untyped this.implementationImport = value;
	public var implementationSymbol(get, set):String;
	inline function get_implementationSymbol():String return untyped this.implementationSymbol;
	inline function set_implementationSymbol(value:String):String return untyped this.implementationSymbol = value;
}
