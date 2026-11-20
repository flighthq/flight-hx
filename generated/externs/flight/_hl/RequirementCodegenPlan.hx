package flight._hl;

private extern class RequirementCodegenPlan_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_requirement_codegen_plan_backend")
	static function get_backend(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_requirement_codegen_plan_backend")
	static function set_backend(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract RequirementCodegenPlan(hl.Bytes) {
	public var backend(get, set):String;
	inline function get_backend():String { var raw = RequirementCodegenPlan_Ffi.get_backend(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); RequirementCodegenPlan_Ffi.freeString(raw); return value; }
	inline function set_backend(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } RequirementCodegenPlan_Ffi.set_backend(this, raw); return value; }
}
