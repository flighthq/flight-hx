package flight._js;

abstract Quaternion(Dynamic) {
	public var x(get, set):Float;
	inline function get_x():Float return untyped this["x"];
	inline function set_x(value:Float):Float return untyped this["x"] = value;
	public var y(get, set):Float;
	inline function get_y():Float return untyped this["y"];
	inline function set_y(value:Float):Float return untyped this["y"] = value;
	public var z(get, set):Float;
	inline function get_z():Float return untyped this["z"];
	inline function set_z(value:Float):Float return untyped this["z"] = value;
	public var w(get, set):Float;
	inline function get_w():Float return untyped this["w"];
	inline function set_w(value:Float):Float return untyped this["w"] = value;
	static inline public function create(x:Float, y:Float, z:Float, w:Float):flight._js.Quaternion {
		return flight._js._fn.Geometry.createQuaternion(x, y, z, w);
	}
	inline public function clone():flight._js.Quaternion {
		return flight._js._fn.Geometry.cloneQuaternion(cast this);
	}
	inline public function conjugate(source:flight._js.Quaternion):Void {
		flight._js._fn.Geometry.conjugateQuaternion(cast this, source);
	}
	inline public function copy(source:flight._js.Quaternion):Void {
		flight._js._fn.Geometry.copyQuaternion(cast this, source);
	}
	inline public function equals(b:Null<flight._js.Quaternion>):Bool {
		return flight._js._fn.Geometry.equalsQuaternion(cast this, b);
	}
	inline public function getAngleBetween(b:flight._js.Quaternion):Float {
		return flight._js._fn.Geometry.getQuaternionAngleBetween(cast this, b);
	}
	inline public function getAxisAngle(outAxis:flight._js.Vector3):Float {
		return flight._js._fn.Geometry.getQuaternionAxisAngle(outAxis, cast this);
	}
	inline public function getDot(b:flight._js.Quaternion):Float {
		return flight._js._fn.Geometry.getQuaternionDot(cast this, b);
	}
	inline public function getEuler(out:flight._js.Vector3, order:Dynamic):Void {
		flight._js._fn.Geometry.getQuaternionEuler(out, cast this, order);
	}
	inline public function inverse(source:flight._js.Quaternion):Void {
		flight._js._fn.Geometry.inverseQuaternion(cast this, source);
	}
	inline public function multiply(a:flight._js.Quaternion, b:flight._js.Quaternion):Void {
		flight._js._fn.Geometry.multiplyQuaternion(cast this, a, b);
	}
	inline public function normalize(source:flight._js.Quaternion):Float {
		return flight._js._fn.Geometry.normalizeQuaternion(cast this, source);
	}
	inline public function set(x:Float, y:Float, z:Float, w:Float):Void {
		flight._js._fn.Geometry.setQuaternion(cast this, x, y, z, w);
	}
	inline public function setFromAxisAngle(axis:flight._js.Vector3, angle:Float):Void {
		flight._js._fn.Geometry.setQuaternionFromAxisAngle(cast this, axis, angle);
	}
	inline public function setFromEuler(x:Float, y:Float, z:Float, order:Dynamic):Void {
		flight._js._fn.Geometry.setQuaternionFromEuler(cast this, x, y, z, order);
	}
	inline public function setFromMatrix4(source:flight._js.Matrix4):Void {
		flight._js._fn.Geometry.setQuaternionFromMatrix4(cast this, source);
	}
	inline public function setFromUnitVectors(from:flight._js.Vector3, to:flight._js.Vector3):Void {
		flight._js._fn.Geometry.setQuaternionFromUnitVectors(cast this, from, to);
	}
	inline public function setIdentity():Void {
		flight._js._fn.Geometry.setQuaternionIdentity(cast this);
	}
	inline public function setLookRotation(forward:flight._js.Vector3, up:flight._js.Vector3):Void {
		flight._js._fn.Geometry.setQuaternionLookRotation(cast this, forward, up);
	}
	inline public function slerp(a:flight._js.Quaternion, b:flight._js.Quaternion, t:Float):Void {
		flight._js._fn.Geometry.slerpQuaternion(cast this, a, b, t);
	}
	inline public function release():Void {
		flight._js._fn.Geometry.releaseQuaternion(cast this);
	}
	inline public function free():Void {
		flight._js._fn.Geometry.freeQuaternion(cast this);
	}
}
