package flight._hl;

abstract AreaLight(hl.Bytes) {
	public var castsShadow(get, set):Bool;

	inline function get_castsShadow():Bool return this.getUI8(16) != 0;

	inline function set_castsShadow(value:Bool):Bool { this.setUI8(16, value ? 1 : 0); return value; }
	public var color(get, set):Int;

	inline function get_color():Int return this.getI32(20);

	inline function set_color(value:Int):Int { this.setI32(20, value); return value; }
	public var decay(get, set):Float;

	inline function get_decay():Float return this.getF64(24);

	inline function set_decay(value:Float):Float { this.setF64(24, value); return value; }
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return this.getUI8(72) != 0;

	inline function set_enabled(value:Bool):Bool { this.setUI8(72, value ? 1 : 0); return value; }
	public var intensity(get, set):Float;

	inline function get_intensity():Float return this.getF64(80);

	inline function set_intensity(value:Float):Float { this.setF64(80, value); return value; }
	public var normalBias(get, set):Float;

	inline function get_normalBias():Float return this.getF64(120);

	inline function set_normalBias(value:Float):Float { this.setF64(120, value); return value; }
	public var pcfRadius(get, set):Float;

	inline function get_pcfRadius():Float return this.getF64(128);

	inline function set_pcfRadius(value:Float):Float { this.setF64(128, value); return value; }
	public var range(get, set):Float;

	inline function get_range():Float return this.getF64(176);

	inline function set_range(value:Float):Float { this.setF64(176, value); return value; }
	public var shadowBias(get, set):Float;

	inline function get_shadowBias():Float return this.getF64(224);

	inline function set_shadowBias(value:Float):Float { this.setF64(224, value); return value; }
	public var shadowFar(get, set):Float;

	inline function get_shadowFar():Float return this.getF64(232);

	inline function set_shadowFar(value:Float):Float { this.setF64(232, value); return value; }
	public var shadowMapSize(get, set):Int;

	inline function get_shadowMapSize():Int return this.getI32(240);

	inline function set_shadowMapSize(value:Int):Int { this.setI32(240, value); return value; }
	public var shadowNear(get, set):Float;

	inline function get_shadowNear():Float return this.getF64(248);

	inline function set_shadowNear(value:Float):Float { this.setF64(248, value); return value; }
	public var shadowStrength(get, set):Float;

	inline function get_shadowStrength():Float return this.getF64(256);

	inline function set_shadowStrength(value:Float):Float { this.setF64(256, value); return value; }
}
