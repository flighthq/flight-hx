package flight._hl;

abstract MediaSessionPositionState(hl.Bytes) {
	public var duration(get, set):Single;

	inline function get_duration():Single return this.getF32(0);

	inline function set_duration(value:Single):Single { this.setF32(0, value); return value; }
	public var playbackRate(get, set):Single;

	inline function get_playbackRate():Single return this.getF32(4);

	inline function set_playbackRate(value:Single):Single { this.setF32(4, value); return value; }
	public var position(get, set):Single;

	inline function get_position():Single return this.getF32(8);

	inline function set_position(value:Single):Single { this.setF32(8, value); return value; }
}
