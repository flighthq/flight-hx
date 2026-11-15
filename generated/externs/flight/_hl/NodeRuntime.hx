package flight._hl;

abstract NodeRuntime(hl.Bytes) {
	public var appearanceId(get, set):Int;

	inline function get_appearanceId():Int return this.getI32(0);

	inline function set_appearanceId(value:Int):Int { this.setI32(0, value); return value; }
	public var boundsUsingLocalBoundsId(get, set):Int;

	inline function get_boundsUsingLocalBoundsId():Int return this.getI32(4);

	inline function set_boundsUsingLocalBoundsId(value:Int):Int { this.setI32(4, value); return value; }
	public var boundsUsingLocalTransformId(get, set):Int;

	inline function get_boundsUsingLocalTransformId():Int return this.getI32(8);

	inline function set_boundsUsingLocalTransformId(value:Int):Int { this.setI32(8, value); return value; }
	public var childrenId(get, set):Int;

	inline function get_childrenId():Int return this.getI32(56);

	inline function set_childrenId(value:Int):Int { this.setI32(56, value); return value; }
	public var colorAdjustmentsUnsupported(get, set):Bool;

	inline function get_colorAdjustmentsUnsupported():Bool return this.getUI8(72) != 0;

	inline function set_colorAdjustmentsUnsupported(value:Bool):Bool { this.setUI8(72, value ? 1 : 0); return value; }
	public var localBoundsId(get, set):Int;

	inline function get_localBoundsId():Int return this.getI32(76);

	inline function set_localBoundsId(value:Int):Int { this.setI32(76, value); return value; }
	public var localBoundsUsingLocalBoundsId(get, set):Int;

	inline function get_localBoundsUsingLocalBoundsId():Int return this.getI32(80);

	inline function set_localBoundsUsingLocalBoundsId(value:Int):Int { this.setI32(80, value); return value; }
	public var localContentId(get, set):Int;

	inline function get_localContentId():Int return this.getI32(84);

	inline function set_localContentId(value:Int):Int { this.setI32(84, value); return value; }
	public var localTransformId(get, set):Int;

	inline function get_localTransformId():Int return this.getI32(120);

	inline function set_localTransformId(value:Int):Int { this.setI32(120, value); return value; }
	public var localTransformUsingLocalTransformId(get, set):Int;

	inline function get_localTransformUsingLocalTransformId():Int return this.getI32(124);

	inline function set_localTransformUsingLocalTransformId(value:Int):Int { this.setI32(124, value); return value; }
	public var parentReferenceId(get, set):Int;

	inline function get_parentReferenceId():Int return this.getI32(152);

	inline function set_parentReferenceId(value:Int):Int { this.setI32(152, value); return value; }
	public var worldBoundsUsingLocalBoundsId(get, set):Int;

	inline function get_worldBoundsUsingLocalBoundsId():Int return this.getI32(320);

	inline function set_worldBoundsUsingLocalBoundsId(value:Int):Int { this.setI32(320, value); return value; }
	public var worldBoundsUsingWorldTransformId(get, set):Int;

	inline function get_worldBoundsUsingWorldTransformId():Int return this.getI32(324);

	inline function set_worldBoundsUsingWorldTransformId(value:Int):Int { this.setI32(324, value); return value; }
	public var worldTransformId(get, set):Int;

	inline function get_worldTransformId():Int return this.getI32(328);

	inline function set_worldTransformId(value:Int):Int { this.setI32(328, value); return value; }
	public var worldTransformRevisionCounter(get, set):Int;

	inline function get_worldTransformRevisionCounter():Int return this.getI32(332);

	inline function set_worldTransformRevisionCounter(value:Int):Int { this.setI32(332, value); return value; }
	public var worldTransformUsingLocalTransformId(get, set):Int;

	inline function get_worldTransformUsingLocalTransformId():Int return this.getI32(336);

	inline function set_worldTransformUsingLocalTransformId(value:Int):Int { this.setI32(336, value); return value; }
	public var worldTransformUsingParentTransformId(get, set):Int;

	inline function get_worldTransformUsingParentTransformId():Int return this.getI32(340);

	inline function set_worldTransformUsingParentTransformId(value:Int):Int { this.setI32(340, value); return value; }
}
