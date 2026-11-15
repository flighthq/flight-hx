package flight._js;

@:jsRequire("flight")
private extern class Sampler_Ffi {
	@:native("flight_get_sampler_anisotropy") static function get_anisotropy(ptr:Dynamic):Float;
	@:native("flight_set_sampler_anisotropy") static function set_anisotropy(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_sampler_mipmaps") static function get_mipmaps(ptr:Dynamic):Bool;
	@:native("flight_set_sampler_mipmaps") static function set_mipmaps(ptr:Dynamic, value:Bool):Bool;
}

abstract Sampler(Dynamic) {
	public var anisotropy(get, set):Float;

	inline function get_anisotropy():Float return Sampler_Ffi.get_anisotropy(this);

	inline function set_anisotropy(value:Float):Float return Sampler_Ffi.set_anisotropy(this, value);
	public var mipmaps(get, set):Bool;

	inline function get_mipmaps():Bool return Sampler_Ffi.get_mipmaps(this);

	inline function set_mipmaps(value:Bool):Bool return Sampler_Ffi.set_mipmaps(this, value);

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
	inline public function equals(b:flight._js.Sampler):Bool {
		return flight._js._fn.Texture.equalsSampler(cast this, b);
	}
	inline public function free():Void {
		flight._js._fn.Texture.freeSampler(cast this);
	}
}
