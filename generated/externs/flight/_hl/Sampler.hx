package flight._hl;

abstract Sampler(hl.Bytes) {
	public var anisotropy(get, set):Single;

	inline function get_anisotropy():Single return this.getF32(16);

	inline function set_anisotropy(value:Single):Single { this.setF32(16, value); return value; }
	public var mipmaps(get, set):Bool;

	inline function get_mipmaps():Bool return this.getUI8(28) != 0;

	inline function set_mipmaps(value:Bool):Bool { this.setUI8(28, value ? 1 : 0); return value; }

	static inline public function createAnisotropic(level:Single):flight._hl.Sampler {
		return flight._hl._fn.Texture.createAnisotropicSampler(level);
	}
	static inline public function createClampLinear():flight._hl.Sampler {
		return flight._hl._fn.Texture.createClampLinearSampler();
	}
	static inline public function createPixelArt():flight._hl.Sampler {
		return flight._hl._fn.Texture.createPixelArtSampler();
	}
	static inline public function create():flight._hl.Sampler {
		return flight._hl._fn.Texture.createSampler();
	}
	static inline public function createTiling():flight._hl.Sampler {
		return flight._hl._fn.Texture.createTilingSampler();
	}
	inline public function clone():flight._hl.Sampler {
		return flight._hl._fn.Texture.cloneSampler(cast this);
	}
	inline public function copy(source:flight._hl.Sampler):Void {
		flight._hl._fn.Texture.copySampler(cast this, source);
	}
	inline public function equals(b:flight._hl.Sampler):Bool {
		return flight._hl._fn.Texture.equalsSampler(cast this, b);
	}
	inline public function free():Void {
		flight._hl._fn.Texture.freeSampler(cast this);
	}
}
