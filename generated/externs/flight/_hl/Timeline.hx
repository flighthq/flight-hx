package flight._hl;

abstract Timeline(hl.Bytes) {
	public var currentFrame(get, set):Int;

	inline function get_currentFrame():Int return this.getI32(40);

	inline function set_currentFrame(value:Int):Int { this.setI32(40, value); return value; }
	public var isPlaying(get, set):Bool;

	inline function get_isPlaying():Bool return this.getUI8(80) != 0;

	inline function set_isPlaying(value:Bool):Bool { this.setUI8(80, value ? 1 : 0); return value; }
	public var timeElapsed(get, set):Float;

	inline function get_timeElapsed():Float return this.getF64(88);

	inline function set_timeElapsed(value:Float):Float { this.setF64(88, value); return value; }
	public var lastFrameUpdate(get, set):Int;

	inline function get_lastFrameUpdate():Int return this.getI32(96);

	inline function set_lastFrameUpdate(value:Int):Int { this.setI32(96, value); return value; }
}
