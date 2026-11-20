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

	inline function get_enabled():Bool return this.getUI8(96) != 0;

	inline function set_enabled(value:Bool):Bool { this.setUI8(96, value ? 1 : 0); return value; }
	public var intensity(get, set):Float;

	inline function get_intensity():Float return this.getF64(104);

	inline function set_intensity(value:Float):Float { this.setF64(104, value); return value; }
	public var normalBias(get, set):Float;

	inline function get_normalBias():Float return this.getF64(144);

	inline function set_normalBias(value:Float):Float { this.setF64(144, value); return value; }
	public var pcfRadius(get, set):Float;

	inline function get_pcfRadius():Float return this.getF64(152);

	inline function set_pcfRadius(value:Float):Float { this.setF64(152, value); return value; }
	public var shadowBias(get, set):Float;

	inline function get_shadowBias():Float return this.getF64(160);

	inline function set_shadowBias(value:Float):Float { this.setF64(160, value); return value; }
	public var shadowFar(get, set):Float;

	inline function get_shadowFar():Float return this.getF64(168);

	inline function set_shadowFar(value:Float):Float { this.setF64(168, value); return value; }
	public var shadowMapSize(get, set):Int;

	inline function get_shadowMapSize():Int return this.getI32(176);

	inline function set_shadowMapSize(value:Int):Int { this.setI32(176, value); return value; }
	public var shadowNear(get, set):Float;

	inline function get_shadowNear():Float return this.getF64(184);

	inline function set_shadowNear(value:Float):Float { this.setF64(184, value); return value; }
	public var shadowStrength(get, set):Float;

	inline function get_shadowStrength():Float return this.getF64(192);

	inline function set_shadowStrength(value:Float):Float { this.setF64(192, value); return value; }
}
