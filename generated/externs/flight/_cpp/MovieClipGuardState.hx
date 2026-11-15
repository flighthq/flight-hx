package flight._cpp;

private extern class MovieClipGuardState_Ffi {
	@:native("flight_get_movie_clip_guard_state_movie_clip_guards_enabled") static function get_movieClipGuardsEnabled(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_movie_clip_guard_state_movie_clip_guards_enabled") static function set_movieClipGuardsEnabled(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract MovieClipGuardState(cpp.Star<cpp.Void>) {
	public var movieClipGuardsEnabled(get, set):Bool;

	inline function get_movieClipGuardsEnabled():Bool return MovieClipGuardState_Ffi.get_movieClipGuardsEnabled(this);

	inline function set_movieClipGuardsEnabled(value:Bool):Bool return MovieClipGuardState_Ffi.set_movieClipGuardsEnabled(this, value);
}
