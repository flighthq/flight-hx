package flight._hl._fn;

extern class Geometry {
	@:hlNative("flight", "flight_create_aabb")
	public static function createAabb(minX:Float, minY:Float, minZ:Float, maxX:Float, maxY:Float, maxZ:Float):flight._hl.Aabb;
	@:hlNative("flight", "flight_clone_aabb")
	public static function cloneAabb(source:flight._hl.Aabb):flight._hl.Aabb;
	@:hlNative("flight", "flight_contains_aabb_point")
	public static function containsAabbPoint(aabb:flight._hl.Aabb, point:flight._hl.Vector3):Bool;
	@:hlNative("flight", "flight_copy_aabb")
	public static function copyAabb(out:flight._hl.Aabb, source:flight._hl.Aabb):Void;
	@:hlNative("flight", "flight_expand_aabb_by_point")
	public static function expandAabbByPoint(out:flight._hl.Aabb, aabb:flight._hl.Aabb, point:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_expand_aabb_by_sphere")
	public static function expandAabbBySphere(out:flight._hl.Aabb, aabb:flight._hl.Aabb, sphere:flight._hl.BoundingSphere):Void;
	@:hlNative("flight", "flight_get_aabb_center")
	public static function getAabbCenter(out:flight._hl.Vector3, aabb:flight._hl.Aabb):Void;
	@:hlNative("flight", "flight_get_aabb_extents")
	public static function getAabbExtents(out:flight._hl.Vector3, aabb:flight._hl.Aabb):Void;
	@:hlNative("flight", "flight_get_aabb_size")
	public static function getAabbSize(out:flight._hl.Vector3, aabb:flight._hl.Aabb):Void;
	@:hlNative("flight", "flight_get_closest_point_on_aabb")
	public static function getClosestPointOnAabb(out:flight._hl.Vector3, aabb:flight._hl.Aabb, point:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_intersect_aabb")
	public static function intersectAabb(out:flight._hl.Aabb, a:flight._hl.Aabb, b:flight._hl.Aabb):Void;
	@:hlNative("flight", "flight_is_aabb_intersecting_aabb")
	public static function isAabbIntersectingAabb(a:flight._hl.Aabb, b:flight._hl.Aabb):Bool;
	@:hlNative("flight", "flight_is_aabb_intersecting_sphere")
	public static function isAabbIntersectingSphere(aabb:flight._hl.Aabb, sphere:flight._hl.BoundingSphere):Bool;
	@:hlNative("flight", "flight_set_aabb")
	public static function setAabb(out:flight._hl.Aabb, minX:Float, minY:Float, minZ:Float, maxX:Float, maxY:Float, maxZ:Float):Void;
	@:hlNative("flight", "flight_set_aabb_from_points")
	public static function setAabbFromPoints(out:flight._hl.Aabb, points:hl.Bytes, pointsLen:Int):Void;
	@:hlNative("flight", "flight_transform_aabb_by_matrix4")
	public static function transformAabbByMatrix4(out:flight._hl.Aabb, aabb:flight._hl.Aabb, m:flight._hl.Matrix4):Void;
	@:hlNative("flight", "flight_union_aabb")
	public static function unionAabb(out:flight._hl.Aabb, a:flight._hl.Aabb, b:flight._hl.Aabb):Void;
	@:hlNative("flight", "flight_create_bounding_sphere")
	public static function createBoundingSphere(centerX:Float, centerY:Float, centerZ:Float, radius:Float):flight._hl.BoundingSphere;
	@:hlNative("flight", "flight_clone_bounding_sphere")
	public static function cloneBoundingSphere(source:flight._hl.BoundingSphere):flight._hl.BoundingSphere;
	@:hlNative("flight", "flight_contains_bounding_sphere_point")
	public static function containsBoundingSpherePoint(sphere:flight._hl.BoundingSphere, point:flight._hl.Vector3):Bool;
	@:hlNative("flight", "flight_copy_bounding_sphere")
	public static function copyBoundingSphere(out:flight._hl.BoundingSphere, source:flight._hl.BoundingSphere):Void;
	@:hlNative("flight", "flight_get_closest_point_on_bounding_sphere")
	public static function getClosestPointOnBoundingSphere(out:flight._hl.Vector3, sphere:flight._hl.BoundingSphere, point:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_is_bounding_sphere_intersecting_bounding_sphere")
	public static function isBoundingSphereIntersectingBoundingSphere(a:flight._hl.BoundingSphere, b:flight._hl.BoundingSphere):Bool;
	@:hlNative("flight", "flight_merge_bounding_sphere")
	public static function mergeBoundingSphere(out:flight._hl.BoundingSphere, a:flight._hl.BoundingSphere, b:flight._hl.BoundingSphere):Void;
	@:hlNative("flight", "flight_set_bounding_sphere")
	public static function setBoundingSphere(out:flight._hl.BoundingSphere, centerX:Float, centerY:Float, centerZ:Float, radius:Float):Void;
	@:hlNative("flight", "flight_set_bounding_sphere_from_aabb")
	public static function setBoundingSphereFromAabb(out:flight._hl.BoundingSphere, aabb:flight._hl.Aabb):Void;
	@:hlNative("flight", "flight_transform_bounding_sphere_by_matrix4")
	public static function transformBoundingSphereByMatrix4(out:flight._hl.BoundingSphere, sphere:flight._hl.BoundingSphere, m:flight._hl.Matrix4):Void;
	@:hlNative("flight", "flight_create_capsule")
	private static function __flightPacked_createCapsule(__flightValues:hl.NativeArray<Float>):flight._hl.Capsule;
	public static inline function createCapsule(startX:Float, startY:Float, startZ:Float, endX:Float, endY:Float, endZ:Float, radius:Float):flight._hl.Capsule {
		var __flightValues = new hl.NativeArray<Float>(7);
		__flightValues[0] = startX;
		__flightValues[1] = startY;
		__flightValues[2] = startZ;
		__flightValues[3] = endX;
		__flightValues[4] = endY;
		__flightValues[5] = endZ;
		__flightValues[6] = radius;
		return __flightPacked_createCapsule(__flightValues);
	}
	@:hlNative("flight", "flight_get_closest_point_on_capsule")
	public static function getClosestPointOnCapsule(out:flight._hl.Vector3, capsule:flight._hl.Capsule, point:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_intersect_ray3d_capsule")
	public static function intersectRay3dCapsule(ray:flight._hl.Ray3D, capsule:flight._hl.Capsule):Float;
	@:hlNative("flight", "flight_is_capsule_intersecting_aabb")
	public static function isCapsuleIntersectingAabb(capsule:flight._hl.Capsule, aabb:flight._hl.Aabb):Bool;
	@:hlNative("flight", "flight_is_capsule_intersecting_capsule")
	public static function isCapsuleIntersectingCapsule(a:flight._hl.Capsule, b:flight._hl.Capsule):Bool;
	@:hlNative("flight", "flight_is_capsule_intersecting_sphere")
	public static function isCapsuleIntersectingSphere(capsule:flight._hl.Capsule, sphere:flight._hl.BoundingSphere):Bool;
	@:hlNative("flight", "flight_set_capsule")
	private static function __flightPacked_setCapsule(out:flight._hl.Capsule, __flightValues:hl.NativeArray<Float>):Void;
	public static inline function setCapsule(out:flight._hl.Capsule, startX:Float, startY:Float, startZ:Float, endX:Float, endY:Float, endZ:Float, radius:Float):Void {
		var __flightValues = new hl.NativeArray<Float>(7);
		__flightValues[0] = startX;
		__flightValues[1] = startY;
		__flightValues[2] = startZ;
		__flightValues[3] = endX;
		__flightValues[4] = endY;
		__flightValues[5] = endZ;
		__flightValues[6] = radius;
		__flightPacked_setCapsule(out, __flightValues);
	}
	@:hlNative("flight", "flight_are_geometry_pool_guards_enabled")
	public static function areGeometryPoolGuardsEnabled():Bool;
	@:hlNative("flight", "flight_disable_geometry_pool_guards")
	public static function disableGeometryPoolGuards():Void;
	@:hlNative("flight", "flight_create_frustum")
	public static function createFrustum():flight._hl.Frustum;
	@:hlNative("flight", "flight_get_frustum_corners")
	public static function getFrustumCorners(out:hl.Bytes, outLen:Int, inverseViewProjection:flight._hl.Matrix4):Void;
	@:hlNative("flight", "flight_is_frustum_containing_point")
	public static function isFrustumContainingPoint(frustum:flight._hl.Frustum, point:flight._hl.Vector3):Bool;
	@:hlNative("flight", "flight_is_frustum_intersecting_aabb")
	public static function isFrustumIntersectingAabb(frustum:flight._hl.Frustum, aabb:flight._hl.Aabb):Bool;
	@:hlNative("flight", "flight_is_frustum_intersecting_obb")
	public static function isFrustumIntersectingObb(frustum:flight._hl.Frustum, obb:flight._hl.Obb):Bool;
	@:hlNative("flight", "flight_is_frustum_intersecting_sphere")
	public static function isFrustumIntersectingSphere(frustum:flight._hl.Frustum, sphere:flight._hl.BoundingSphere):Bool;
	@:hlNative("flight", "flight_set_frustum_from_matrix4")
	public static function setFrustumFromMatrix4(out:flight._hl.Frustum, viewProjection:flight._hl.Matrix4):Void;
	@:hlNative("flight", "flight_create_gradient_transform_matrix")
	public static function createGradientTransformMatrix(width:Float, height:Float, rotation:Float, tx:Float, ty:Float):flight._hl.Matrix;
	@:hlNative("flight", "flight_create_matrix")
	public static function createMatrix(a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):flight._hl.Matrix;
	@:hlNative("flight", "flight_create_transform_matrix")
	public static function createTransformMatrix(scaleX:Float, scaleY:Float, rotation:Float, tx:Float, ty:Float):flight._hl.Matrix;
	@:hlNative("flight", "flight_clone_matrix")
	public static function cloneMatrix(source:flight._hl.Matrix):flight._hl.Matrix;
	@:hlNative("flight", "flight_copy_matrix")
	public static function copyMatrix(out:flight._hl.Matrix, source:flight._hl.Matrix):Void;
	@:hlNative("flight", "flight_copy_matrix_column_from_vector3")
	public static function copyMatrixColumnFromVector3(out:flight._hl.Matrix, column:Int, source:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_copy_matrix_column_to_vector3")
	public static function copyMatrixColumnToVector3(out:flight._hl.Vector3, column:Int, source:flight._hl.Matrix):Void;
	@:hlNative("flight", "flight_copy_matrix_row_from_vector3")
	public static function copyMatrixRowFromVector3(out:flight._hl.Matrix, row:Int, source:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_copy_matrix_row_to_vector3")
	public static function copyMatrixRowToVector3(out:flight._hl.Vector3, row:Int, source:flight._hl.Matrix):Void;
	@:hlNative("flight", "flight_equals_matrix")
	public static function equalsMatrix(a:flight._hl.Matrix, b:flight._hl.Matrix, compareTranslation:Bool):Bool;
	@:hlNative("flight", "flight_inverse_matrix")
	public static function inverseMatrix(out:flight._hl.Matrix, source:flight._hl.Matrix):Bool;
	@:hlNative("flight", "flight_inverse_matrix_transform_point")
	public static function inverseMatrixTransformPoint(out:flight._hl.Vector2, matrix:flight._hl.Matrix, point:flight._hl.Vector2):Void;
	@:hlNative("flight", "flight_inverse_matrix_transform_point_xy")
	public static function inverseMatrixTransformPointXy(out:flight._hl.Vector2, source:flight._hl.Matrix, x:Float, y:Float):Void;
	@:hlNative("flight", "flight_inverse_matrix_transform_vector")
	public static function inverseMatrixTransformVector(out:flight._hl.Vector2, matrix:flight._hl.Matrix, vector:flight._hl.Vector2):Void;
	@:hlNative("flight", "flight_inverse_matrix_transform_vector_xy")
	public static function inverseMatrixTransformVectorXy(out:flight._hl.Vector2, source:flight._hl.Matrix, x:Float, y:Float):Void;
	@:hlNative("flight", "flight_matrix_transform_bounds")
	public static function matrixTransformBounds(out:flight._hl.Rectangle, source:flight._hl.Matrix, ax:Float, ay:Float, bx:Float, by:Float):Void;
	@:hlNative("flight", "flight_matrix_transform_bounds_vector2")
	public static function matrixTransformBoundsVector2(out:flight._hl.Rectangle, matrix:flight._hl.Matrix, a:flight._hl.Vector2, b:flight._hl.Vector2):Void;
	@:hlNative("flight", "flight_matrix_transform_point")
	public static function matrixTransformPoint(out:flight._hl.Vector2, matrix:flight._hl.Matrix, point:flight._hl.Vector2):Void;
	@:hlNative("flight", "flight_matrix_transform_point_xy")
	public static function matrixTransformPointXy(out:flight._hl.Vector2, source:flight._hl.Matrix, x:Float, y:Float):Void;
	@:hlNative("flight", "flight_matrix_transform_rectangle")
	public static function matrixTransformRectangle(out:flight._hl.Rectangle, matrix:flight._hl.Matrix, source:flight._hl.Rectangle):Void;
	@:hlNative("flight", "flight_matrix_transform_vector")
	public static function matrixTransformVector(out:flight._hl.Vector2, matrix:flight._hl.Matrix, vector:flight._hl.Vector2):Void;
	@:hlNative("flight", "flight_matrix_transform_vector_xy")
	public static function matrixTransformVectorXy(out:flight._hl.Vector2, source:flight._hl.Matrix, x:Float, y:Float):Void;
	@:hlNative("flight", "flight_multiply_matrix")
	public static function multiplyMatrix(out:flight._hl.Matrix, a:flight._hl.Matrix, b:flight._hl.Matrix):Void;
	@:hlNative("flight", "flight_rotate_matrix")
	public static function rotateMatrix(out:flight._hl.Matrix, source:flight._hl.Matrix, theta:Float):Void;
	@:hlNative("flight", "flight_scale_matrix")
	public static function scaleMatrix(out:flight._hl.Matrix, source:flight._hl.Matrix, sx:Float, sy:Float):Void;
	@:hlNative("flight", "flight_set_gradient_transform_matrix")
	public static function setGradientTransformMatrix(out:flight._hl.Matrix, width:Float, height:Float, rotation:Float, tx:Float, ty:Float):Void;
	@:hlNative("flight", "flight_set_matrix")
	public static function setMatrix(out:flight._hl.Matrix, a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):Void;
	@:hlNative("flight", "flight_set_matrix_from_float32_array")
	public static function setMatrixFromFloat32Array(out:flight._hl.Matrix, offset:Int, source:hl.Bytes, sourceLen:Int):Void;
	@:hlNative("flight", "flight_set_matrix_from_matrix3")
	public static function setMatrixFromMatrix3(out:flight._hl.Matrix, source:flight._hl.Matrix3):Void;
	@:hlNative("flight", "flight_set_matrix_from_matrix4")
	public static function setMatrixFromMatrix4(out:flight._hl.Matrix, source:flight._hl.Matrix4):Void;
	@:hlNative("flight", "flight_set_matrix_identity")
	public static function setMatrixIdentity(out:flight._hl.Matrix):Void;
	@:hlNative("flight", "flight_set_transform_matrix")
	public static function setTransformMatrix(out:flight._hl.Matrix, scaleX:Float, scaleY:Float, rotation:Float, tx:Float, ty:Float):Void;
	@:hlNative("flight", "flight_translate_matrix")
	public static function translateMatrix(out:flight._hl.Matrix, source:flight._hl.Matrix, dx:Float, dy:Float):Void;
	@:hlNative("flight", "flight_translate_matrix_by_vector")
	public static function translateMatrixByVector(out:flight._hl.Matrix, matrix:flight._hl.Matrix, vector:flight._hl.Vector2):Void;
	@:hlNative("flight", "flight_translate_matrix_by_vector_xy")
	public static function translateMatrixByVectorXy(out:flight._hl.Matrix, source:flight._hl.Matrix, x:Float, y:Float):Void;
	@:hlNative("flight", "flight_write_matrix_to_float32_array")
	public static function writeMatrixToFloat32Array(out:hl.Bytes, outLen:Int, offset:Int, source:flight._hl.Matrix):Void;
	@:hlNative("flight", "flight_create_matrix3")
	public static function createMatrix3():flight._hl.Matrix3;
	@:hlNative("flight", "flight_create_matrix3_from_values")
	private static function __flightPacked_createMatrix3FromValues(__flightValues:hl.NativeArray<Float>):flight._hl.Matrix3;
	public static inline function createMatrix3FromValues(m00:Float, m01:Float, m02:Float, m10:Float, m11:Float, m12:Float, m20:Float, m21:Float, m22:Float):flight._hl.Matrix3 {
		var __flightValues = new hl.NativeArray<Float>(9);
		__flightValues[0] = m00;
		__flightValues[1] = m01;
		__flightValues[2] = m02;
		__flightValues[3] = m10;
		__flightValues[4] = m11;
		__flightValues[5] = m12;
		__flightValues[6] = m20;
		__flightValues[7] = m21;
		__flightValues[8] = m22;
		return __flightPacked_createMatrix3FromValues(__flightValues);
	}
	@:hlNative("flight", "flight_clone_matrix3")
	public static function cloneMatrix3(source:flight._hl.Matrix3):flight._hl.Matrix3;
	@:hlNative("flight", "flight_copy_matrix3")
	public static function copyMatrix3(out:flight._hl.Matrix3, source:flight._hl.Matrix3):Void;
	@:hlNative("flight", "flight_copy_matrix3_column_from_vector3")
	public static function copyMatrix3ColumnFromVector3(out:flight._hl.Matrix3, column:Int, source:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_copy_matrix3_column_to_vector3")
	public static function copyMatrix3ColumnToVector3(out:flight._hl.Vector3, column:Int, source:flight._hl.Matrix3):Void;
	@:hlNative("flight", "flight_copy_matrix3_row_from_vector3")
	public static function copyMatrix3RowFromVector3(out:flight._hl.Matrix3, row:Int, source:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_copy_matrix3_row_to_vector3")
	public static function copyMatrix3RowToVector3(out:flight._hl.Vector3, row:Int, source:flight._hl.Matrix3):Void;
	@:hlNative("flight", "flight_equals_matrix3")
	public static function equalsMatrix3(a:flight._hl.Matrix3, b:flight._hl.Matrix3):Bool;
	@:hlNative("flight", "flight_get_matrix3_determinant")
	public static function getMatrix3Determinant(source:flight._hl.Matrix3):Float;
	@:hlNative("flight", "flight_get_matrix3_element")
	public static function getMatrix3Element(source:flight._hl.Matrix3, row:Int, column:Int):Float;
	@:hlNative("flight", "flight_inverse_matrix3")
	public static function inverseMatrix3(out:flight._hl.Matrix3, source:flight._hl.Matrix3):Bool;
	@:hlNative("flight", "flight_is_affine_matrix3")
	public static function isAffineMatrix3(source:flight._hl.Matrix3):Bool;
	@:hlNative("flight", "flight_multiply_matrix3")
	public static function multiplyMatrix3(out:flight._hl.Matrix3, a:flight._hl.Matrix3, b:flight._hl.Matrix3):Void;
	@:hlNative("flight", "flight_rotate_matrix3")
	public static function rotateMatrix3(out:flight._hl.Matrix3, source:flight._hl.Matrix3, theta:Float):Void;
	@:hlNative("flight", "flight_scale_matrix3")
	public static function scaleMatrix3(out:flight._hl.Matrix3, source:flight._hl.Matrix3, sx:Float, sy:Float):Void;
	@:hlNative("flight", "flight_set_matrix3")
	private static function __flightPacked_setMatrix3(out:flight._hl.Matrix3, __flightValues:hl.NativeArray<Float>):Void;
	public static inline function setMatrix3(out:flight._hl.Matrix3, m00:Float, m01:Float, m02:Float, m10:Float, m11:Float, m12:Float, m20:Float, m21:Float, m22:Float):Void {
		var __flightValues = new hl.NativeArray<Float>(9);
		__flightValues[0] = m00;
		__flightValues[1] = m01;
		__flightValues[2] = m02;
		__flightValues[3] = m10;
		__flightValues[4] = m11;
		__flightValues[5] = m12;
		__flightValues[6] = m20;
		__flightValues[7] = m21;
		__flightValues[8] = m22;
		__flightPacked_setMatrix3(out, __flightValues);
	}
	@:hlNative("flight", "flight_set_matrix3_element")
	public static function setMatrix3Element(out:flight._hl.Matrix3, row:Int, column:Int, value:Float):Void;
	@:hlNative("flight", "flight_set_matrix3_from_float32_array")
	public static function setMatrix3FromFloat32Array(out:flight._hl.Matrix3, offset:Int, source:hl.Bytes, sourceLen:Int):Void;
	@:hlNative("flight", "flight_set_matrix3_from_matrix")
	public static function setMatrix3FromMatrix(out:flight._hl.Matrix3, source:flight._hl.Matrix):Void;
	@:hlNative("flight", "flight_set_matrix3_from_matrix4")
	public static function setMatrix3FromMatrix4(out:flight._hl.Matrix3, source:flight._hl.Matrix4):Void;
	@:hlNative("flight", "flight_set_matrix3_identity")
	public static function setMatrix3Identity(out:flight._hl.Matrix3):Void;
	@:hlNative("flight", "flight_set_matrix3_normal_from_matrix4")
	public static function setMatrix3NormalFromMatrix4(out:flight._hl.Matrix3, source:flight._hl.Matrix4):Void;
	@:hlNative("flight", "flight_translate_matrix3")
	public static function translateMatrix3(out:flight._hl.Matrix3, source:flight._hl.Matrix3, tx:Float, ty:Float):Void;
	@:hlNative("flight", "flight_transpose_matrix3")
	public static function transposeMatrix3(out:flight._hl.Matrix3, source:flight._hl.Matrix3):Void;
	@:hlNative("flight", "flight_write_matrix3_to_float32_array")
	public static function writeMatrix3ToFloat32Array(out:hl.Bytes, outLen:Int, offset:Int, source:flight._hl.Matrix3):Void;
	@:hlNative("flight", "flight_acquire_identity_matrix3")
	public static function acquireIdentityMatrix3():flight._hl.Matrix3;
	@:hlNative("flight", "flight_acquire_matrix3")
	public static function acquireMatrix3():flight._hl.Matrix3;
	@:hlNative("flight", "flight_clear_matrix3_pool")
	public static function clearMatrix3Pool():Void;
	@:hlNative("flight", "flight_release_matrix3")
	public static function releaseMatrix3(m:flight._hl.Matrix3):Void;
	@:hlNative("flight", "flight_create_matrix4")
	public static function createMatrix4():flight._hl.Matrix4;
	@:hlNative("flight", "flight_create_matrix4_from_2d")
	public static function createMatrix4From2d(a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):flight._hl.Matrix4;
	@:hlNative("flight", "flight_create_matrix4_from_values")
	private static function __flightPacked_createMatrix4FromValues(__flightValues:hl.NativeArray<Float>):flight._hl.Matrix4;
	public static inline function createMatrix4FromValues(m00:Float, m01:Float, m02:Float, m03:Float, m10:Float, m11:Float, m12:Float, m13:Float, m20:Float, m21:Float, m22:Float, m23:Float, m30:Float, m31:Float, m32:Float, m33:Float):flight._hl.Matrix4 {
		var __flightValues = new hl.NativeArray<Float>(16);
		__flightValues[0] = m00;
		__flightValues[1] = m01;
		__flightValues[2] = m02;
		__flightValues[3] = m03;
		__flightValues[4] = m10;
		__flightValues[5] = m11;
		__flightValues[6] = m12;
		__flightValues[7] = m13;
		__flightValues[8] = m20;
		__flightValues[9] = m21;
		__flightValues[10] = m22;
		__flightValues[11] = m23;
		__flightValues[12] = m30;
		__flightValues[13] = m31;
		__flightValues[14] = m32;
		__flightValues[15] = m33;
		return __flightPacked_createMatrix4FromValues(__flightValues);
	}
	@:hlNative("flight", "flight_create_orthographic_matrix4")
	public static function createOrthographicMatrix4(left:Float, right:Float, bottom:Float, top:Float, zNear:Float, zFar:Float):flight._hl.Matrix4;
	@:hlNative("flight", "flight_create_perspective_matrix4")
	public static function createPerspectiveMatrix4(tanHalfFovY:Float, aspect:Float, zNear:Float, zFar:Float):flight._hl.Matrix4;
	@:hlNative("flight", "flight_append_matrix4")
	public static function appendMatrix4(out:flight._hl.Matrix4, source:flight._hl.Matrix4, other:flight._hl.Matrix4):Void;
	@:hlNative("flight", "flight_append_rotation_matrix4")
	public static function appendRotationMatrix4(out:flight._hl.Matrix4, source:flight._hl.Matrix4, radians:Float, axis:flight._hl.Vector4, pivotPoint:flight._hl.Vector4):Void;
	@:hlNative("flight", "flight_append_scale_matrix4")
	public static function appendScaleMatrix4(out:flight._hl.Matrix4, source:flight._hl.Matrix4, xScale:Float, yScale:Float, zScale:Float):Void;
	@:hlNative("flight", "flight_append_translation_matrix4")
	public static function appendTranslationMatrix4(out:flight._hl.Matrix4, source:flight._hl.Matrix4, x:Float, y:Float, z:Float):Void;
	@:hlNative("flight", "flight_clone_matrix4")
	public static function cloneMatrix4(source:flight._hl.Matrix4):flight._hl.Matrix4;
	@:hlNative("flight", "flight_compose_matrix4")
	public static function composeMatrix4(out:flight._hl.Matrix4, position:flight._hl.Vector3, rotation:flight._hl.Quaternion, scale:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_copy_matrix4")
	public static function copyMatrix4(out:flight._hl.Matrix4, source:flight._hl.Matrix4):Void;
	@:hlNative("flight", "flight_copy_matrix4_column_from_vector4")
	public static function copyMatrix4ColumnFromVector4(out:flight._hl.Matrix4, column:Int, source:flight._hl.Vector4):Void;
	@:hlNative("flight", "flight_copy_matrix4_column_to_vector4")
	public static function copyMatrix4ColumnToVector4(out:flight._hl.Vector4, column:Int, source:flight._hl.Matrix4):Void;
	@:hlNative("flight", "flight_copy_matrix4_row_from_vector4")
	public static function copyMatrix4RowFromVector4(out:flight._hl.Matrix4, row:Int, source:flight._hl.Vector4):Void;
	@:hlNative("flight", "flight_copy_matrix4_row_to_vector4")
	public static function copyMatrix4RowToVector4(out:flight._hl.Vector4, row:Int, source:flight._hl.Matrix4):Void;
	@:hlNative("flight", "flight_decompose_matrix4")
	public static function decomposeMatrix4(outPosition:flight._hl.Vector3, outRotation:flight._hl.Quaternion, outScale:flight._hl.Vector3, m:flight._hl.Matrix4):Void;
	@:hlNative("flight", "flight_equals_matrix4")
	public static function equalsMatrix4(a:flight._hl.Matrix4, b:flight._hl.Matrix4):Bool;
	@:hlNative("flight", "flight_get_matrix4_determinant")
	public static function getMatrix4Determinant(source:flight._hl.Matrix4):Float;
	@:hlNative("flight", "flight_get_matrix4_element")
	public static function getMatrix4Element(source:flight._hl.Matrix4, row:Int, column:Int):Float;
	@:hlNative("flight", "flight_get_matrix4_position")
	public static function getMatrix4Position(out:flight._hl.Vector3, source:flight._hl.Matrix4):Void;
	@:hlNative("flight", "flight_interpolate_matrix4")
	public static function interpolateMatrix4(out:flight._hl.Matrix4, a:flight._hl.Matrix4, b:flight._hl.Matrix4, t:Float):Void;
	@:hlNative("flight", "flight_inverse_matrix4")
	public static function inverseMatrix4(out:flight._hl.Matrix4, source:flight._hl.Matrix4):Bool;
	@:hlNative("flight", "flight_is_affine_matrix4")
	public static function isAffineMatrix4(source:flight._hl.Matrix4):Bool;
	@:hlNative("flight", "flight_matrix4_transform_point")
	public static function matrix4TransformPoint(out:flight._hl.Vector3, source:flight._hl.Matrix4, point:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_matrix4_transform_vector")
	public static function matrix4TransformVector(out:flight._hl.Vector4, source:flight._hl.Matrix4, vector:flight._hl.Vector4):Void;
	@:hlNative("flight", "flight_matrix4_transform_vectors")
	public static function matrix4TransformVectors(out:hl.Bytes, outLen:Int, source:flight._hl.Matrix4, vectors:hl.Bytes, vectorsLen:Int):Void;
	@:hlNative("flight", "flight_multiply_matrix4")
	public static function multiplyMatrix4(out:flight._hl.Matrix4, a:flight._hl.Matrix4, b:flight._hl.Matrix4):Void;
	@:hlNative("flight", "flight_prepend_matrix4")
	public static function prependMatrix4(out:flight._hl.Matrix4, source:flight._hl.Matrix4, other:flight._hl.Matrix4):Void;
	@:hlNative("flight", "flight_prepend_rotation_matrix4")
	public static function prependRotationMatrix4(out:flight._hl.Matrix4, source:flight._hl.Matrix4, radians:Float, axis:flight._hl.Vector4, pivotPoint:flight._hl.Vector4):Void;
	@:hlNative("flight", "flight_prepend_scale_matrix4")
	public static function prependScaleMatrix4(out:flight._hl.Matrix4, source:flight._hl.Matrix4, xScale:Float, yScale:Float, zScale:Float):Void;
	@:hlNative("flight", "flight_prepend_translation_matrix4")
	public static function prependTranslationMatrix4(out:flight._hl.Matrix4, source:flight._hl.Matrix4, x:Float, y:Float, z:Float):Void;
	@:hlNative("flight", "flight_rotate_matrix4")
	public static function rotateMatrix4(out:flight._hl.Matrix4, source:flight._hl.Matrix4, axis:flight._hl.Vector3, radians:Float):Void;
	@:hlNative("flight", "flight_scale_matrix4")
	public static function scaleMatrix4(out:flight._hl.Matrix4, source:flight._hl.Matrix4, sx:Float, sy:Float, sz:Float):Void;
	@:hlNative("flight", "flight_set_matrix4")
	private static function __flightPacked_setMatrix4(out:flight._hl.Matrix4, __flightValues:hl.NativeArray<Float>):Void;
	public static inline function setMatrix4(out:flight._hl.Matrix4, m00:Float, m01:Float, m02:Float, m03:Float, m10:Float, m11:Float, m12:Float, m13:Float, m20:Float, m21:Float, m22:Float, m23:Float, m30:Float, m31:Float, m32:Float, m33:Float):Void {
		var __flightValues = new hl.NativeArray<Float>(16);
		__flightValues[0] = m00;
		__flightValues[1] = m01;
		__flightValues[2] = m02;
		__flightValues[3] = m03;
		__flightValues[4] = m10;
		__flightValues[5] = m11;
		__flightValues[6] = m12;
		__flightValues[7] = m13;
		__flightValues[8] = m20;
		__flightValues[9] = m21;
		__flightValues[10] = m22;
		__flightValues[11] = m23;
		__flightValues[12] = m30;
		__flightValues[13] = m31;
		__flightValues[14] = m32;
		__flightValues[15] = m33;
		__flightPacked_setMatrix4(out, __flightValues);
	}
	@:hlNative("flight", "flight_set_matrix4_element")
	public static function setMatrix4Element(out:flight._hl.Matrix4, row:Int, column:Int, value:Float):Void;
	@:hlNative("flight", "flight_set_matrix4_from_2d")
	public static function setMatrix4From2d(out:flight._hl.Matrix4, a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):Void;
	@:hlNative("flight", "flight_set_matrix4_from_float32_array")
	public static function setMatrix4FromFloat32Array(out:flight._hl.Matrix4, offset:Int, source:hl.Bytes, sourceLen:Int):Void;
	@:hlNative("flight", "flight_set_matrix4_from_matrix")
	public static function setMatrix4FromMatrix(out:flight._hl.Matrix4, source:flight._hl.Matrix):Void;
	@:hlNative("flight", "flight_set_matrix4_from_matrix3")
	public static function setMatrix4FromMatrix3(out:flight._hl.Matrix4, source:flight._hl.Matrix3):Void;
	@:hlNative("flight", "flight_set_matrix4_from_quaternion")
	public static function setMatrix4FromQuaternion(out:flight._hl.Matrix4, source:flight._hl.Quaternion):Void;
	@:hlNative("flight", "flight_set_matrix4_identity")
	public static function setMatrix4Identity(out:flight._hl.Matrix4):Void;
	@:hlNative("flight", "flight_set_matrix4_look_at")
	public static function setMatrix4LookAt(out:flight._hl.Matrix4, eye:flight._hl.Vector3, target:flight._hl.Vector3, up:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_set_matrix4_position")
	public static function setMatrix4Position(out:flight._hl.Matrix4, source:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_set_orthographic_matrix4")
	public static function setOrthographicMatrix4(out:flight._hl.Matrix4, left:Float, right:Float, bottom:Float, top:Float, zNear:Float, zFar:Float):Void;
	@:hlNative("flight", "flight_set_perspective_matrix4")
	public static function setPerspectiveMatrix4(out:flight._hl.Matrix4, tanHalfFovY:Float, aspect:Float, zNear:Float, zFar:Float):Void;
	@:hlNative("flight", "flight_translate_matrix4")
	public static function translateMatrix4(out:flight._hl.Matrix4, source:flight._hl.Matrix4, tx:Float, ty:Float, tz:Float):Void;
	@:hlNative("flight", "flight_transpose_matrix4")
	public static function transposeMatrix4(out:flight._hl.Matrix4, source:flight._hl.Matrix4):Void;
	@:hlNative("flight", "flight_write_matrix4_to_float32_array")
	public static function writeMatrix4ToFloat32Array(out:hl.Bytes, outLen:Int, offset:Int, source:flight._hl.Matrix4):Void;
	@:hlNative("flight", "flight_acquire_identity_matrix4")
	public static function acquireIdentityMatrix4():flight._hl.Matrix4;
	@:hlNative("flight", "flight_acquire_matrix4")
	public static function acquireMatrix4():flight._hl.Matrix4;
	@:hlNative("flight", "flight_clear_matrix4_pool")
	public static function clearMatrix4Pool():Void;
	@:hlNative("flight", "flight_release_matrix4")
	public static function releaseMatrix4(m:flight._hl.Matrix4):Void;
	@:hlNative("flight", "flight_acquire_identity_matrix")
	public static function acquireIdentityMatrix():flight._hl.Matrix;
	@:hlNative("flight", "flight_acquire_matrix")
	public static function acquireMatrix():flight._hl.Matrix;
	@:hlNative("flight", "flight_clear_matrix_pool")
	public static function clearMatrixPool():Void;
	@:hlNative("flight", "flight_release_matrix")
	public static function releaseMatrix(m:flight._hl.Matrix):Void;
	@:hlNative("flight", "flight_create_obb")
	private static function __flightPacked_createObb(__flightValues:hl.NativeArray<Float>):flight._hl.Obb;
	public static inline function createObb(centerX:Float, centerY:Float, centerZ:Float, halfExtentX:Float, halfExtentY:Float, halfExtentZ:Float, orientationX:Float, orientationY:Float, orientationZ:Float, orientationW:Float):flight._hl.Obb {
		var __flightValues = new hl.NativeArray<Float>(10);
		__flightValues[0] = centerX;
		__flightValues[1] = centerY;
		__flightValues[2] = centerZ;
		__flightValues[3] = halfExtentX;
		__flightValues[4] = halfExtentY;
		__flightValues[5] = halfExtentZ;
		__flightValues[6] = orientationX;
		__flightValues[7] = orientationY;
		__flightValues[8] = orientationZ;
		__flightValues[9] = orientationW;
		return __flightPacked_createObb(__flightValues);
	}
	@:hlNative("flight", "flight_get_closest_point_on_obb")
	public static function getClosestPointOnObb(out:flight._hl.Vector3, obb:flight._hl.Obb, point:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_intersect_ray3d_obb")
	public static function intersectRay3dObb(ray:flight._hl.Ray3D, obb:flight._hl.Obb):Float;
	@:hlNative("flight", "flight_is_obb_intersecting_aabb")
	public static function isObbIntersectingAabb(obb:flight._hl.Obb, aabb:flight._hl.Aabb):Bool;
	@:hlNative("flight", "flight_is_obb_intersecting_obb")
	public static function isObbIntersectingObb(a:flight._hl.Obb, b:flight._hl.Obb):Bool;
	@:hlNative("flight", "flight_is_obb_intersecting_sphere")
	public static function isObbIntersectingSphere(obb:flight._hl.Obb, sphere:flight._hl.BoundingSphere):Bool;
	@:hlNative("flight", "flight_set_obb")
	private static function __flightPacked_setObb(out:flight._hl.Obb, __flightValues:hl.NativeArray<Float>):Void;
	public static inline function setObb(out:flight._hl.Obb, centerX:Float, centerY:Float, centerZ:Float, halfExtentX:Float, halfExtentY:Float, halfExtentZ:Float, orientationX:Float, orientationY:Float, orientationZ:Float, orientationW:Float):Void {
		var __flightValues = new hl.NativeArray<Float>(10);
		__flightValues[0] = centerX;
		__flightValues[1] = centerY;
		__flightValues[2] = centerZ;
		__flightValues[3] = halfExtentX;
		__flightValues[4] = halfExtentY;
		__flightValues[5] = halfExtentZ;
		__flightValues[6] = orientationX;
		__flightValues[7] = orientationY;
		__flightValues[8] = orientationZ;
		__flightValues[9] = orientationW;
		__flightPacked_setObb(out, __flightValues);
	}
	@:hlNative("flight", "flight_transform_obb_by_matrix4")
	public static function transformObbByMatrix4(out:flight._hl.Obb, obb:flight._hl.Obb, m:flight._hl.Matrix4):Void;
	@:hlNative("flight", "flight_create_plane")
	public static function createPlane(a:Float, b:Float, c:Float, d:Float):flight._hl.Plane;
	@:hlNative("flight", "flight_clone_plane")
	public static function clonePlane(source:flight._hl.Plane):flight._hl.Plane;
	@:hlNative("flight", "flight_copy_plane")
	public static function copyPlane(out:flight._hl.Plane, source:flight._hl.Plane):Void;
	@:hlNative("flight", "flight_get_closest_point_on_plane")
	public static function getClosestPointOnPlane(out:flight._hl.Vector3, plane:flight._hl.Plane, point:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_get_plane_coplanar_point")
	public static function getPlaneCoplanarPoint(out:flight._hl.Vector3, plane:flight._hl.Plane):Void;
	@:hlNative("flight", "flight_get_plane_signed_distance_to_point")
	public static function getPlaneSignedDistanceToPoint(plane:flight._hl.Plane, point:flight._hl.Vector3):Float;
	@:hlNative("flight", "flight_normalize_plane")
	public static function normalizePlane(out:flight._hl.Plane, source:flight._hl.Plane):Void;
	@:hlNative("flight", "flight_project_vector3_onto_plane")
	public static function projectVector3OntoPlane(out:flight._hl.Vector3, point:flight._hl.Vector3, plane:flight._hl.Plane):Void;
	@:hlNative("flight", "flight_set_plane")
	public static function setPlane(out:flight._hl.Plane, a:Float, b:Float, c:Float, d:Float):Void;
	@:hlNative("flight", "flight_set_plane_from_normal_and_point")
	public static function setPlaneFromNormalAndPoint(out:flight._hl.Plane, normal:flight._hl.Vector3, point:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_set_plane_from_points")
	public static function setPlaneFromPoints(out:flight._hl.Plane, a:flight._hl.Vector3, b:flight._hl.Vector3, c:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_create_quaternion")
	public static function createQuaternion(x:Float, y:Float, z:Float, w:Float):flight._hl.Quaternion;
	@:hlNative("flight", "flight_clone_quaternion")
	public static function cloneQuaternion(source:flight._hl.Quaternion):flight._hl.Quaternion;
	@:hlNative("flight", "flight_conjugate_quaternion")
	public static function conjugateQuaternion(out:flight._hl.Quaternion, source:flight._hl.Quaternion):Void;
	@:hlNative("flight", "flight_copy_quaternion")
	public static function copyQuaternion(out:flight._hl.Quaternion, source:flight._hl.Quaternion):Void;
	@:hlNative("flight", "flight_equals_quaternion")
	public static function equalsQuaternion(a:flight._hl.Quaternion, b:flight._hl.Quaternion):Bool;
	@:hlNative("flight", "flight_get_quaternion_angle_between")
	public static function getQuaternionAngleBetween(a:flight._hl.Quaternion, b:flight._hl.Quaternion):Float;
	@:hlNative("flight", "flight_get_quaternion_axis_angle")
	public static function getQuaternionAxisAngle(outAxis:flight._hl.Vector3, source:flight._hl.Quaternion):Float;
	@:hlNative("flight", "flight_get_quaternion_dot")
	public static function getQuaternionDot(a:flight._hl.Quaternion, b:flight._hl.Quaternion):Float;
	@:hlNative("flight", "flight_get_quaternion_euler")
	public static function getQuaternionEuler(out:flight._hl.Vector3, source:flight._hl.Quaternion, order:Int):Void;
	@:hlNative("flight", "flight_inverse_quaternion")
	public static function inverseQuaternion(out:flight._hl.Quaternion, source:flight._hl.Quaternion):Void;
	@:hlNative("flight", "flight_multiply_quaternion")
	public static function multiplyQuaternion(out:flight._hl.Quaternion, a:flight._hl.Quaternion, b:flight._hl.Quaternion):Void;
	@:hlNative("flight", "flight_normalize_quaternion")
	public static function normalizeQuaternion(out:flight._hl.Quaternion, source:flight._hl.Quaternion):Float;
	@:hlNative("flight", "flight_rotate_vector3_by_quaternion")
	public static function rotateVector3ByQuaternion(out:flight._hl.Vector3, vector:flight._hl.Vector3, q:flight._hl.Quaternion):Void;
	@:hlNative("flight", "flight_set_quaternion")
	public static function setQuaternion(out:flight._hl.Quaternion, x:Float, y:Float, z:Float, w:Float):Void;
	@:hlNative("flight", "flight_set_quaternion_from_axis_angle")
	public static function setQuaternionFromAxisAngle(out:flight._hl.Quaternion, axis:flight._hl.Vector3, angle:Float):Void;
	@:hlNative("flight", "flight_set_quaternion_from_euler")
	public static function setQuaternionFromEuler(out:flight._hl.Quaternion, x:Float, y:Float, z:Float, order:Int):Void;
	@:hlNative("flight", "flight_set_quaternion_from_matrix4")
	public static function setQuaternionFromMatrix4(out:flight._hl.Quaternion, source:flight._hl.Matrix4):Void;
	@:hlNative("flight", "flight_set_quaternion_from_unit_vectors")
	public static function setQuaternionFromUnitVectors(out:flight._hl.Quaternion, from:flight._hl.Vector3, to:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_set_quaternion_identity")
	public static function setQuaternionIdentity(out:flight._hl.Quaternion):Void;
	@:hlNative("flight", "flight_set_quaternion_look_rotation")
	public static function setQuaternionLookRotation(out:flight._hl.Quaternion, forward:flight._hl.Vector3, up:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_slerp_quaternion")
	public static function slerpQuaternion(out:flight._hl.Quaternion, a:flight._hl.Quaternion, b:flight._hl.Quaternion, t:Float):Void;
	@:hlNative("flight", "flight_acquire_identity_quaternion")
	public static function acquireIdentityQuaternion():flight._hl.Quaternion;
	@:hlNative("flight", "flight_acquire_quaternion")
	public static function acquireQuaternion():flight._hl.Quaternion;
	@:hlNative("flight", "flight_clear_quaternion_pool")
	public static function clearQuaternionPool():Void;
	@:hlNative("flight", "flight_release_quaternion")
	public static function releaseQuaternion(q:flight._hl.Quaternion):Void;
	@:hlNative("flight", "flight_create_ray3d")
	public static function createRay3d(originX:Float, originY:Float, originZ:Float, directionX:Float, directionY:Float, directionZ:Float):flight._hl.Ray3D;
	@:hlNative("flight", "flight_get_closest_point_between_ray3ds")
	public static function getClosestPointBetweenRay3ds(outA:flight._hl.Vector3, outB:flight._hl.Vector3, a:flight._hl.Ray3D, b:flight._hl.Ray3D):Void;
	@:hlNative("flight", "flight_get_closest_point_on_ray3d")
	public static function getClosestPointOnRay3d(out:flight._hl.Vector3, ray:flight._hl.Ray3D, point:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_get_ray3d_point_at")
	public static function getRay3dPointAt(out:flight._hl.Vector3, ray:flight._hl.Ray3D, t:Float):Void;
	@:hlNative("flight", "flight_intersect_ray3d_aabb")
	public static function intersectRay3dAabb(ray:flight._hl.Ray3D, aabb:flight._hl.Aabb):Float;
	@:hlNative("flight", "flight_intersect_ray3d_plane")
	public static function intersectRay3dPlane(ray:flight._hl.Ray3D, plane:flight._hl.Plane):Float;
	@:hlNative("flight", "flight_intersect_ray3d_sphere")
	public static function intersectRay3dSphere(ray:flight._hl.Ray3D, sphere:flight._hl.BoundingSphere):Float;
	@:hlNative("flight", "flight_intersect_ray3d_triangle")
	public static function intersectRay3dTriangle(ray:flight._hl.Ray3D, a:flight._hl.Vector3, b:flight._hl.Vector3, c:flight._hl.Vector3):Float;
	@:hlNative("flight", "flight_set_ray3d")
	public static function setRay3d(out:flight._hl.Ray3D, origin:flight._hl.Vector3, direction:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_transform_ray3d_by_matrix4")
	public static function transformRay3dByMatrix4(out:flight._hl.Ray3D, ray:flight._hl.Ray3D, m:flight._hl.Matrix4):Void;
	@:hlNative("flight", "flight_create_rectangle")
	public static function createRectangle(x:Float, y:Float, width:Float, height:Float):flight._hl.Rectangle;
	@:hlNative("flight", "flight_clone_rectangle")
	public static function cloneRectangle(source:flight._hl.Rectangle):flight._hl.Rectangle;
	@:hlNative("flight", "flight_compute_rectangle_intersection")
	public static function computeRectangleIntersection(out:flight._hl.Rectangle, a:flight._hl.Rectangle, b:flight._hl.Rectangle):Void;
	@:hlNative("flight", "flight_contains_rectangle_point")
	public static function containsRectanglePoint(source:flight._hl.Rectangle, vector:flight._hl.Vector2):Bool;
	@:hlNative("flight", "flight_contains_rectangle_point_xy")
	public static function containsRectanglePointXy(source:flight._hl.Rectangle, x:Float, y:Float):Bool;
	@:hlNative("flight", "flight_copy_rectangle")
	public static function copyRectangle(out:flight._hl.Rectangle, source:flight._hl.Rectangle):Void;
	@:hlNative("flight", "flight_encloses_rectangle")
	public static function enclosesRectangle(source:flight._hl.Rectangle, other:flight._hl.Rectangle):Bool;
	@:hlNative("flight", "flight_equals_rectangle")
	public static function equalsRectangle(a:flight._hl.Rectangle, b:flight._hl.Rectangle):Bool;
	@:hlNative("flight", "flight_expand_rectangle_to_point")
	public static function expandRectangleToPoint(out:flight._hl.Rectangle, sourceRect:flight._hl.Rectangle, sourceVec2:flight._hl.Vector2):Void;
	@:hlNative("flight", "flight_get_rectangle_bottom")
	public static function getRectangleBottom(source:flight._hl.Rectangle):Float;
	@:hlNative("flight", "flight_get_rectangle_bottom_right")
	public static function getRectangleBottomRight(out:flight._hl.Vector2, source:flight._hl.Rectangle):Void;
	@:hlNative("flight", "flight_get_rectangle_left")
	public static function getRectangleLeft(source:flight._hl.Rectangle):Float;
	@:hlNative("flight", "flight_get_rectangle_max_x")
	public static function getRectangleMaxX(source:flight._hl.Rectangle):Float;
	@:hlNative("flight", "flight_get_rectangle_max_y")
	public static function getRectangleMaxY(source:flight._hl.Rectangle):Float;
	@:hlNative("flight", "flight_get_rectangle_min_x")
	public static function getRectangleMinX(source:flight._hl.Rectangle):Float;
	@:hlNative("flight", "flight_get_rectangle_min_y")
	public static function getRectangleMinY(source:flight._hl.Rectangle):Float;
	@:hlNative("flight", "flight_get_rectangle_normalized_bottom_right")
	public static function getRectangleNormalizedBottomRight(out:flight._hl.Vector2, source:flight._hl.Rectangle):Void;
	@:hlNative("flight", "flight_get_rectangle_normalized_top_left")
	public static function getRectangleNormalizedTopLeft(out:flight._hl.Vector2, source:flight._hl.Rectangle):Void;
	@:hlNative("flight", "flight_get_rectangle_right")
	public static function getRectangleRight(source:flight._hl.Rectangle):Float;
	@:hlNative("flight", "flight_get_rectangle_size")
	public static function getRectangleSize(out:flight._hl.Vector2, source:flight._hl.Rectangle):Void;
	@:hlNative("flight", "flight_get_rectangle_top")
	public static function getRectangleTop(source:flight._hl.Rectangle):Float;
	@:hlNative("flight", "flight_get_rectangle_top_left")
	public static function getRectangleTopLeft(out:flight._hl.Vector2, source:flight._hl.Rectangle):Void;
	@:hlNative("flight", "flight_inflate_rectangle")
	public static function inflateRectangle(out:flight._hl.Rectangle, source:flight._hl.Rectangle, dx:Float, dy:Float):Void;
	@:hlNative("flight", "flight_intersects_rectangle")
	public static function intersectsRectangle(a:flight._hl.Rectangle, b:flight._hl.Rectangle):Bool;
	@:hlNative("flight", "flight_is_empty_rectangle")
	public static function isEmptyRectangle(source:flight._hl.Rectangle):Bool;
	@:hlNative("flight", "flight_is_flipped_x_rectangle")
	public static function isFlippedXRectangle(source:flight._hl.Rectangle):Bool;
	@:hlNative("flight", "flight_is_flipped_y_rectangle")
	public static function isFlippedYRectangle(source:flight._hl.Rectangle):Bool;
	@:hlNative("flight", "flight_merge_rectangle")
	public static function mergeRectangle(out:flight._hl.Rectangle, source:flight._hl.Rectangle, other:flight._hl.Rectangle):Void;
	@:hlNative("flight", "flight_normalize_rectangle")
	public static function normalizeRectangle(out:flight._hl.Rectangle, source:flight._hl.Rectangle):Void;
	@:hlNative("flight", "flight_offset_rectangle")
	public static function offsetRectangle(out:flight._hl.Rectangle, source:flight._hl.Rectangle, dx:Float, dy:Float):Void;
	@:hlNative("flight", "flight_offset_rectangle_by_point")
	public static function offsetRectangleByPoint(out:flight._hl.Rectangle, source:flight._hl.Rectangle, point:flight._hl.Vector2):Void;
	@:hlNative("flight", "flight_set_empty_rectangle")
	public static function setEmptyRectangle(out:flight._hl.Rectangle):Void;
	@:hlNative("flight", "flight_set_rectangle")
	public static function setRectangle(out:flight._hl.Rectangle, x:Float, y:Float, width:Float, height:Float):Void;
	@:hlNative("flight", "flight_set_rectangle_bottom")
	public static function setRectangleBottom(target:flight._hl.Rectangle, value:Float):Void;
	@:hlNative("flight", "flight_set_rectangle_bottom_right")
	public static function setRectangleBottomRight(target:flight._hl.Rectangle, point:flight._hl.Vector2):Void;
	@:hlNative("flight", "flight_set_rectangle_left")
	public static function setRectangleLeft(target:flight._hl.Rectangle, value:Float):Void;
	@:hlNative("flight", "flight_set_rectangle_right")
	public static function setRectangleRight(target:flight._hl.Rectangle, value:Float):Void;
	@:hlNative("flight", "flight_set_rectangle_size")
	public static function setRectangleSize(out:flight._hl.Rectangle, size:flight._hl.Vector2):Void;
	@:hlNative("flight", "flight_set_rectangle_top")
	public static function setRectangleTop(target:flight._hl.Rectangle, value:Float):Void;
	@:hlNative("flight", "flight_set_rectangle_top_left")
	public static function setRectangleTopLeft(out:flight._hl.Rectangle, point:flight._hl.Vector2):Void;
	@:hlNative("flight", "flight_acquire_empty_rectangle")
	public static function acquireEmptyRectangle():flight._hl.Rectangle;
	@:hlNative("flight", "flight_acquire_rectangle")
	public static function acquireRectangle():flight._hl.Rectangle;
	@:hlNative("flight", "flight_clear_rectangle_pool")
	public static function clearRectanglePool():Void;
	@:hlNative("flight", "flight_release_rectangle")
	public static function releaseRectangle(r:flight._hl.Rectangle):Void;
	@:hlNative("flight", "flight_create_transform2d")
	private static function __flightPacked_createTransform2d(__flightValues:hl.NativeArray<Float>):flight._hl.Transform2D;
	public static inline function createTransform2d(x:Float, y:Float, rotation:Float, scaleX:Float, scaleY:Float, skewX:Float, skewY:Float, pivotX:Float, pivotY:Float):flight._hl.Transform2D {
		var __flightValues = new hl.NativeArray<Float>(9);
		__flightValues[0] = x;
		__flightValues[1] = y;
		__flightValues[2] = rotation;
		__flightValues[3] = scaleX;
		__flightValues[4] = scaleY;
		__flightValues[5] = skewX;
		__flightValues[6] = skewY;
		__flightValues[7] = pivotX;
		__flightValues[8] = pivotY;
		return __flightPacked_createTransform2d(__flightValues);
	}
	@:hlNative("flight", "flight_decompose_matrix_to_transform2d")
	public static function decomposeMatrixToTransform2d(out:flight._hl.Transform2D, source:flight._hl.Matrix):Void;
	@:hlNative("flight", "flight_create_transform3d")
	public static function createTransform3d():flight._hl.Transform3D;
	@:hlNative("flight", "flight_compose_matrix4_from_transform3d")
	public static function composeMatrix4FromTransform3d(out:flight._hl.Matrix4, source:flight._hl.Transform3D):Void;
	@:hlNative("flight", "flight_decompose_matrix4_to_transform3d")
	public static function decomposeMatrix4ToTransform3d(out:flight._hl.Transform3D, m:flight._hl.Matrix4):Void;
	@:hlNative("flight", "flight_reserve_float32_array")
	public static function reserveFloat32Array(array:hl.Bytes, arrayLen:Int, capacity:Int):hl.Bytes;
	@:hlNative("flight", "flight_reserve_int16_array")
	public static function reserveInt16Array(array:hl.Bytes, arrayLen:Int, capacity:Int):hl.Bytes;
	@:hlNative("flight", "flight_reserve_uint16_array")
	public static function reserveUint16Array(array:hl.Bytes, arrayLen:Int, capacity:Int):hl.Bytes;
	@:hlNative("flight", "flight_create_vector2")
	public static function createVector2(x:Float, y:Float):flight._hl.Vector2;
	@:hlNative("flight", "flight_create_vector2_from_polar")
	public static function createVector2FromPolar(length:Float, angle:Float):flight._hl.Vector2;
	@:hlNative("flight", "flight_add_vector2")
	public static function addVector2(out:flight._hl.Vector2, a:flight._hl.Vector2, b:flight._hl.Vector2):Void;
	@:hlNative("flight", "flight_clamp_vector2")
	public static function clampVector2(out:flight._hl.Vector2, value:flight._hl.Vector2, min:flight._hl.Vector2, max:flight._hl.Vector2):Void;
	@:hlNative("flight", "flight_clone_vector2")
	public static function cloneVector2(source:flight._hl.Vector2):flight._hl.Vector2;
	@:hlNative("flight", "flight_copy_vector2")
	public static function copyVector2(out:flight._hl.Vector2, source:flight._hl.Vector2):Void;
	@:hlNative("flight", "flight_cross_vector2")
	public static function crossVector2(a:flight._hl.Vector2, b:flight._hl.Vector2):Float;
	@:hlNative("flight", "flight_divide_vector2")
	public static function divideVector2(out:flight._hl.Vector2, source:flight._hl.Vector2, divisor:flight._hl.Vector2):Void;
	@:hlNative("flight", "flight_equals_vector2")
	public static function equalsVector2(a:flight._hl.Vector2, b:flight._hl.Vector2):Bool;
	@:hlNative("flight", "flight_get_vector2_angle")
	public static function getVector2Angle(source:flight._hl.Vector2):Float;
	@:hlNative("flight", "flight_get_vector2_angle_between")
	public static function getVector2AngleBetween(a:flight._hl.Vector2, b:flight._hl.Vector2):Float;
	@:hlNative("flight", "flight_get_vector2_distance")
	public static function getVector2Distance(a:flight._hl.Vector2, b:flight._hl.Vector2):Float;
	@:hlNative("flight", "flight_get_vector2_distance_squared")
	public static function getVector2DistanceSquared(a:flight._hl.Vector2, b:flight._hl.Vector2):Float;
	@:hlNative("flight", "flight_get_vector2_dot")
	public static function getVector2Dot(a:flight._hl.Vector2, b:flight._hl.Vector2):Float;
	@:hlNative("flight", "flight_get_vector2_length")
	public static function getVector2Length(source:flight._hl.Vector2):Float;
	@:hlNative("flight", "flight_get_vector2_length_squared")
	public static function getVector2LengthSquared(source:flight._hl.Vector2):Float;
	@:hlNative("flight", "flight_interpolate_vector2")
	public static function interpolateVector2(out:flight._hl.Vector2, a:flight._hl.Vector2, b:flight._hl.Vector2, t:Float):Void;
	@:hlNative("flight", "flight_max_vector2")
	public static function maxVector2(out:flight._hl.Vector2, a:flight._hl.Vector2, b:flight._hl.Vector2):Void;
	@:hlNative("flight", "flight_min_vector2")
	public static function minVector2(out:flight._hl.Vector2, a:flight._hl.Vector2, b:flight._hl.Vector2):Void;
	@:hlNative("flight", "flight_multiply_vector2")
	public static function multiplyVector2(out:flight._hl.Vector2, a:flight._hl.Vector2, b:flight._hl.Vector2):Void;
	@:hlNative("flight", "flight_near_equals_vector2")
	public static function nearEqualsVector2(a:flight._hl.Vector2, b:flight._hl.Vector2, tolerance:Float):Bool;
	@:hlNative("flight", "flight_negate_vector2")
	public static function negateVector2(out:flight._hl.Vector2, source:flight._hl.Vector2):Void;
	@:hlNative("flight", "flight_normalize_vector2")
	public static function normalizeVector2(out:flight._hl.Vector2, source:flight._hl.Vector2):Float;
	@:hlNative("flight", "flight_offset_vector2")
	public static function offsetVector2(out:flight._hl.Vector2, source:flight._hl.Vector2, dx:Float, dy:Float):Void;
	@:hlNative("flight", "flight_reflect_vector2")
	public static function reflectVector2(out:flight._hl.Vector2, incident:flight._hl.Vector2, normal:flight._hl.Vector2):Void;
	@:hlNative("flight", "flight_rotate_vector2")
	public static function rotateVector2(out:flight._hl.Vector2, source:flight._hl.Vector2, angle:Float):Void;
	@:hlNative("flight", "flight_scale_vector2")
	public static function scaleVector2(out:flight._hl.Vector2, source:flight._hl.Vector2, scalar:Float):Void;
	@:hlNative("flight", "flight_scale_vector2_to_length")
	public static function scaleVector2ToLength(out:flight._hl.Vector2, source:flight._hl.Vector2, length:Float):Void;
	@:hlNative("flight", "flight_set_vector2")
	public static function setVector2(out:flight._hl.Vector2, x:Float, y:Float):Void;
	@:hlNative("flight", "flight_set_vector2_from_float32_array")
	public static function setVector2FromFloat32Array(out:flight._hl.Vector2, offset:Int, source:hl.Bytes, sourceLen:Int):Void;
	@:hlNative("flight", "flight_set_vector2_from_polar")
	public static function setVector2FromPolar(out:flight._hl.Vector2, length:Float, angle:Float):Void;
	@:hlNative("flight", "flight_set_vector2_from_vector3")
	public static function setVector2FromVector3(out:flight._hl.Vector2, source:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_subtract_vector2")
	public static function subtractVector2(out:flight._hl.Vector2, source:flight._hl.Vector2, other:flight._hl.Vector2):Void;
	@:hlNative("flight", "flight_write_vector2_to_float32_array")
	public static function writeVector2ToFloat32Array(out:hl.Bytes, outLen:Int, offset:Int, source:flight._hl.Vector2):Void;
	@:hlNative("flight", "flight_acquire_empty_vector2")
	public static function acquireEmptyVector2():flight._hl.Vector2;
	@:hlNative("flight", "flight_acquire_vector2")
	public static function acquireVector2():flight._hl.Vector2;
	@:hlNative("flight", "flight_clear_vector2_pool")
	public static function clearVector2Pool():Void;
	@:hlNative("flight", "flight_release_vector2")
	public static function releaseVector2(v:flight._hl.Vector2):Void;
	@:hlNative("flight", "flight_create_vector3")
	public static function createVector3(x:Float, y:Float, z:Float):flight._hl.Vector3;
	@:hlNative("flight", "flight_create_vector3_from_spherical")
	public static function createVector3FromSpherical(radius:Float, theta:Float, phi:Float):flight._hl.Vector3;
	@:hlNative("flight", "flight_add_vector3")
	public static function addVector3(out:flight._hl.Vector3, a:flight._hl.Vector3, b:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_clamp_vector3")
	public static function clampVector3(out:flight._hl.Vector3, value:flight._hl.Vector3, min:flight._hl.Vector3, max:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_clone_vector3")
	public static function cloneVector3(source:flight._hl.Vector3):flight._hl.Vector3;
	@:hlNative("flight", "flight_copy_vector3")
	public static function copyVector3(out:flight._hl.Vector3, source:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_cross_vector3")
	public static function crossVector3(out:flight._hl.Vector3, source:flight._hl.Vector3, other:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_divide_vector3")
	public static function divideVector3(out:flight._hl.Vector3, source:flight._hl.Vector3, divisor:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_equals_vector3")
	public static function equalsVector3(a:flight._hl.Vector3, b:flight._hl.Vector3):Bool;
	@:hlNative("flight", "flight_get_vector3_angle_between")
	public static function getVector3AngleBetween(a:flight._hl.Vector3, b:flight._hl.Vector3):Float;
	@:hlNative("flight", "flight_get_vector3_distance")
	public static function getVector3Distance(a:flight._hl.Vector3, b:flight._hl.Vector3):Float;
	@:hlNative("flight", "flight_get_vector3_distance_squared")
	public static function getVector3DistanceSquared(a:flight._hl.Vector3, b:flight._hl.Vector3):Float;
	@:hlNative("flight", "flight_get_vector3_dot")
	public static function getVector3Dot(a:flight._hl.Vector3, b:flight._hl.Vector3):Float;
	@:hlNative("flight", "flight_get_vector3_length")
	public static function getVector3Length(source:flight._hl.Vector3):Float;
	@:hlNative("flight", "flight_get_vector3_length_squared")
	public static function getVector3LengthSquared(source:flight._hl.Vector3):Float;
	@:hlNative("flight", "flight_get_vector3_spherical")
	public static function getVector3Spherical(out:flight._hl.Vector3, source:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_interpolate_vector3")
	public static function interpolateVector3(out:flight._hl.Vector3, a:flight._hl.Vector3, b:flight._hl.Vector3, t:Float):Void;
	@:hlNative("flight", "flight_max_vector3")
	public static function maxVector3(out:flight._hl.Vector3, a:flight._hl.Vector3, b:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_min_vector3")
	public static function minVector3(out:flight._hl.Vector3, a:flight._hl.Vector3, b:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_multiply_vector3")
	public static function multiplyVector3(out:flight._hl.Vector3, a:flight._hl.Vector3, b:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_near_equals_vector3")
	public static function nearEqualsVector3(a:flight._hl.Vector3, b:flight._hl.Vector3, tolerance:Float):Bool;
	@:hlNative("flight", "flight_negate_vector3")
	public static function negateVector3(out:flight._hl.Vector3, source:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_normalize_vector3")
	public static function normalizeVector3(out:flight._hl.Vector3, source:flight._hl.Vector3):Float;
	@:hlNative("flight", "flight_offset_vector3")
	public static function offsetVector3(out:flight._hl.Vector3, source:flight._hl.Vector3, dx:Float, dy:Float, dz:Float):Void;
	@:hlNative("flight", "flight_project_vector3")
	public static function projectVector3(out:flight._hl.Vector2, source:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_reflect_vector3")
	public static function reflectVector3(out:flight._hl.Vector3, incident:flight._hl.Vector3, normal:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_scale_vector3")
	public static function scaleVector3(out:flight._hl.Vector3, source:flight._hl.Vector3, scalar:Float):Void;
	@:hlNative("flight", "flight_set_vector3")
	public static function setVector3(out:flight._hl.Vector3, x:Float, y:Float, z:Float):Void;
	@:hlNative("flight", "flight_set_vector3_from_float32_array")
	public static function setVector3FromFloat32Array(out:flight._hl.Vector3, offset:Int, source:hl.Bytes, sourceLen:Int):Void;
	@:hlNative("flight", "flight_set_vector3_from_spherical")
	public static function setVector3FromSpherical(out:flight._hl.Vector3, radius:Float, theta:Float, phi:Float):Void;
	@:hlNative("flight", "flight_set_vector3_from_vector4")
	public static function setVector3FromVector4(out:flight._hl.Vector3, source:flight._hl.Vector4):Void;
	@:hlNative("flight", "flight_subtract_vector3")
	public static function subtractVector3(out:flight._hl.Vector3, source:flight._hl.Vector3, other:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_transform_vector3_by_matrix3")
	public static function transformVector3ByMatrix3(out:flight._hl.Vector3, source:flight._hl.Vector3, matrix:flight._hl.Matrix3):Void;
	@:hlNative("flight", "flight_write_vector3_to_float32_array")
	public static function writeVector3ToFloat32Array(out:hl.Bytes, outLen:Int, offset:Int, source:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_acquire_empty_vector3")
	public static function acquireEmptyVector3():flight._hl.Vector3;
	@:hlNative("flight", "flight_acquire_vector3")
	public static function acquireVector3():flight._hl.Vector3;
	@:hlNative("flight", "flight_clear_vector3_pool")
	public static function clearVector3Pool():Void;
	@:hlNative("flight", "flight_release_vector3")
	public static function releaseVector3(v:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_create_vector4")
	public static function createVector4(x:Float, y:Float, z:Float, w:Float):flight._hl.Vector4;
	@:hlNative("flight", "flight_add_vector4")
	public static function addVector4(out:flight._hl.Vector4, a:flight._hl.Vector4, b:flight._hl.Vector4):Void;
	@:hlNative("flight", "flight_clamp_vector4")
	public static function clampVector4(out:flight._hl.Vector4, value:flight._hl.Vector4, min:flight._hl.Vector4, max:flight._hl.Vector4):Void;
	@:hlNative("flight", "flight_clone_vector4")
	public static function cloneVector4(source:flight._hl.Vector4):flight._hl.Vector4;
	@:hlNative("flight", "flight_copy_vector4")
	public static function copyVector4(out:flight._hl.Vector4, source:flight._hl.Vector4):Void;
	@:hlNative("flight", "flight_divide_vector4")
	public static function divideVector4(out:flight._hl.Vector4, source:flight._hl.Vector4, divisor:flight._hl.Vector4):Void;
	@:hlNative("flight", "flight_equals_vector4")
	public static function equalsVector4(a:flight._hl.Vector4, b:flight._hl.Vector4):Bool;
	@:hlNative("flight", "flight_get_vector4_angle_between")
	public static function getVector4AngleBetween(a:flight._hl.Vector4, b:flight._hl.Vector4):Float;
	@:hlNative("flight", "flight_get_vector4_distance")
	public static function getVector4Distance(a:flight._hl.Vector4, b:flight._hl.Vector4):Float;
	@:hlNative("flight", "flight_get_vector4_distance_squared")
	public static function getVector4DistanceSquared(a:flight._hl.Vector4, b:flight._hl.Vector4):Float;
	@:hlNative("flight", "flight_get_vector4_dot")
	public static function getVector4Dot(a:flight._hl.Vector4, b:flight._hl.Vector4):Float;
	@:hlNative("flight", "flight_get_vector4_length")
	public static function getVector4Length(source:flight._hl.Vector4):Float;
	@:hlNative("flight", "flight_get_vector4_length_squared")
	public static function getVector4LengthSquared(source:flight._hl.Vector4):Float;
	@:hlNative("flight", "flight_interpolate_vector4")
	public static function interpolateVector4(out:flight._hl.Vector4, a:flight._hl.Vector4, b:flight._hl.Vector4, t:Float):Void;
	@:hlNative("flight", "flight_max_vector4")
	public static function maxVector4(out:flight._hl.Vector4, a:flight._hl.Vector4, b:flight._hl.Vector4):Void;
	@:hlNative("flight", "flight_min_vector4")
	public static function minVector4(out:flight._hl.Vector4, a:flight._hl.Vector4, b:flight._hl.Vector4):Void;
	@:hlNative("flight", "flight_multiply_vector4")
	public static function multiplyVector4(out:flight._hl.Vector4, a:flight._hl.Vector4, b:flight._hl.Vector4):Void;
	@:hlNative("flight", "flight_near_equals_vector4")
	public static function nearEqualsVector4(a:flight._hl.Vector4, b:flight._hl.Vector4, tolerance:Float):Bool;
	@:hlNative("flight", "flight_negate_vector4")
	public static function negateVector4(out:flight._hl.Vector4, source:flight._hl.Vector4):Void;
	@:hlNative("flight", "flight_normalize_vector4")
	public static function normalizeVector4(out:flight._hl.Vector4, source:flight._hl.Vector4):Float;
	@:hlNative("flight", "flight_offset_vector4")
	public static function offsetVector4(out:flight._hl.Vector4, source:flight._hl.Vector4, dx:Float, dy:Float, dz:Float, dw:Float):Void;
	@:hlNative("flight", "flight_project_vector4")
	public static function projectVector4(out:flight._hl.Vector3, source:flight._hl.Vector4):Void;
	@:hlNative("flight", "flight_reflect_vector4")
	public static function reflectVector4(out:flight._hl.Vector4, incident:flight._hl.Vector4, normal:flight._hl.Vector4):Void;
	@:hlNative("flight", "flight_scale_vector4")
	public static function scaleVector4(out:flight._hl.Vector4, source:flight._hl.Vector4, scalar:Float):Void;
	@:hlNative("flight", "flight_set_vector4")
	public static function setVector4(out:flight._hl.Vector4, x:Float, y:Float, z:Float, w:Float):Void;
	@:hlNative("flight", "flight_set_vector4_from_float32_array")
	public static function setVector4FromFloat32Array(out:flight._hl.Vector4, offset:Int, source:hl.Bytes, sourceLen:Int):Void;
	@:hlNative("flight", "flight_set_vector4_from_vector3")
	public static function setVector4FromVector3(out:flight._hl.Vector4, source:flight._hl.Vector3, w:Float):Void;
	@:hlNative("flight", "flight_subtract_vector4")
	public static function subtractVector4(out:flight._hl.Vector4, source:flight._hl.Vector4, other:flight._hl.Vector4):Void;
	@:hlNative("flight", "flight_write_vector4_to_float32_array")
	public static function writeVector4ToFloat32Array(out:hl.Bytes, outLen:Int, offset:Int, source:flight._hl.Vector4):Void;
	@:hlNative("flight", "flight_acquire_empty_vector4")
	public static function acquireEmptyVector4():flight._hl.Vector4;
	@:hlNative("flight", "flight_acquire_vector4")
	public static function acquireVector4():flight._hl.Vector4;
	@:hlNative("flight", "flight_clear_vector4_pool")
	public static function clearVector4Pool():Void;
	@:hlNative("flight", "flight_release_vector4")
	public static function releaseVector4(v:flight._hl.Vector4):Void;
	@:hlNative("flight", "flight_free_aabb")
	public static function freeAabb(ptr:flight._hl.Aabb):Void;
	@:hlNative("flight", "flight_free_bounding_sphere")
	public static function freeBoundingSphere(ptr:flight._hl.BoundingSphere):Void;
	@:hlNative("flight", "flight_free_capsule")
	public static function freeCapsule(ptr:flight._hl.Capsule):Void;
	@:hlNative("flight", "flight_free_frustum")
	public static function freeFrustum(ptr:flight._hl.Frustum):Void;
	@:hlNative("flight", "flight_free_matrix")
	public static function freeMatrix(ptr:flight._hl.Matrix):Void;
	@:hlNative("flight", "flight_free_matrix3")
	public static function freeMatrix3(ptr:flight._hl.Matrix3):Void;
	@:hlNative("flight", "flight_free_matrix4")
	public static function freeMatrix4(ptr:flight._hl.Matrix4):Void;
	@:hlNative("flight", "flight_free_obb")
	public static function freeObb(ptr:flight._hl.Obb):Void;
	@:hlNative("flight", "flight_free_plane")
	public static function freePlane(ptr:flight._hl.Plane):Void;
	@:hlNative("flight", "flight_free_quaternion")
	public static function freeQuaternion(ptr:flight._hl.Quaternion):Void;
	@:hlNative("flight", "flight_free_ray3_d")
	public static function freeRay3D(ptr:flight._hl.Ray3D):Void;
	@:hlNative("flight", "flight_free_transform2_d")
	public static function freeTransform2D(ptr:flight._hl.Transform2D):Void;
	@:hlNative("flight", "flight_free_transform3_d")
	public static function freeTransform3D(ptr:flight._hl.Transform3D):Void;
	@:hlNative("flight", "flight_free_vector2")
	public static function freeVector2(ptr:flight._hl.Vector2):Void;
	@:hlNative("flight", "flight_free_vector3")
	public static function freeVector3(ptr:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_free_vector4")
	public static function freeVector4(ptr:flight._hl.Vector4):Void;
	@:hlNative("flight", "flight_free_rectangle")
	public static function freeRectangle(ptr:flight._hl.Rectangle):Void;
}
