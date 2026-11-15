package flight._js;

@:jsRequire("flight")
private extern class Matrix_Ffi {
	@:native("flight_get_matrix_a") static function get_a(ptr:Dynamic):Float;
	@:native("flight_set_matrix_a") static function set_a(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_matrix_b") static function get_b(ptr:Dynamic):Float;
	@:native("flight_set_matrix_b") static function set_b(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_matrix_c") static function get_c(ptr:Dynamic):Float;
	@:native("flight_set_matrix_c") static function set_c(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_matrix_d") static function get_d(ptr:Dynamic):Float;
	@:native("flight_set_matrix_d") static function set_d(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_matrix_tx") static function get_tx(ptr:Dynamic):Float;
	@:native("flight_set_matrix_tx") static function set_tx(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_matrix_ty") static function get_ty(ptr:Dynamic):Float;
	@:native("flight_set_matrix_ty") static function set_ty(ptr:Dynamic, value:Float):Float;
}

abstract Matrix(Dynamic) {
	public var a(get, set):Float;

	inline function get_a():Float return Matrix_Ffi.get_a(this);

	inline function set_a(value:Float):Float return Matrix_Ffi.set_a(this, value);
	public var b(get, set):Float;

	inline function get_b():Float return Matrix_Ffi.get_b(this);

	inline function set_b(value:Float):Float return Matrix_Ffi.set_b(this, value);
	public var c(get, set):Float;

	inline function get_c():Float return Matrix_Ffi.get_c(this);

	inline function set_c(value:Float):Float return Matrix_Ffi.set_c(this, value);
	public var d(get, set):Float;

	inline function get_d():Float return Matrix_Ffi.get_d(this);

	inline function set_d(value:Float):Float return Matrix_Ffi.set_d(this, value);
	public var tx(get, set):Float;

	inline function get_tx():Float return Matrix_Ffi.get_tx(this);

	inline function set_tx(value:Float):Float return Matrix_Ffi.set_tx(this, value);
	public var ty(get, set):Float;

	inline function get_ty():Float return Matrix_Ffi.get_ty(this);

	inline function set_ty(value:Float):Float return Matrix_Ffi.set_ty(this, value);

	inline public function getCamera2dView(camera:flight._js.Camera2D, viewportWidth:Float, viewportHeight:Float):Void {
		flight._js._fn.Camera.getCamera2dViewMatrix(camera, viewportWidth, viewportHeight, cast this);
	}
	static inline public function createGradientTransform(width:Float, height:Float, rotation:Float, tx:Float, ty:Float):flight._js.Matrix {
		return flight._js._fn.Geometry.createGradientTransformMatrix(width, height, rotation, tx, ty);
	}
	static inline public function create(a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):flight._js.Matrix {
		return flight._js._fn.Geometry.createMatrix(a, b, c, d, tx, ty);
	}
	static inline public function createTransform(scaleX:Float, scaleY:Float, rotation:Float, tx:Float, ty:Float):flight._js.Matrix {
		return flight._js._fn.Geometry.createTransformMatrix(scaleX, scaleY, rotation, tx, ty);
	}
	inline public function clone():flight._js.Matrix {
		return flight._js._fn.Geometry.cloneMatrix(cast this);
	}
	inline public function copy(source:flight._js.Matrix):Void {
		flight._js._fn.Geometry.copyMatrix(cast this, source);
	}
	inline public function copyColumnFromVector3(column:Int, source:flight._js.Vector3):Void {
		flight._js._fn.Geometry.copyMatrixColumnFromVector3(cast this, column, source);
	}
	inline public function copyRowFromVector3(row:Int, source:flight._js.Vector3):Void {
		flight._js._fn.Geometry.copyMatrixRowFromVector3(cast this, row, source);
	}
	inline public function equals(b:flight._js.Matrix, compareTranslation:Bool):Bool {
		return flight._js._fn.Geometry.equalsMatrix(cast this, b, compareTranslation);
	}
	inline public function inverse(source:flight._js.Matrix):Bool {
		return flight._js._fn.Geometry.inverseMatrix(cast this, source);
	}
	inline public function inverseTransformPoint(out:flight._js.Vector2, point:flight._js.Vector2):Void {
		flight._js._fn.Geometry.inverseMatrixTransformPoint(out, cast this, point);
	}
	inline public function inverseTransformPointXy(out:flight._js.Vector2, x:Float, y:Float):Void {
		flight._js._fn.Geometry.inverseMatrixTransformPointXy(out, cast this, x, y);
	}
	inline public function inverseTransformVector(out:flight._js.Vector2, vector:flight._js.Vector2):Void {
		flight._js._fn.Geometry.inverseMatrixTransformVector(out, cast this, vector);
	}
	inline public function inverseTransformVectorXy(out:flight._js.Vector2, x:Float, y:Float):Void {
		flight._js._fn.Geometry.inverseMatrixTransformVectorXy(out, cast this, x, y);
	}
	inline public function multiply(a:flight._js.Matrix, b:flight._js.Matrix):Void {
		flight._js._fn.Geometry.multiplyMatrix(cast this, a, b);
	}
	inline public function rotate(source:flight._js.Matrix, theta:Float):Void {
		flight._js._fn.Geometry.rotateMatrix(cast this, source, theta);
	}
	inline public function scale(source:flight._js.Matrix, sx:Float, sy:Float):Void {
		flight._js._fn.Geometry.scaleMatrix(cast this, source, sx, sy);
	}
	inline public function setGradientTransform(width:Float, height:Float, rotation:Float, tx:Float, ty:Float):Void {
		flight._js._fn.Geometry.setGradientTransformMatrix(cast this, width, height, rotation, tx, ty);
	}
	inline public function set(a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):Void {
		flight._js._fn.Geometry.setMatrix(cast this, a, b, c, d, tx, ty);
	}
	inline public function setFromFloat32Array(offset:Int, source:Dynamic, sourceLen:Int):Void {
		flight._js._fn.Geometry.setMatrixFromFloat32Array(cast this, offset, source, sourceLen);
	}
	inline public function setFromMatrix3(source:flight._js.Matrix3):Void {
		flight._js._fn.Geometry.setMatrixFromMatrix3(cast this, source);
	}
	inline public function setFromMatrix4(source:flight._js.Matrix4):Void {
		flight._js._fn.Geometry.setMatrixFromMatrix4(cast this, source);
	}
	inline public function setIdentity():Void {
		flight._js._fn.Geometry.setMatrixIdentity(cast this);
	}
	inline public function setTransform(scaleX:Float, scaleY:Float, rotation:Float, tx:Float, ty:Float):Void {
		flight._js._fn.Geometry.setTransformMatrix(cast this, scaleX, scaleY, rotation, tx, ty);
	}
	inline public function translate(source:flight._js.Matrix, dx:Float, dy:Float):Void {
		flight._js._fn.Geometry.translateMatrix(cast this, source, dx, dy);
	}
	inline public function translateByVector(matrix:flight._js.Matrix, vector:flight._js.Vector2):Void {
		flight._js._fn.Geometry.translateMatrixByVector(cast this, matrix, vector);
	}
	inline public function translateByVectorXy(source:flight._js.Matrix, x:Float, y:Float):Void {
		flight._js._fn.Geometry.translateMatrixByVectorXy(cast this, source, x, y);
	}
	inline public function writeToFloat32Array(out:Dynamic, outLen:Int, offset:Int):Void {
		flight._js._fn.Geometry.writeMatrixToFloat32Array(out, outLen, offset, cast this);
	}
	inline public function release():Void {
		flight._js._fn.Geometry.releaseMatrix(cast this);
	}
	inline public function free():Void {
		flight._js._fn.Geometry.freeMatrix(cast this);
	}
	inline public function setNodeLocal(target:Dynamic):Void {
		flight._js._fn.Node.setNodeLocalMatrix(target, cast this);
	}
	static inline public function createLottieGradient(start:Dynamic, startLen:Int, end:Dynamic, endLen:Int):flight._js.Matrix {
		return flight._js._fn.Scene2dFormats.createLottieGradientMatrix(start, startLen, end, endLen);
	}
	static inline public function createSvgGradient(gradient:flight._js.SvgGradient, path:flight._js.Path):flight._js.Matrix {
		return flight._js._fn.Scene2dFormats.createSvgGradientMatrix(gradient, path);
	}
	static inline public function createSvgViewBox(viewBox:Dynamic, viewBoxLen:Int, viewport:flight._js.SvgViewport, preserveAspectRatioValue:String):flight._js.Matrix {
		return flight._js._fn.Scene2dFormats.createSvgViewBoxMatrix(viewBox, viewBoxLen, viewport, preserveAspectRatioValue);
	}
	inline public function getSkeleton2dBoneWorld(skeleton:flight._js.Skeleton2D, boneIndex:Int):Bool {
		return flight._js._fn.Skeleton2d.getSkeleton2dBoneWorldMatrix(cast this, skeleton, boneIndex);
	}
}
