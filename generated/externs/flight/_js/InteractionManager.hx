package flight._js;

abstract InteractionManager(Dynamic) {
	public var doubleClickDelay(get, set):Float;
	inline function get_doubleClickDelay():Float return untyped this.doubleClickDelay;
	inline function set_doubleClickDelay(value:Float):Float return untyped this.doubleClickDelay = value;
	public var doubleClickDistance(get, set):Float;
	inline function get_doubleClickDistance():Float return untyped this.doubleClickDistance;
	inline function set_doubleClickDistance(value:Float):Float return untyped this.doubleClickDistance = value;
	public var enabled(get, set):Bool;
	inline function get_enabled():Bool return untyped this.enabled;
	inline function set_enabled(value:Bool):Bool return untyped this.enabled = value;
	public var precise(get, set):Bool;
	inline function get_precise():Bool return untyped this.precise;
	inline function set_precise(value:Bool):Bool return untyped this.precise = value;
	public var suppressTouchHover(get, set):Bool;
	inline function get_suppressTouchHover():Bool return untyped this.suppressTouchHover;
	inline function set_suppressTouchHover(value:Bool):Bool return untyped this.suppressTouchHover = value;
	public var trackedSubscribersOnly(get, set):Bool;
	inline function get_trackedSubscribersOnly():Bool return untyped this.trackedSubscribersOnly;
	inline function set_trackedSubscribersOnly(value:Bool):Bool return untyped this.trackedSubscribersOnly = value;
}
