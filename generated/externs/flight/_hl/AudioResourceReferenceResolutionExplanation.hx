package flight._hl;

abstract AudioResourceReferenceResolutionExplanation(hl.Bytes) {
	public var retryable(get, set):Bool;

	inline function get_retryable():Bool return this.getUI8(12) != 0;

	inline function set_retryable(value:Bool):Bool { this.setUI8(12, value ? 1 : 0); return value; }
}
