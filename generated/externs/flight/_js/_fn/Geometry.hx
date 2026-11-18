package flight._js._fn;

@:jsRequire("@flighthq/geometry")
extern class Geometry {
	@:native("createAabb")
	public static function createAabb(minX:Float, minY:Float, minZ:Float, maxX:Float, maxY:Float, maxZ:Float):flight._js.Aabb;
	@:native("cloneAabb")
	public static function cloneAabb(source:flight._js.Aabb):flight._js.Aabb;
	@:native("containsAabbPoint")
	public static function containsAabbPoint(aabb:flight._js.Aabb, point:flight._js.Vector3):Bool;
	@:native("copyAabb")
	public static function copyAabb(out:flight._js.Aabb, source:flight._js.Aabb):Void;
	@:native("expandAabbByPoint")
	public static function expandAabbByPoint(out:flight._js.Aabb, aabb:flight._js.Aabb, point:flight._js.Vector3):Void;
	@:native("expandAabbBySphere")
	public static function expandAabbBySphere(out:flight._js.Aabb, aabb:flight._js.Aabb, sphere:flight._js.BoundingSphere):Void;
	@:native("getAabbCenter")
	public static function getAabbCenter(out:flight._js.Vector3, aabb:flight._js.Aabb):Void;
	@:native("getAabbExtents")
	public static function getAabbExtents(out:flight._js.Vector3, aabb:flight._js.Aabb):Void;
	@:native("getAabbSize")
	public static function getAabbSize(out:flight._js.Vector3, aabb:flight._js.Aabb):Void;
	@:native("getClosestPointOnAabb")
	public static function getClosestPointOnAabb(out:flight._js.Vector3, aabb:flight._js.Aabb, point:flight._js.Vector3):Void;
	@:native("intersectAabb")
	public static function intersectAabb(out:flight._js.Aabb, a:flight._js.Aabb, b:flight._js.Aabb):Void;
	@:native("isAabbIntersectingAabb")
	public static function isAabbIntersectingAabb(a:flight._js.Aabb, b:flight._js.Aabb):Bool;
	@:native("isAabbIntersectingSphere")
	public static function isAabbIntersectingSphere(aabb:flight._js.Aabb, sphere:flight._js.BoundingSphere):Bool;
	@:native("setAabb")
	public static function setAabb(out:flight._js.Aabb, minX:Float, minY:Float, minZ:Float, maxX:Float, maxY:Float, maxZ:Float):Void;
	@:native("setAabbFromPoints")
	public static function setAabbFromPoints(out:flight._js.Aabb, points:Dynamic):Void;
	@:native("transformAabbByMatrix4")
	public static function transformAabbByMatrix4(out:flight._js.Aabb, aabb:flight._js.Aabb, m:flight._js.Matrix4):Void;
	@:native("unionAabb")
	public static function unionAabb(out:flight._js.Aabb, a:flight._js.Aabb, b:flight._js.Aabb):Void;
	@:native("createBoundingSphere")
	public static function createBoundingSphere(centerX:Float, centerY:Float, centerZ:Float, radius:Float):flight._js.BoundingSphere;
	@:native("cloneBoundingSphere")
	public static function cloneBoundingSphere(source:flight._js.BoundingSphere):flight._js.BoundingSphere;
	@:native("containsBoundingSpherePoint")
	public static function containsBoundingSpherePoint(sphere:flight._js.BoundingSphere, point:flight._js.Vector3):Bool;
	@:native("copyBoundingSphere")
	public static function copyBoundingSphere(out:flight._js.BoundingSphere, source:flight._js.BoundingSphere):Void;
	@:native("getClosestPointOnBoundingSphere")
	public static function getClosestPointOnBoundingSphere(out:flight._js.Vector3, sphere:flight._js.BoundingSphere, point:flight._js.Vector3):Void;
	@:native("isBoundingSphereIntersectingBoundingSphere")
	public static function isBoundingSphereIntersectingBoundingSphere(a:flight._js.BoundingSphere, b:flight._js.BoundingSphere):Bool;
	@:native("mergeBoundingSphere")
	public static function mergeBoundingSphere(out:flight._js.BoundingSphere, a:flight._js.BoundingSphere, b:flight._js.BoundingSphere):Void;
	@:native("setBoundingSphere")
	public static function setBoundingSphere(out:flight._js.BoundingSphere, centerX:Float, centerY:Float, centerZ:Float, radius:Float):Void;
	@:native("setBoundingSphereFromAabb")
	public static function setBoundingSphereFromAabb(out:flight._js.BoundingSphere, aabb:flight._js.Aabb):Void;
	@:native("transformBoundingSphereByMatrix4")
	public static function transformBoundingSphereByMatrix4(out:flight._js.BoundingSphere, sphere:flight._js.BoundingSphere, m:flight._js.Matrix4):Void;
	@:native("createCapsule")
	public static function createCapsule(startX:Float, startY:Float, startZ:Float, endX:Float, endY:Float, endZ:Float, radius:Float):flight._js.Capsule;
	@:native("getClosestPointOnCapsule")
	public static function getClosestPointOnCapsule(out:flight._js.Vector3, capsule:flight._js.Capsule, point:flight._js.Vector3):Void;
	@:native("intersectRay3DCapsule")
	public static function intersectRay3dCapsule(ray:flight._js.Ray3D, capsule:flight._js.Capsule):Float;
	@:native("isCapsuleIntersectingAabb")
	public static function isCapsuleIntersectingAabb(capsule:flight._js.Capsule, aabb:flight._js.Aabb):Bool;
	@:native("isCapsuleIntersectingCapsule")
	public static function isCapsuleIntersectingCapsule(a:flight._js.Capsule, b:flight._js.Capsule):Bool;
	@:native("isCapsuleIntersectingSphere")
	public static function isCapsuleIntersectingSphere(capsule:flight._js.Capsule, sphere:flight._js.BoundingSphere):Bool;
	@:native("setCapsule")
	public static function setCapsule(out:flight._js.Capsule, startX:Float, startY:Float, startZ:Float, endX:Float, endY:Float, endZ:Float, radius:Float):Void;
	@:native("areGeometryPoolGuardsEnabled")
	public static function areGeometryPoolGuardsEnabled():Bool;
	@:native("disableGeometryPoolGuards")
	public static function disableGeometryPoolGuards():Void;
	@:native("enableGeometryPoolGuards")
	public static function enableGeometryPoolGuards(logState:Dynamic, clock:Dynamic):Void;
	@:native("createFrustum")
	public static function createFrustum():flight._js.Frustum;
	@:native("getFrustumCorners")
	public static function getFrustumCorners(out:Dynamic, inverseViewProjection:flight._js.Matrix4):Void;
	@:native("isFrustumContainingPoint")
	public static function isFrustumContainingPoint(frustum:flight._js.Frustum, point:flight._js.Vector3):Bool;
	@:native("isFrustumIntersectingAabb")
	public static function isFrustumIntersectingAabb(frustum:flight._js.Frustum, aabb:flight._js.Aabb):Bool;
	@:native("isFrustumIntersectingObb")
	public static function isFrustumIntersectingObb(frustum:flight._js.Frustum, obb:flight._js.Obb):Bool;
	@:native("isFrustumIntersectingSphere")
	public static function isFrustumIntersectingSphere(frustum:flight._js.Frustum, sphere:flight._js.BoundingSphere):Bool;
	@:native("setFrustumFromMatrix4")
	public static function setFrustumFromMatrix4(out:flight._js.Frustum, viewProjection:flight._js.Matrix4):Void;
	@:native("createGradientTransformMatrix")
	public static function createGradientTransformMatrix(width:Float, height:Float, rotation:Float, tx:Float, ty:Float):flight._js.Matrix;
	@:native("createMatrix")
	public static function createMatrix(a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):flight._js.Matrix;
	@:native("createTransformMatrix")
	public static function createTransformMatrix(scaleX:Float, scaleY:Float, rotation:Float, tx:Float, ty:Float):flight._js.Matrix;
	@:native("cloneMatrix")
	public static function cloneMatrix(source:flight._js.Matrix):flight._js.Matrix;
	@:native("copyMatrix")
	public static function copyMatrix(out:flight._js.Matrix, source:flight._js.Matrix):Void;
	@:native("copyMatrixColumnFromVector3")
	public static function copyMatrixColumnFromVector3(out:flight._js.Matrix, column:Int, source:flight._js.Vector3):Void;
	@:native("copyMatrixColumnToVector3")
	public static function copyMatrixColumnToVector3(out:flight._js.Vector3, column:Int, source:flight._js.Matrix):Void;
	@:native("copyMatrixRowFromVector3")
	public static function copyMatrixRowFromVector3(out:flight._js.Matrix, row:Int, source:flight._js.Vector3):Void;
	@:native("copyMatrixRowToVector3")
	public static function copyMatrixRowToVector3(out:flight._js.Vector3, row:Int, source:flight._js.Matrix):Void;
	@:native("equalsMatrix")
	public static function equalsMatrix(a:Null<flight._js.Matrix>, b:Null<flight._js.Matrix>, compareTranslation:Bool):Bool;
	@:native("inverseMatrix")
	public static function inverseMatrix(out:flight._js.Matrix, source:flight._js.Matrix):Bool;
	@:native("inverseMatrixTransformPoint")
	public static function inverseMatrixTransformPoint(out:flight._js.Vector2, matrix:flight._js.Matrix, point:flight._js.Vector2):Void;
	@:native("inverseMatrixTransformPointXY")
	public static function inverseMatrixTransformPointXy(out:flight._js.Vector2, source:flight._js.Matrix, x:Float, y:Float):Void;
	@:native("inverseMatrixTransformVector")
	public static function inverseMatrixTransformVector(out:flight._js.Vector2, matrix:flight._js.Matrix, vector:flight._js.Vector2):Void;
	@:native("inverseMatrixTransformVectorXY")
	public static function inverseMatrixTransformVectorXy(out:flight._js.Vector2, source:flight._js.Matrix, x:Float, y:Float):Void;
	@:native("matrixTransformBounds")
	public static function matrixTransformBounds(out:flight._js.Rectangle, source:flight._js.Matrix, ax:Float, ay:Float, bx:Float, by:Float):Void;
	@:native("matrixTransformBoundsVector2")
	public static function matrixTransformBoundsVector2(out:flight._js.Rectangle, matrix:flight._js.Matrix, a:flight._js.Vector2, b:flight._js.Vector2):Void;
	@:native("matrixTransformPoint")
	public static function matrixTransformPoint(out:flight._js.Vector2, matrix:flight._js.Matrix, point:flight._js.Vector2):Void;
	@:native("matrixTransformPointXY")
	public static function matrixTransformPointXy(out:flight._js.Vector2, source:flight._js.Matrix, x:Float, y:Float):Void;
	@:native("matrixTransformRectangle")
	public static function matrixTransformRectangle(out:flight._js.Rectangle, matrix:flight._js.Matrix, source:flight._js.Rectangle):Void;
	@:native("matrixTransformVector")
	public static function matrixTransformVector(out:flight._js.Vector2, matrix:flight._js.Matrix, vector:flight._js.Vector2):Void;
	@:native("matrixTransformVectorXY")
	public static function matrixTransformVectorXy(out:flight._js.Vector2, source:flight._js.Matrix, x:Float, y:Float):Void;
	@:native("multiplyMatrix")
	public static function multiplyMatrix(out:flight._js.Matrix, a:flight._js.Matrix, b:flight._js.Matrix):Void;
	@:native("rotateMatrix")
	public static function rotateMatrix(out:flight._js.Matrix, source:flight._js.Matrix, theta:Float):Void;
	@:native("scaleMatrix")
	public static function scaleMatrix(out:flight._js.Matrix, source:flight._js.Matrix, sx:Float, sy:Float):Void;
	@:native("setGradientTransformMatrix")
	public static function setGradientTransformMatrix(out:flight._js.Matrix, width:Float, height:Float, rotation:Float, tx:Float, ty:Float):Void;
	@:native("setMatrix")
	public static function setMatrix(out:flight._js.Matrix, a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):Void;
	@:native("setMatrixFromFloat32Array")
	public static function setMatrixFromFloat32Array(out:flight._js.Matrix, offset:Int, source:Dynamic):Void;
	@:native("setMatrixFromMatrix3")
	public static function setMatrixFromMatrix3(out:flight._js.Matrix, source:flight._js.Matrix3):Void;
	@:native("setMatrixFromMatrix4")
	public static function setMatrixFromMatrix4(out:flight._js.Matrix, source:flight._js.Matrix4):Void;
	@:native("setMatrixIdentity")
	public static function setMatrixIdentity(out:flight._js.Matrix):Void;
	@:native("setTransformMatrix")
	public static function setTransformMatrix(out:flight._js.Matrix, scaleX:Float, scaleY:Float, rotation:Float, tx:Float, ty:Float):Void;
	@:native("translateMatrix")
	public static function translateMatrix(out:flight._js.Matrix, source:flight._js.Matrix, dx:Float, dy:Float):Void;
	@:native("translateMatrixByVector")
	public static function translateMatrixByVector(out:flight._js.Matrix, matrix:flight._js.Matrix, vector:flight._js.Vector2):Void;
	@:native("translateMatrixByVectorXY")
	public static function translateMatrixByVectorXy(out:flight._js.Matrix, source:flight._js.Matrix, x:Float, y:Float):Void;
	@:native("writeMatrixToFloat32Array")
	public static function writeMatrixToFloat32Array(out:Dynamic, offset:Int, source:flight._js.Matrix):Void;
	@:native("createMatrix3")
	public static function createMatrix3():flight._js.Matrix3;
	@:native("createMatrix3FromValues")
	public static function createMatrix3FromValues(m00:Float, m01:Float, m02:Float, m10:Float, m11:Float, m12:Float, m20:Float, m21:Float, m22:Float):flight._js.Matrix3;
	@:native("cloneMatrix3")
	public static function cloneMatrix3(source:flight._js.Matrix3):flight._js.Matrix3;
	@:native("copyMatrix3")
	public static function copyMatrix3(out:flight._js.Matrix3, source:flight._js.Matrix3):Void;
	@:native("copyMatrix3ColumnFromVector3")
	public static function copyMatrix3ColumnFromVector3(out:flight._js.Matrix3, column:Int, source:flight._js.Vector3):Void;
	@:native("copyMatrix3ColumnToVector3")
	public static function copyMatrix3ColumnToVector3(out:flight._js.Vector3, column:Int, source:flight._js.Matrix3):Void;
	@:native("copyMatrix3RowFromVector3")
	public static function copyMatrix3RowFromVector3(out:flight._js.Matrix3, row:Int, source:flight._js.Vector3):Void;
	@:native("copyMatrix3RowToVector3")
	public static function copyMatrix3RowToVector3(out:flight._js.Vector3, row:Int, source:flight._js.Matrix3):Void;
	@:native("equalsMatrix3")
	public static function equalsMatrix3(a:Null<flight._js.Matrix3>, b:Null<flight._js.Matrix3>):Bool;
	@:native("getMatrix3Determinant")
	public static function getMatrix3Determinant(source:flight._js.Matrix3):Float;
	@:native("getMatrix3Element")
	public static function getMatrix3Element(source:flight._js.Matrix3, row:Int, column:Int):Float;
	@:native("inverseMatrix3")
	public static function inverseMatrix3(out:flight._js.Matrix3, source:flight._js.Matrix3):Bool;
	@:native("isAffineMatrix3")
	public static function isAffineMatrix3(source:flight._js.Matrix3):Bool;
	@:native("multiplyMatrix3")
	public static function multiplyMatrix3(out:flight._js.Matrix3, a:flight._js.Matrix3, b:flight._js.Matrix3):Void;
	@:native("rotateMatrix3")
	public static function rotateMatrix3(out:flight._js.Matrix3, source:flight._js.Matrix3, theta:Float):Void;
	@:native("scaleMatrix3")
	public static function scaleMatrix3(out:flight._js.Matrix3, source:flight._js.Matrix3, sx:Float, sy:Float):Void;
	@:native("setMatrix3")
	public static function setMatrix3(out:flight._js.Matrix3, m00:Float, m01:Float, m02:Float, m10:Float, m11:Float, m12:Float, m20:Float, m21:Float, m22:Float):Void;
	@:native("setMatrix3Element")
	public static function setMatrix3Element(out:flight._js.Matrix3, row:Int, column:Int, value:Float):Void;
	@:native("setMatrix3FromFloat32Array")
	public static function setMatrix3FromFloat32Array(out:flight._js.Matrix3, offset:Int, source:Dynamic):Void;
	@:native("setMatrix3FromMatrix")
	public static function setMatrix3FromMatrix(out:flight._js.Matrix3, source:flight._js.Matrix):Void;
	@:native("setMatrix3FromMatrix4")
	public static function setMatrix3FromMatrix4(out:flight._js.Matrix3, source:flight._js.Matrix4):Void;
	@:native("setMatrix3Identity")
	public static function setMatrix3Identity(out:flight._js.Matrix3):Void;
	@:native("setMatrix3NormalFromMatrix4")
	public static function setMatrix3NormalFromMatrix4(out:flight._js.Matrix3, source:flight._js.Matrix4):Void;
	@:native("translateMatrix3")
	public static function translateMatrix3(out:flight._js.Matrix3, source:flight._js.Matrix3, tx:Float, ty:Float):Void;
	@:native("transposeMatrix3")
	public static function transposeMatrix3(out:flight._js.Matrix3, source:flight._js.Matrix3):Void;
	@:native("writeMatrix3ToFloat32Array")
	public static function writeMatrix3ToFloat32Array(out:Dynamic, offset:Int, source:flight._js.Matrix3):Void;
	@:native("acquireIdentityMatrix3")
	public static function acquireIdentityMatrix3():flight._js.Matrix3;
	@:native("acquireMatrix3")
	public static function acquireMatrix3():flight._js.Matrix3;
	@:native("clearMatrix3Pool")
	public static function clearMatrix3Pool():Void;
	@:native("releaseMatrix3")
	public static function releaseMatrix3(m:flight._js.Matrix3):Void;
	@:native("createMatrix4")
	public static function createMatrix4():flight._js.Matrix4;
	@:native("createMatrix4From2D")
	public static function createMatrix4From2d(a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):flight._js.Matrix4;
	@:native("createMatrix4FromValues")
	public static function createMatrix4FromValues(m00:Float, m01:Float, m02:Float, m03:Float, m10:Float, m11:Float, m12:Float, m13:Float, m20:Float, m21:Float, m22:Float, m23:Float, m30:Float, m31:Float, m32:Float, m33:Float):flight._js.Matrix4;
	@:native("createOrthographicMatrix4")
	public static function createOrthographicMatrix4(left:Float, right:Float, bottom:Float, top:Float, zNear:Float, zFar:Float):flight._js.Matrix4;
	@:native("createPerspectiveMatrix4")
	public static function createPerspectiveMatrix4(tanHalfFovY:Float, aspect:Float, zNear:Float, zFar:Float):flight._js.Matrix4;
	@:native("appendMatrix4")
	public static function appendMatrix4(out:flight._js.Matrix4, source:flight._js.Matrix4, other:flight._js.Matrix4):Void;
	@:native("appendRotationMatrix4")
	public static function appendRotationMatrix4(out:flight._js.Matrix4, source:flight._js.Matrix4, radians:Float, axis:flight._js.Vector4, pivotPoint:Null<flight._js.Vector4>):Void;
	@:native("appendScaleMatrix4")
	public static function appendScaleMatrix4(out:flight._js.Matrix4, source:flight._js.Matrix4, xScale:Float, yScale:Float, zScale:Float):Void;
	@:native("appendTranslationMatrix4")
	public static function appendTranslationMatrix4(out:flight._js.Matrix4, source:flight._js.Matrix4, x:Float, y:Float, z:Float):Void;
	@:native("cloneMatrix4")
	public static function cloneMatrix4(source:flight._js.Matrix4):flight._js.Matrix4;
	@:native("composeMatrix4")
	public static function composeMatrix4(out:flight._js.Matrix4, position:flight._js.Vector3, rotation:flight._js.Quaternion, scale:flight._js.Vector3):Void;
	@:native("copyMatrix4")
	public static function copyMatrix4(out:flight._js.Matrix4, source:flight._js.Matrix4):Void;
	@:native("copyMatrix4ColumnFromVector4")
	public static function copyMatrix4ColumnFromVector4(out:flight._js.Matrix4, column:Int, source:flight._js.Vector4):Void;
	@:native("copyMatrix4ColumnToVector4")
	public static function copyMatrix4ColumnToVector4(out:flight._js.Vector4, column:Int, source:flight._js.Matrix4):Void;
	@:native("copyMatrix4RowFromVector4")
	public static function copyMatrix4RowFromVector4(out:flight._js.Matrix4, row:Int, source:flight._js.Vector4):Void;
	@:native("copyMatrix4RowToVector4")
	public static function copyMatrix4RowToVector4(out:flight._js.Vector4, row:Int, source:flight._js.Matrix4):Void;
	@:native("decomposeMatrix4")
	public static function decomposeMatrix4(outPosition:flight._js.Vector3, outRotation:flight._js.Quaternion, outScale:flight._js.Vector3, m:flight._js.Matrix4):Void;
	@:native("equalsMatrix4")
	public static function equalsMatrix4(a:Null<flight._js.Matrix4>, b:Null<flight._js.Matrix4>):Bool;
	@:native("getMatrix4Determinant")
	public static function getMatrix4Determinant(source:flight._js.Matrix4):Float;
	@:native("getMatrix4Element")
	public static function getMatrix4Element(source:flight._js.Matrix4, row:Int, column:Int):Float;
	@:native("getMatrix4Position")
	public static function getMatrix4Position(out:flight._js.Vector3, source:flight._js.Matrix4):Void;
	@:native("interpolateMatrix4")
	public static function interpolateMatrix4(out:flight._js.Matrix4, a:flight._js.Matrix4, b:flight._js.Matrix4, t:Float):Void;
	@:native("inverseMatrix4")
	public static function inverseMatrix4(out:flight._js.Matrix4, source:flight._js.Matrix4):Bool;
	@:native("isAffineMatrix4")
	public static function isAffineMatrix4(source:flight._js.Matrix4):Bool;
	@:native("matrix4TransformPoint")
	public static function matrix4TransformPoint(out:flight._js.Vector3, source:flight._js.Matrix4, point:flight._js.Vector3):Void;
	@:native("matrix4TransformVector")
	public static function matrix4TransformVector(out:flight._js.Vector4, source:flight._js.Matrix4, vector:flight._js.Vector4):Void;
	@:native("matrix4TransformVectors")
	public static function matrix4TransformVectors(out:Dynamic, source:flight._js.Matrix4, vectors:Dynamic):Void;
	@:native("multiplyMatrix4")
	public static function multiplyMatrix4(out:flight._js.Matrix4, a:flight._js.Matrix4, b:flight._js.Matrix4):Void;
	@:native("prependMatrix4")
	public static function prependMatrix4(out:flight._js.Matrix4, source:flight._js.Matrix4, other:flight._js.Matrix4):Void;
	@:native("prependRotationMatrix4")
	public static function prependRotationMatrix4(out:flight._js.Matrix4, source:flight._js.Matrix4, radians:Float, axis:flight._js.Vector4, pivotPoint:Null<flight._js.Vector4>):Void;
	@:native("prependScaleMatrix4")
	public static function prependScaleMatrix4(out:flight._js.Matrix4, source:flight._js.Matrix4, xScale:Float, yScale:Float, zScale:Float):Void;
	@:native("prependTranslationMatrix4")
	public static function prependTranslationMatrix4(out:flight._js.Matrix4, source:flight._js.Matrix4, x:Float, y:Float, z:Float):Void;
	@:native("rotateMatrix4")
	public static function rotateMatrix4(out:flight._js.Matrix4, source:flight._js.Matrix4, axis:flight._js.Vector3, radians:Float):Void;
	@:native("scaleMatrix4")
	public static function scaleMatrix4(out:flight._js.Matrix4, source:flight._js.Matrix4, sx:Float, sy:Float, sz:Float):Void;
	@:native("setMatrix4")
	public static function setMatrix4(out:flight._js.Matrix4, m00:Float, m01:Float, m02:Float, m03:Float, m10:Float, m11:Float, m12:Float, m13:Float, m20:Float, m21:Float, m22:Float, m23:Float, m30:Float, m31:Float, m32:Float, m33:Float):Void;
	@:native("setMatrix4Element")
	public static function setMatrix4Element(out:flight._js.Matrix4, row:Int, column:Int, value:Float):Void;
	@:native("setMatrix4From2D")
	public static function setMatrix4From2d(out:flight._js.Matrix4, a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):Void;
	@:native("setMatrix4FromFloat32Array")
	public static function setMatrix4FromFloat32Array(out:flight._js.Matrix4, offset:Int, source:Dynamic):Void;
	@:native("setMatrix4FromMatrix")
	public static function setMatrix4FromMatrix(out:flight._js.Matrix4, source:flight._js.Matrix):Void;
	@:native("setMatrix4FromMatrix3")
	public static function setMatrix4FromMatrix3(out:flight._js.Matrix4, source:flight._js.Matrix3):Void;
	@:native("setMatrix4FromQuaternion")
	public static function setMatrix4FromQuaternion(out:flight._js.Matrix4, source:flight._js.Quaternion):Void;
	@:native("setMatrix4Identity")
	public static function setMatrix4Identity(out:flight._js.Matrix4):Void;
	@:native("setMatrix4LookAt")
	public static function setMatrix4LookAt(out:flight._js.Matrix4, eye:flight._js.Vector3, target:flight._js.Vector3, up:flight._js.Vector3):Void;
	@:native("setMatrix4Position")
	public static function setMatrix4Position(out:flight._js.Matrix4, source:flight._js.Vector3):Void;
	@:native("setOrthographicMatrix4")
	public static function setOrthographicMatrix4(out:flight._js.Matrix4, left:Float, right:Float, bottom:Float, top:Float, zNear:Float, zFar:Float):Void;
	@:native("setPerspectiveMatrix4")
	public static function setPerspectiveMatrix4(out:flight._js.Matrix4, tanHalfFovY:Float, aspect:Float, zNear:Float, zFar:Float):Void;
	@:native("translateMatrix4")
	public static function translateMatrix4(out:flight._js.Matrix4, source:flight._js.Matrix4, tx:Float, ty:Float, tz:Float):Void;
	@:native("transposeMatrix4")
	public static function transposeMatrix4(out:flight._js.Matrix4, source:flight._js.Matrix4):Void;
	@:native("writeMatrix4ToFloat32Array")
	public static function writeMatrix4ToFloat32Array(out:Dynamic, offset:Int, source:flight._js.Matrix4):Void;
	@:native("acquireIdentityMatrix4")
	public static function acquireIdentityMatrix4():flight._js.Matrix4;
	@:native("acquireMatrix4")
	public static function acquireMatrix4():flight._js.Matrix4;
	@:native("clearMatrix4Pool")
	public static function clearMatrix4Pool():Void;
	@:native("releaseMatrix4")
	public static function releaseMatrix4(m:flight._js.Matrix4):Void;
	@:native("acquireIdentityMatrix")
	public static function acquireIdentityMatrix():flight._js.Matrix;
	@:native("acquireMatrix")
	public static function acquireMatrix():flight._js.Matrix;
	@:native("clearMatrixPool")
	public static function clearMatrixPool():Void;
	@:native("releaseMatrix")
	public static function releaseMatrix(m:flight._js.Matrix):Void;
	@:native("createObb")
	public static function createObb(centerX:Float, centerY:Float, centerZ:Float, halfExtentX:Float, halfExtentY:Float, halfExtentZ:Float, orientationX:Float, orientationY:Float, orientationZ:Float, orientationW:Float):flight._js.Obb;
	@:native("getClosestPointOnObb")
	public static function getClosestPointOnObb(out:flight._js.Vector3, obb:flight._js.Obb, point:flight._js.Vector3):Void;
	@:native("intersectRay3DObb")
	public static function intersectRay3dObb(ray:flight._js.Ray3D, obb:flight._js.Obb):Float;
	@:native("isObbIntersectingAabb")
	public static function isObbIntersectingAabb(obb:flight._js.Obb, aabb:flight._js.Aabb):Bool;
	@:native("isObbIntersectingObb")
	public static function isObbIntersectingObb(a:flight._js.Obb, b:flight._js.Obb):Bool;
	@:native("isObbIntersectingSphere")
	public static function isObbIntersectingSphere(obb:flight._js.Obb, sphere:flight._js.BoundingSphere):Bool;
	@:native("setObb")
	public static function setObb(out:flight._js.Obb, centerX:Float, centerY:Float, centerZ:Float, halfExtentX:Float, halfExtentY:Float, halfExtentZ:Float, orientationX:Float, orientationY:Float, orientationZ:Float, orientationW:Float):Void;
	@:native("transformObbByMatrix4")
	public static function transformObbByMatrix4(out:flight._js.Obb, obb:flight._js.Obb, m:flight._js.Matrix4):Void;
	@:native("createPlane")
	public static function createPlane(a:Float, b:Float, c:Float, d:Float):flight._js.Plane;
	@:native("clonePlane")
	public static function clonePlane(source:flight._js.Plane):flight._js.Plane;
	@:native("copyPlane")
	public static function copyPlane(out:flight._js.Plane, source:flight._js.Plane):Void;
	@:native("getClosestPointOnPlane")
	public static function getClosestPointOnPlane(out:flight._js.Vector3, plane:flight._js.Plane, point:flight._js.Vector3):Void;
	@:native("getPlaneCoplanarPoint")
	public static function getPlaneCoplanarPoint(out:flight._js.Vector3, plane:flight._js.Plane):Void;
	@:native("getPlaneSignedDistanceToPoint")
	public static function getPlaneSignedDistanceToPoint(plane:flight._js.Plane, point:flight._js.Vector3):Float;
	@:native("normalizePlane")
	public static function normalizePlane(out:flight._js.Plane, source:flight._js.Plane):Void;
	@:native("projectVector3OntoPlane")
	public static function projectVector3OntoPlane(out:flight._js.Vector3, point:flight._js.Vector3, plane:flight._js.Plane):Void;
	@:native("setPlane")
	public static function setPlane(out:flight._js.Plane, a:Float, b:Float, c:Float, d:Float):Void;
	@:native("setPlaneFromNormalAndPoint")
	public static function setPlaneFromNormalAndPoint(out:flight._js.Plane, normal:flight._js.Vector3, point:flight._js.Vector3):Void;
	@:native("setPlaneFromPoints")
	public static function setPlaneFromPoints(out:flight._js.Plane, a:flight._js.Vector3, b:flight._js.Vector3, c:flight._js.Vector3):Void;
	@:native("createQuaternion")
	public static function createQuaternion(x:Float, y:Float, z:Float, w:Float):flight._js.Quaternion;
	@:native("cloneQuaternion")
	public static function cloneQuaternion(source:flight._js.Quaternion):flight._js.Quaternion;
	@:native("conjugateQuaternion")
	public static function conjugateQuaternion(out:flight._js.Quaternion, source:flight._js.Quaternion):Void;
	@:native("copyQuaternion")
	public static function copyQuaternion(out:flight._js.Quaternion, source:flight._js.Quaternion):Void;
	@:native("equalsQuaternion")
	public static function equalsQuaternion(a:Null<flight._js.Quaternion>, b:Null<flight._js.Quaternion>):Bool;
	@:native("getQuaternionAngleBetween")
	public static function getQuaternionAngleBetween(a:flight._js.Quaternion, b:flight._js.Quaternion):Float;
	@:native("getQuaternionAxisAngle")
	public static function getQuaternionAxisAngle(outAxis:flight._js.Vector3, source:flight._js.Quaternion):Float;
	@:native("getQuaternionDot")
	public static function getQuaternionDot(a:flight._js.Quaternion, b:flight._js.Quaternion):Float;
	@:native("getQuaternionEuler")
	public static function getQuaternionEuler(out:flight._js.Vector3, source:flight._js.Quaternion, order:Dynamic):Void;
	@:native("inverseQuaternion")
	public static function inverseQuaternion(out:flight._js.Quaternion, source:flight._js.Quaternion):Void;
	@:native("multiplyQuaternion")
	public static function multiplyQuaternion(out:flight._js.Quaternion, a:flight._js.Quaternion, b:flight._js.Quaternion):Void;
	@:native("normalizeQuaternion")
	public static function normalizeQuaternion(out:flight._js.Quaternion, source:flight._js.Quaternion):Float;
	@:native("rotateVector3ByQuaternion")
	public static function rotateVector3ByQuaternion(out:flight._js.Vector3, vector:flight._js.Vector3, q:flight._js.Quaternion):Void;
	@:native("setQuaternion")
	public static function setQuaternion(out:flight._js.Quaternion, x:Float, y:Float, z:Float, w:Float):Void;
	@:native("setQuaternionFromAxisAngle")
	public static function setQuaternionFromAxisAngle(out:flight._js.Quaternion, axis:flight._js.Vector3, angle:Float):Void;
	@:native("setQuaternionFromEuler")
	public static function setQuaternionFromEuler(out:flight._js.Quaternion, x:Float, y:Float, z:Float, order:Dynamic):Void;
	@:native("setQuaternionFromMatrix4")
	public static function setQuaternionFromMatrix4(out:flight._js.Quaternion, source:flight._js.Matrix4):Void;
	@:native("setQuaternionFromUnitVectors")
	public static function setQuaternionFromUnitVectors(out:flight._js.Quaternion, from:flight._js.Vector3, to:flight._js.Vector3):Void;
	@:native("setQuaternionIdentity")
	public static function setQuaternionIdentity(out:flight._js.Quaternion):Void;
	@:native("setQuaternionLookRotation")
	public static function setQuaternionLookRotation(out:flight._js.Quaternion, forward:flight._js.Vector3, up:flight._js.Vector3):Void;
	@:native("slerpQuaternion")
	public static function slerpQuaternion(out:flight._js.Quaternion, a:flight._js.Quaternion, b:flight._js.Quaternion, t:Float):Void;
	@:native("acquireIdentityQuaternion")
	public static function acquireIdentityQuaternion():flight._js.Quaternion;
	@:native("acquireQuaternion")
	public static function acquireQuaternion():flight._js.Quaternion;
	@:native("clearQuaternionPool")
	public static function clearQuaternionPool():Void;
	@:native("releaseQuaternion")
	public static function releaseQuaternion(q:flight._js.Quaternion):Void;
	@:native("createRay3D")
	public static function createRay3d(originX:Float, originY:Float, originZ:Float, directionX:Float, directionY:Float, directionZ:Float):flight._js.Ray3D;
	@:native("getClosestPointBetweenRay3ds")
	public static function getClosestPointBetweenRay3ds(outA:flight._js.Vector3, outB:flight._js.Vector3, a:flight._js.Ray3D, b:flight._js.Ray3D):Void;
	@:native("getClosestPointOnRay3D")
	public static function getClosestPointOnRay3d(out:flight._js.Vector3, ray:flight._js.Ray3D, point:flight._js.Vector3):Void;
	@:native("getRay3DPointAt")
	public static function getRay3dPointAt(out:flight._js.Vector3, ray:flight._js.Ray3D, t:Float):Void;
	@:native("intersectRay3DAabb")
	public static function intersectRay3dAabb(ray:flight._js.Ray3D, aabb:flight._js.Aabb):Float;
	@:native("intersectRay3DPlane")
	public static function intersectRay3dPlane(ray:flight._js.Ray3D, plane:flight._js.Plane):Float;
	@:native("intersectRay3DSphere")
	public static function intersectRay3dSphere(ray:flight._js.Ray3D, sphere:flight._js.BoundingSphere):Float;
	@:native("intersectRay3DTriangle")
	public static function intersectRay3dTriangle(ray:flight._js.Ray3D, a:flight._js.Vector3, b:flight._js.Vector3, c:flight._js.Vector3):Float;
	@:native("setRay3D")
	public static function setRay3d(out:flight._js.Ray3D, origin:flight._js.Vector3, direction:flight._js.Vector3):Void;
	@:native("transformRay3DByMatrix4")
	public static function transformRay3dByMatrix4(out:flight._js.Ray3D, ray:flight._js.Ray3D, m:flight._js.Matrix4):Void;
	@:native("createRectangle")
	public static function createRectangle(x:Float, y:Float, width:Float, height:Float):flight._js.Rectangle;
	@:native("cloneRectangle")
	public static function cloneRectangle(source:flight._js.Rectangle):flight._js.Rectangle;
	@:native("computeRectangleIntersection")
	public static function computeRectangleIntersection(out:flight._js.Rectangle, a:flight._js.Rectangle, b:flight._js.Rectangle):Void;
	@:native("containsRectanglePoint")
	public static function containsRectanglePoint(source:flight._js.Rectangle, vector:flight._js.Vector2):Bool;
	@:native("containsRectanglePointXY")
	public static function containsRectanglePointXy(source:flight._js.Rectangle, x:Float, y:Float):Bool;
	@:native("copyRectangle")
	public static function copyRectangle(out:flight._js.Rectangle, source:flight._js.Rectangle):Void;
	@:native("enclosesRectangle")
	public static function enclosesRectangle(source:flight._js.Rectangle, other:flight._js.Rectangle):Bool;
	@:native("equalsRectangle")
	public static function equalsRectangle(a:Null<flight._js.Rectangle>, b:Null<flight._js.Rectangle>):Bool;
	@:native("expandRectangleToPoint")
	public static function expandRectangleToPoint(out:flight._js.Rectangle, sourceRect:flight._js.Rectangle, sourceVec2:flight._js.Vector2):Void;
	@:native("getRectangleBottom")
	public static function getRectangleBottom(source:flight._js.Rectangle):Float;
	@:native("getRectangleBottomRight")
	public static function getRectangleBottomRight(out:flight._js.Vector2, source:flight._js.Rectangle):Void;
	@:native("getRectangleLeft")
	public static function getRectangleLeft(source:flight._js.Rectangle):Float;
	@:native("getRectangleMaxX")
	public static function getRectangleMaxX(source:flight._js.Rectangle):Float;
	@:native("getRectangleMaxY")
	public static function getRectangleMaxY(source:flight._js.Rectangle):Float;
	@:native("getRectangleMinX")
	public static function getRectangleMinX(source:flight._js.Rectangle):Float;
	@:native("getRectangleMinY")
	public static function getRectangleMinY(source:flight._js.Rectangle):Float;
	@:native("getRectangleNormalizedBottomRight")
	public static function getRectangleNormalizedBottomRight(out:flight._js.Vector2, source:flight._js.Rectangle):Void;
	@:native("getRectangleNormalizedTopLeft")
	public static function getRectangleNormalizedTopLeft(out:flight._js.Vector2, source:flight._js.Rectangle):Void;
	@:native("getRectangleRight")
	public static function getRectangleRight(source:flight._js.Rectangle):Float;
	@:native("getRectangleSize")
	public static function getRectangleSize(out:flight._js.Vector2, source:flight._js.Rectangle):Void;
	@:native("getRectangleTop")
	public static function getRectangleTop(source:flight._js.Rectangle):Float;
	@:native("getRectangleTopLeft")
	public static function getRectangleTopLeft(out:flight._js.Vector2, source:flight._js.Rectangle):Void;
	@:native("inflateRectangle")
	public static function inflateRectangle(out:flight._js.Rectangle, source:flight._js.Rectangle, dx:Float, dy:Float):Void;
	@:native("intersectsRectangle")
	public static function intersectsRectangle(a:flight._js.Rectangle, b:flight._js.Rectangle):Bool;
	@:native("isEmptyRectangle")
	public static function isEmptyRectangle(source:flight._js.Rectangle):Bool;
	@:native("isFlippedXRectangle")
	public static function isFlippedXRectangle(source:flight._js.Rectangle):Bool;
	@:native("isFlippedYRectangle")
	public static function isFlippedYRectangle(source:flight._js.Rectangle):Bool;
	@:native("mergeRectangle")
	public static function mergeRectangle(out:flight._js.Rectangle, source:flight._js.Rectangle, other:flight._js.Rectangle):Void;
	@:native("normalizeRectangle")
	public static function normalizeRectangle(out:flight._js.Rectangle, source:flight._js.Rectangle):Void;
	@:native("offsetRectangle")
	public static function offsetRectangle(out:flight._js.Rectangle, source:flight._js.Rectangle, dx:Float, dy:Float):Void;
	@:native("offsetRectangleByPoint")
	public static function offsetRectangleByPoint(out:flight._js.Rectangle, source:flight._js.Rectangle, point:flight._js.Vector2):Void;
	@:native("setEmptyRectangle")
	public static function setEmptyRectangle(out:flight._js.Rectangle):Void;
	@:native("setRectangle")
	public static function setRectangle(out:flight._js.Rectangle, x:Float, y:Float, width:Float, height:Float):Void;
	@:native("setRectangleBottom")
	public static function setRectangleBottom(target:flight._js.Rectangle, value:Float):Void;
	@:native("setRectangleBottomRight")
	public static function setRectangleBottomRight(target:flight._js.Rectangle, point:flight._js.Vector2):Void;
	@:native("setRectangleLeft")
	public static function setRectangleLeft(target:flight._js.Rectangle, value:Float):Void;
	@:native("setRectangleRight")
	public static function setRectangleRight(target:flight._js.Rectangle, value:Float):Void;
	@:native("setRectangleSize")
	public static function setRectangleSize(out:flight._js.Rectangle, size:flight._js.Vector2):Void;
	@:native("setRectangleTop")
	public static function setRectangleTop(target:flight._js.Rectangle, value:Float):Void;
	@:native("setRectangleTopLeft")
	public static function setRectangleTopLeft(out:flight._js.Rectangle, point:flight._js.Vector2):Void;
	@:native("acquireEmptyRectangle")
	public static function acquireEmptyRectangle():flight._js.Rectangle;
	@:native("acquireRectangle")
	public static function acquireRectangle():flight._js.Rectangle;
	@:native("clearRectanglePool")
	public static function clearRectanglePool():Void;
	@:native("releaseRectangle")
	public static function releaseRectangle(r:flight._js.Rectangle):Void;
	@:native("createTransform2D")
	public static function createTransform2d(x:Float, y:Float, rotation:Float, scaleX:Float, scaleY:Float, skewX:Float, skewY:Float, pivotX:Float, pivotY:Float):flight._js.Transform2D;
	@:native("decomposeMatrixToTransform2D")
	public static function decomposeMatrixToTransform2d(out:flight._js.Transform2D, source:flight._js.Matrix):Void;
	@:native("createTransform3D")
	public static function createTransform3d():flight._js.Transform3D;
	@:native("composeMatrix4FromTransform3D")
	public static function composeMatrix4FromTransform3d(out:flight._js.Matrix4, source:flight._js.Transform3D):Void;
	@:native("decomposeMatrix4ToTransform3D")
	public static function decomposeMatrix4ToTransform3d(out:flight._js.Transform3D, m:flight._js.Matrix4):Void;
	@:native("reserveFloat32Array")
	public static function reserveFloat32Array(array:Dynamic, capacity:Int):Dynamic;
	@:native("reserveInt16Array")
	public static function reserveInt16Array(array:Dynamic, capacity:Int):Dynamic;
	@:native("reserveUint16Array")
	public static function reserveUint16Array(array:Dynamic, capacity:Int):Dynamic;
	@:native("createVector2")
	public static function createVector2(x:Float, y:Float):flight._js.Vector2;
	@:native("createVector2FromPolar")
	public static function createVector2FromPolar(length:Float, angle:Float):flight._js.Vector2;
	@:native("addVector2")
	public static function addVector2(out:flight._js.Vector2, a:flight._js.Vector2, b:flight._js.Vector2):Void;
	@:native("clampVector2")
	public static function clampVector2(out:flight._js.Vector2, value:flight._js.Vector2, min:flight._js.Vector2, max:flight._js.Vector2):Void;
	@:native("cloneVector2")
	public static function cloneVector2(source:flight._js.Vector2):flight._js.Vector2;
	@:native("copyVector2")
	public static function copyVector2(out:flight._js.Vector2, source:flight._js.Vector2):Void;
	@:native("crossVector2")
	public static function crossVector2(a:flight._js.Vector2, b:flight._js.Vector2):Float;
	@:native("divideVector2")
	public static function divideVector2(out:flight._js.Vector2, source:flight._js.Vector2, divisor:flight._js.Vector2):Void;
	@:native("equalsVector2")
	public static function equalsVector2(a:Null<flight._js.Vector2>, b:Null<flight._js.Vector2>):Bool;
	@:native("getVector2Angle")
	public static function getVector2Angle(source:flight._js.Vector2):Float;
	@:native("getVector2AngleBetween")
	public static function getVector2AngleBetween(a:flight._js.Vector2, b:flight._js.Vector2):Float;
	@:native("getVector2Distance")
	public static function getVector2Distance(a:flight._js.Vector2, b:flight._js.Vector2):Float;
	@:native("getVector2DistanceSquared")
	public static function getVector2DistanceSquared(a:flight._js.Vector2, b:flight._js.Vector2):Float;
	@:native("getVector2Dot")
	public static function getVector2Dot(a:flight._js.Vector2, b:flight._js.Vector2):Float;
	@:native("getVector2Length")
	public static function getVector2Length(source:flight._js.Vector2):Float;
	@:native("getVector2LengthSquared")
	public static function getVector2LengthSquared(source:flight._js.Vector2):Float;
	@:native("interpolateVector2")
	public static function interpolateVector2(out:flight._js.Vector2, a:flight._js.Vector2, b:flight._js.Vector2, t:Float):Void;
	@:native("maxVector2")
	public static function maxVector2(out:flight._js.Vector2, a:flight._js.Vector2, b:flight._js.Vector2):Void;
	@:native("minVector2")
	public static function minVector2(out:flight._js.Vector2, a:flight._js.Vector2, b:flight._js.Vector2):Void;
	@:native("multiplyVector2")
	public static function multiplyVector2(out:flight._js.Vector2, a:flight._js.Vector2, b:flight._js.Vector2):Void;
	@:native("nearEqualsVector2")
	public static function nearEqualsVector2(a:flight._js.Vector2, b:flight._js.Vector2, tolerance:Float):Bool;
	@:native("negateVector2")
	public static function negateVector2(out:flight._js.Vector2, source:flight._js.Vector2):Void;
	@:native("normalizeVector2")
	public static function normalizeVector2(out:flight._js.Vector2, source:flight._js.Vector2):Float;
	@:native("offsetVector2")
	public static function offsetVector2(out:flight._js.Vector2, source:flight._js.Vector2, dx:Float, dy:Float):Void;
	@:native("reflectVector2")
	public static function reflectVector2(out:flight._js.Vector2, incident:flight._js.Vector2, normal:flight._js.Vector2):Void;
	@:native("rotateVector2")
	public static function rotateVector2(out:flight._js.Vector2, source:flight._js.Vector2, angle:Float):Void;
	@:native("scaleVector2")
	public static function scaleVector2(out:flight._js.Vector2, source:flight._js.Vector2, scalar:Float):Void;
	@:native("scaleVector2ToLength")
	public static function scaleVector2ToLength(out:flight._js.Vector2, source:flight._js.Vector2, length:Float):Void;
	@:native("setVector2")
	public static function setVector2(out:flight._js.Vector2, x:Float, y:Float):Void;
	@:native("setVector2FromFloat32Array")
	public static function setVector2FromFloat32Array(out:flight._js.Vector2, offset:Int, source:Dynamic):Void;
	@:native("setVector2FromPolar")
	public static function setVector2FromPolar(out:flight._js.Vector2, length:Float, angle:Float):Void;
	@:native("setVector2FromVector3")
	public static function setVector2FromVector3(out:flight._js.Vector2, source:flight._js.Vector3):Void;
	@:native("subtractVector2")
	public static function subtractVector2(out:flight._js.Vector2, source:flight._js.Vector2, other:flight._js.Vector2):Void;
	@:native("writeVector2ToFloat32Array")
	public static function writeVector2ToFloat32Array(out:Dynamic, offset:Int, source:flight._js.Vector2):Void;
	@:native("acquireEmptyVector2")
	public static function acquireEmptyVector2():flight._js.Vector2;
	@:native("acquireVector2")
	public static function acquireVector2():flight._js.Vector2;
	@:native("clearVector2Pool")
	public static function clearVector2Pool():Void;
	@:native("releaseVector2")
	public static function releaseVector2(v:flight._js.Vector2):Void;
	@:native("createVector3")
	public static function createVector3(x:Float, y:Float, z:Float):flight._js.Vector3;
	@:native("createVector3FromSpherical")
	public static function createVector3FromSpherical(radius:Float, theta:Float, phi:Float):flight._js.Vector3;
	@:native("addVector3")
	public static function addVector3(out:flight._js.Vector3, a:flight._js.Vector3, b:flight._js.Vector3):Void;
	@:native("clampVector3")
	public static function clampVector3(out:flight._js.Vector3, value:flight._js.Vector3, min:flight._js.Vector3, max:flight._js.Vector3):Void;
	@:native("cloneVector3")
	public static function cloneVector3(source:flight._js.Vector3):flight._js.Vector3;
	@:native("copyVector3")
	public static function copyVector3(out:flight._js.Vector3, source:flight._js.Vector3):Void;
	@:native("crossVector3")
	public static function crossVector3(out:flight._js.Vector3, source:flight._js.Vector3, other:flight._js.Vector3):Void;
	@:native("divideVector3")
	public static function divideVector3(out:flight._js.Vector3, source:flight._js.Vector3, divisor:flight._js.Vector3):Void;
	@:native("equalsVector3")
	public static function equalsVector3(a:Null<flight._js.Vector3>, b:Null<flight._js.Vector3>):Bool;
	@:native("getVector3AngleBetween")
	public static function getVector3AngleBetween(a:flight._js.Vector3, b:flight._js.Vector3):Float;
	@:native("getVector3Distance")
	public static function getVector3Distance(a:flight._js.Vector3, b:flight._js.Vector3):Float;
	@:native("getVector3DistanceSquared")
	public static function getVector3DistanceSquared(a:flight._js.Vector3, b:flight._js.Vector3):Float;
	@:native("getVector3Dot")
	public static function getVector3Dot(a:flight._js.Vector3, b:flight._js.Vector3):Float;
	@:native("getVector3Length")
	public static function getVector3Length(source:flight._js.Vector3):Float;
	@:native("getVector3LengthSquared")
	public static function getVector3LengthSquared(source:flight._js.Vector3):Float;
	@:native("getVector3Spherical")
	public static function getVector3Spherical(out:flight._js.Vector3, source:flight._js.Vector3):Void;
	@:native("interpolateVector3")
	public static function interpolateVector3(out:flight._js.Vector3, a:flight._js.Vector3, b:flight._js.Vector3, t:Float):Void;
	@:native("maxVector3")
	public static function maxVector3(out:flight._js.Vector3, a:flight._js.Vector3, b:flight._js.Vector3):Void;
	@:native("minVector3")
	public static function minVector3(out:flight._js.Vector3, a:flight._js.Vector3, b:flight._js.Vector3):Void;
	@:native("multiplyVector3")
	public static function multiplyVector3(out:flight._js.Vector3, a:flight._js.Vector3, b:flight._js.Vector3):Void;
	@:native("nearEqualsVector3")
	public static function nearEqualsVector3(a:flight._js.Vector3, b:flight._js.Vector3, tolerance:Float):Bool;
	@:native("negateVector3")
	public static function negateVector3(out:flight._js.Vector3, source:flight._js.Vector3):Void;
	@:native("normalizeVector3")
	public static function normalizeVector3(out:flight._js.Vector3, source:flight._js.Vector3):Float;
	@:native("offsetVector3")
	public static function offsetVector3(out:flight._js.Vector3, source:flight._js.Vector3, dx:Float, dy:Float, dz:Float):Void;
	@:native("projectVector3")
	public static function projectVector3(out:flight._js.Vector2, source:flight._js.Vector3):Void;
	@:native("reflectVector3")
	public static function reflectVector3(out:flight._js.Vector3, incident:flight._js.Vector3, normal:flight._js.Vector3):Void;
	@:native("scaleVector3")
	public static function scaleVector3(out:flight._js.Vector3, source:flight._js.Vector3, scalar:Float):Void;
	@:native("setVector3")
	public static function setVector3(out:flight._js.Vector3, x:Float, y:Float, z:Float):Void;
	@:native("setVector3FromFloat32Array")
	public static function setVector3FromFloat32Array(out:flight._js.Vector3, offset:Int, source:Dynamic):Void;
	@:native("setVector3FromSpherical")
	public static function setVector3FromSpherical(out:flight._js.Vector3, radius:Float, theta:Float, phi:Float):Void;
	@:native("setVector3FromVector4")
	public static function setVector3FromVector4(out:flight._js.Vector3, source:flight._js.Vector4):Void;
	@:native("subtractVector3")
	public static function subtractVector3(out:flight._js.Vector3, source:flight._js.Vector3, other:flight._js.Vector3):Void;
	@:native("transformVector3ByMatrix3")
	public static function transformVector3ByMatrix3(out:flight._js.Vector3, source:flight._js.Vector3, matrix:flight._js.Matrix3):Void;
	@:native("writeVector3ToFloat32Array")
	public static function writeVector3ToFloat32Array(out:Dynamic, offset:Int, source:flight._js.Vector3):Void;
	@:native("acquireEmptyVector3")
	public static function acquireEmptyVector3():flight._js.Vector3;
	@:native("acquireVector3")
	public static function acquireVector3():flight._js.Vector3;
	@:native("clearVector3Pool")
	public static function clearVector3Pool():Void;
	@:native("releaseVector3")
	public static function releaseVector3(v:flight._js.Vector3):Void;
	@:native("createVector4")
	public static function createVector4(x:Float, y:Float, z:Float, w:Float):flight._js.Vector4;
	@:native("addVector4")
	public static function addVector4(out:flight._js.Vector4, a:flight._js.Vector4, b:flight._js.Vector4):Void;
	@:native("clampVector4")
	public static function clampVector4(out:flight._js.Vector4, value:flight._js.Vector4, min:flight._js.Vector4, max:flight._js.Vector4):Void;
	@:native("cloneVector4")
	public static function cloneVector4(source:flight._js.Vector4):flight._js.Vector4;
	@:native("copyVector4")
	public static function copyVector4(out:flight._js.Vector4, source:flight._js.Vector4):Void;
	@:native("divideVector4")
	public static function divideVector4(out:flight._js.Vector4, source:flight._js.Vector4, divisor:flight._js.Vector4):Void;
	@:native("equalsVector4")
	public static function equalsVector4(a:Null<flight._js.Vector4>, b:Null<flight._js.Vector4>):Bool;
	@:native("getVector4AngleBetween")
	public static function getVector4AngleBetween(a:flight._js.Vector4, b:flight._js.Vector4):Float;
	@:native("getVector4Distance")
	public static function getVector4Distance(a:flight._js.Vector4, b:flight._js.Vector4):Float;
	@:native("getVector4DistanceSquared")
	public static function getVector4DistanceSquared(a:flight._js.Vector4, b:flight._js.Vector4):Float;
	@:native("getVector4Dot")
	public static function getVector4Dot(a:flight._js.Vector4, b:flight._js.Vector4):Float;
	@:native("getVector4Length")
	public static function getVector4Length(source:flight._js.Vector4):Float;
	@:native("getVector4LengthSquared")
	public static function getVector4LengthSquared(source:flight._js.Vector4):Float;
	@:native("interpolateVector4")
	public static function interpolateVector4(out:flight._js.Vector4, a:flight._js.Vector4, b:flight._js.Vector4, t:Float):Void;
	@:native("maxVector4")
	public static function maxVector4(out:flight._js.Vector4, a:flight._js.Vector4, b:flight._js.Vector4):Void;
	@:native("minVector4")
	public static function minVector4(out:flight._js.Vector4, a:flight._js.Vector4, b:flight._js.Vector4):Void;
	@:native("multiplyVector4")
	public static function multiplyVector4(out:flight._js.Vector4, a:flight._js.Vector4, b:flight._js.Vector4):Void;
	@:native("nearEqualsVector4")
	public static function nearEqualsVector4(a:flight._js.Vector4, b:flight._js.Vector4, tolerance:Float):Bool;
	@:native("negateVector4")
	public static function negateVector4(out:flight._js.Vector4, source:flight._js.Vector4):Void;
	@:native("normalizeVector4")
	public static function normalizeVector4(out:flight._js.Vector4, source:flight._js.Vector4):Float;
	@:native("offsetVector4")
	public static function offsetVector4(out:flight._js.Vector4, source:flight._js.Vector4, dx:Float, dy:Float, dz:Float, dw:Float):Void;
	@:native("projectVector4")
	public static function projectVector4(out:flight._js.Vector3, source:flight._js.Vector4):Void;
	@:native("reflectVector4")
	public static function reflectVector4(out:flight._js.Vector4, incident:flight._js.Vector4, normal:flight._js.Vector4):Void;
	@:native("scaleVector4")
	public static function scaleVector4(out:flight._js.Vector4, source:flight._js.Vector4, scalar:Float):Void;
	@:native("setVector4")
	public static function setVector4(out:flight._js.Vector4, x:Float, y:Float, z:Float, w:Float):Void;
	@:native("setVector4FromFloat32Array")
	public static function setVector4FromFloat32Array(out:flight._js.Vector4, offset:Int, source:Dynamic):Void;
	@:native("setVector4FromVector3")
	public static function setVector4FromVector3(out:flight._js.Vector4, source:flight._js.Vector3, w:Float):Void;
	@:native("subtractVector4")
	public static function subtractVector4(out:flight._js.Vector4, source:flight._js.Vector4, other:flight._js.Vector4):Void;
	@:native("writeVector4ToFloat32Array")
	public static function writeVector4ToFloat32Array(out:Dynamic, offset:Int, source:flight._js.Vector4):Void;
	@:native("acquireEmptyVector4")
	public static function acquireEmptyVector4():flight._js.Vector4;
	@:native("acquireVector4")
	public static function acquireVector4():flight._js.Vector4;
	@:native("clearVector4Pool")
	public static function clearVector4Pool():Void;
	@:native("releaseVector4")
	public static function releaseVector4(v:flight._js.Vector4):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAabb(ptr:flight._js.Aabb):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeBoundingSphere(ptr:flight._js.BoundingSphere):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeCapsule(ptr:flight._js.Capsule):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeFrustum(ptr:flight._js.Frustum):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeMatrix(ptr:flight._js.Matrix):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeMatrix3(ptr:flight._js.Matrix3):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeMatrix4(ptr:flight._js.Matrix4):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeObb(ptr:flight._js.Obb):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePlane(ptr:flight._js.Plane):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeQuaternion(ptr:flight._js.Quaternion):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeRay3D(ptr:flight._js.Ray3D):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeTransform2D(ptr:flight._js.Transform2D):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeTransform3D(ptr:flight._js.Transform3D):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeVector2(ptr:flight._js.Vector2):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeVector3(ptr:flight._js.Vector3):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeVector4(ptr:flight._js.Vector4):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeRectangle(ptr:flight._js.Rectangle):Void {}
}
