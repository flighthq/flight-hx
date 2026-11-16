package flight._js;

abstract TextLabelContentExplanation(Dynamic) {
	public var agreement(get, set):Bool;
	inline function get_agreement():Bool return untyped this.agreement;
	inline function set_agreement(value:Bool):Bool return untyped this.agreement = value;
	public var revision(get, set):Int;
	inline function get_revision():Int return untyped this.revision;
	inline function set_revision(value:Int):Int return untyped this.revision = value;
}
