package flight._cpp;

abstract Matrix3(cpp.Star<cpp.Void>) {
	static inline public function create():flight._cpp.Matrix3 {
		return flight._cpp._fn.Geometry.createMatrix3();
	}
	static inline public function createFromValues(m00:Single, m01:Single, m02:Single, m10:Single, m11:Single, m12:Single, m20:Single, m21:Single, m22:Single):flight._cpp.Matrix3 {
		return flight._cpp._fn.Geometry.createMatrix3FromValues(m00, m01, m02, m10, m11, m12, m20, m21, m22);
	}
	inline public function clone():flight._cpp.Matrix3 {
		return flight._cpp._fn.Geometry.cloneMatrix3(cast this);
	}
	inline public function copy(source:flight._cpp.Matrix3):Void {
		flight._cpp._fn.Geometry.copyMatrix3(cast this, source);
	}
	inline public function copyColumnFromVector3(column:Int, source:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.copyMatrix3ColumnFromVector3(cast this, column, source);
	}
	inline public function copyRowFromVector3(row:Int, source:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.copyMatrix3RowFromVector3(cast this, row, source);
	}
	inline public function equals(b:flight._cpp.Matrix3):Bool {
		return flight._cpp._fn.Geometry.equalsMatrix3(cast this, b);
	}
	inline public function getDeterminant():Single {
		return flight._cpp._fn.Geometry.getMatrix3Determinant(cast this);
	}
	inline public function getElement(row:Int, column:Int):Single {
		return flight._cpp._fn.Geometry.getMatrix3Element(cast this, row, column);
	}
	inline public function inverse(source:flight._cpp.Matrix3):Bool {
		return flight._cpp._fn.Geometry.inverseMatrix3(cast this, source);
	}
	inline public function isAffine():Bool {
		return flight._cpp._fn.Geometry.isAffineMatrix3(cast this);
	}
	inline public function multiply(a:flight._cpp.Matrix3, b:flight._cpp.Matrix3):Void {
		flight._cpp._fn.Geometry.multiplyMatrix3(cast this, a, b);
	}
	inline public function rotate(source:flight._cpp.Matrix3, theta:Single):Void {
		flight._cpp._fn.Geometry.rotateMatrix3(cast this, source, theta);
	}
	inline public function scale(source:flight._cpp.Matrix3, sx:Single, sy:Single):Void {
		flight._cpp._fn.Geometry.scaleMatrix3(cast this, source, sx, sy);
	}
	inline public function set(m00:Single, m01:Single, m02:Single, m10:Single, m11:Single, m12:Single, m20:Single, m21:Single, m22:Single):Void {
		flight._cpp._fn.Geometry.setMatrix3(cast this, m00, m01, m02, m10, m11, m12, m20, m21, m22);
	}
	inline public function setElement(row:Int, column:Int, value:Single):Void {
		flight._cpp._fn.Geometry.setMatrix3Element(cast this, row, column, value);
	}
	inline public function setFromFloat32Array(offset:Int, source:cpp.Star<cpp.Void>, sourceLen:Int):Void {
		flight._cpp._fn.Geometry.setMatrix3FromFloat32Array(cast this, offset, source, sourceLen);
	}
	inline public function setFromMatrix(source:flight._cpp.Matrix):Void {
		flight._cpp._fn.Geometry.setMatrix3FromMatrix(cast this, source);
	}
	inline public function setFromMatrix4(source:flight._cpp.Matrix4):Void {
		flight._cpp._fn.Geometry.setMatrix3FromMatrix4(cast this, source);
	}
	inline public function setIdentity():Void {
		flight._cpp._fn.Geometry.setMatrix3Identity(cast this);
	}
	inline public function setNormalFromMatrix4(source:flight._cpp.Matrix4):Void {
		flight._cpp._fn.Geometry.setMatrix3NormalFromMatrix4(cast this, source);
	}
	inline public function translate(source:flight._cpp.Matrix3, tx:Single, ty:Single):Void {
		flight._cpp._fn.Geometry.translateMatrix3(cast this, source, tx, ty);
	}
	inline public function transpose(source:flight._cpp.Matrix3):Void {
		flight._cpp._fn.Geometry.transposeMatrix3(cast this, source);
	}
	inline public function writeToFloat32Array(out:cpp.Star<cpp.Void>, outLen:Int, offset:Int):Void {
		flight._cpp._fn.Geometry.writeMatrix3ToFloat32Array(out, outLen, offset, cast this);
	}
	inline public function release():Void {
		flight._cpp._fn.Geometry.releaseMatrix3(cast this);
	}
	inline public function free():Void {
		flight._cpp._fn.Geometry.freeMatrix3(cast this);
	}
}
