package flight._js;

abstract ParticleEmitterState(Dynamic) {
	public var burstTimer(get, set):Float;
	inline function get_burstTimer():Float return untyped this["burstTimer"];
	inline function set_burstTimer(value:Float):Float return untyped this["burstTimer"] = value;
	public var emitterAge(get, set):Float;
	inline function get_emitterAge():Float return untyped this["emitterAge"];
	inline function set_emitterAge(value:Float):Float return untyped this["emitterAge"] = value;
	public var prevX(get, set):Float;
	inline function get_prevX():Float return untyped this["prevX"];
	inline function set_prevX(value:Float):Float return untyped this["prevX"] = value;
	public var prevY(get, set):Float;
	inline function get_prevY():Float return untyped this["prevY"];
	inline function set_prevY(value:Float):Float return untyped this["prevY"] = value;
	public var prevZ(get, set):Float;
	inline function get_prevZ():Float return untyped this["prevZ"];
	inline function set_prevZ(value:Float):Float return untyped this["prevZ"] = value;
	public var spawnAccumulator(get, set):Float;
	inline function get_spawnAccumulator():Float return untyped this["spawnAccumulator"];
	inline function set_spawnAccumulator(value:Float):Float return untyped this["spawnAccumulator"] = value;
}
