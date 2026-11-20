package flight._js;

abstract Sampler(Dynamic) {
	public var anisotropy(get, set):Float;
	inline function get_anisotropy():Float return untyped this.anisotropy;
	inline function set_anisotropy(value:Float):Float return untyped this.anisotropy = value;
	public var mipmaps(get, set):Bool;
	inline function get_mipmaps():Bool return untyped this.mipmaps;
	inline function set_mipmaps(value:Bool):Bool return untyped this.mipmaps = value;
	static inline public function createAnisotropic(level:Float):flight._js.Sampler {
		return flight._js._fn.Texture.createAnisotropicSampler(level);
	}
	static inline public function createClampLinear():flight._js.Sampler {
		return flight._js._fn.Texture.createClampLinearSampler();
	}
	static inline public function createPixelArt():flight._js.Sampler {
		return flight._js._fn.Texture.createPixelArtSampler();
	}
	static inline public function create():flight._js.Sampler {
		return flight._js._fn.Texture.createSampler();
	}
	static inline public function createTiling():flight._js.Sampler {
		return flight._js._fn.Texture.createTilingSampler();
	}
	inline public function clone():flight._js.Sampler {
		return flight._js._fn.Texture.cloneSampler(cast this);
	}
	inline public function copy(source:flight._js.Sampler):Void {
		flight._js._fn.Texture.copySampler(cast this, source);
	}
	inline public function equals(b:Null<flight._js.Sampler>):Bool {
		return flight._js._fn.Texture.equalsSampler(cast this, b);
	}
	inline public function free():Void {
		flight._js._fn.Texture.freeSampler(cast this);
	}
}
