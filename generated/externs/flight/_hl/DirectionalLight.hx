package flight._hl;

abstract DirectionalLight(hl.Bytes) {
	public var cascadeCount(get, set):Int;

	inline function get_cascadeCount():Int return this.getI32(16);

	inline function set_cascadeCount(value:Int):Int { this.setI32(16, value); return value; }
	public var castsShadow(get, set):Bool;

	inline function get_castsShadow():Bool return this.getUI8(48) != 0;

	inline function set_castsShadow(value:Bool):Bool { this.setUI8(48, value ? 1 : 0); return value; }
	public var color(get, set):Int;

	inline function get_color():Int return this.getI32(52);

	inline function set_color(value:Int):Int { this.setI32(52, value); return value; }
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return this.getUI8(88) != 0;

	inline function set_enabled(value:Bool):Bool { this.setUI8(88, value ? 1 : 0); return value; }
	public var intensity(get, set):Single;

	inline function get_intensity():Single return this.getF32(92);

	inline function set_intensity(value:Single):Single { this.setF32(92, value); return value; }
	public var normalBias(get, set):Single;

	inline function get_normalBias():Single return this.getF32(128);

	inline function set_normalBias(value:Single):Single { this.setF32(128, value); return value; }
	public var pcfRadius(get, set):Single;

	inline function get_pcfRadius():Single return this.getF32(132);

	inline function set_pcfRadius(value:Single):Single { this.setF32(132, value); return value; }
	public var shadowBias(get, set):Single;

	inline function get_shadowBias():Single return this.getF32(136);

	inline function set_shadowBias(value:Single):Single { this.setF32(136, value); return value; }
	public var shadowFar(get, set):Single;

	inline function get_shadowFar():Single return this.getF32(140);

	inline function set_shadowFar(value:Single):Single { this.setF32(140, value); return value; }
	public var shadowMapSize(get, set):Int;

	inline function get_shadowMapSize():Int return this.getI32(144);

	inline function set_shadowMapSize(value:Int):Int { this.setI32(144, value); return value; }
	public var shadowNear(get, set):Single;

	inline function get_shadowNear():Single return this.getF32(148);

	inline function set_shadowNear(value:Single):Single { this.setF32(148, value); return value; }
	public var shadowStrength(get, set):Single;

	inline function get_shadowStrength():Single return this.getF32(152);

	inline function set_shadowStrength(value:Single):Single { this.setF32(152, value); return value; }
}
