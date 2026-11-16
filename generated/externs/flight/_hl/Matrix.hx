package flight._hl;

abstract Matrix(hl.Bytes) {
	public var a(get, set):Single;

	inline function get_a():Single return this.getF32(16);

	inline function set_a(value:Single):Single { this.setF32(16, value); return value; }
	public var b(get, set):Single;

	inline function get_b():Single return this.getF32(20);

	inline function set_b(value:Single):Single { this.setF32(20, value); return value; }
	public var c(get, set):Single;

	inline function get_c():Single return this.getF32(24);

	inline function set_c(value:Single):Single { this.setF32(24, value); return value; }
	public var d(get, set):Single;

	inline function get_d():Single return this.getF32(28);

	inline function set_d(value:Single):Single { this.setF32(28, value); return value; }
	public var tx(get, set):Single;

	inline function get_tx():Single return this.getF32(32);

	inline function set_tx(value:Single):Single { this.setF32(32, value); return value; }
	public var ty(get, set):Single;

	inline function get_ty():Single return this.getF32(36);

	inline function set_ty(value:Single):Single { this.setF32(36, value); return value; }

	inline public function getCamera2dView(camera:flight._hl.Camera2D, viewportWidth:Single, viewportHeight:Single):Void {
		flight._hl._fn.Camera.getCamera2dViewMatrix(camera, viewportWidth, viewportHeight, cast this);
	}
	static inline public function createGradientTransform(width:Single, height:Single, rotation:Single, tx:Single, ty:Single):flight._hl.Matrix {
		return flight._hl._fn.Geometry.createGradientTransformMatrix(width, height, rotation, tx, ty);
	}
	static inline public function create(a:Single, b:Single, c:Single, d:Single, tx:Single, ty:Single):flight._hl.Matrix {
		return flight._hl._fn.Geometry.createMatrix(a, b, c, d, tx, ty);
	}
	static inline public function createTransform(scaleX:Single, scaleY:Single, rotation:Single, tx:Single, ty:Single):flight._hl.Matrix {
		return flight._hl._fn.Geometry.createTransformMatrix(scaleX, scaleY, rotation, tx, ty);
	}
	inline public function clone():flight._hl.Matrix {
		return flight._hl._fn.Geometry.cloneMatrix(cast this);
	}
	inline public function copy(source:flight._hl.Matrix):Void {
		flight._hl._fn.Geometry.copyMatrix(cast this, source);
	}
	inline public function copyColumnFromVector3(column:Int, source:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.copyMatrixColumnFromVector3(cast this, column, source);
	}
	inline public function copyRowFromVector3(row:Int, source:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.copyMatrixRowFromVector3(cast this, row, source);
	}
	inline public function equals(b:flight._hl.Matrix, compareTranslation:Bool):Bool {
		return flight._hl._fn.Geometry.equalsMatrix(cast this, b, compareTranslation);
	}
	inline public function inverse(source:flight._hl.Matrix):Bool {
		return flight._hl._fn.Geometry.inverseMatrix(cast this, source);
	}
	inline public function inverseTransformPoint(out:flight._hl.Vector2, point:flight._hl.Vector2):Void {
		flight._hl._fn.Geometry.inverseMatrixTransformPoint(out, cast this, point);
	}
	inline public function inverseTransformPointXy(out:flight._hl.Vector2, x:Single, y:Single):Void {
		flight._hl._fn.Geometry.inverseMatrixTransformPointXy(out, cast this, x, y);
	}
	inline public function inverseTransformVector(out:flight._hl.Vector2, vector:flight._hl.Vector2):Void {
		flight._hl._fn.Geometry.inverseMatrixTransformVector(out, cast this, vector);
	}
	inline public function inverseTransformVectorXy(out:flight._hl.Vector2, x:Single, y:Single):Void {
		flight._hl._fn.Geometry.inverseMatrixTransformVectorXy(out, cast this, x, y);
	}
	inline public function multiply(a:flight._hl.Matrix, b:flight._hl.Matrix):Void {
		flight._hl._fn.Geometry.multiplyMatrix(cast this, a, b);
	}
	inline public function rotate(source:flight._hl.Matrix, theta:Single):Void {
		flight._hl._fn.Geometry.rotateMatrix(cast this, source, theta);
	}
	inline public function scale(source:flight._hl.Matrix, sx:Single, sy:Single):Void {
		flight._hl._fn.Geometry.scaleMatrix(cast this, source, sx, sy);
	}
	inline public function setGradientTransform(width:Single, height:Single, rotation:Single, tx:Single, ty:Single):Void {
		flight._hl._fn.Geometry.setGradientTransformMatrix(cast this, width, height, rotation, tx, ty);
	}
	inline public function set(a:Single, b:Single, c:Single, d:Single, tx:Single, ty:Single):Void {
		flight._hl._fn.Geometry.setMatrix(cast this, a, b, c, d, tx, ty);
	}
	inline public function setFromFloat32Array(offset:Int, source:hl.Bytes, sourceLen:Int):Void {
		flight._hl._fn.Geometry.setMatrixFromFloat32Array(cast this, offset, source, sourceLen);
	}
	inline public function setFromMatrix3(source:flight._hl.Matrix3):Void {
		flight._hl._fn.Geometry.setMatrixFromMatrix3(cast this, source);
	}
	inline public function setFromMatrix4(source:flight._hl.Matrix4):Void {
		flight._hl._fn.Geometry.setMatrixFromMatrix4(cast this, source);
	}
	inline public function setIdentity():Void {
		flight._hl._fn.Geometry.setMatrixIdentity(cast this);
	}
	inline public function setTransform(scaleX:Single, scaleY:Single, rotation:Single, tx:Single, ty:Single):Void {
		flight._hl._fn.Geometry.setTransformMatrix(cast this, scaleX, scaleY, rotation, tx, ty);
	}
	inline public function translate(source:flight._hl.Matrix, dx:Single, dy:Single):Void {
		flight._hl._fn.Geometry.translateMatrix(cast this, source, dx, dy);
	}
	inline public function translateByVector(matrix:flight._hl.Matrix, vector:flight._hl.Vector2):Void {
		flight._hl._fn.Geometry.translateMatrixByVector(cast this, matrix, vector);
	}
	inline public function translateByVectorXy(source:flight._hl.Matrix, x:Single, y:Single):Void {
		flight._hl._fn.Geometry.translateMatrixByVectorXy(cast this, source, x, y);
	}
	inline public function writeToFloat32Array(out:hl.Bytes, outLen:Int, offset:Int):Void {
		flight._hl._fn.Geometry.writeMatrixToFloat32Array(out, outLen, offset, cast this);
	}
	inline public function release():Void {
		flight._hl._fn.Geometry.releaseMatrix(cast this);
	}
	inline public function free():Void {
		flight._hl._fn.Geometry.freeMatrix(cast this);
	}
	inline public function setNodeLocal(target:hl.Bytes):Void {
		flight._hl._fn.Node.setNodeLocalMatrix(target, cast this);
	}
	static inline public function createLottieGradient(start:hl.Bytes, startLen:Int, end:hl.Bytes, endLen:Int):flight._hl.Matrix {
		return flight._hl._fn.Scene2dFormats.createLottieGradientMatrix(start, startLen, end, endLen);
	}
	static inline public function createSvgGradient(gradient:flight._hl.SvgGradient, path:flight._hl.Path):flight._hl.Matrix {
		return flight._hl._fn.Scene2dFormats.createSvgGradientMatrix(gradient, path);
	}
	static inline public function createSvgViewBox(viewBox:hl.Bytes, viewBoxLen:Int, viewport:flight._hl.SvgViewport, preserveAspectRatioValue:hl.Bytes):flight._hl.Matrix {
		return flight._hl._fn.Scene2dFormats.createSvgViewBoxMatrix(viewBox, viewBoxLen, viewport, preserveAspectRatioValue);
	}
	inline public function getSkeleton2dBoneWorld(skeleton:flight._hl.Skeleton2D, boneIndex:Int):Bool {
		return flight._hl._fn.Skeleton2d.getSkeleton2dBoneWorldMatrix(cast this, skeleton, boneIndex);
	}
}
