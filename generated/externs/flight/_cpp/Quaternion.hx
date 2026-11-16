package flight._cpp;

private extern class Quaternion_Ffi {
	@:native("flight_get_quaternion_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_quaternion_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_quaternion_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_quaternion_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_quaternion_z") static function get_z(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_quaternion_z") static function set_z(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_quaternion_w") static function get_w(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_quaternion_w") static function set_w(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Quaternion(cpp.Star<cpp.Void>) {
	public var x(get, set):Single;

	inline function get_x():Single return Quaternion_Ffi.get_x(this);

	inline function set_x(value:Single):Single { Quaternion_Ffi.set_x(this, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return Quaternion_Ffi.get_y(this);

	inline function set_y(value:Single):Single { Quaternion_Ffi.set_y(this, value); return value; }
	public var z(get, set):Single;

	inline function get_z():Single return Quaternion_Ffi.get_z(this);

	inline function set_z(value:Single):Single { Quaternion_Ffi.set_z(this, value); return value; }
	public var w(get, set):Single;

	inline function get_w():Single return Quaternion_Ffi.get_w(this);

	inline function set_w(value:Single):Single { Quaternion_Ffi.set_w(this, value); return value; }

	static extern inline public function create(x:Single, y:Single, z:Single, w:Single):flight._cpp.Quaternion {
		return flight._cpp._fn.Geometry.createQuaternion(x, y, z, w);
	}
	extern inline public function clone():flight._cpp.Quaternion {
		return flight._cpp._fn.Geometry.cloneQuaternion(cast this);
	}
	extern inline public function conjugate(source:flight._cpp.Quaternion):Void {
		flight._cpp._fn.Geometry.conjugateQuaternion(cast this, source);
	}
	extern inline public function copy(source:flight._cpp.Quaternion):Void {
		flight._cpp._fn.Geometry.copyQuaternion(cast this, source);
	}
	extern inline public function equals(b:flight._cpp.Quaternion):Bool {
		return flight._cpp._fn.Geometry.equalsQuaternion(cast this, b);
	}
	extern inline public function getAngleBetween(b:flight._cpp.Quaternion):Single {
		return flight._cpp._fn.Geometry.getQuaternionAngleBetween(cast this, b);
	}
	extern inline public function getAxisAngle(outAxis:flight._cpp.Vector3):Single {
		return flight._cpp._fn.Geometry.getQuaternionAxisAngle(outAxis, cast this);
	}
	extern inline public function getDot(b:flight._cpp.Quaternion):Single {
		return flight._cpp._fn.Geometry.getQuaternionDot(cast this, b);
	}
	extern inline public function getEuler(out:flight._cpp.Vector3, order:Int):Void {
		flight._cpp._fn.Geometry.getQuaternionEuler(out, cast this, order);
	}
	extern inline public function inverse(source:flight._cpp.Quaternion):Void {
		flight._cpp._fn.Geometry.inverseQuaternion(cast this, source);
	}
	extern inline public function multiply(a:flight._cpp.Quaternion, b:flight._cpp.Quaternion):Void {
		flight._cpp._fn.Geometry.multiplyQuaternion(cast this, a, b);
	}
	extern inline public function normalize(source:flight._cpp.Quaternion):Single {
		return flight._cpp._fn.Geometry.normalizeQuaternion(cast this, source);
	}
	extern inline public function set(x:Single, y:Single, z:Single, w:Single):Void {
		flight._cpp._fn.Geometry.setQuaternion(cast this, x, y, z, w);
	}
	extern inline public function setFromAxisAngle(axis:flight._cpp.Vector3, angle:Single):Void {
		flight._cpp._fn.Geometry.setQuaternionFromAxisAngle(cast this, axis, angle);
	}
	extern inline public function setFromEuler(x:Single, y:Single, z:Single, order:Int):Void {
		flight._cpp._fn.Geometry.setQuaternionFromEuler(cast this, x, y, z, order);
	}
	extern inline public function setFromMatrix4(source:flight._cpp.Matrix4):Void {
		flight._cpp._fn.Geometry.setQuaternionFromMatrix4(cast this, source);
	}
	extern inline public function setFromUnitVectors(from:flight._cpp.Vector3, to:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.setQuaternionFromUnitVectors(cast this, from, to);
	}
	extern inline public function setIdentity():Void {
		flight._cpp._fn.Geometry.setQuaternionIdentity(cast this);
	}
	extern inline public function setLookRotation(forward:flight._cpp.Vector3, up:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.setQuaternionLookRotation(cast this, forward, up);
	}
	extern inline public function slerp(a:flight._cpp.Quaternion, b:flight._cpp.Quaternion, t:Single):Void {
		flight._cpp._fn.Geometry.slerpQuaternion(cast this, a, b, t);
	}
	extern inline public function release():Void {
		flight._cpp._fn.Geometry.releaseQuaternion(cast this);
	}
	extern inline public function free():Void {
		flight._cpp._fn.Geometry.freeQuaternion(cast this);
	}
}
