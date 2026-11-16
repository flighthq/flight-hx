package flight._js;

abstract Matrix3(Dynamic) {
	static inline public function create():flight._js.Matrix3 {
		return flight._js._fn.Geometry.createMatrix3();
	}
	static inline public function createFromValues(m00:Float, m01:Float, m02:Float, m10:Float, m11:Float, m12:Float, m20:Float, m21:Float, m22:Float):flight._js.Matrix3 {
		return flight._js._fn.Geometry.createMatrix3FromValues(m00, m01, m02, m10, m11, m12, m20, m21, m22);
	}
	inline public function clone():flight._js.Matrix3 {
		return flight._js._fn.Geometry.cloneMatrix3(cast this);
	}
	inline public function copy(source:flight._js.Matrix3):Void {
		flight._js._fn.Geometry.copyMatrix3(cast this, source);
	}
	inline public function copyColumnFromVector3(column:Int, source:flight._js.Vector3):Void {
		flight._js._fn.Geometry.copyMatrix3ColumnFromVector3(cast this, column, source);
	}
	inline public function copyRowFromVector3(row:Int, source:flight._js.Vector3):Void {
		flight._js._fn.Geometry.copyMatrix3RowFromVector3(cast this, row, source);
	}
	inline public function equals(b:Null<flight._js.Matrix3>):Bool {
		return flight._js._fn.Geometry.equalsMatrix3(cast this, b);
	}
	inline public function getDeterminant():Float {
		return flight._js._fn.Geometry.getMatrix3Determinant(cast this);
	}
	inline public function getElement(row:Int, column:Int):Float {
		return flight._js._fn.Geometry.getMatrix3Element(cast this, row, column);
	}
	inline public function inverse(source:flight._js.Matrix3):Bool {
		return flight._js._fn.Geometry.inverseMatrix3(cast this, source);
	}
	inline public function isAffine():Bool {
		return flight._js._fn.Geometry.isAffineMatrix3(cast this);
	}
	inline public function multiply(a:flight._js.Matrix3, b:flight._js.Matrix3):Void {
		flight._js._fn.Geometry.multiplyMatrix3(cast this, a, b);
	}
	inline public function rotate(source:flight._js.Matrix3, theta:Float):Void {
		flight._js._fn.Geometry.rotateMatrix3(cast this, source, theta);
	}
	inline public function scale(source:flight._js.Matrix3, sx:Float, sy:Float):Void {
		flight._js._fn.Geometry.scaleMatrix3(cast this, source, sx, sy);
	}
	inline public function set(m00:Float, m01:Float, m02:Float, m10:Float, m11:Float, m12:Float, m20:Float, m21:Float, m22:Float):Void {
		flight._js._fn.Geometry.setMatrix3(cast this, m00, m01, m02, m10, m11, m12, m20, m21, m22);
	}
	inline public function setElement(row:Int, column:Int, value:Float):Void {
		flight._js._fn.Geometry.setMatrix3Element(cast this, row, column, value);
	}
	inline public function setFromFloat32Array(offset:Int, source:Dynamic):Void {
		flight._js._fn.Geometry.setMatrix3FromFloat32Array(cast this, offset, source);
	}
	inline public function setFromMatrix(source:flight._js.Matrix):Void {
		flight._js._fn.Geometry.setMatrix3FromMatrix(cast this, source);
	}
	inline public function setFromMatrix4(source:flight._js.Matrix4):Void {
		flight._js._fn.Geometry.setMatrix3FromMatrix4(cast this, source);
	}
	inline public function setIdentity():Void {
		flight._js._fn.Geometry.setMatrix3Identity(cast this);
	}
	inline public function setNormalFromMatrix4(source:flight._js.Matrix4):Void {
		flight._js._fn.Geometry.setMatrix3NormalFromMatrix4(cast this, source);
	}
	inline public function translate(source:flight._js.Matrix3, tx:Float, ty:Float):Void {
		flight._js._fn.Geometry.translateMatrix3(cast this, source, tx, ty);
	}
	inline public function transpose(source:flight._js.Matrix3):Void {
		flight._js._fn.Geometry.transposeMatrix3(cast this, source);
	}
	inline public function writeToFloat32Array(out:Dynamic, offset:Int):Void {
		flight._js._fn.Geometry.writeMatrix3ToFloat32Array(out, offset, cast this);
	}
	inline public function release():Void {
		flight._js._fn.Geometry.releaseMatrix3(cast this);
	}
	inline public function free():Void {
		flight._js._fn.Geometry.freeMatrix3(cast this);
	}
}
