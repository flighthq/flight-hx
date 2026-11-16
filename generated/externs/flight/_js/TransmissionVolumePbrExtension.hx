package flight._js;

abstract TransmissionVolumePbrExtension(Dynamic) {
	public var attenuationColor(get, set):Int;
	inline function get_attenuationColor():Int return untyped this["attenuationColor"];
	inline function set_attenuationColor(value:Int):Int return untyped this["attenuationColor"] = value;
	public var attenuationDistance(get, set):Float;
	inline function get_attenuationDistance():Float return untyped this["attenuationDistance"];
	inline function set_attenuationDistance(value:Float):Float return untyped this["attenuationDistance"] = value;
	public var ior(get, set):Float;
	inline function get_ior():Float return untyped this["ior"];
	inline function set_ior(value:Float):Float return untyped this["ior"] = value;
	public var thickness(get, set):Float;
	inline function get_thickness():Float return untyped this["thickness"];
	inline function set_thickness(value:Float):Float return untyped this["thickness"] = value;
	public var transmission(get, set):Float;
	inline function get_transmission():Float return untyped this["transmission"];
	inline function set_transmission(value:Float):Float return untyped this["transmission"] = value;
}
