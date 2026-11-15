package flight._hl;

abstract Vector4(hl.Bytes) {
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

	inline public function copyMatrix4ColumnTo(column:Int, source:flight._hl.Matrix4):Void {
		flight._hl._fn.Geometry.copyMatrix4ColumnToVector4(cast this, column, source);
	}
	inline public function copyMatrix4RowTo(row:Int, source:flight._hl.Matrix4):Void {
		flight._hl._fn.Geometry.copyMatrix4RowToVector4(cast this, row, source);
	}
	static inline public function create(x:Single, y:Single, z:Single, w:Single):flight._hl.Vector4 {
		return flight._hl._fn.Geometry.createVector4(x, y, z, w);
	}
	inline public function add(a:flight._hl.Vector4, b:flight._hl.Vector4):Void {
		flight._hl._fn.Geometry.addVector4(cast this, a, b);
	}
	inline public function clamp(value:flight._hl.Vector4, min:flight._hl.Vector4, max:flight._hl.Vector4):Void {
		flight._hl._fn.Geometry.clampVector4(cast this, value, min, max);
	}
	inline public function clone():flight._hl.Vector4 {
		return flight._hl._fn.Geometry.cloneVector4(cast this);
	}
	inline public function copy(source:flight._hl.Vector4):Void {
		flight._hl._fn.Geometry.copyVector4(cast this, source);
	}
	inline public function divide(source:flight._hl.Vector4, divisor:flight._hl.Vector4):Void {
		flight._hl._fn.Geometry.divideVector4(cast this, source, divisor);
	}
	inline public function equals(b:flight._hl.Vector4):Bool {
		return flight._hl._fn.Geometry.equalsVector4(cast this, b);
	}
	inline public function getAngleBetween(b:flight._hl.Vector4):Single {
		return flight._hl._fn.Geometry.getVector4AngleBetween(cast this, b);
	}
	inline public function getDistance(b:flight._hl.Vector4):Single {
		return flight._hl._fn.Geometry.getVector4Distance(cast this, b);
	}
	inline public function getDistanceSquared(b:flight._hl.Vector4):Single {
		return flight._hl._fn.Geometry.getVector4DistanceSquared(cast this, b);
	}
	inline public function getDot(b:flight._hl.Vector4):Single {
		return flight._hl._fn.Geometry.getVector4Dot(cast this, b);
	}
	inline public function getLength():Single {
		return flight._hl._fn.Geometry.getVector4Length(cast this);
	}
	inline public function getLengthSquared():Single {
		return flight._hl._fn.Geometry.getVector4LengthSquared(cast this);
	}
	inline public function interpolate(a:flight._hl.Vector4, b:flight._hl.Vector4, t:Single):Void {
		flight._hl._fn.Geometry.interpolateVector4(cast this, a, b, t);
	}
	inline public function max(a:flight._hl.Vector4, b:flight._hl.Vector4):Void {
		flight._hl._fn.Geometry.maxVector4(cast this, a, b);
	}
	inline public function min(a:flight._hl.Vector4, b:flight._hl.Vector4):Void {
		flight._hl._fn.Geometry.minVector4(cast this, a, b);
	}
	inline public function multiply(a:flight._hl.Vector4, b:flight._hl.Vector4):Void {
		flight._hl._fn.Geometry.multiplyVector4(cast this, a, b);
	}
	inline public function nearEquals(b:flight._hl.Vector4, tolerance:Single):Bool {
		return flight._hl._fn.Geometry.nearEqualsVector4(cast this, b, tolerance);
	}
	inline public function negate(source:flight._hl.Vector4):Void {
		flight._hl._fn.Geometry.negateVector4(cast this, source);
	}
	inline public function normalize(source:flight._hl.Vector4):Single {
		return flight._hl._fn.Geometry.normalizeVector4(cast this, source);
	}
	inline public function offset(source:flight._hl.Vector4, dx:Single, dy:Single, dz:Single, dw:Single):Void {
		flight._hl._fn.Geometry.offsetVector4(cast this, source, dx, dy, dz, dw);
	}
	inline public function project(out:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.projectVector4(out, cast this);
	}
	inline public function reflect(incident:flight._hl.Vector4, normal:flight._hl.Vector4):Void {
		flight._hl._fn.Geometry.reflectVector4(cast this, incident, normal);
	}
	inline public function scale(source:flight._hl.Vector4, scalar:Single):Void {
		flight._hl._fn.Geometry.scaleVector4(cast this, source, scalar);
	}
	inline public function set(x:Single, y:Single, z:Single, w:Single):Void {
		flight._hl._fn.Geometry.setVector4(cast this, x, y, z, w);
	}
	inline public function setFromFloat32Array(offset:Int, source:hl.Bytes, sourceLen:Int):Void {
		flight._hl._fn.Geometry.setVector4FromFloat32Array(cast this, offset, source, sourceLen);
	}
	inline public function setFromVector3(source:flight._hl.Vector3, w:Single):Void {
		flight._hl._fn.Geometry.setVector4FromVector3(cast this, source, w);
	}
	inline public function subtract(source:flight._hl.Vector4, other:flight._hl.Vector4):Void {
		flight._hl._fn.Geometry.subtractVector4(cast this, source, other);
	}
	inline public function writeToFloat32Array(out:hl.Bytes, outLen:Int, offset:Int):Void {
		flight._hl._fn.Geometry.writeVector4ToFloat32Array(out, outLen, offset, cast this);
	}
	inline public function release():Void {
		flight._hl._fn.Geometry.releaseVector4(cast this);
	}
	inline public function free():Void {
		flight._hl._fn.Geometry.freeVector4(cast this);
	}
}
