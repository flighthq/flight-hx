package flight._js;

abstract Scene2DDocumentImporterEntry(Dynamic) {
	public var kind(get, set):String;
	inline function get_kind():String return untyped this.kind;
	inline function set_kind(value:String):String return untyped this.kind = value;
}
