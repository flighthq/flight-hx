package flight._js;

@:jsRequire("flight")
private extern class Vector3_Ffi {
	@:native("flight_get_vector3_x") static function get_x(ptr:Dynamic):Float;
	@:native("flight_set_vector3_x") static function set_x(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_vector3_y") static function get_y(ptr:Dynamic):Float;
	@:native("flight_set_vector3_y") static function set_y(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_vector3_z") static function get_z(ptr:Dynamic):Float;
	@:native("flight_set_vector3_z") static function set_z(ptr:Dynamic, value:Float):Float;
}

abstract Vector3(Dynamic) {
	public var x(get, set):Float;

	inline function get_x():Float return Vector3_Ffi.get_x(this);

	inline function set_x(value:Float):Float return Vector3_Ffi.set_x(this, value);
	public var y(get, set):Float;

	inline function get_y():Float return Vector3_Ffi.get_y(this);

	inline function set_y(value:Float):Float return Vector3_Ffi.set_y(this, value);
	public var z(get, set):Float;

	inline function get_z():Float return Vector3_Ffi.get_z(this);

	inline function set_z(value:Float):Float return Vector3_Ffi.set_z(this, value);

	inline public function copyMatrixColumnTo(column:Int, source:flight._js.Matrix):Void {
		flight._js._fn.Geometry.copyMatrixColumnToVector3(cast this, column, source);
	}
	inline public function copyMatrixRowTo(row:Int, source:flight._js.Matrix):Void {
		flight._js._fn.Geometry.copyMatrixRowToVector3(cast this, row, source);
	}
	inline public function copyMatrix3ColumnTo(column:Int, source:flight._js.Matrix3):Void {
		flight._js._fn.Geometry.copyMatrix3ColumnToVector3(cast this, column, source);
	}
	inline public function copyMatrix3RowTo(row:Int, source:flight._js.Matrix3):Void {
		flight._js._fn.Geometry.copyMatrix3RowToVector3(cast this, row, source);
	}
	inline public function projectOntoPlane(point:flight._js.Vector3, plane:flight._js.Plane):Void {
		flight._js._fn.Geometry.projectVector3OntoPlane(cast this, point, plane);
	}
	inline public function rotateByQuaternion(vector:flight._js.Vector3, q:flight._js.Quaternion):Void {
		flight._js._fn.Geometry.rotateVector3ByQuaternion(cast this, vector, q);
	}
	static inline public function create(x:Float, y:Float, z:Float):flight._js.Vector3 {
		return flight._js._fn.Geometry.createVector3(x, y, z);
	}
	static inline public function createFromSpherical(radius:Float, theta:Float, phi:Float):flight._js.Vector3 {
		return flight._js._fn.Geometry.createVector3FromSpherical(radius, theta, phi);
	}
	inline public function add(a:flight._js.Vector3, b:flight._js.Vector3):Void {
		flight._js._fn.Geometry.addVector3(cast this, a, b);
	}
	inline public function clamp(value:flight._js.Vector3, min:flight._js.Vector3, max:flight._js.Vector3):Void {
		flight._js._fn.Geometry.clampVector3(cast this, value, min, max);
	}
	inline public function clone():flight._js.Vector3 {
		return flight._js._fn.Geometry.cloneVector3(cast this);
	}
	inline public function copy(source:flight._js.Vector3):Void {
		flight._js._fn.Geometry.copyVector3(cast this, source);
	}
	inline public function cross(source:flight._js.Vector3, other:flight._js.Vector3):Void {
		flight._js._fn.Geometry.crossVector3(cast this, source, other);
	}
	inline public function divide(source:flight._js.Vector3, divisor:flight._js.Vector3):Void {
		flight._js._fn.Geometry.divideVector3(cast this, source, divisor);
	}
	inline public function equals(b:flight._js.Vector3):Bool {
		return flight._js._fn.Geometry.equalsVector3(cast this, b);
	}
	inline public function getAngleBetween(b:flight._js.Vector3):Float {
		return flight._js._fn.Geometry.getVector3AngleBetween(cast this, b);
	}
	inline public function getDistance(b:flight._js.Vector3):Float {
		return flight._js._fn.Geometry.getVector3Distance(cast this, b);
	}
	inline public function getDistanceSquared(b:flight._js.Vector3):Float {
		return flight._js._fn.Geometry.getVector3DistanceSquared(cast this, b);
	}
	inline public function getDot(b:flight._js.Vector3):Float {
		return flight._js._fn.Geometry.getVector3Dot(cast this, b);
	}
	inline public function getLength():Float {
		return flight._js._fn.Geometry.getVector3Length(cast this);
	}
	inline public function getLengthSquared():Float {
		return flight._js._fn.Geometry.getVector3LengthSquared(cast this);
	}
	inline public function getSpherical(source:flight._js.Vector3):Void {
		flight._js._fn.Geometry.getVector3Spherical(cast this, source);
	}
	inline public function interpolate(a:flight._js.Vector3, b:flight._js.Vector3, t:Float):Void {
		flight._js._fn.Geometry.interpolateVector3(cast this, a, b, t);
	}
	inline public function max(a:flight._js.Vector3, b:flight._js.Vector3):Void {
		flight._js._fn.Geometry.maxVector3(cast this, a, b);
	}
	inline public function min(a:flight._js.Vector3, b:flight._js.Vector3):Void {
		flight._js._fn.Geometry.minVector3(cast this, a, b);
	}
	inline public function multiply(a:flight._js.Vector3, b:flight._js.Vector3):Void {
		flight._js._fn.Geometry.multiplyVector3(cast this, a, b);
	}
	inline public function nearEquals(b:flight._js.Vector3, tolerance:Float):Bool {
		return flight._js._fn.Geometry.nearEqualsVector3(cast this, b, tolerance);
	}
	inline public function negate(source:flight._js.Vector3):Void {
		flight._js._fn.Geometry.negateVector3(cast this, source);
	}
	inline public function normalize(source:flight._js.Vector3):Float {
		return flight._js._fn.Geometry.normalizeVector3(cast this, source);
	}
	inline public function offset(source:flight._js.Vector3, dx:Float, dy:Float, dz:Float):Void {
		flight._js._fn.Geometry.offsetVector3(cast this, source, dx, dy, dz);
	}
	inline public function project(out:flight._js.Vector2):Void {
		flight._js._fn.Geometry.projectVector3(out, cast this);
	}
	inline public function reflect(incident:flight._js.Vector3, normal:flight._js.Vector3):Void {
		flight._js._fn.Geometry.reflectVector3(cast this, incident, normal);
	}
	inline public function scale(source:flight._js.Vector3, scalar:Float):Void {
		flight._js._fn.Geometry.scaleVector3(cast this, source, scalar);
	}
	inline public function set(x:Float, y:Float, z:Float):Void {
		flight._js._fn.Geometry.setVector3(cast this, x, y, z);
	}
	inline public function setFromFloat32Array(offset:Int, source:Dynamic, sourceLen:Int):Void {
		flight._js._fn.Geometry.setVector3FromFloat32Array(cast this, offset, source, sourceLen);
	}
	inline public function setFromSpherical(radius:Float, theta:Float, phi:Float):Void {
		flight._js._fn.Geometry.setVector3FromSpherical(cast this, radius, theta, phi);
	}
	inline public function setFromVector4(source:flight._js.Vector4):Void {
		flight._js._fn.Geometry.setVector3FromVector4(cast this, source);
	}
	inline public function subtract(source:flight._js.Vector3, other:flight._js.Vector3):Void {
		flight._js._fn.Geometry.subtractVector3(cast this, source, other);
	}
	inline public function transformByMatrix3(source:flight._js.Vector3, matrix:flight._js.Matrix3):Void {
		flight._js._fn.Geometry.transformVector3ByMatrix3(cast this, source, matrix);
	}
	inline public function writeToFloat32Array(out:Dynamic, outLen:Int, offset:Int):Void {
		flight._js._fn.Geometry.writeVector3ToFloat32Array(out, outLen, offset, cast this);
	}
	inline public function release():Void {
		flight._js._fn.Geometry.releaseVector3(cast this);
	}
	inline public function free():Void {
		flight._js._fn.Geometry.freeVector3(cast this);
	}
}
