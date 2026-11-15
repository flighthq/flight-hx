package flight._cpp;

private extern class Sampler_Ffi {
	@:native("flight_get_sampler_anisotropy") static function get_anisotropy(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_sampler_anisotropy") static function set_anisotropy(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_sampler_mipmaps") static function get_mipmaps(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_sampler_mipmaps") static function set_mipmaps(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract Sampler(cpp.Star<cpp.Void>) {
	public var anisotropy(get, set):Single;

	inline function get_anisotropy():Single return Sampler_Ffi.get_anisotropy(this);

	inline function set_anisotropy(value:Single):Single return Sampler_Ffi.set_anisotropy(this, value);
	public var mipmaps(get, set):Bool;

	inline function get_mipmaps():Bool return Sampler_Ffi.get_mipmaps(this);

	inline function set_mipmaps(value:Bool):Bool return Sampler_Ffi.set_mipmaps(this, value);

	static inline public function createAnisotropic(level:Single):flight._cpp.Sampler {
		return flight._cpp._fn.Texture.createAnisotropicSampler(level);
	}
	static inline public function createClampLinear():flight._cpp.Sampler {
		return flight._cpp._fn.Texture.createClampLinearSampler();
	}
	static inline public function createPixelArt():flight._cpp.Sampler {
		return flight._cpp._fn.Texture.createPixelArtSampler();
	}
	static inline public function create():flight._cpp.Sampler {
		return flight._cpp._fn.Texture.createSampler();
	}
	static inline public function createTiling():flight._cpp.Sampler {
		return flight._cpp._fn.Texture.createTilingSampler();
	}
	inline public function clone():flight._cpp.Sampler {
		return flight._cpp._fn.Texture.cloneSampler(cast this);
	}
	inline public function copy(source:flight._cpp.Sampler):Void {
		flight._cpp._fn.Texture.copySampler(cast this, source);
	}
	inline public function equals(b:flight._cpp.Sampler):Bool {
		return flight._cpp._fn.Texture.equalsSampler(cast this, b);
	}
	inline public function free():Void {
		flight._cpp._fn.Texture.freeSampler(cast this);
	}
}
