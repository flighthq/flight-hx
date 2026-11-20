package flight._cpp;

abstract Matrix4(cpp.Star<cpp.Void>) {
	extern inline public function getCamera3dInverseViewProjection(camera:flight._cpp.Camera3D, aspect:Float):Bool {
		return flight._cpp._fn.Camera.getCamera3dInverseViewProjectionMatrix4(cast this, camera, aspect);
	}
	extern inline public function getCamera3dViewProjection(camera:flight._cpp.Camera3D, aspect:Float):Void {
		flight._cpp._fn.Camera.getCamera3dViewProjectionMatrix4(cast this, camera, aspect);
	}
	extern inline public function setCamera3dViewMatrix4From(guardState:cpp.Star<cpp.Void>, camera:flight._cpp.Camera3D):Void {
		flight._cpp._fn.Camera.setCamera3dViewMatrix4FromMatrix4(guardState, camera, cast this);
	}
	extern inline public function setProjection(projection:flight._cpp.Projection, aspect:Float, near:Float, far:Float):Void {
		flight._cpp._fn.Camera.setProjectionMatrix4(cast this, projection, aspect, near, far);
	}
	extern inline public function transformBoundingSphereBy(out:flight._cpp.BoundingSphere, sphere:flight._cpp.BoundingSphere):Void {
		flight._cpp._fn.Geometry.transformBoundingSphereByMatrix4(out, sphere, cast this);
	}
	static extern inline public function create():flight._cpp.Matrix4 {
		return flight._cpp._fn.Geometry.createMatrix4();
	}
	static extern inline public function createFrom2d(a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):flight._cpp.Matrix4 {
		return flight._cpp._fn.Geometry.createMatrix4From2d(a, b, c, d, tx, ty);
	}
	static extern inline public function createFromValues(m00:Float, m01:Float, m02:Float, m03:Float, m10:Float, m11:Float, m12:Float, m13:Float, m20:Float, m21:Float, m22:Float, m23:Float, m30:Float, m31:Float, m32:Float, m33:Float):flight._cpp.Matrix4 {
		return flight._cpp._fn.Geometry.createMatrix4FromValues(m00, m01, m02, m03, m10, m11, m12, m13, m20, m21, m22, m23, m30, m31, m32, m33);
	}
	static extern inline public function createOrthographic(left:Float, right:Float, bottom:Float, top:Float, zNear:Float, zFar:Float):flight._cpp.Matrix4 {
		return flight._cpp._fn.Geometry.createOrthographicMatrix4(left, right, bottom, top, zNear, zFar);
	}
	static extern inline public function createPerspective(tanHalfFovY:Float, aspect:Float, zNear:Float, zFar:Float):flight._cpp.Matrix4 {
		return flight._cpp._fn.Geometry.createPerspectiveMatrix4(tanHalfFovY, aspect, zNear, zFar);
	}
	extern inline public function append(source:flight._cpp.Matrix4, other:flight._cpp.Matrix4):Void {
		flight._cpp._fn.Geometry.appendMatrix4(cast this, source, other);
	}
	extern inline public function appendRotation(source:flight._cpp.Matrix4, radians:Float, axis:flight._cpp.Vector4, pivotPoint:flight._cpp.Vector4):Void {
		flight._cpp._fn.Geometry.appendRotationMatrix4(cast this, source, radians, axis, pivotPoint);
	}
	extern inline public function appendScale(source:flight._cpp.Matrix4, xScale:Float, yScale:Float, zScale:Float):Void {
		flight._cpp._fn.Geometry.appendScaleMatrix4(cast this, source, xScale, yScale, zScale);
	}
	extern inline public function appendTranslation(source:flight._cpp.Matrix4, x:Float, y:Float, z:Float):Void {
		flight._cpp._fn.Geometry.appendTranslationMatrix4(cast this, source, x, y, z);
	}
	extern inline public function clone():flight._cpp.Matrix4 {
		return flight._cpp._fn.Geometry.cloneMatrix4(cast this);
	}
	extern inline public function compose(position:flight._cpp.Vector3, rotation:flight._cpp.Quaternion, scale:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.composeMatrix4(cast this, position, rotation, scale);
	}
	extern inline public function copy(source:flight._cpp.Matrix4):Void {
		flight._cpp._fn.Geometry.copyMatrix4(cast this, source);
	}
	extern inline public function copyColumnFromVector4(column:Int, source:flight._cpp.Vector4):Void {
		flight._cpp._fn.Geometry.copyMatrix4ColumnFromVector4(cast this, column, source);
	}
	extern inline public function copyRowFromVector4(row:Int, source:flight._cpp.Vector4):Void {
		flight._cpp._fn.Geometry.copyMatrix4RowFromVector4(cast this, row, source);
	}
	extern inline public function decompose(outPosition:flight._cpp.Vector3, outRotation:flight._cpp.Quaternion, outScale:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.decomposeMatrix4(outPosition, outRotation, outScale, cast this);
	}
	extern inline public function equals(b:flight._cpp.Matrix4):Bool {
		return flight._cpp._fn.Geometry.equalsMatrix4(cast this, b);
	}
	extern inline public function getDeterminant():Float {
		return flight._cpp._fn.Geometry.getMatrix4Determinant(cast this);
	}
	extern inline public function getElement(row:Int, column:Int):Float {
		return flight._cpp._fn.Geometry.getMatrix4Element(cast this, row, column);
	}
	extern inline public function getPosition(out:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.getMatrix4Position(out, cast this);
	}
	extern inline public function interpolate(a:flight._cpp.Matrix4, b:flight._cpp.Matrix4, t:Float):Void {
		flight._cpp._fn.Geometry.interpolateMatrix4(cast this, a, b, t);
	}
	extern inline public function inverse(source:flight._cpp.Matrix4):Bool {
		return flight._cpp._fn.Geometry.inverseMatrix4(cast this, source);
	}
	extern inline public function isAffine():Bool {
		return flight._cpp._fn.Geometry.isAffineMatrix4(cast this);
	}
	extern inline public function multiply(a:flight._cpp.Matrix4, b:flight._cpp.Matrix4):Void {
		flight._cpp._fn.Geometry.multiplyMatrix4(cast this, a, b);
	}
	extern inline public function prepend(source:flight._cpp.Matrix4, other:flight._cpp.Matrix4):Void {
		flight._cpp._fn.Geometry.prependMatrix4(cast this, source, other);
	}
	extern inline public function prependRotation(source:flight._cpp.Matrix4, radians:Float, axis:flight._cpp.Vector4, pivotPoint:flight._cpp.Vector4):Void {
		flight._cpp._fn.Geometry.prependRotationMatrix4(cast this, source, radians, axis, pivotPoint);
	}
	extern inline public function prependScale(source:flight._cpp.Matrix4, xScale:Float, yScale:Float, zScale:Float):Void {
		flight._cpp._fn.Geometry.prependScaleMatrix4(cast this, source, xScale, yScale, zScale);
	}
	extern inline public function prependTranslation(source:flight._cpp.Matrix4, x:Float, y:Float, z:Float):Void {
		flight._cpp._fn.Geometry.prependTranslationMatrix4(cast this, source, x, y, z);
	}
	extern inline public function rotate(source:flight._cpp.Matrix4, axis:flight._cpp.Vector3, radians:Float):Void {
		flight._cpp._fn.Geometry.rotateMatrix4(cast this, source, axis, radians);
	}
	extern inline public function scale(source:flight._cpp.Matrix4, sx:Float, sy:Float, sz:Float):Void {
		flight._cpp._fn.Geometry.scaleMatrix4(cast this, source, sx, sy, sz);
	}
	extern inline public function set(m00:Float, m01:Float, m02:Float, m03:Float, m10:Float, m11:Float, m12:Float, m13:Float, m20:Float, m21:Float, m22:Float, m23:Float, m30:Float, m31:Float, m32:Float, m33:Float):Void {
		flight._cpp._fn.Geometry.setMatrix4(cast this, m00, m01, m02, m03, m10, m11, m12, m13, m20, m21, m22, m23, m30, m31, m32, m33);
	}
	extern inline public function setElement(row:Int, column:Int, value:Float):Void {
		flight._cpp._fn.Geometry.setMatrix4Element(cast this, row, column, value);
	}
	extern inline public function setFrom2d(a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):Void {
		flight._cpp._fn.Geometry.setMatrix4From2d(cast this, a, b, c, d, tx, ty);
	}
	extern inline public function setFromFloat32Array(offset:Int, source:cpp.Star<cpp.Void>, sourceLen:Int):Void {
		flight._cpp._fn.Geometry.setMatrix4FromFloat32Array(cast this, offset, source, sourceLen);
	}
	extern inline public function setFromMatrix(source:flight._cpp.Matrix):Void {
		flight._cpp._fn.Geometry.setMatrix4FromMatrix(cast this, source);
	}
	extern inline public function setFromMatrix3(source:flight._cpp.Matrix3):Void {
		flight._cpp._fn.Geometry.setMatrix4FromMatrix3(cast this, source);
	}
	extern inline public function setFromQuaternion(source:flight._cpp.Quaternion):Void {
		flight._cpp._fn.Geometry.setMatrix4FromQuaternion(cast this, source);
	}
	extern inline public function setIdentity():Void {
		flight._cpp._fn.Geometry.setMatrix4Identity(cast this);
	}
	extern inline public function setLookAt(eye:flight._cpp.Vector3, target:flight._cpp.Vector3, up:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.setMatrix4LookAt(cast this, eye, target, up);
	}
	extern inline public function setPosition(source:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.setMatrix4Position(cast this, source);
	}
	extern inline public function setOrthographic(left:Float, right:Float, bottom:Float, top:Float, zNear:Float, zFar:Float):Void {
		flight._cpp._fn.Geometry.setOrthographicMatrix4(cast this, left, right, bottom, top, zNear, zFar);
	}
	extern inline public function setPerspective(tanHalfFovY:Float, aspect:Float, zNear:Float, zFar:Float):Void {
		flight._cpp._fn.Geometry.setPerspectiveMatrix4(cast this, tanHalfFovY, aspect, zNear, zFar);
	}
	extern inline public function translate(source:flight._cpp.Matrix4, tx:Float, ty:Float, tz:Float):Void {
		flight._cpp._fn.Geometry.translateMatrix4(cast this, source, tx, ty, tz);
	}
	extern inline public function transpose(source:flight._cpp.Matrix4):Void {
		flight._cpp._fn.Geometry.transposeMatrix4(cast this, source);
	}
	extern inline public function writeToFloat32Array(out:cpp.Star<cpp.Void>, outLen:Int, offset:Int):Void {
		flight._cpp._fn.Geometry.writeMatrix4ToFloat32Array(out, outLen, offset, cast this);
	}
	extern inline public function release():Void {
		flight._cpp._fn.Geometry.releaseMatrix4(cast this);
	}
	extern inline public function composeFromTransform3d(source:flight._cpp.Transform3D):Void {
		flight._cpp._fn.Geometry.composeMatrix4FromTransform3d(cast this, source);
	}
	extern inline public function free():Void {
		flight._cpp._fn.Geometry.freeMatrix4(cast this);
	}
}
