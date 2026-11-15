package flight._cpp;

private extern class Matrix_Ffi {
	@:native("flight_get_matrix_a") static function get_a(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_matrix_a") static function set_a(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_matrix_b") static function get_b(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_matrix_b") static function set_b(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_matrix_c") static function get_c(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_matrix_c") static function set_c(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_matrix_d") static function get_d(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_matrix_d") static function set_d(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_matrix_tx") static function get_tx(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_matrix_tx") static function set_tx(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_matrix_ty") static function get_ty(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_matrix_ty") static function set_ty(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Matrix(cpp.Star<cpp.Void>) {
	public var a(get, set):Single;

	inline function get_a():Single return Matrix_Ffi.get_a(this);

	inline function set_a(value:Single):Single return Matrix_Ffi.set_a(this, value);
	public var b(get, set):Single;

	inline function get_b():Single return Matrix_Ffi.get_b(this);

	inline function set_b(value:Single):Single return Matrix_Ffi.set_b(this, value);
	public var c(get, set):Single;

	inline function get_c():Single return Matrix_Ffi.get_c(this);

	inline function set_c(value:Single):Single return Matrix_Ffi.set_c(this, value);
	public var d(get, set):Single;

	inline function get_d():Single return Matrix_Ffi.get_d(this);

	inline function set_d(value:Single):Single return Matrix_Ffi.set_d(this, value);
	public var tx(get, set):Single;

	inline function get_tx():Single return Matrix_Ffi.get_tx(this);

	inline function set_tx(value:Single):Single return Matrix_Ffi.set_tx(this, value);
	public var ty(get, set):Single;

	inline function get_ty():Single return Matrix_Ffi.get_ty(this);

	inline function set_ty(value:Single):Single return Matrix_Ffi.set_ty(this, value);

	inline public function getCamera2dView(camera:flight._cpp.Camera2D, viewportWidth:Single, viewportHeight:Single):Void {
		flight._cpp._fn.Camera.getCamera2dViewMatrix(camera, viewportWidth, viewportHeight, cast this);
	}
	static inline public function createGradientTransform(width:Single, height:Single, rotation:Single, tx:Single, ty:Single):flight._cpp.Matrix {
		return flight._cpp._fn.Geometry.createGradientTransformMatrix(width, height, rotation, tx, ty);
	}
	static inline public function create(a:Single, b:Single, c:Single, d:Single, tx:Single, ty:Single):flight._cpp.Matrix {
		return flight._cpp._fn.Geometry.createMatrix(a, b, c, d, tx, ty);
	}
	static inline public function createTransform(scaleX:Single, scaleY:Single, rotation:Single, tx:Single, ty:Single):flight._cpp.Matrix {
		return flight._cpp._fn.Geometry.createTransformMatrix(scaleX, scaleY, rotation, tx, ty);
	}
	inline public function clone():flight._cpp.Matrix {
		return flight._cpp._fn.Geometry.cloneMatrix(cast this);
	}
	inline public function copy(source:flight._cpp.Matrix):Void {
		flight._cpp._fn.Geometry.copyMatrix(cast this, source);
	}
	inline public function copyColumnFromVector3(column:Int, source:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.copyMatrixColumnFromVector3(cast this, column, source);
	}
	inline public function copyRowFromVector3(row:Int, source:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.copyMatrixRowFromVector3(cast this, row, source);
	}
	inline public function equals(b:flight._cpp.Matrix, compareTranslation:Bool):Bool {
		return flight._cpp._fn.Geometry.equalsMatrix(cast this, b, compareTranslation);
	}
	inline public function inverse(source:flight._cpp.Matrix):Bool {
		return flight._cpp._fn.Geometry.inverseMatrix(cast this, source);
	}
	inline public function inverseTransformPoint(out:flight._cpp.Vector2, point:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.inverseMatrixTransformPoint(out, cast this, point);
	}
	inline public function inverseTransformPointXy(out:flight._cpp.Vector2, x:Single, y:Single):Void {
		flight._cpp._fn.Geometry.inverseMatrixTransformPointXy(out, cast this, x, y);
	}
	inline public function inverseTransformVector(out:flight._cpp.Vector2, vector:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.inverseMatrixTransformVector(out, cast this, vector);
	}
	inline public function inverseTransformVectorXy(out:flight._cpp.Vector2, x:Single, y:Single):Void {
		flight._cpp._fn.Geometry.inverseMatrixTransformVectorXy(out, cast this, x, y);
	}
	inline public function multiply(a:flight._cpp.Matrix, b:flight._cpp.Matrix):Void {
		flight._cpp._fn.Geometry.multiplyMatrix(cast this, a, b);
	}
	inline public function rotate(source:flight._cpp.Matrix, theta:Single):Void {
		flight._cpp._fn.Geometry.rotateMatrix(cast this, source, theta);
	}
	inline public function scale(source:flight._cpp.Matrix, sx:Single, sy:Single):Void {
		flight._cpp._fn.Geometry.scaleMatrix(cast this, source, sx, sy);
	}
	inline public function setGradientTransform(width:Single, height:Single, rotation:Single, tx:Single, ty:Single):Void {
		flight._cpp._fn.Geometry.setGradientTransformMatrix(cast this, width, height, rotation, tx, ty);
	}
	inline public function set(a:Single, b:Single, c:Single, d:Single, tx:Single, ty:Single):Void {
		flight._cpp._fn.Geometry.setMatrix(cast this, a, b, c, d, tx, ty);
	}
	inline public function setFromFloat32Array(offset:Int, source:cpp.Star<cpp.Void>, sourceLen:Int):Void {
		flight._cpp._fn.Geometry.setMatrixFromFloat32Array(cast this, offset, source, sourceLen);
	}
	inline public function setFromMatrix3(source:flight._cpp.Matrix3):Void {
		flight._cpp._fn.Geometry.setMatrixFromMatrix3(cast this, source);
	}
	inline public function setFromMatrix4(source:flight._cpp.Matrix4):Void {
		flight._cpp._fn.Geometry.setMatrixFromMatrix4(cast this, source);
	}
	inline public function setIdentity():Void {
		flight._cpp._fn.Geometry.setMatrixIdentity(cast this);
	}
	inline public function setTransform(scaleX:Single, scaleY:Single, rotation:Single, tx:Single, ty:Single):Void {
		flight._cpp._fn.Geometry.setTransformMatrix(cast this, scaleX, scaleY, rotation, tx, ty);
	}
	inline public function translate(source:flight._cpp.Matrix, dx:Single, dy:Single):Void {
		flight._cpp._fn.Geometry.translateMatrix(cast this, source, dx, dy);
	}
	inline public function translateByVector(matrix:flight._cpp.Matrix, vector:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.translateMatrixByVector(cast this, matrix, vector);
	}
	inline public function translateByVectorXy(source:flight._cpp.Matrix, x:Single, y:Single):Void {
		flight._cpp._fn.Geometry.translateMatrixByVectorXy(cast this, source, x, y);
	}
	inline public function writeToFloat32Array(out:cpp.Star<cpp.Void>, outLen:Int, offset:Int):Void {
		flight._cpp._fn.Geometry.writeMatrixToFloat32Array(out, outLen, offset, cast this);
	}
	inline public function release():Void {
		flight._cpp._fn.Geometry.releaseMatrix(cast this);
	}
	inline public function free():Void {
		flight._cpp._fn.Geometry.freeMatrix(cast this);
	}
	inline public function setNodeLocal(target:cpp.Star<cpp.Void>):Void {
		flight._cpp._fn.Node.setNodeLocalMatrix(target, cast this);
	}
	static inline public function createLottieGradient(start:cpp.Star<cpp.Void>, startLen:Int, end:cpp.Star<cpp.Void>, endLen:Int):flight._cpp.Matrix {
		return flight._cpp._fn.Scene2dFormats.createLottieGradientMatrix(start, startLen, end, endLen);
	}
	static inline public function createSvgGradient(gradient:flight._cpp.SvgGradient, path:flight._cpp.Path):flight._cpp.Matrix {
		return flight._cpp._fn.Scene2dFormats.createSvgGradientMatrix(gradient, path);
	}
	static inline public function createSvgViewBox(viewBox:cpp.Star<cpp.Void>, viewBoxLen:Int, viewport:flight._cpp.SvgViewport, preserveAspectRatioValue:cpp.ConstCharStar):flight._cpp.Matrix {
		return flight._cpp._fn.Scene2dFormats.createSvgViewBoxMatrix(viewBox, viewBoxLen, viewport, preserveAspectRatioValue);
	}
	inline public function getSkeleton2dBoneWorld(skeleton:flight._cpp.Skeleton2D, boneIndex:Int):Bool {
		return flight._cpp._fn.Skeleton2d.getSkeleton2dBoneWorldMatrix(cast this, skeleton, boneIndex);
	}
}
