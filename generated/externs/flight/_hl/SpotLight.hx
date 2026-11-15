package flight._hl;

abstract SpotLight(hl.Bytes) {
	public var castsShadow(get, set):Bool;

	inline function get_castsShadow():Bool return this.getUI8(16) != 0;

	inline function set_castsShadow(value:Bool):Bool { this.setUI8(16, value ? 1 : 0); return value; }
	public var color(get, set):Int;

	inline function get_color():Int return this.getI32(20);

	inline function set_color(value:Int):Int { this.setI32(20, value); return value; }
	public var decay(get, set):Single;

	inline function get_decay():Single return this.getF32(24);

	inline function set_decay(value:Single):Single { this.setF32(24, value); return value; }
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return this.getUI8(64) != 0;

	inline function set_enabled(value:Bool):Bool { this.setUI8(64, value ? 1 : 0); return value; }
	public var innerConeCos(get, set):Single;

	inline function get_innerConeCos():Single return this.getF32(68);

	inline function set_innerConeCos(value:Single):Single { this.setF32(68, value); return value; }
	public var intensity(get, set):Single;

	inline function get_intensity():Single return this.getF32(72);

	inline function set_intensity(value:Single):Single { this.setF32(72, value); return value; }
	public var layerMask(get, set):Int;

	inline function get_layerMask():Int return this.getI32(80);

	inline function set_layerMask(value:Int):Int { this.setI32(80, value); return value; }
	public var priority(get, set):Single;

	inline function get_priority():Single return this.getF32(84);

	inline function set_priority(value:Single):Single { this.setF32(84, value); return value; }
	public var normalBias(get, set):Single;

	inline function get_normalBias():Single return this.getF32(112);

	inline function set_normalBias(value:Single):Single { this.setF32(112, value); return value; }
	public var outerConeCos(get, set):Single;

	inline function get_outerConeCos():Single return this.getF32(116);

	inline function set_outerConeCos(value:Single):Single { this.setF32(116, value); return value; }
	public var pcfRadius(get, set):Single;

	inline function get_pcfRadius():Single return this.getF32(120);

	inline function set_pcfRadius(value:Single):Single { this.setF32(120, value); return value; }
	public var range(get, set):Single;

	inline function get_range():Single return this.getF32(160);

	inline function set_range(value:Single):Single { this.setF32(160, value); return value; }
	public var shadowBias(get, set):Single;

	inline function get_shadowBias():Single return this.getF32(164);

	inline function set_shadowBias(value:Single):Single { this.setF32(164, value); return value; }
	public var shadowFar(get, set):Single;

	inline function get_shadowFar():Single return this.getF32(168);

	inline function set_shadowFar(value:Single):Single { this.setF32(168, value); return value; }
	public var shadowMapSize(get, set):Int;

	inline function get_shadowMapSize():Int return this.getI32(172);

	inline function set_shadowMapSize(value:Int):Int { this.setI32(172, value); return value; }
	public var shadowNear(get, set):Single;

	inline function get_shadowNear():Single return this.getF32(176);

	inline function set_shadowNear(value:Single):Single { this.setF32(176, value); return value; }
	public var shadowStrength(get, set):Single;

	inline function get_shadowStrength():Single return this.getF32(180);

	inline function set_shadowStrength(value:Single):Single { this.setF32(180, value); return value; }
	public var spotBlend(get, set):Single;

	inline function get_spotBlend():Single return this.getF32(184);

	inline function set_spotBlend(value:Single):Single { this.setF32(184, value); return value; }
}
