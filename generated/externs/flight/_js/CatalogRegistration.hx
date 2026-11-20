package flight._js;

abstract CatalogRegistration(Dynamic) {
	public var module(get, set):String;
	inline function get_module():String return untyped this.module;
	inline function set_module(value:String):String return untyped this.module = value;
	public var registrar(get, set):String;
	inline function get_registrar():String return untyped this.registrar;
	inline function set_registrar(value:String):String return untyped this.registrar = value;
}
