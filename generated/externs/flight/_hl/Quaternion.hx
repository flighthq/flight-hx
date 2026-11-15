package flight._hl;

abstract Quaternion(hl.Bytes) {
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(16);

	inline function set_x(value:Single):Single { this.setF32(16, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(20);

	inline function set_y(value:Single):Single { this.setF32(20, value); return value; }
	public var z(get, set):Single;

	inline function get_z():Single return this.getF32(24);

	inline function set_z(value:Single):Single { this.setF32(24, value); return value; }
	public var w(get, set):Single;

	inline function get_w():Single return this.getF32(28);

	inline function set_w(value:Single):Single { this.setF32(28, value); return value; }

	static inline public function create(x:Single, y:Single, z:Single, w:Single):flight._hl.Quaternion {
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
	inline public function getAngleBetween(b:flight._hl.Quaternion):Single {
		return flight._hl._fn.Geometry.getQuaternionAngleBetween(cast this, b);
	}
	inline public function getAxisAngle(outAxis:flight._hl.Vector3):Single {
		return flight._hl._fn.Geometry.getQuaternionAxisAngle(outAxis, cast this);
	}
	inline public function getDot(b:flight._hl.Quaternion):Single {
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
	inline public function normalize(source:flight._hl.Quaternion):Single {
		return flight._hl._fn.Geometry.normalizeQuaternion(cast this, source);
	}
	inline public function set(x:Single, y:Single, z:Single, w:Single):Void {
		flight._hl._fn.Geometry.setQuaternion(cast this, x, y, z, w);
	}
	inline public function setFromAxisAngle(axis:flight._hl.Vector3, angle:Single):Void {
		flight._hl._fn.Geometry.setQuaternionFromAxisAngle(cast this, axis, angle);
	}
	inline public function setFromEuler(x:Single, y:Single, z:Single, order:Int):Void {
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
	inline public function slerp(a:flight._hl.Quaternion, b:flight._hl.Quaternion, t:Single):Void {
		flight._hl._fn.Geometry.slerpQuaternion(cast this, a, b, t);
	}
	inline public function release():Void {
		flight._hl._fn.Geometry.releaseQuaternion(cast this);
	}
	inline public function free():Void {
		flight._hl._fn.Geometry.freeQuaternion(cast this);
	}
}
