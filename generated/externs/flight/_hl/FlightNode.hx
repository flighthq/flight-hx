package flight._hl;

private extern class FlightNode_Ffi {
	@:hlNative("flight", "flight_node_equals")
	static function equals(a:flight._hl.FlightNode, b:flight._hl.FlightNode):Bool;
	@:hlNative("flight", "flight_free_node")
	static function free(node:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_set_node_enabled")
	static function set_enabled_invalidating(node:flight._hl.FlightNode, value:Bool):Bool;
	@:hlNative("flight", "flight_set_node3d_alpha")
	static function set_node3dAlpha_invalidating(node:flight._hl.FlightNode, value:Single):Bool;
	@:hlNative("flight", "flight_set_node2d_clip")
	static function set_node2dClip_invalidating(node:flight._hl.FlightNode, value:hl.Bytes):Bool;
	@:hlNative("flight", "flight_get_node_enabled")
	static function get_enabled(node:flight._hl.FlightNode):Bool;
	@:hlNative("flight", "flight_set_node_enabled_field")
	static function set_enabled(node:flight._hl.FlightNode, value:Bool):Bool;
	@:hlNative("flight", "flight_get_node2d_alpha")
	static function get_node2dAlpha(node:flight._hl.FlightNode):Single;
	@:hlNative("flight", "flight_set_node2d_alpha")
	static function set_node2dAlpha(node:flight._hl.FlightNode, value:Single):Bool;
	@:hlNative("flight", "flight_get_node2d_pivot_x")
	static function get_node2dPivotX(node:flight._hl.FlightNode):Float;
	@:hlNative("flight", "flight_set_node2d_pivot_x")
	static function set_node2dPivotX(node:flight._hl.FlightNode, value:Float):Bool;
	@:hlNative("flight", "flight_get_node2d_pivot_y")
	static function get_node2dPivotY(node:flight._hl.FlightNode):Float;
	@:hlNative("flight", "flight_set_node2d_pivot_y")
	static function set_node2dPivotY(node:flight._hl.FlightNode, value:Float):Bool;
	@:hlNative("flight", "flight_get_node2d_rotation")
	static function get_node2dRotation(node:flight._hl.FlightNode):Float;
	@:hlNative("flight", "flight_set_node2d_rotation")
	static function set_node2dRotation(node:flight._hl.FlightNode, value:Float):Bool;
	@:hlNative("flight", "flight_get_node2d_scale_x")
	static function get_node2dScaleX(node:flight._hl.FlightNode):Float;
	@:hlNative("flight", "flight_set_node2d_scale_x")
	static function set_node2dScaleX(node:flight._hl.FlightNode, value:Float):Bool;
	@:hlNative("flight", "flight_get_node2d_scale_y")
	static function get_node2dScaleY(node:flight._hl.FlightNode):Float;
	@:hlNative("flight", "flight_set_node2d_scale_y")
	static function set_node2dScaleY(node:flight._hl.FlightNode, value:Float):Bool;
	@:hlNative("flight", "flight_get_node2d_skew_x")
	static function get_node2dSkewX(node:flight._hl.FlightNode):Float;
	@:hlNative("flight", "flight_set_node2d_skew_x")
	static function set_node2dSkewX(node:flight._hl.FlightNode, value:Float):Bool;
	@:hlNative("flight", "flight_get_node2d_skew_y")
	static function get_node2dSkewY(node:flight._hl.FlightNode):Float;
	@:hlNative("flight", "flight_set_node2d_skew_y")
	static function set_node2dSkewY(node:flight._hl.FlightNode, value:Float):Bool;
	@:hlNative("flight", "flight_get_node2d_visible")
	static function get_node2dVisible(node:flight._hl.FlightNode):Bool;
	@:hlNative("flight", "flight_set_node2d_visible")
	static function set_node2dVisible(node:flight._hl.FlightNode, value:Bool):Bool;
	@:hlNative("flight", "flight_get_node2d_x")
	static function get_node2dX(node:flight._hl.FlightNode):Float;
	@:hlNative("flight", "flight_set_node2d_x")
	static function set_node2dX(node:flight._hl.FlightNode, value:Float):Bool;
	@:hlNative("flight", "flight_get_node2d_y")
	static function get_node2dY(node:flight._hl.FlightNode):Float;
	@:hlNative("flight", "flight_set_node2d_y")
	static function set_node2dY(node:flight._hl.FlightNode, value:Float):Bool;
	@:hlNative("flight", "flight_get_node3d_alpha")
	static function get_node3dAlpha(node:flight._hl.FlightNode):Single;
	@:hlNative("flight", "flight_set_node3d_alpha_field")
	static function set_node3dAlpha(node:flight._hl.FlightNode, value:Single):Bool;
	@:hlNative("flight", "flight_get_node3d_visible")
	static function get_node3dVisible(node:flight._hl.FlightNode):Bool;
	@:hlNative("flight", "flight_set_node3d_visible")
	static function set_node3dVisible(node:flight._hl.FlightNode, value:Bool):Bool;
	@:hlNative("flight", "flight_get_node3d_position_x")
	static function get_node3dPositionX(node:flight._hl.FlightNode):Float;
	@:hlNative("flight", "flight_set_node3d_position_x")
	static function set_node3dPositionX(node:flight._hl.FlightNode, value:Float):Bool;
	@:hlNative("flight", "flight_get_node3d_position_y")
	static function get_node3dPositionY(node:flight._hl.FlightNode):Float;
	@:hlNative("flight", "flight_set_node3d_position_y")
	static function set_node3dPositionY(node:flight._hl.FlightNode, value:Float):Bool;
	@:hlNative("flight", "flight_get_node3d_position_z")
	static function get_node3dPositionZ(node:flight._hl.FlightNode):Float;
	@:hlNative("flight", "flight_set_node3d_position_z")
	static function set_node3dPositionZ(node:flight._hl.FlightNode, value:Float):Bool;
	@:hlNative("flight", "flight_get_node3d_rotation_x")
	static function get_node3dRotationX(node:flight._hl.FlightNode):Float;
	@:hlNative("flight", "flight_set_node3d_rotation_x")
	static function set_node3dRotationX(node:flight._hl.FlightNode, value:Float):Bool;
	@:hlNative("flight", "flight_get_node3d_rotation_y")
	static function get_node3dRotationY(node:flight._hl.FlightNode):Float;
	@:hlNative("flight", "flight_set_node3d_rotation_y")
	static function set_node3dRotationY(node:flight._hl.FlightNode, value:Float):Bool;
	@:hlNative("flight", "flight_get_node3d_rotation_z")
	static function get_node3dRotationZ(node:flight._hl.FlightNode):Float;
	@:hlNative("flight", "flight_set_node3d_rotation_z")
	static function set_node3dRotationZ(node:flight._hl.FlightNode, value:Float):Bool;
	@:hlNative("flight", "flight_get_node3d_rotation_w")
	static function get_node3dRotationW(node:flight._hl.FlightNode):Float;
	@:hlNative("flight", "flight_set_node3d_rotation_w")
	static function set_node3dRotationW(node:flight._hl.FlightNode, value:Float):Bool;
	@:hlNative("flight", "flight_get_node3d_scale_x")
	static function get_node3dScaleX(node:flight._hl.FlightNode):Float;
	@:hlNative("flight", "flight_set_node3d_scale_x")
	static function set_node3dScaleX(node:flight._hl.FlightNode, value:Float):Bool;
	@:hlNative("flight", "flight_get_node3d_scale_y")
	static function get_node3dScaleY(node:flight._hl.FlightNode):Float;
	@:hlNative("flight", "flight_set_node3d_scale_y")
	static function set_node3dScaleY(node:flight._hl.FlightNode, value:Float):Bool;
	@:hlNative("flight", "flight_get_node3d_scale_z")
	static function get_node3dScaleZ(node:flight._hl.FlightNode):Float;
	@:hlNative("flight", "flight_set_node3d_scale_z")
	static function set_node3dScaleZ(node:flight._hl.FlightNode, value:Float):Bool;
	@:hlNative("flight", "flight_get_node_kind")
	static function get_kind(node:flight._hl.FlightNode):hl.Bytes;
	@:hlNative("flight", "flight_set_node_kind")
	static function set_kind(node:flight._hl.FlightNode, value:hl.Bytes):Bool;
	@:hlNative("flight", "flight_get_node_name")
	static function get_name(node:flight._hl.FlightNode):hl.Bytes;
	@:hlNative("flight", "flight_set_node_name")
	static function set_name(node:flight._hl.FlightNode, value:hl.Bytes):Bool;
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_get_node2d_blend_mode")
	static function get_node2dBlendMode(node:flight._hl.FlightNode):Int;
	@:hlNative("flight", "flight_set_node2d_blend_mode")
	static function set_node2dBlendMode(node:flight._hl.FlightNode, value:Int, present:Bool):Bool;
	@:hlNative("flight", "flight_get_node2d_clip")
	static function get_node2dClip(node:flight._hl.FlightNode):hl.Bytes;
	@:hlNative("flight", "flight_get_node2d_material")
	static function get_node2dMaterial(node:flight._hl.FlightNode):hl.Bytes;
	@:hlNative("flight", "flight_set_node2d_material")
	static function set_node2dMaterial(node:flight._hl.FlightNode, value:hl.Bytes):Bool;
	@:hlNative("flight", "flight_get_node2d_material_data")
	static function get_node2dMaterialData(node:flight._hl.FlightNode):hl.Bytes;
	@:hlNative("flight", "flight_set_node2d_material_data")
	static function set_node2dMaterialData(node:flight._hl.FlightNode, value:hl.Bytes):Bool;
}

abstract FlightNode(hl.Bytes) {
	public static inline function same(a:Null<FlightNode>, b:Null<FlightNode>):Bool return FlightNode_Ffi.equals(cast a, cast b);
	public static inline function freeNullable(node:Null<FlightNode>):Void FlightNode_Ffi.free(cast node);
	public inline function equals(other:FlightNode):Bool return FlightNode_Ffi.equals(cast this, other);
	public inline function free():Void FlightNode_Ffi.free(cast this);

	public var enabled(get, set):Bool;
	inline function get_enabled():Bool return FlightNode_Ffi.get_enabled(cast this);
	inline function set_enabled(value:Bool):Bool { FlightNode_Ffi.set_enabled(cast this, value); return value; }

	public var node2dAlpha(get, set):Single;
	inline function get_node2dAlpha():Single return FlightNode_Ffi.get_node2dAlpha(cast this);
	inline function set_node2dAlpha(value:Single):Single { FlightNode_Ffi.set_node2dAlpha(cast this, value); return value; }

	public var node2dPivotX(get, set):Float;
	inline function get_node2dPivotX():Float return FlightNode_Ffi.get_node2dPivotX(cast this);
	inline function set_node2dPivotX(value:Float):Float { FlightNode_Ffi.set_node2dPivotX(cast this, value); return value; }

	public var node2dPivotY(get, set):Float;
	inline function get_node2dPivotY():Float return FlightNode_Ffi.get_node2dPivotY(cast this);
	inline function set_node2dPivotY(value:Float):Float { FlightNode_Ffi.set_node2dPivotY(cast this, value); return value; }

	public var node2dRotation(get, set):Float;
	inline function get_node2dRotation():Float return FlightNode_Ffi.get_node2dRotation(cast this);
	inline function set_node2dRotation(value:Float):Float { FlightNode_Ffi.set_node2dRotation(cast this, value); return value; }

	public var node2dScaleX(get, set):Float;
	inline function get_node2dScaleX():Float return FlightNode_Ffi.get_node2dScaleX(cast this);
	inline function set_node2dScaleX(value:Float):Float { FlightNode_Ffi.set_node2dScaleX(cast this, value); return value; }

	public var node2dScaleY(get, set):Float;
	inline function get_node2dScaleY():Float return FlightNode_Ffi.get_node2dScaleY(cast this);
	inline function set_node2dScaleY(value:Float):Float { FlightNode_Ffi.set_node2dScaleY(cast this, value); return value; }

	public var node2dSkewX(get, set):Float;
	inline function get_node2dSkewX():Float return FlightNode_Ffi.get_node2dSkewX(cast this);
	inline function set_node2dSkewX(value:Float):Float { FlightNode_Ffi.set_node2dSkewX(cast this, value); return value; }

	public var node2dSkewY(get, set):Float;
	inline function get_node2dSkewY():Float return FlightNode_Ffi.get_node2dSkewY(cast this);
	inline function set_node2dSkewY(value:Float):Float { FlightNode_Ffi.set_node2dSkewY(cast this, value); return value; }

	public var node2dVisible(get, set):Bool;
	inline function get_node2dVisible():Bool return FlightNode_Ffi.get_node2dVisible(cast this);
	inline function set_node2dVisible(value:Bool):Bool { FlightNode_Ffi.set_node2dVisible(cast this, value); return value; }

	public var node2dX(get, set):Float;
	inline function get_node2dX():Float return FlightNode_Ffi.get_node2dX(cast this);
	inline function set_node2dX(value:Float):Float { FlightNode_Ffi.set_node2dX(cast this, value); return value; }

	public var node2dY(get, set):Float;
	inline function get_node2dY():Float return FlightNode_Ffi.get_node2dY(cast this);
	inline function set_node2dY(value:Float):Float { FlightNode_Ffi.set_node2dY(cast this, value); return value; }

	public var node3dAlpha(get, set):Single;
	inline function get_node3dAlpha():Single return FlightNode_Ffi.get_node3dAlpha(cast this);
	inline function set_node3dAlpha(value:Single):Single { FlightNode_Ffi.set_node3dAlpha(cast this, value); return value; }

	public var node3dVisible(get, set):Bool;
	inline function get_node3dVisible():Bool return FlightNode_Ffi.get_node3dVisible(cast this);
	inline function set_node3dVisible(value:Bool):Bool { FlightNode_Ffi.set_node3dVisible(cast this, value); return value; }

	public var node3dPositionX(get, set):Float;
	inline function get_node3dPositionX():Float return FlightNode_Ffi.get_node3dPositionX(cast this);
	inline function set_node3dPositionX(value:Float):Float { FlightNode_Ffi.set_node3dPositionX(cast this, value); return value; }

	public var node3dPositionY(get, set):Float;
	inline function get_node3dPositionY():Float return FlightNode_Ffi.get_node3dPositionY(cast this);
	inline function set_node3dPositionY(value:Float):Float { FlightNode_Ffi.set_node3dPositionY(cast this, value); return value; }

	public var node3dPositionZ(get, set):Float;
	inline function get_node3dPositionZ():Float return FlightNode_Ffi.get_node3dPositionZ(cast this);
	inline function set_node3dPositionZ(value:Float):Float { FlightNode_Ffi.set_node3dPositionZ(cast this, value); return value; }

	public var node3dRotationX(get, set):Float;
	inline function get_node3dRotationX():Float return FlightNode_Ffi.get_node3dRotationX(cast this);
	inline function set_node3dRotationX(value:Float):Float { FlightNode_Ffi.set_node3dRotationX(cast this, value); return value; }

	public var node3dRotationY(get, set):Float;
	inline function get_node3dRotationY():Float return FlightNode_Ffi.get_node3dRotationY(cast this);
	inline function set_node3dRotationY(value:Float):Float { FlightNode_Ffi.set_node3dRotationY(cast this, value); return value; }

	public var node3dRotationZ(get, set):Float;
	inline function get_node3dRotationZ():Float return FlightNode_Ffi.get_node3dRotationZ(cast this);
	inline function set_node3dRotationZ(value:Float):Float { FlightNode_Ffi.set_node3dRotationZ(cast this, value); return value; }

	public var node3dRotationW(get, set):Float;
	inline function get_node3dRotationW():Float return FlightNode_Ffi.get_node3dRotationW(cast this);
	inline function set_node3dRotationW(value:Float):Float { FlightNode_Ffi.set_node3dRotationW(cast this, value); return value; }

	public var node3dScaleX(get, set):Float;
	inline function get_node3dScaleX():Float return FlightNode_Ffi.get_node3dScaleX(cast this);
	inline function set_node3dScaleX(value:Float):Float { FlightNode_Ffi.set_node3dScaleX(cast this, value); return value; }

	public var node3dScaleY(get, set):Float;
	inline function get_node3dScaleY():Float return FlightNode_Ffi.get_node3dScaleY(cast this);
	inline function set_node3dScaleY(value:Float):Float { FlightNode_Ffi.set_node3dScaleY(cast this, value); return value; }

	public var node3dScaleZ(get, set):Float;
	inline function get_node3dScaleZ():Float return FlightNode_Ffi.get_node3dScaleZ(cast this);
	inline function set_node3dScaleZ(value:Float):Float { FlightNode_Ffi.set_node3dScaleZ(cast this, value); return value; }

	public var kind(get, set):Null<String>;
	inline function get_kind():Null<String> { var raw = FlightNode_Ffi.get_kind(cast this); if (raw == null) return null; var value = @:privateAccess String.fromUTF8(raw); FlightNode_Ffi.freeString(raw); return value; }
	inline function set_kind(value:Null<String>):Null<String> { var raw:hl.Bytes = null; if (value != null) { var encoded = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(encoded.length + 1); raw.blit(0, encoded.getData(), 0, encoded.length); raw.setUI8(encoded.length, 0); } FlightNode_Ffi.set_kind(cast this, raw); return value; }

	public var name(get, set):Null<String>;
	inline function get_name():Null<String> { var raw = FlightNode_Ffi.get_name(cast this); if (raw == null) return null; var value = @:privateAccess String.fromUTF8(raw); FlightNode_Ffi.freeString(raw); return value; }
	inline function set_name(value:Null<String>):Null<String> { var raw:hl.Bytes = null; if (value != null) { var encoded = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(encoded.length + 1); raw.blit(0, encoded.getData(), 0, encoded.length); raw.setUI8(encoded.length, 0); } FlightNode_Ffi.set_name(cast this, raw); return value; }

	public var node2dBlendMode(get, never):Int;
	inline function get_node2dBlendMode():Int return FlightNode_Ffi.get_node2dBlendMode(cast this);
	public inline function setNode2dBlendMode(value:Int, present:Bool):Bool return FlightNode_Ffi.set_node2dBlendMode(cast this, value, present);

	public var node2dClip(get, never):hl.Bytes;
	inline function get_node2dClip():hl.Bytes return FlightNode_Ffi.get_node2dClip(cast this);

	public var node2dMaterial(get, set):hl.Bytes;
	inline function get_node2dMaterial():hl.Bytes return FlightNode_Ffi.get_node2dMaterial(cast this);
	inline function set_node2dMaterial(value:hl.Bytes):hl.Bytes { FlightNode_Ffi.set_node2dMaterial(cast this, value); return value; }

	public var node2dMaterialData(get, set):hl.Bytes;
	inline function get_node2dMaterialData():hl.Bytes return FlightNode_Ffi.get_node2dMaterialData(cast this);
	inline function set_node2dMaterialData(value:hl.Bytes):hl.Bytes { FlightNode_Ffi.set_node2dMaterialData(cast this, value); return value; }

	public inline function setEnabledField(value:Bool):Bool return FlightNode_Ffi.set_enabled(cast this, value);
	public inline function setNode3dAlphaField(value:Single):Bool return FlightNode_Ffi.set_node3dAlpha(cast this, value);
	public inline function setEnabled(value:Bool):Bool return FlightNode_Ffi.set_enabled_invalidating(cast this, value);
	public inline function setNode3dAlpha(value:Single):Bool return FlightNode_Ffi.set_node3dAlpha_invalidating(cast this, value);
	public inline function setNode2dClip(value:hl.Bytes):Bool return FlightNode_Ffi.set_node2dClip_invalidating(cast this, value);
}
