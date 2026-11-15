package flight._hl;

abstract Vector3(hl.Bytes) {
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(16);

	inline function set_x(value:Single):Single { this.setF32(16, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(20);

	inline function set_y(value:Single):Single { this.setF32(20, value); return value; }
	public var z(get, set):Single;

	inline function get_z():Single return this.getF32(24);

	inline function set_z(value:Single):Single { this.setF32(24, value); return value; }

	inline public function copyMatrixColumnTo(column:Int, source:flight._hl.Matrix):Void {
		flight._hl._fn.Geometry.copyMatrixColumnToVector3(cast this, column, source);
	}
	inline public function copyMatrixRowTo(row:Int, source:flight._hl.Matrix):Void {
		flight._hl._fn.Geometry.copyMatrixRowToVector3(cast this, row, source);
	}
	inline public function copyMatrix3ColumnTo(column:Int, source:flight._hl.Matrix3):Void {
		flight._hl._fn.Geometry.copyMatrix3ColumnToVector3(cast this, column, source);
	}
	inline public function copyMatrix3RowTo(row:Int, source:flight._hl.Matrix3):Void {
		flight._hl._fn.Geometry.copyMatrix3RowToVector3(cast this, row, source);
	}
	inline public function projectOntoPlane(point:flight._hl.Vector3, plane:flight._hl.Plane):Void {
		flight._hl._fn.Geometry.projectVector3OntoPlane(cast this, point, plane);
	}
	inline public function rotateByQuaternion(vector:flight._hl.Vector3, q:flight._hl.Quaternion):Void {
		flight._hl._fn.Geometry.rotateVector3ByQuaternion(cast this, vector, q);
	}
	static inline public function create(x:Single, y:Single, z:Single):flight._hl.Vector3 {
		return flight._hl._fn.Geometry.createVector3(x, y, z);
	}
	static inline public function createFromSpherical(radius:Single, theta:Single, phi:Single):flight._hl.Vector3 {
		return flight._hl._fn.Geometry.createVector3FromSpherical(radius, theta, phi);
	}
	inline public function add(a:flight._hl.Vector3, b:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.addVector3(cast this, a, b);
	}
	inline public function clamp(value:flight._hl.Vector3, min:flight._hl.Vector3, max:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.clampVector3(cast this, value, min, max);
	}
	inline public function clone():flight._hl.Vector3 {
		return flight._hl._fn.Geometry.cloneVector3(cast this);
	}
	inline public function copy(source:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.copyVector3(cast this, source);
	}
	inline public function cross(source:flight._hl.Vector3, other:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.crossVector3(cast this, source, other);
	}
	inline public function divide(source:flight._hl.Vector3, divisor:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.divideVector3(cast this, source, divisor);
	}
	inline public function equals(b:flight._hl.Vector3):Bool {
		return flight._hl._fn.Geometry.equalsVector3(cast this, b);
	}
	inline public function getAngleBetween(b:flight._hl.Vector3):Single {
		return flight._hl._fn.Geometry.getVector3AngleBetween(cast this, b);
	}
	inline public function getDistance(b:flight._hl.Vector3):Single {
		return flight._hl._fn.Geometry.getVector3Distance(cast this, b);
	}
	inline public function getDistanceSquared(b:flight._hl.Vector3):Single {
		return flight._hl._fn.Geometry.getVector3DistanceSquared(cast this, b);
	}
	inline public function getDot(b:flight._hl.Vector3):Single {
		return flight._hl._fn.Geometry.getVector3Dot(cast this, b);
	}
	inline public function getLength():Single {
		return flight._hl._fn.Geometry.getVector3Length(cast this);
	}
	inline public function getLengthSquared():Single {
		return flight._hl._fn.Geometry.getVector3LengthSquared(cast this);
	}
	inline public function getSpherical(source:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.getVector3Spherical(cast this, source);
	}
	inline public function interpolate(a:flight._hl.Vector3, b:flight._hl.Vector3, t:Single):Void {
		flight._hl._fn.Geometry.interpolateVector3(cast this, a, b, t);
	}
	inline public function max(a:flight._hl.Vector3, b:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.maxVector3(cast this, a, b);
	}
	inline public function min(a:flight._hl.Vector3, b:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.minVector3(cast this, a, b);
	}
	inline public function multiply(a:flight._hl.Vector3, b:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.multiplyVector3(cast this, a, b);
	}
	inline public function nearEquals(b:flight._hl.Vector3, tolerance:Single):Bool {
		return flight._hl._fn.Geometry.nearEqualsVector3(cast this, b, tolerance);
	}
	inline public function negate(source:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.negateVector3(cast this, source);
	}
	inline public function normalize(source:flight._hl.Vector3):Single {
		return flight._hl._fn.Geometry.normalizeVector3(cast this, source);
	}
	inline public function offset(source:flight._hl.Vector3, dx:Single, dy:Single, dz:Single):Void {
		flight._hl._fn.Geometry.offsetVector3(cast this, source, dx, dy, dz);
	}
	inline public function project(out:flight._hl.Vector2):Void {
		flight._hl._fn.Geometry.projectVector3(out, cast this);
	}
	inline public function reflect(incident:flight._hl.Vector3, normal:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.reflectVector3(cast this, incident, normal);
	}
	inline public function scale(source:flight._hl.Vector3, scalar:Single):Void {
		flight._hl._fn.Geometry.scaleVector3(cast this, source, scalar);
	}
	inline public function set(x:Single, y:Single, z:Single):Void {
		flight._hl._fn.Geometry.setVector3(cast this, x, y, z);
	}
	inline public function setFromFloat32Array(offset:Int, source:hl.Bytes, sourceLen:Int):Void {
		flight._hl._fn.Geometry.setVector3FromFloat32Array(cast this, offset, source, sourceLen);
	}
	inline public function setFromSpherical(radius:Single, theta:Single, phi:Single):Void {
		flight._hl._fn.Geometry.setVector3FromSpherical(cast this, radius, theta, phi);
	}
	inline public function setFromVector4(source:flight._hl.Vector4):Void {
		flight._hl._fn.Geometry.setVector3FromVector4(cast this, source);
	}
	inline public function subtract(source:flight._hl.Vector3, other:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.subtractVector3(cast this, source, other);
	}
	inline public function transformByMatrix3(source:flight._hl.Vector3, matrix:flight._hl.Matrix3):Void {
		flight._hl._fn.Geometry.transformVector3ByMatrix3(cast this, source, matrix);
	}
	inline public function writeToFloat32Array(out:hl.Bytes, outLen:Int, offset:Int):Void {
		flight._hl._fn.Geometry.writeVector3ToFloat32Array(out, outLen, offset, cast this);
	}
	inline public function release():Void {
		flight._hl._fn.Geometry.releaseVector3(cast this);
	}
	inline public function free():Void {
		flight._hl._fn.Geometry.freeVector3(cast this);
	}
}
