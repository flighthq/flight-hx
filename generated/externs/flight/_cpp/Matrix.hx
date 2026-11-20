package flight._cpp;

private extern class Matrix_Ffi {
	@:native("flight_get_matrix_a") static function get_a(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_matrix_a") static function set_a(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_matrix_b") static function get_b(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_matrix_b") static function set_b(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_matrix_c") static function get_c(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_matrix_c") static function set_c(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_matrix_d") static function get_d(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_matrix_d") static function set_d(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_matrix_tx") static function get_tx(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_matrix_tx") static function set_tx(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_matrix_ty") static function get_ty(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_matrix_ty") static function set_ty(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Matrix(cpp.Star<cpp.Void>) {
	public var a(get, set):Float;

	inline function get_a():Float return Matrix_Ffi.get_a(this);

	inline function set_a(value:Float):Float { Matrix_Ffi.set_a(this, value); return value; }
	public var b(get, set):Float;

	inline function get_b():Float return Matrix_Ffi.get_b(this);

	inline function set_b(value:Float):Float { Matrix_Ffi.set_b(this, value); return value; }
	public var c(get, set):Float;

	inline function get_c():Float return Matrix_Ffi.get_c(this);

	inline function set_c(value:Float):Float { Matrix_Ffi.set_c(this, value); return value; }
	public var d(get, set):Float;

	inline function get_d():Float return Matrix_Ffi.get_d(this);

	inline function set_d(value:Float):Float { Matrix_Ffi.set_d(this, value); return value; }
	public var tx(get, set):Float;

	inline function get_tx():Float return Matrix_Ffi.get_tx(this);

	inline function set_tx(value:Float):Float { Matrix_Ffi.set_tx(this, value); return value; }
	public var ty(get, set):Float;

	inline function get_ty():Float return Matrix_Ffi.get_ty(this);

	inline function set_ty(value:Float):Float { Matrix_Ffi.set_ty(this, value); return value; }

	extern inline public function getCamera2dView(camera:flight._cpp.Camera2D, viewportWidth:Float, viewportHeight:Float):Void {
		flight._cpp._fn.Camera.getCamera2dViewMatrix(camera, viewportWidth, viewportHeight, cast this);
	}
	static extern inline public function createGradientTransform(width:Float, height:Float, rotation:Float, tx:Float, ty:Float):flight._cpp.Matrix {
		return flight._cpp._fn.Geometry.createGradientTransformMatrix(width, height, rotation, tx, ty);
	}
	static extern inline public function create(a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):flight._cpp.Matrix {
		return flight._cpp._fn.Geometry.createMatrix(a, b, c, d, tx, ty);
	}
	static extern inline public function createTransform(scaleX:Float, scaleY:Float, rotation:Float, tx:Float, ty:Float):flight._cpp.Matrix {
		return flight._cpp._fn.Geometry.createTransformMatrix(scaleX, scaleY, rotation, tx, ty);
	}
	extern inline public function clone():flight._cpp.Matrix {
		return flight._cpp._fn.Geometry.cloneMatrix(cast this);
	}
	extern inline public function copy(source:flight._cpp.Matrix):Void {
		flight._cpp._fn.Geometry.copyMatrix(cast this, source);
	}
	extern inline public function copyColumnFromVector3(column:Int, source:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.copyMatrixColumnFromVector3(cast this, column, source);
	}
	extern inline public function copyRowFromVector3(row:Int, source:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.copyMatrixRowFromVector3(cast this, row, source);
	}
	extern inline public function equals(b:flight._cpp.Matrix, compareTranslation:Bool):Bool {
		return flight._cpp._fn.Geometry.equalsMatrix(cast this, b, compareTranslation);
	}
	extern inline public function inverse(source:flight._cpp.Matrix):Bool {
		return flight._cpp._fn.Geometry.inverseMatrix(cast this, source);
	}
	extern inline public function inverseTransformPoint(out:flight._cpp.Vector2, point:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.inverseMatrixTransformPoint(out, cast this, point);
	}
	extern inline public function inverseTransformPointXy(out:flight._cpp.Vector2, x:Float, y:Float):Void {
		flight._cpp._fn.Geometry.inverseMatrixTransformPointXy(out, cast this, x, y);
	}
	extern inline public function inverseTransformVector(out:flight._cpp.Vector2, vector:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.inverseMatrixTransformVector(out, cast this, vector);
	}
	extern inline public function inverseTransformVectorXy(out:flight._cpp.Vector2, x:Float, y:Float):Void {
		flight._cpp._fn.Geometry.inverseMatrixTransformVectorXy(out, cast this, x, y);
	}
	extern inline public function multiply(a:flight._cpp.Matrix, b:flight._cpp.Matrix):Void {
		flight._cpp._fn.Geometry.multiplyMatrix(cast this, a, b);
	}
	extern inline public function rotate(source:flight._cpp.Matrix, theta:Float):Void {
		flight._cpp._fn.Geometry.rotateMatrix(cast this, source, theta);
	}
	extern inline public function scale(source:flight._cpp.Matrix, sx:Float, sy:Float):Void {
		flight._cpp._fn.Geometry.scaleMatrix(cast this, source, sx, sy);
	}
	extern inline public function setGradientTransform(width:Float, height:Float, rotation:Float, tx:Float, ty:Float):Void {
		flight._cpp._fn.Geometry.setGradientTransformMatrix(cast this, width, height, rotation, tx, ty);
	}
	extern inline public function set(a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):Void {
		flight._cpp._fn.Geometry.setMatrix(cast this, a, b, c, d, tx, ty);
	}
	extern inline public function setFromFloat32Array(offset:Int, source:cpp.Star<cpp.Void>, sourceLen:Int):Void {
		flight._cpp._fn.Geometry.setMatrixFromFloat32Array(cast this, offset, source, sourceLen);
	}
	extern inline public function setFromMatrix3(source:flight._cpp.Matrix3):Void {
		flight._cpp._fn.Geometry.setMatrixFromMatrix3(cast this, source);
	}
	extern inline public function setFromMatrix4(source:flight._cpp.Matrix4):Void {
		flight._cpp._fn.Geometry.setMatrixFromMatrix4(cast this, source);
	}
	extern inline public function setIdentity():Void {
		flight._cpp._fn.Geometry.setMatrixIdentity(cast this);
	}
	extern inline public function setTransform(scaleX:Float, scaleY:Float, rotation:Float, tx:Float, ty:Float):Void {
		flight._cpp._fn.Geometry.setTransformMatrix(cast this, scaleX, scaleY, rotation, tx, ty);
	}
	extern inline public function translate(source:flight._cpp.Matrix, dx:Float, dy:Float):Void {
		flight._cpp._fn.Geometry.translateMatrix(cast this, source, dx, dy);
	}
	extern inline public function translateByVector(matrix:flight._cpp.Matrix, vector:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.translateMatrixByVector(cast this, matrix, vector);
	}
	extern inline public function translateByVectorXy(source:flight._cpp.Matrix, x:Float, y:Float):Void {
		flight._cpp._fn.Geometry.translateMatrixByVectorXy(cast this, source, x, y);
	}
	extern inline public function writeToFloat32Array(out:cpp.Star<cpp.Void>, outLen:Int, offset:Int):Void {
		flight._cpp._fn.Geometry.writeMatrixToFloat32Array(out, outLen, offset, cast this);
	}
	extern inline public function release():Void {
		flight._cpp._fn.Geometry.releaseMatrix(cast this);
	}
	extern inline public function free():Void {
		flight._cpp._fn.Geometry.freeMatrix(cast this);
	}
	extern inline public function getSkeleton2dBoneWorld(skeleton:flight._cpp.Skeleton2D, boneIndex:Int):Bool {
		return flight._cpp._fn.Skeleton2D.getSkeleton2dBoneWorldMatrix(cast this, skeleton, boneIndex);
	}
}
