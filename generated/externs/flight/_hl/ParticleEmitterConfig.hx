package flight._hl;

abstract ParticleEmitterConfig(hl.Bytes) {
	public var alphaEnd(get, set):Single;

	inline function get_alphaEnd():Single return this.getF32(24);

	inline function set_alphaEnd(value:Single):Single { this.setF32(24, value); return value; }
	public var alphaStart(get, set):Single;

	inline function get_alphaStart():Single return this.getF32(28);

	inline function set_alphaStart(value:Single):Single { this.setF32(28, value); return value; }
	public var burstCount(get, set):Single;

	inline function get_burstCount():Single return this.getF32(36);

	inline function set_burstCount(value:Single):Single { this.setF32(36, value); return value; }
	public var burstInterval(get, set):Single;

	inline function get_burstInterval():Single return this.getF32(40);

	inline function set_burstInterval(value:Single):Single { this.setF32(40, value); return value; }
	public var colorEndB(get, set):Single;

	inline function get_colorEndB():Single return this.getF32(72);

	inline function set_colorEndB(value:Single):Single { this.setF32(72, value); return value; }
	public var colorEndG(get, set):Single;

	inline function get_colorEndG():Single return this.getF32(76);

	inline function set_colorEndG(value:Single):Single { this.setF32(76, value); return value; }
	public var colorEndR(get, set):Single;

	inline function get_colorEndR():Single return this.getF32(80);

	inline function set_colorEndR(value:Single):Single { this.setF32(80, value); return value; }
	public var colorEndVarianceB(get, set):Single;

	inline function get_colorEndVarianceB():Single return this.getF32(84);

	inline function set_colorEndVarianceB(value:Single):Single { this.setF32(84, value); return value; }
	public var colorEndVarianceG(get, set):Single;

	inline function get_colorEndVarianceG():Single return this.getF32(88);

	inline function set_colorEndVarianceG(value:Single):Single { this.setF32(88, value); return value; }
	public var colorEndVarianceR(get, set):Single;

	inline function get_colorEndVarianceR():Single return this.getF32(92);

	inline function set_colorEndVarianceR(value:Single):Single { this.setF32(92, value); return value; }
	public var colorStartB(get, set):Single;

	inline function get_colorStartB():Single return this.getF32(96);

	inline function set_colorStartB(value:Single):Single { this.setF32(96, value); return value; }
	public var colorStartG(get, set):Single;

	inline function get_colorStartG():Single return this.getF32(100);

	inline function set_colorStartG(value:Single):Single { this.setF32(100, value); return value; }
	public var colorStartR(get, set):Single;

	inline function get_colorStartR():Single return this.getF32(104);

	inline function set_colorStartR(value:Single):Single { this.setF32(104, value); return value; }
	public var colorStartVarianceB(get, set):Single;

	inline function get_colorStartVarianceB():Single return this.getF32(108);

	inline function set_colorStartVarianceB(value:Single):Single { this.setF32(108, value); return value; }
	public var colorStartVarianceG(get, set):Single;

	inline function get_colorStartVarianceG():Single return this.getF32(112);

	inline function set_colorStartVarianceG(value:Single):Single { this.setF32(112, value); return value; }
	public var colorStartVarianceR(get, set):Single;

	inline function get_colorStartVarianceR():Single return this.getF32(116);

	inline function set_colorStartVarianceR(value:Single):Single { this.setF32(116, value); return value; }
	public var directionX(get, set):Single;

	inline function get_directionX():Single return this.getF32(120);

	inline function set_directionX(value:Single):Single { this.setF32(120, value); return value; }
	public var directionY(get, set):Single;

	inline function get_directionY():Single return this.getF32(124);

	inline function set_directionY(value:Single):Single { this.setF32(124, value); return value; }
	public var directionZ(get, set):Single;

	inline function get_directionZ():Single return this.getF32(128);

	inline function set_directionZ(value:Single):Single { this.setF32(128, value); return value; }
	public var duration(get, set):Single;

	inline function get_duration():Single return this.getF32(132);

	inline function set_duration(value:Single):Single { this.setF32(132, value); return value; }
	public var emitterConeAngle(get, set):Single;

	inline function get_emitterConeAngle():Single return this.getF32(136);

	inline function set_emitterConeAngle(value:Single):Single { this.setF32(136, value); return value; }
	public var emitterDepth(get, set):Single;

	inline function get_emitterDepth():Single return this.getF32(140);

	inline function set_emitterDepth(value:Single):Single { this.setF32(140, value); return value; }
	public var emitterHeight(get, set):Single;

	inline function get_emitterHeight():Single return this.getF32(144);

	inline function set_emitterHeight(value:Single):Single { this.setF32(144, value); return value; }
	public var emitterRadius(get, set):Single;

	inline function get_emitterRadius():Single return this.getF32(148);

	inline function set_emitterRadius(value:Single):Single { this.setF32(148, value); return value; }
	public var emitterWidth(get, set):Single;

	inline function get_emitterWidth():Single return this.getF32(156);

	inline function set_emitterWidth(value:Single):Single { this.setF32(156, value); return value; }
	public var frameCount(get, set):Single;

	inline function get_frameCount():Single return this.getF32(160);

	inline function set_frameCount(value:Single):Single { this.setF32(160, value); return value; }
	public var frameRate(get, set):Single;

	inline function get_frameRate():Single return this.getF32(164);

	inline function set_frameRate(value:Single):Single { this.setF32(164, value); return value; }
	public var gravityX(get, set):Single;

	inline function get_gravityX():Single return this.getF32(168);

	inline function set_gravityX(value:Single):Single { this.setF32(168, value); return value; }
	public var gravityY(get, set):Single;

	inline function get_gravityY():Single return this.getF32(172);

	inline function set_gravityY(value:Single):Single { this.setF32(172, value); return value; }
	public var gravityZ(get, set):Single;

	inline function get_gravityZ():Single return this.getF32(176);

	inline function set_gravityZ(value:Single):Single { this.setF32(176, value); return value; }
	public var lifetimeMax(get, set):Single;

	inline function get_lifetimeMax():Single return this.getF32(180);

	inline function set_lifetimeMax(value:Single):Single { this.setF32(180, value); return value; }
	public var lifetimeMin(get, set):Single;

	inline function get_lifetimeMin():Single return this.getF32(184);

	inline function set_lifetimeMin(value:Single):Single { this.setF32(184, value); return value; }
	public var looping(get, set):Bool;

	inline function get_looping():Bool return this.getUI8(188) != 0;

	inline function set_looping(value:Bool):Bool { this.setUI8(188, value ? 1 : 0); return value; }
	public var maxParticles(get, set):Single;

	inline function get_maxParticles():Single return this.getF32(192);

	inline function set_maxParticles(value:Single):Single { this.setF32(192, value); return value; }
	public var regionIdMax(get, set):Single;

	inline function get_regionIdMax():Single return this.getF32(196);

	inline function set_regionIdMax(value:Single):Single { this.setF32(196, value); return value; }
	public var regionIdMin(get, set):Single;

	inline function get_regionIdMin():Single return this.getF32(200);

	inline function set_regionIdMin(value:Single):Single { this.setF32(200, value); return value; }
	public var rotationSpeedMax(get, set):Single;

	inline function get_rotationSpeedMax():Single return this.getF32(204);

	inline function set_rotationSpeedMax(value:Single):Single { this.setF32(204, value); return value; }
	public var rotationSpeedMin(get, set):Single;

	inline function get_rotationSpeedMin():Single return this.getF32(208);

	inline function set_rotationSpeedMin(value:Single):Single { this.setF32(208, value); return value; }
	public var scaleEnd(get, set):Single;

	inline function get_scaleEnd():Single return this.getF32(240);

	inline function set_scaleEnd(value:Single):Single { this.setF32(240, value); return value; }
	public var scaleMax(get, set):Single;

	inline function get_scaleMax():Single return this.getF32(244);

	inline function set_scaleMax(value:Single):Single { this.setF32(244, value); return value; }
	public var scaleMin(get, set):Single;

	inline function get_scaleMin():Single return this.getF32(248);

	inline function set_scaleMin(value:Single):Single { this.setF32(248, value); return value; }
	public var spawnRate(get, set):Single;

	inline function get_spawnRate():Single return this.getF32(252);

	inline function set_spawnRate(value:Single):Single { this.setF32(252, value); return value; }
	public var speedMax(get, set):Single;

	inline function get_speedMax():Single return this.getF32(256);

	inline function set_speedMax(value:Single):Single { this.setF32(256, value); return value; }
	public var speedMin(get, set):Single;

	inline function get_speedMin():Single return this.getF32(260);

	inline function set_speedMin(value:Single):Single { this.setF32(260, value); return value; }
	public var spread(get, set):Single;

	inline function get_spread():Single return this.getF32(264);

	inline function set_spread(value:Single):Single { this.setF32(264, value); return value; }
	public var velocityInheritance(get, set):Single;

	inline function get_velocityInheritance():Single return this.getF32(268);

	inline function set_velocityInheritance(value:Single):Single { this.setF32(268, value); return value; }
	public var worldSpace(get, set):Bool;

	inline function get_worldSpace():Bool return this.getUI8(272) != 0;

	inline function set_worldSpace(value:Bool):Bool { this.setUI8(272, value ? 1 : 0); return value; }
}
