package flight._hl;

private extern class ParticleDesignerDocument_Ffi {
	@:hlNative("flight", "flight_field_get_particle_designer_document_texture_file_name")
	static function get_textureFileName(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_particle_designer_document_texture_file_name")
	static function set_textureFileName(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract ParticleDesignerDocument(hl.Bytes) {
	public var angle(get, set):Single;

	inline function get_angle():Single return this.getF32(0);

	inline function set_angle(value:Single):Single { this.setF32(0, value); return value; }
	public var angleVariance(get, set):Single;

	inline function get_angleVariance():Single return this.getF32(4);

	inline function set_angleVariance(value:Single):Single { this.setF32(4, value); return value; }
	public var blendFuncDestination(get, set):Single;

	inline function get_blendFuncDestination():Single return this.getF32(8);

	inline function set_blendFuncDestination(value:Single):Single { this.setF32(8, value); return value; }
	public var blendFuncSource(get, set):Single;

	inline function get_blendFuncSource():Single return this.getF32(12);

	inline function set_blendFuncSource(value:Single):Single { this.setF32(12, value); return value; }
	public var duration(get, set):Single;

	inline function get_duration():Single return this.getF32(16);

	inline function set_duration(value:Single):Single { this.setF32(16, value); return value; }
	public var finishColorAlpha(get, set):Single;

	inline function get_finishColorAlpha():Single return this.getF32(24);

	inline function set_finishColorAlpha(value:Single):Single { this.setF32(24, value); return value; }
	public var finishColorBlue(get, set):Single;

	inline function get_finishColorBlue():Single return this.getF32(28);

	inline function set_finishColorBlue(value:Single):Single { this.setF32(28, value); return value; }
	public var finishColorGreen(get, set):Single;

	inline function get_finishColorGreen():Single return this.getF32(32);

	inline function set_finishColorGreen(value:Single):Single { this.setF32(32, value); return value; }
	public var finishColorRed(get, set):Single;

	inline function get_finishColorRed():Single return this.getF32(36);

	inline function set_finishColorRed(value:Single):Single { this.setF32(36, value); return value; }
	public var finishColorVarianceAlpha(get, set):Single;

	inline function get_finishColorVarianceAlpha():Single return this.getF32(40);

	inline function set_finishColorVarianceAlpha(value:Single):Single { this.setF32(40, value); return value; }
	public var finishColorVarianceBlue(get, set):Single;

	inline function get_finishColorVarianceBlue():Single return this.getF32(44);

	inline function set_finishColorVarianceBlue(value:Single):Single { this.setF32(44, value); return value; }
	public var finishColorVarianceGreen(get, set):Single;

	inline function get_finishColorVarianceGreen():Single return this.getF32(48);

	inline function set_finishColorVarianceGreen(value:Single):Single { this.setF32(48, value); return value; }
	public var finishColorVarianceRed(get, set):Single;

	inline function get_finishColorVarianceRed():Single return this.getF32(52);

	inline function set_finishColorVarianceRed(value:Single):Single { this.setF32(52, value); return value; }
	public var finishParticleSize(get, set):Single;

	inline function get_finishParticleSize():Single return this.getF32(56);

	inline function set_finishParticleSize(value:Single):Single { this.setF32(56, value); return value; }
	public var finishParticleSizeVariance(get, set):Single;

	inline function get_finishParticleSizeVariance():Single return this.getF32(60);

	inline function set_finishParticleSizeVariance(value:Single):Single { this.setF32(60, value); return value; }
	public var gravityx(get, set):Single;

	inline function get_gravityx():Single return this.getF32(64);

	inline function set_gravityx(value:Single):Single { this.setF32(64, value); return value; }
	public var gravityy(get, set):Single;

	inline function get_gravityy():Single return this.getF32(68);

	inline function set_gravityy(value:Single):Single { this.setF32(68, value); return value; }
	public var maxParticles(get, set):Single;

	inline function get_maxParticles():Single return this.getF32(72);

	inline function set_maxParticles(value:Single):Single { this.setF32(72, value); return value; }
	public var maxRadius(get, set):Single;

	inline function get_maxRadius():Single return this.getF32(76);

	inline function set_maxRadius(value:Single):Single { this.setF32(76, value); return value; }
	public var maxRadiusVariance(get, set):Single;

	inline function get_maxRadiusVariance():Single return this.getF32(80);

	inline function set_maxRadiusVariance(value:Single):Single { this.setF32(80, value); return value; }
	public var minRadius(get, set):Single;

	inline function get_minRadius():Single return this.getF32(84);

	inline function set_minRadius(value:Single):Single { this.setF32(84, value); return value; }
	public var minRadiusVariance(get, set):Single;

	inline function get_minRadiusVariance():Single return this.getF32(88);

	inline function set_minRadiusVariance(value:Single):Single { this.setF32(88, value); return value; }
	public var particleLifespan(get, set):Single;

	inline function get_particleLifespan():Single return this.getF32(92);

	inline function set_particleLifespan(value:Single):Single { this.setF32(92, value); return value; }
	public var particleLifespanVariance(get, set):Single;

	inline function get_particleLifespanVariance():Single return this.getF32(96);

	inline function set_particleLifespanVariance(value:Single):Single { this.setF32(96, value); return value; }
	public var rotatePerSecond(get, set):Single;

	inline function get_rotatePerSecond():Single return this.getF32(100);

	inline function set_rotatePerSecond(value:Single):Single { this.setF32(100, value); return value; }
	public var rotatePerSecondVariance(get, set):Single;

	inline function get_rotatePerSecondVariance():Single return this.getF32(104);

	inline function set_rotatePerSecondVariance(value:Single):Single { this.setF32(104, value); return value; }
	public var rotationEnd(get, set):Single;

	inline function get_rotationEnd():Single return this.getF32(108);

	inline function set_rotationEnd(value:Single):Single { this.setF32(108, value); return value; }
	public var rotationEndVariance(get, set):Single;

	inline function get_rotationEndVariance():Single return this.getF32(112);

	inline function set_rotationEndVariance(value:Single):Single { this.setF32(112, value); return value; }
	public var rotationStart(get, set):Single;

	inline function get_rotationStart():Single return this.getF32(116);

	inline function set_rotationStart(value:Single):Single { this.setF32(116, value); return value; }
	public var rotationStartVariance(get, set):Single;

	inline function get_rotationStartVariance():Single return this.getF32(120);

	inline function set_rotationStartVariance(value:Single):Single { this.setF32(120, value); return value; }
	public var sourcePositionVariancex(get, set):Single;

	inline function get_sourcePositionVariancex():Single return this.getF32(124);

	inline function set_sourcePositionVariancex(value:Single):Single { this.setF32(124, value); return value; }
	public var sourcePositionVariancey(get, set):Single;

	inline function get_sourcePositionVariancey():Single return this.getF32(128);

	inline function set_sourcePositionVariancey(value:Single):Single { this.setF32(128, value); return value; }
	public var speed(get, set):Single;

	inline function get_speed():Single return this.getF32(132);

	inline function set_speed(value:Single):Single { this.setF32(132, value); return value; }
	public var speedVariance(get, set):Single;

	inline function get_speedVariance():Single return this.getF32(136);

	inline function set_speedVariance(value:Single):Single { this.setF32(136, value); return value; }
	public var startColorAlpha(get, set):Single;

	inline function get_startColorAlpha():Single return this.getF32(140);

	inline function set_startColorAlpha(value:Single):Single { this.setF32(140, value); return value; }
	public var startColorBlue(get, set):Single;

	inline function get_startColorBlue():Single return this.getF32(144);

	inline function set_startColorBlue(value:Single):Single { this.setF32(144, value); return value; }
	public var startColorGreen(get, set):Single;

	inline function get_startColorGreen():Single return this.getF32(148);

	inline function set_startColorGreen(value:Single):Single { this.setF32(148, value); return value; }
	public var startColorRed(get, set):Single;

	inline function get_startColorRed():Single return this.getF32(152);

	inline function set_startColorRed(value:Single):Single { this.setF32(152, value); return value; }
	public var startColorVarianceAlpha(get, set):Single;

	inline function get_startColorVarianceAlpha():Single return this.getF32(156);

	inline function set_startColorVarianceAlpha(value:Single):Single { this.setF32(156, value); return value; }
	public var startColorVarianceBlue(get, set):Single;

	inline function get_startColorVarianceBlue():Single return this.getF32(160);

	inline function set_startColorVarianceBlue(value:Single):Single { this.setF32(160, value); return value; }
	public var startColorVarianceGreen(get, set):Single;

	inline function get_startColorVarianceGreen():Single return this.getF32(164);

	inline function set_startColorVarianceGreen(value:Single):Single { this.setF32(164, value); return value; }
	public var startColorVarianceRed(get, set):Single;

	inline function get_startColorVarianceRed():Single return this.getF32(168);

	inline function set_startColorVarianceRed(value:Single):Single { this.setF32(168, value); return value; }
	public var startParticleSize(get, set):Single;

	inline function get_startParticleSize():Single return this.getF32(172);

	inline function set_startParticleSize(value:Single):Single { this.setF32(172, value); return value; }
	public var startParticleSizeVariance(get, set):Single;

	inline function get_startParticleSizeVariance():Single return this.getF32(176);

	inline function set_startParticleSizeVariance(value:Single):Single { this.setF32(176, value); return value; }
	public var textureFileName(get, set):String;
	inline function get_textureFileName():String {
		final bytes = ParticleDesignerDocument_Ffi.get_textureFileName(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_textureFileName(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ParticleDesignerDocument_Ffi.set_textureFileName(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
