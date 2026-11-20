package flight._cpp;

private extern class Vector3_Ffi {
	@:native("flight_get_vector3_x") static function get_x(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_vector3_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_vector3_y") static function get_y(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_vector3_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_vector3_z") static function get_z(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_vector3_z") static function set_z(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Vector3(cpp.Star<cpp.Void>) {
	public var x(get, set):Float;

	inline function get_x():Float return Vector3_Ffi.get_x(this);

	inline function set_x(value:Float):Float { Vector3_Ffi.set_x(this, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return Vector3_Ffi.get_y(this);

	inline function set_y(value:Float):Float { Vector3_Ffi.set_y(this, value); return value; }
	public var z(get, set):Float;

	inline function get_z():Float return Vector3_Ffi.get_z(this);

	inline function set_z(value:Float):Float { Vector3_Ffi.set_z(this, value); return value; }

	extern inline public function copyMatrixColumnTo(column:Int, source:flight._cpp.Matrix):Void {
		flight._cpp._fn.Geometry.copyMatrixColumnToVector3(cast this, column, source);
	}
	extern inline public function copyMatrixRowTo(row:Int, source:flight._cpp.Matrix):Void {
		flight._cpp._fn.Geometry.copyMatrixRowToVector3(cast this, row, source);
	}
	extern inline public function copyMatrix3ColumnTo(column:Int, source:flight._cpp.Matrix3):Void {
		flight._cpp._fn.Geometry.copyMatrix3ColumnToVector3(cast this, column, source);
	}
	extern inline public function copyMatrix3RowTo(row:Int, source:flight._cpp.Matrix3):Void {
		flight._cpp._fn.Geometry.copyMatrix3RowToVector3(cast this, row, source);
	}
	extern inline public function projectOntoPlane(point:flight._cpp.Vector3, plane:flight._cpp.Plane):Void {
		flight._cpp._fn.Geometry.projectVector3OntoPlane(cast this, point, plane);
	}
	extern inline public function rotateByQuaternion(vector:flight._cpp.Vector3, q:flight._cpp.Quaternion):Void {
		flight._cpp._fn.Geometry.rotateVector3ByQuaternion(cast this, vector, q);
	}
	static extern inline public function create(x:Float, y:Float, z:Float):flight._cpp.Vector3 {
		return flight._cpp._fn.Geometry.createVector3(x, y, z);
	}
	static extern inline public function createFromSpherical(radius:Float, theta:Float, phi:Float):flight._cpp.Vector3 {
		return flight._cpp._fn.Geometry.createVector3FromSpherical(radius, theta, phi);
	}
	extern inline public function add(a:flight._cpp.Vector3, b:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.addVector3(cast this, a, b);
	}
	extern inline public function clamp(value:flight._cpp.Vector3, min:flight._cpp.Vector3, max:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.clampVector3(cast this, value, min, max);
	}
	extern inline public function clone():flight._cpp.Vector3 {
		return flight._cpp._fn.Geometry.cloneVector3(cast this);
	}
	extern inline public function copy(source:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.copyVector3(cast this, source);
	}
	extern inline public function cross(source:flight._cpp.Vector3, other:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.crossVector3(cast this, source, other);
	}
	extern inline public function divide(source:flight._cpp.Vector3, divisor:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.divideVector3(cast this, source, divisor);
	}
	extern inline public function equals(b:flight._cpp.Vector3):Bool {
		return flight._cpp._fn.Geometry.equalsVector3(cast this, b);
	}
	extern inline public function getAngleBetween(b:flight._cpp.Vector3):Float {
		return flight._cpp._fn.Geometry.getVector3AngleBetween(cast this, b);
	}
	extern inline public function getDistance(b:flight._cpp.Vector3):Float {
		return flight._cpp._fn.Geometry.getVector3Distance(cast this, b);
	}
	extern inline public function getDistanceSquared(b:flight._cpp.Vector3):Float {
		return flight._cpp._fn.Geometry.getVector3DistanceSquared(cast this, b);
	}
	extern inline public function getDot(b:flight._cpp.Vector3):Float {
		return flight._cpp._fn.Geometry.getVector3Dot(cast this, b);
	}
	extern inline public function getLength():Float {
		return flight._cpp._fn.Geometry.getVector3Length(cast this);
	}
	extern inline public function getLengthSquared():Float {
		return flight._cpp._fn.Geometry.getVector3LengthSquared(cast this);
	}
	extern inline public function getSpherical(source:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.getVector3Spherical(cast this, source);
	}
	extern inline public function interpolate(a:flight._cpp.Vector3, b:flight._cpp.Vector3, t:Float):Void {
		flight._cpp._fn.Geometry.interpolateVector3(cast this, a, b, t);
	}
	extern inline public function max(a:flight._cpp.Vector3, b:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.maxVector3(cast this, a, b);
	}
	extern inline public function min(a:flight._cpp.Vector3, b:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.minVector3(cast this, a, b);
	}
	extern inline public function multiply(a:flight._cpp.Vector3, b:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.multiplyVector3(cast this, a, b);
	}
	extern inline public function nearEquals(b:flight._cpp.Vector3, tolerance:Float):Bool {
		return flight._cpp._fn.Geometry.nearEqualsVector3(cast this, b, tolerance);
	}
	extern inline public function negate(source:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.negateVector3(cast this, source);
	}
	extern inline public function normalize(source:flight._cpp.Vector3):Float {
		return flight._cpp._fn.Geometry.normalizeVector3(cast this, source);
	}
	extern inline public function offset(source:flight._cpp.Vector3, dx:Float, dy:Float, dz:Float):Void {
		flight._cpp._fn.Geometry.offsetVector3(cast this, source, dx, dy, dz);
	}
	extern inline public function project(out:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.projectVector3(out, cast this);
	}
	extern inline public function reflect(incident:flight._cpp.Vector3, normal:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.reflectVector3(cast this, incident, normal);
	}
	extern inline public function scale(source:flight._cpp.Vector3, scalar:Float):Void {
		flight._cpp._fn.Geometry.scaleVector3(cast this, source, scalar);
	}
	extern inline public function set(x:Float, y:Float, z:Float):Void {
		flight._cpp._fn.Geometry.setVector3(cast this, x, y, z);
	}
	extern inline public function setFromFloat32Array(offset:Int, source:cpp.Star<cpp.Void>, sourceLen:Int):Void {
		flight._cpp._fn.Geometry.setVector3FromFloat32Array(cast this, offset, source, sourceLen);
	}
	extern inline public function setFromSpherical(radius:Float, theta:Float, phi:Float):Void {
		flight._cpp._fn.Geometry.setVector3FromSpherical(cast this, radius, theta, phi);
	}
	extern inline public function setFromVector4(source:flight._cpp.Vector4):Void {
		flight._cpp._fn.Geometry.setVector3FromVector4(cast this, source);
	}
	extern inline public function subtract(source:flight._cpp.Vector3, other:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.subtractVector3(cast this, source, other);
	}
	extern inline public function transformByMatrix3(source:flight._cpp.Vector3, matrix:flight._cpp.Matrix3):Void {
		flight._cpp._fn.Geometry.transformVector3ByMatrix3(cast this, source, matrix);
	}
	extern inline public function writeToFloat32Array(out:cpp.Star<cpp.Void>, outLen:Int, offset:Int):Void {
		flight._cpp._fn.Geometry.writeVector3ToFloat32Array(out, outLen, offset, cast this);
	}
	extern inline public function release():Void {
		flight._cpp._fn.Geometry.releaseVector3(cast this);
	}
	extern inline public function free():Void {
		flight._cpp._fn.Geometry.freeVector3(cast this);
	}
}
