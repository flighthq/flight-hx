package flight._js;

@:jsRequire("flight")
private extern class NodeRuntime_Ffi {
	@:native("flight_get_node_runtime_appearance_id") static function get_appearanceId(ptr:Dynamic):Int;
	@:native("flight_set_node_runtime_appearance_id") static function set_appearanceId(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_node_runtime_bounds_using_local_bounds_id") static function get_boundsUsingLocalBoundsId(ptr:Dynamic):Int;
	@:native("flight_set_node_runtime_bounds_using_local_bounds_id") static function set_boundsUsingLocalBoundsId(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_node_runtime_bounds_using_local_transform_id") static function get_boundsUsingLocalTransformId(ptr:Dynamic):Int;
	@:native("flight_set_node_runtime_bounds_using_local_transform_id") static function set_boundsUsingLocalTransformId(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_node_runtime_children_id") static function get_childrenId(ptr:Dynamic):Int;
	@:native("flight_set_node_runtime_children_id") static function set_childrenId(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_node_runtime_color_adjustments_unsupported") static function get_colorAdjustmentsUnsupported(ptr:Dynamic):Bool;
	@:native("flight_set_node_runtime_color_adjustments_unsupported") static function set_colorAdjustmentsUnsupported(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_node_runtime_local_bounds_id") static function get_localBoundsId(ptr:Dynamic):Int;
	@:native("flight_set_node_runtime_local_bounds_id") static function set_localBoundsId(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_node_runtime_local_bounds_using_local_bounds_id") static function get_localBoundsUsingLocalBoundsId(ptr:Dynamic):Int;
	@:native("flight_set_node_runtime_local_bounds_using_local_bounds_id") static function set_localBoundsUsingLocalBoundsId(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_node_runtime_local_content_id") static function get_localContentId(ptr:Dynamic):Int;
	@:native("flight_set_node_runtime_local_content_id") static function set_localContentId(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_node_runtime_local_transform_id") static function get_localTransformId(ptr:Dynamic):Int;
	@:native("flight_set_node_runtime_local_transform_id") static function set_localTransformId(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_node_runtime_local_transform_using_local_transform_id") static function get_localTransformUsingLocalTransformId(ptr:Dynamic):Int;
	@:native("flight_set_node_runtime_local_transform_using_local_transform_id") static function set_localTransformUsingLocalTransformId(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_node_runtime_parent_reference_id") static function get_parentReferenceId(ptr:Dynamic):Int;
	@:native("flight_set_node_runtime_parent_reference_id") static function set_parentReferenceId(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_node_runtime_world_bounds_using_local_bounds_id") static function get_worldBoundsUsingLocalBoundsId(ptr:Dynamic):Int;
	@:native("flight_set_node_runtime_world_bounds_using_local_bounds_id") static function set_worldBoundsUsingLocalBoundsId(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_node_runtime_world_bounds_using_world_transform_id") static function get_worldBoundsUsingWorldTransformId(ptr:Dynamic):Int;
	@:native("flight_set_node_runtime_world_bounds_using_world_transform_id") static function set_worldBoundsUsingWorldTransformId(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_node_runtime_world_transform_id") static function get_worldTransformId(ptr:Dynamic):Int;
	@:native("flight_set_node_runtime_world_transform_id") static function set_worldTransformId(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_node_runtime_world_transform_revision_counter") static function get_worldTransformRevisionCounter(ptr:Dynamic):Int;
	@:native("flight_set_node_runtime_world_transform_revision_counter") static function set_worldTransformRevisionCounter(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_node_runtime_world_transform_using_local_transform_id") static function get_worldTransformUsingLocalTransformId(ptr:Dynamic):Int;
	@:native("flight_set_node_runtime_world_transform_using_local_transform_id") static function set_worldTransformUsingLocalTransformId(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_node_runtime_world_transform_using_parent_transform_id") static function get_worldTransformUsingParentTransformId(ptr:Dynamic):Int;
	@:native("flight_set_node_runtime_world_transform_using_parent_transform_id") static function set_worldTransformUsingParentTransformId(ptr:Dynamic, value:Int):Int;
}

abstract NodeRuntime(Dynamic) {
	public var appearanceId(get, set):Int;

	inline function get_appearanceId():Int return NodeRuntime_Ffi.get_appearanceId(this);

	inline function set_appearanceId(value:Int):Int return NodeRuntime_Ffi.set_appearanceId(this, value);
	public var boundsUsingLocalBoundsId(get, set):Int;

	inline function get_boundsUsingLocalBoundsId():Int return NodeRuntime_Ffi.get_boundsUsingLocalBoundsId(this);

	inline function set_boundsUsingLocalBoundsId(value:Int):Int return NodeRuntime_Ffi.set_boundsUsingLocalBoundsId(this, value);
	public var boundsUsingLocalTransformId(get, set):Int;

	inline function get_boundsUsingLocalTransformId():Int return NodeRuntime_Ffi.get_boundsUsingLocalTransformId(this);

	inline function set_boundsUsingLocalTransformId(value:Int):Int return NodeRuntime_Ffi.set_boundsUsingLocalTransformId(this, value);
	public var childrenId(get, set):Int;

	inline function get_childrenId():Int return NodeRuntime_Ffi.get_childrenId(this);

	inline function set_childrenId(value:Int):Int return NodeRuntime_Ffi.set_childrenId(this, value);
	public var colorAdjustmentsUnsupported(get, set):Bool;

	inline function get_colorAdjustmentsUnsupported():Bool return NodeRuntime_Ffi.get_colorAdjustmentsUnsupported(this);

	inline function set_colorAdjustmentsUnsupported(value:Bool):Bool return NodeRuntime_Ffi.set_colorAdjustmentsUnsupported(this, value);
	public var localBoundsId(get, set):Int;

	inline function get_localBoundsId():Int return NodeRuntime_Ffi.get_localBoundsId(this);

	inline function set_localBoundsId(value:Int):Int return NodeRuntime_Ffi.set_localBoundsId(this, value);
	public var localBoundsUsingLocalBoundsId(get, set):Int;

	inline function get_localBoundsUsingLocalBoundsId():Int return NodeRuntime_Ffi.get_localBoundsUsingLocalBoundsId(this);

	inline function set_localBoundsUsingLocalBoundsId(value:Int):Int return NodeRuntime_Ffi.set_localBoundsUsingLocalBoundsId(this, value);
	public var localContentId(get, set):Int;

	inline function get_localContentId():Int return NodeRuntime_Ffi.get_localContentId(this);

	inline function set_localContentId(value:Int):Int return NodeRuntime_Ffi.set_localContentId(this, value);
	public var localTransformId(get, set):Int;

	inline function get_localTransformId():Int return NodeRuntime_Ffi.get_localTransformId(this);

	inline function set_localTransformId(value:Int):Int return NodeRuntime_Ffi.set_localTransformId(this, value);
	public var localTransformUsingLocalTransformId(get, set):Int;

	inline function get_localTransformUsingLocalTransformId():Int return NodeRuntime_Ffi.get_localTransformUsingLocalTransformId(this);

	inline function set_localTransformUsingLocalTransformId(value:Int):Int return NodeRuntime_Ffi.set_localTransformUsingLocalTransformId(this, value);
	public var parentReferenceId(get, set):Int;

	inline function get_parentReferenceId():Int return NodeRuntime_Ffi.get_parentReferenceId(this);

	inline function set_parentReferenceId(value:Int):Int return NodeRuntime_Ffi.set_parentReferenceId(this, value);
	public var worldBoundsUsingLocalBoundsId(get, set):Int;

	inline function get_worldBoundsUsingLocalBoundsId():Int return NodeRuntime_Ffi.get_worldBoundsUsingLocalBoundsId(this);

	inline function set_worldBoundsUsingLocalBoundsId(value:Int):Int return NodeRuntime_Ffi.set_worldBoundsUsingLocalBoundsId(this, value);
	public var worldBoundsUsingWorldTransformId(get, set):Int;

	inline function get_worldBoundsUsingWorldTransformId():Int return NodeRuntime_Ffi.get_worldBoundsUsingWorldTransformId(this);

	inline function set_worldBoundsUsingWorldTransformId(value:Int):Int return NodeRuntime_Ffi.set_worldBoundsUsingWorldTransformId(this, value);
	public var worldTransformId(get, set):Int;

	inline function get_worldTransformId():Int return NodeRuntime_Ffi.get_worldTransformId(this);

	inline function set_worldTransformId(value:Int):Int return NodeRuntime_Ffi.set_worldTransformId(this, value);
	public var worldTransformRevisionCounter(get, set):Int;

	inline function get_worldTransformRevisionCounter():Int return NodeRuntime_Ffi.get_worldTransformRevisionCounter(this);

	inline function set_worldTransformRevisionCounter(value:Int):Int return NodeRuntime_Ffi.set_worldTransformRevisionCounter(this, value);
	public var worldTransformUsingLocalTransformId(get, set):Int;

	inline function get_worldTransformUsingLocalTransformId():Int return NodeRuntime_Ffi.get_worldTransformUsingLocalTransformId(this);

	inline function set_worldTransformUsingLocalTransformId(value:Int):Int return NodeRuntime_Ffi.set_worldTransformUsingLocalTransformId(this, value);
	public var worldTransformUsingParentTransformId(get, set):Int;

	inline function get_worldTransformUsingParentTransformId():Int return NodeRuntime_Ffi.get_worldTransformUsingParentTransformId(this);

	inline function set_worldTransformUsingParentTransformId(value:Int):Int return NodeRuntime_Ffi.set_worldTransformUsingParentTransformId(this, value);
}
