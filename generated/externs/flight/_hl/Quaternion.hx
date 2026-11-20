package flight._hl;

abstract Quaternion(hl.Bytes) {
	public var x(get, set):Float;

	inline function get_x():Float return this.getF64(16);

	inline function set_x(value:Float):Float { this.setF64(16, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return this.getF64(24);

	inline function set_y(value:Float):Float { this.setF64(24, value); return value; }
	public var z(get, set):Float;

	inline function get_z():Float return this.getF64(32);

	inline function set_z(value:Float):Float { this.setF64(32, value); return value; }
	public var w(get, set):Float;

	inline function get_w():Float return this.getF64(40);

	inline function set_w(value:Float):Float { this.setF64(40, value); return value; }

	static inline public function create(x:Float, y:Float, z:Float, w:Float):flight._hl.Quaternion {
		return flight._hl._fn.Geometry.createQuaternion(x, y, z, w);
	}
	inline public function clone():flight._hl.Quaternion {
		return flight._hl._fn.Geometry.cloneQuaternion(cast this);
	}
	inline public function conjugate(source:flight._hl.Quaternion):Void {
		flight._hl._fn.Geometry.conjugateQuaternion(cast this, source);
	}
	inline public function copy(source:flight._hl.Quaternion):Void {
		flight._hl._fn.Geometry.copyQuaternion(cast this, source);
	}
	inline public function equals(b:flight._hl.Quaternion):Bool {
		return flight._hl._fn.Geometry.equalsQuaternion(cast this, b);
	}
	inline public function getAngleBetween(b:flight._hl.Quaternion):Float {
		return flight._hl._fn.Geometry.getQuaternionAngleBetween(cast this, b);
	}
	inline public function getAxisAngle(outAxis:flight._hl.Vector3):Float {
		return flight._hl._fn.Geometry.getQuaternionAxisAngle(outAxis, cast this);
	}
	inline public function getDot(b:flight._hl.Quaternion):Float {
		return flight._hl._fn.Geometry.getQuaternionDot(cast this, b);
	}
	inline public function getEuler(out:flight._hl.Vector3, order:Int):Void {
		flight._hl._fn.Geometry.getQuaternionEuler(out, cast this, order);
	}
	inline public function inverse(source:flight._hl.Quaternion):Void {
		flight._hl._fn.Geometry.inverseQuaternion(cast this, source);
	}
	inline public function multiply(a:flight._hl.Quaternion, b:flight._hl.Quaternion):Void {
		flight._hl._fn.Geometry.multiplyQuaternion(cast this, a, b);
	}
	inline public function normalize(source:flight._hl.Quaternion):Float {
		return flight._hl._fn.Geometry.normalizeQuaternion(cast this, source);
	}
	inline public function set(x:Float, y:Float, z:Float, w:Float):Void {
		flight._hl._fn.Geometry.setQuaternion(cast this, x, y, z, w);
	}
	inline public function setFromAxisAngle(axis:flight._hl.Vector3, angle:Float):Void {
		flight._hl._fn.Geometry.setQuaternionFromAxisAngle(cast this, axis, angle);
	}
	inline public function setFromEuler(x:Float, y:Float, z:Float, order:Int):Void {
		flight._hl._fn.Geometry.setQuaternionFromEuler(cast this, x, y, z, order);
	}
	inline public function setFromMatrix4(source:flight._hl.Matrix4):Void {
		flight._hl._fn.Geometry.setQuaternionFromMatrix4(cast this, source);
	}
	inline public function setFromUnitVectors(from:flight._hl.Vector3, to:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.setQuaternionFromUnitVectors(cast this, from, to);
	}
	inline public function setIdentity():Void {
		flight._hl._fn.Geometry.setQuaternionIdentity(cast this);
	}
	inline public function setLookRotation(forward:flight._hl.Vector3, up:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.setQuaternionLookRotation(cast this, forward, up);
	}
	inline public function slerp(a:flight._hl.Quaternion, b:flight._hl.Quaternion, t:Float):Void {
		flight._hl._fn.Geometry.slerpQuaternion(cast this, a, b, t);
	}
	inline public function release():Void {
		flight._hl._fn.Geometry.releaseQuaternion(cast this);
	}
	inline public function free():Void {
		flight._hl._fn.Geometry.freeQuaternion(cast this);
	}
}
