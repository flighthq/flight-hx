package flight._hl;

abstract Matrix4(hl.Bytes) {
	inline public function getCamera3dInverseViewProjection(camera:flight._hl.Camera3D, aspect:Single):Bool {
		return flight._hl._fn.Camera.getCamera3dInverseViewProjectionMatrix4(cast this, camera, aspect);
	}
	inline public function getCamera3dViewProjection(camera:flight._hl.Camera3D, aspect:Single):Void {
		flight._hl._fn.Camera.getCamera3dViewProjectionMatrix4(cast this, camera, aspect);
	}
	inline public function setCamera3dViewMatrix4From(guardState:Dynamic, camera:flight._hl.Camera3D):Void {
		flight._hl._fn.Camera.setCamera3dViewMatrix4FromMatrix4(guardState, camera, cast this);
	}
	inline public function setProjection(projection:flight._hl.Projection, aspect:Single, near:Single, far:Single):Void {
		flight._hl._fn.Camera.setProjectionMatrix4(cast this, projection, aspect, near, far);
	}
	inline public function transformBoundingSphereBy(out:flight._hl.BoundingSphere, sphere:flight._hl.BoundingSphere):Void {
		flight._hl._fn.Geometry.transformBoundingSphereByMatrix4(out, sphere, cast this);
	}
	static inline public function create():flight._hl.Matrix4 {
		return flight._hl._fn.Geometry.createMatrix4();
	}
	static inline public function createFrom2d(a:Single, b:Single, c:Single, d:Single, tx:Single, ty:Single):flight._hl.Matrix4 {
		return flight._hl._fn.Geometry.createMatrix4From2d(a, b, c, d, tx, ty);
	}
	static inline public function createFromValues(m00:Single, m01:Single, m02:Single, m03:Single, m10:Single, m11:Single, m12:Single, m13:Single, m20:Single, m21:Single, m22:Single, m23:Single, m30:Single, m31:Single, m32:Single, m33:Single):flight._hl.Matrix4 {
		return flight._hl._fn.Geometry.createMatrix4FromValues(m00, m01, m02, m03, m10, m11, m12, m13, m20, m21, m22, m23, m30, m31, m32, m33);
	}
	static inline public function createOrthographic(left:Single, right:Single, bottom:Single, top:Single, zNear:Single, zFar:Single):flight._hl.Matrix4 {
		return flight._hl._fn.Geometry.createOrthographicMatrix4(left, right, bottom, top, zNear, zFar);
	}
	static inline public function createPerspective(tanHalfFovY:Single, aspect:Single, zNear:Single, zFar:Single):flight._hl.Matrix4 {
		return flight._hl._fn.Geometry.createPerspectiveMatrix4(tanHalfFovY, aspect, zNear, zFar);
	}
	inline public function append(source:flight._hl.Matrix4, other:flight._hl.Matrix4):Void {
		flight._hl._fn.Geometry.appendMatrix4(cast this, source, other);
	}
	inline public function appendRotation(source:flight._hl.Matrix4, radians:Single, axis:flight._hl.Vector4, pivotPoint:flight._hl.Vector4):Void {
		flight._hl._fn.Geometry.appendRotationMatrix4(cast this, source, radians, axis, pivotPoint);
	}
	inline public function appendScale(source:flight._hl.Matrix4, xScale:Single, yScale:Single, zScale:Single):Void {
		flight._hl._fn.Geometry.appendScaleMatrix4(cast this, source, xScale, yScale, zScale);
	}
	inline public function appendTranslation(source:flight._hl.Matrix4, x:Single, y:Single, z:Single):Void {
		flight._hl._fn.Geometry.appendTranslationMatrix4(cast this, source, x, y, z);
	}
	inline public function clone():flight._hl.Matrix4 {
		return flight._hl._fn.Geometry.cloneMatrix4(cast this);
	}
	inline public function compose(position:flight._hl.Vector3, rotation:flight._hl.Quaternion, scale:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.composeMatrix4(cast this, position, rotation, scale);
	}
	inline public function copy(source:flight._hl.Matrix4):Void {
		flight._hl._fn.Geometry.copyMatrix4(cast this, source);
	}
	inline public function copyColumnFromVector4(column:Int, source:flight._hl.Vector4):Void {
		flight._hl._fn.Geometry.copyMatrix4ColumnFromVector4(cast this, column, source);
	}
	inline public function copyRowFromVector4(row:Int, source:flight._hl.Vector4):Void {
		flight._hl._fn.Geometry.copyMatrix4RowFromVector4(cast this, row, source);
	}
	inline public function decompose(outPosition:flight._hl.Vector3, outRotation:flight._hl.Quaternion, outScale:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.decomposeMatrix4(outPosition, outRotation, outScale, cast this);
	}
	inline public function equals(b:flight._hl.Matrix4):Bool {
		return flight._hl._fn.Geometry.equalsMatrix4(cast this, b);
	}
	inline public function getDeterminant():Single {
		return flight._hl._fn.Geometry.getMatrix4Determinant(cast this);
	}
	inline public function getElement(row:Int, column:Int):Single {
		return flight._hl._fn.Geometry.getMatrix4Element(cast this, row, column);
	}
	inline public function getPosition(out:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.getMatrix4Position(out, cast this);
	}
	inline public function interpolate(a:flight._hl.Matrix4, b:flight._hl.Matrix4, t:Single):Void {
		flight._hl._fn.Geometry.interpolateMatrix4(cast this, a, b, t);
	}
	inline public function inverse(source:flight._hl.Matrix4):Bool {
		return flight._hl._fn.Geometry.inverseMatrix4(cast this, source);
	}
	inline public function isAffine():Bool {
		return flight._hl._fn.Geometry.isAffineMatrix4(cast this);
	}
	inline public function multiply(a:flight._hl.Matrix4, b:flight._hl.Matrix4):Void {
		flight._hl._fn.Geometry.multiplyMatrix4(cast this, a, b);
	}
	inline public function prepend(source:flight._hl.Matrix4, other:flight._hl.Matrix4):Void {
		flight._hl._fn.Geometry.prependMatrix4(cast this, source, other);
	}
	inline public function prependRotation(source:flight._hl.Matrix4, radians:Single, axis:flight._hl.Vector4, pivotPoint:flight._hl.Vector4):Void {
		flight._hl._fn.Geometry.prependRotationMatrix4(cast this, source, radians, axis, pivotPoint);
	}
	inline public function prependScale(source:flight._hl.Matrix4, xScale:Single, yScale:Single, zScale:Single):Void {
		flight._hl._fn.Geometry.prependScaleMatrix4(cast this, source, xScale, yScale, zScale);
	}
	inline public function prependTranslation(source:flight._hl.Matrix4, x:Single, y:Single, z:Single):Void {
		flight._hl._fn.Geometry.prependTranslationMatrix4(cast this, source, x, y, z);
	}
	inline public function rotate(source:flight._hl.Matrix4, axis:flight._hl.Vector3, radians:Single):Void {
		flight._hl._fn.Geometry.rotateMatrix4(cast this, source, axis, radians);
	}
	inline public function scale(source:flight._hl.Matrix4, sx:Single, sy:Single, sz:Single):Void {
		flight._hl._fn.Geometry.scaleMatrix4(cast this, source, sx, sy, sz);
	}
	inline public function set(m00:Single, m01:Single, m02:Single, m03:Single, m10:Single, m11:Single, m12:Single, m13:Single, m20:Single, m21:Single, m22:Single, m23:Single, m30:Single, m31:Single, m32:Single, m33:Single):Void {
		flight._hl._fn.Geometry.setMatrix4(cast this, m00, m01, m02, m03, m10, m11, m12, m13, m20, m21, m22, m23, m30, m31, m32, m33);
	}
	inline public function setElement(row:Int, column:Int, value:Single):Void {
		flight._hl._fn.Geometry.setMatrix4Element(cast this, row, column, value);
	}
	inline public function setFrom2d(a:Single, b:Single, c:Single, d:Single, tx:Single, ty:Single):Void {
		flight._hl._fn.Geometry.setMatrix4From2d(cast this, a, b, c, d, tx, ty);
	}
	inline public function setFromFloat32Array(offset:Int, source:hl.Bytes, sourceLen:Int):Void {
		flight._hl._fn.Geometry.setMatrix4FromFloat32Array(cast this, offset, source, sourceLen);
	}
	inline public function setFromMatrix(source:flight._hl.Matrix):Void {
		flight._hl._fn.Geometry.setMatrix4FromMatrix(cast this, source);
	}
	inline public function setFromMatrix3(source:flight._hl.Matrix3):Void {
		flight._hl._fn.Geometry.setMatrix4FromMatrix3(cast this, source);
	}
	inline public function setFromQuaternion(source:flight._hl.Quaternion):Void {
		flight._hl._fn.Geometry.setMatrix4FromQuaternion(cast this, source);
	}
	inline public function setIdentity():Void {
		flight._hl._fn.Geometry.setMatrix4Identity(cast this);
	}
	inline public function setLookAt(eye:flight._hl.Vector3, target:flight._hl.Vector3, up:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.setMatrix4LookAt(cast this, eye, target, up);
	}
	inline public function setPosition(source:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.setMatrix4Position(cast this, source);
	}
	inline public function setOrthographic(left:Single, right:Single, bottom:Single, top:Single, zNear:Single, zFar:Single):Void {
		flight._hl._fn.Geometry.setOrthographicMatrix4(cast this, left, right, bottom, top, zNear, zFar);
	}
	inline public function setPerspective(tanHalfFovY:Single, aspect:Single, zNear:Single, zFar:Single):Void {
		flight._hl._fn.Geometry.setPerspectiveMatrix4(cast this, tanHalfFovY, aspect, zNear, zFar);
	}
	inline public function translate(source:flight._hl.Matrix4, tx:Single, ty:Single, tz:Single):Void {
		flight._hl._fn.Geometry.translateMatrix4(cast this, source, tx, ty, tz);
	}
	inline public function transpose(source:flight._hl.Matrix4):Void {
		flight._hl._fn.Geometry.transposeMatrix4(cast this, source);
	}
	inline public function writeToFloat32Array(out:hl.Bytes, outLen:Int, offset:Int):Void {
		flight._hl._fn.Geometry.writeMatrix4ToFloat32Array(out, outLen, offset, cast this);
	}
	inline public function release():Void {
		flight._hl._fn.Geometry.releaseMatrix4(cast this);
	}
	inline public function composeFromTransform3d(source:flight._hl.Transform3D):Void {
		flight._hl._fn.Geometry.composeMatrix4FromTransform3d(cast this, source);
	}
	inline public function free():Void {
		flight._hl._fn.Geometry.freeMatrix4(cast this);
	}
}
