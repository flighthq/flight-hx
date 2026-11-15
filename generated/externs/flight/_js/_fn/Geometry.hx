package flight._js._fn;

@:jsRequire("flight")
extern class Geometry {
	@:native("flight_create_aabb")
	public static function createAabb(minX:Float, minY:Float, minZ:Float, maxX:Float, maxY:Float, maxZ:Float):flight._js.Aabb;
	@:native("flight_clone_aabb")
	public static function cloneAabb(source:flight._js.Aabb):flight._js.Aabb;
	@:native("flight_contains_aabb_point")
	public static function containsAabbPoint(aabb:flight._js.Aabb, point:flight._js.Vector3):Bool;
	@:native("flight_copy_aabb")
	public static function copyAabb(out:flight._js.Aabb, source:flight._js.Aabb):Void;
	@:native("flight_expand_aabb_by_point")
	public static function expandAabbByPoint(out:flight._js.Aabb, aabb:flight._js.Aabb, point:flight._js.Vector3):Void;
	@:native("flight_expand_aabb_by_sphere")
	public static function expandAabbBySphere(out:flight._js.Aabb, aabb:flight._js.Aabb, sphere:flight._js.BoundingSphere):Void;
	@:native("flight_get_aabb_center")
	public static function getAabbCenter(out:flight._js.Vector3, aabb:flight._js.Aabb):Void;
	@:native("flight_get_aabb_extents")
	public static function getAabbExtents(out:flight._js.Vector3, aabb:flight._js.Aabb):Void;
	@:native("flight_get_aabb_size")
	public static function getAabbSize(out:flight._js.Vector3, aabb:flight._js.Aabb):Void;
	@:native("flight_get_closest_point_on_aabb")
	public static function getClosestPointOnAabb(out:flight._js.Vector3, aabb:flight._js.Aabb, point:flight._js.Vector3):Void;
	@:native("flight_intersect_aabb")
	public static function intersectAabb(out:flight._js.Aabb, a:flight._js.Aabb, b:flight._js.Aabb):Void;
	@:native("flight_is_aabb_intersecting_aabb")
	public static function isAabbIntersectingAabb(a:flight._js.Aabb, b:flight._js.Aabb):Bool;
	@:native("flight_is_aabb_intersecting_sphere")
	public static function isAabbIntersectingSphere(aabb:flight._js.Aabb, sphere:flight._js.BoundingSphere):Bool;
	@:native("flight_set_aabb")
	public static function setAabb(out:flight._js.Aabb, minX:Float, minY:Float, minZ:Float, maxX:Float, maxY:Float, maxZ:Float):Void;
	@:native("flight_set_aabb_from_points")
	public static function setAabbFromPoints(out:flight._js.Aabb, points:Dynamic, pointsLen:Int):Void;
	@:native("flight_transform_aabb_by_matrix4")
	public static function transformAabbByMatrix4(out:flight._js.Aabb, aabb:flight._js.Aabb, m:flight._js.Matrix4):Void;
	@:native("flight_union_aabb")
	public static function unionAabb(out:flight._js.Aabb, a:flight._js.Aabb, b:flight._js.Aabb):Void;
	@:native("flight_create_bounding_sphere")
	public static function createBoundingSphere(centerX:Float, centerY:Float, centerZ:Float, radius:Float):flight._js.BoundingSphere;
	@:native("flight_clone_bounding_sphere")
	public static function cloneBoundingSphere(source:flight._js.BoundingSphere):flight._js.BoundingSphere;
	@:native("flight_contains_bounding_sphere_point")
	public static function containsBoundingSpherePoint(sphere:flight._js.BoundingSphere, point:flight._js.Vector3):Bool;
	@:native("flight_copy_bounding_sphere")
	public static function copyBoundingSphere(out:flight._js.BoundingSphere, source:flight._js.BoundingSphere):Void;
	@:native("flight_get_closest_point_on_bounding_sphere")
	public static function getClosestPointOnBoundingSphere(out:flight._js.Vector3, sphere:flight._js.BoundingSphere, point:flight._js.Vector3):Void;
	@:native("flight_is_bounding_sphere_intersecting_bounding_sphere")
	public static function isBoundingSphereIntersectingBoundingSphere(a:flight._js.BoundingSphere, b:flight._js.BoundingSphere):Bool;
	@:native("flight_merge_bounding_sphere")
	public static function mergeBoundingSphere(out:flight._js.BoundingSphere, a:flight._js.BoundingSphere, b:flight._js.BoundingSphere):Void;
	@:native("flight_set_bounding_sphere")
	public static function setBoundingSphere(out:flight._js.BoundingSphere, centerX:Float, centerY:Float, centerZ:Float, radius:Float):Void;
	@:native("flight_set_bounding_sphere_from_aabb")
	public static function setBoundingSphereFromAabb(out:flight._js.BoundingSphere, aabb:flight._js.Aabb):Void;
	@:native("flight_transform_bounding_sphere_by_matrix4")
	public static function transformBoundingSphereByMatrix4(out:flight._js.BoundingSphere, sphere:flight._js.BoundingSphere, m:flight._js.Matrix4):Void;
	@:native("flight_create_capsule")
	public static function createCapsule(startX:Float, startY:Float, startZ:Float, endX:Float, endY:Float, endZ:Float, radius:Float):flight._js.Capsule;
	@:native("flight_get_closest_point_on_capsule")
	public static function getClosestPointOnCapsule(out:flight._js.Vector3, capsule:flight._js.Capsule, point:flight._js.Vector3):Void;
	@:native("flight_intersect_ray3d_capsule")
	public static function intersectRay3dCapsule(ray:flight._js.Ray3D, capsule:flight._js.Capsule):Float;
	@:native("flight_is_capsule_intersecting_aabb")
	public static function isCapsuleIntersectingAabb(capsule:flight._js.Capsule, aabb:flight._js.Aabb):Bool;
	@:native("flight_is_capsule_intersecting_capsule")
	public static function isCapsuleIntersectingCapsule(a:flight._js.Capsule, b:flight._js.Capsule):Bool;
	@:native("flight_is_capsule_intersecting_sphere")
	public static function isCapsuleIntersectingSphere(capsule:flight._js.Capsule, sphere:flight._js.BoundingSphere):Bool;
	@:native("flight_set_capsule")
	public static function setCapsule(out:flight._js.Capsule, startX:Float, startY:Float, startZ:Float, endX:Float, endY:Float, endZ:Float, radius:Float):Void;
	@:native("flight_are_geometry_pool_guards_enabled")
	public static function areGeometryPoolGuardsEnabled():Bool;
	@:native("flight_disable_geometry_pool_guards")
	public static function disableGeometryPoolGuards():Void;
	@:native("flight_enable_geometry_pool_guards")
	public static function enableGeometryPoolGuards(logState:Dynamic, clockFn:Dynamic, clockCtx:Dynamic):Void;
	@:native("flight_create_frustum")
	public static function createFrustum():flight._js.Frustum;
	@:native("flight_get_frustum_corners")
	public static function getFrustumCorners(out:Dynamic, outLen:Int, inverseViewProjection:flight._js.Matrix4):Void;
	@:native("flight_is_frustum_containing_point")
	public static function isFrustumContainingPoint(frustum:flight._js.Frustum, point:flight._js.Vector3):Bool;
	@:native("flight_is_frustum_intersecting_aabb")
	public static function isFrustumIntersectingAabb(frustum:flight._js.Frustum, aabb:flight._js.Aabb):Bool;
	@:native("flight_is_frustum_intersecting_obb")
	public static function isFrustumIntersectingObb(frustum:flight._js.Frustum, obb:flight._js.Obb):Bool;
	@:native("flight_is_frustum_intersecting_sphere")
	public static function isFrustumIntersectingSphere(frustum:flight._js.Frustum, sphere:flight._js.BoundingSphere):Bool;
	@:native("flight_set_frustum_from_matrix4")
	public static function setFrustumFromMatrix4(out:flight._js.Frustum, viewProjection:flight._js.Matrix4):Void;
	@:native("flight_create_gradient_transform_matrix")
	public static function createGradientTransformMatrix(width:Float, height:Float, rotation:Float, tx:Float, ty:Float):flight._js.Matrix;
	@:native("flight_create_matrix")
	public static function createMatrix(a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):flight._js.Matrix;
	@:native("flight_create_transform_matrix")
	public static function createTransformMatrix(scaleX:Float, scaleY:Float, rotation:Float, tx:Float, ty:Float):flight._js.Matrix;
	@:native("flight_clone_matrix")
	public static function cloneMatrix(source:flight._js.Matrix):flight._js.Matrix;
	@:native("flight_copy_matrix")
	public static function copyMatrix(out:flight._js.Matrix, source:flight._js.Matrix):Void;
	@:native("flight_copy_matrix_column_from_vector3")
	public static function copyMatrixColumnFromVector3(out:flight._js.Matrix, column:Int, source:flight._js.Vector3):Void;
	@:native("flight_copy_matrix_column_to_vector3")
	public static function copyMatrixColumnToVector3(out:flight._js.Vector3, column:Int, source:flight._js.Matrix):Void;
	@:native("flight_copy_matrix_row_from_vector3")
	public static function copyMatrixRowFromVector3(out:flight._js.Matrix, row:Int, source:flight._js.Vector3):Void;
	@:native("flight_copy_matrix_row_to_vector3")
	public static function copyMatrixRowToVector3(out:flight._js.Vector3, row:Int, source:flight._js.Matrix):Void;
	@:native("flight_equals_matrix")
	public static function equalsMatrix(a:flight._js.Matrix, b:flight._js.Matrix, compareTranslation:Bool):Bool;
	@:native("flight_inverse_matrix")
	public static function inverseMatrix(out:flight._js.Matrix, source:flight._js.Matrix):Bool;
	@:native("flight_inverse_matrix_transform_point")
	public static function inverseMatrixTransformPoint(out:flight._js.Vector2, matrix:flight._js.Matrix, point:flight._js.Vector2):Void;
	@:native("flight_inverse_matrix_transform_point_xy")
	public static function inverseMatrixTransformPointXy(out:flight._js.Vector2, source:flight._js.Matrix, x:Float, y:Float):Void;
	@:native("flight_inverse_matrix_transform_vector")
	public static function inverseMatrixTransformVector(out:flight._js.Vector2, matrix:flight._js.Matrix, vector:flight._js.Vector2):Void;
	@:native("flight_inverse_matrix_transform_vector_xy")
	public static function inverseMatrixTransformVectorXy(out:flight._js.Vector2, source:flight._js.Matrix, x:Float, y:Float):Void;
	@:native("flight_matrix_transform_bounds")
	public static function matrixTransformBounds(out:flight._js.Rectangle, source:flight._js.Matrix, ax:Float, ay:Float, bx:Float, by:Float):Void;
	@:native("flight_matrix_transform_bounds_vector2")
	public static function matrixTransformBoundsVector2(out:flight._js.Rectangle, matrix:flight._js.Matrix, a:flight._js.Vector2, b:flight._js.Vector2):Void;
	@:native("flight_matrix_transform_point")
	public static function matrixTransformPoint(out:flight._js.Vector2, matrix:flight._js.Matrix, point:flight._js.Vector2):Void;
	@:native("flight_matrix_transform_point_xy")
	public static function matrixTransformPointXy(out:flight._js.Vector2, source:flight._js.Matrix, x:Float, y:Float):Void;
	@:native("flight_matrix_transform_rectangle")
	public static function matrixTransformRectangle(out:flight._js.Rectangle, matrix:flight._js.Matrix, source:flight._js.Rectangle):Void;
	@:native("flight_matrix_transform_vector")
	public static function matrixTransformVector(out:flight._js.Vector2, matrix:flight._js.Matrix, vector:flight._js.Vector2):Void;
	@:native("flight_matrix_transform_vector_xy")
	public static function matrixTransformVectorXy(out:flight._js.Vector2, source:flight._js.Matrix, x:Float, y:Float):Void;
	@:native("flight_multiply_matrix")
	public static function multiplyMatrix(out:flight._js.Matrix, a:flight._js.Matrix, b:flight._js.Matrix):Void;
	@:native("flight_rotate_matrix")
	public static function rotateMatrix(out:flight._js.Matrix, source:flight._js.Matrix, theta:Float):Void;
	@:native("flight_scale_matrix")
	public static function scaleMatrix(out:flight._js.Matrix, source:flight._js.Matrix, sx:Float, sy:Float):Void;
	@:native("flight_set_gradient_transform_matrix")
	public static function setGradientTransformMatrix(out:flight._js.Matrix, width:Float, height:Float, rotation:Float, tx:Float, ty:Float):Void;
	@:native("flight_set_matrix")
	public static function setMatrix(out:flight._js.Matrix, a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):Void;
	@:native("flight_set_matrix_from_float32_array")
	public static function setMatrixFromFloat32Array(out:flight._js.Matrix, offset:Int, source:Dynamic, sourceLen:Int):Void;
	@:native("flight_set_matrix_from_matrix3")
	public static function setMatrixFromMatrix3(out:flight._js.Matrix, source:flight._js.Matrix3):Void;
	@:native("flight_set_matrix_from_matrix4")
	public static function setMatrixFromMatrix4(out:flight._js.Matrix, source:flight._js.Matrix4):Void;
	@:native("flight_set_matrix_identity")
	public static function setMatrixIdentity(out:flight._js.Matrix):Void;
	@:native("flight_set_transform_matrix")
	public static function setTransformMatrix(out:flight._js.Matrix, scaleX:Float, scaleY:Float, rotation:Float, tx:Float, ty:Float):Void;
	@:native("flight_translate_matrix")
	public static function translateMatrix(out:flight._js.Matrix, source:flight._js.Matrix, dx:Float, dy:Float):Void;
	@:native("flight_translate_matrix_by_vector")
	public static function translateMatrixByVector(out:flight._js.Matrix, matrix:flight._js.Matrix, vector:flight._js.Vector2):Void;
	@:native("flight_translate_matrix_by_vector_xy")
	public static function translateMatrixByVectorXy(out:flight._js.Matrix, source:flight._js.Matrix, x:Float, y:Float):Void;
	@:native("flight_write_matrix_to_float32_array")
	public static function writeMatrixToFloat32Array(out:Dynamic, outLen:Int, offset:Int, source:flight._js.Matrix):Void;
	@:native("flight_create_matrix3")
	public static function createMatrix3():flight._js.Matrix3;
	@:native("flight_create_matrix3_from_values")
	public static function createMatrix3FromValues(m00:Float, m01:Float, m02:Float, m10:Float, m11:Float, m12:Float, m20:Float, m21:Float, m22:Float):flight._js.Matrix3;
	@:native("flight_clone_matrix3")
	public static function cloneMatrix3(source:flight._js.Matrix3):flight._js.Matrix3;
	@:native("flight_copy_matrix3")
	public static function copyMatrix3(out:flight._js.Matrix3, source:flight._js.Matrix3):Void;
	@:native("flight_copy_matrix3_column_from_vector3")
	public static function copyMatrix3ColumnFromVector3(out:flight._js.Matrix3, column:Int, source:flight._js.Vector3):Void;
	@:native("flight_copy_matrix3_column_to_vector3")
	public static function copyMatrix3ColumnToVector3(out:flight._js.Vector3, column:Int, source:flight._js.Matrix3):Void;
	@:native("flight_copy_matrix3_row_from_vector3")
	public static function copyMatrix3RowFromVector3(out:flight._js.Matrix3, row:Int, source:flight._js.Vector3):Void;
	@:native("flight_copy_matrix3_row_to_vector3")
	public static function copyMatrix3RowToVector3(out:flight._js.Vector3, row:Int, source:flight._js.Matrix3):Void;
	@:native("flight_equals_matrix3")
	public static function equalsMatrix3(a:flight._js.Matrix3, b:flight._js.Matrix3):Bool;
	@:native("flight_get_matrix3_determinant")
	public static function getMatrix3Determinant(source:flight._js.Matrix3):Float;
	@:native("flight_get_matrix3_element")
	public static function getMatrix3Element(source:flight._js.Matrix3, row:Int, column:Int):Float;
	@:native("flight_inverse_matrix3")
	public static function inverseMatrix3(out:flight._js.Matrix3, source:flight._js.Matrix3):Bool;
	@:native("flight_is_affine_matrix3")
	public static function isAffineMatrix3(source:flight._js.Matrix3):Bool;
	@:native("flight_multiply_matrix3")
	public static function multiplyMatrix3(out:flight._js.Matrix3, a:flight._js.Matrix3, b:flight._js.Matrix3):Void;
	@:native("flight_rotate_matrix3")
	public static function rotateMatrix3(out:flight._js.Matrix3, source:flight._js.Matrix3, theta:Float):Void;
	@:native("flight_scale_matrix3")
	public static function scaleMatrix3(out:flight._js.Matrix3, source:flight._js.Matrix3, sx:Float, sy:Float):Void;
	@:native("flight_set_matrix3")
	public static function setMatrix3(out:flight._js.Matrix3, m00:Float, m01:Float, m02:Float, m10:Float, m11:Float, m12:Float, m20:Float, m21:Float, m22:Float):Void;
	@:native("flight_set_matrix3_element")
	public static function setMatrix3Element(out:flight._js.Matrix3, row:Int, column:Int, value:Float):Void;
	@:native("flight_set_matrix3_from_float32_array")
	public static function setMatrix3FromFloat32Array(out:flight._js.Matrix3, offset:Int, source:Dynamic, sourceLen:Int):Void;
	@:native("flight_set_matrix3_from_matrix")
	public static function setMatrix3FromMatrix(out:flight._js.Matrix3, source:flight._js.Matrix):Void;
	@:native("flight_set_matrix3_from_matrix4")
	public static function setMatrix3FromMatrix4(out:flight._js.Matrix3, source:flight._js.Matrix4):Void;
	@:native("flight_set_matrix3_identity")
	public static function setMatrix3Identity(out:flight._js.Matrix3):Void;
	@:native("flight_set_matrix3_normal_from_matrix4")
	public static function setMatrix3NormalFromMatrix4(out:flight._js.Matrix3, source:flight._js.Matrix4):Void;
	@:native("flight_translate_matrix3")
	public static function translateMatrix3(out:flight._js.Matrix3, source:flight._js.Matrix3, tx:Float, ty:Float):Void;
	@:native("flight_transpose_matrix3")
	public static function transposeMatrix3(out:flight._js.Matrix3, source:flight._js.Matrix3):Void;
	@:native("flight_write_matrix3_to_float32_array")
	public static function writeMatrix3ToFloat32Array(out:Dynamic, outLen:Int, offset:Int, source:flight._js.Matrix3):Void;
	@:native("flight_acquire_identity_matrix3")
	public static function acquireIdentityMatrix3():flight._js.Matrix3;
	@:native("flight_acquire_matrix3")
	public static function acquireMatrix3():flight._js.Matrix3;
	@:native("flight_clear_matrix3_pool")
	public static function clearMatrix3Pool():Void;
	@:native("flight_release_matrix3")
	public static function releaseMatrix3(m:flight._js.Matrix3):Void;
	@:native("flight_create_matrix4")
	public static function createMatrix4():flight._js.Matrix4;
	@:native("flight_create_matrix4_from_2d")
	public static function createMatrix4From2d(a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):flight._js.Matrix4;
	@:native("flight_create_matrix4_from_values")
	public static function createMatrix4FromValues(m00:Float, m01:Float, m02:Float, m03:Float, m10:Float, m11:Float, m12:Float, m13:Float, m20:Float, m21:Float, m22:Float, m23:Float, m30:Float, m31:Float, m32:Float, m33:Float):flight._js.Matrix4;
	@:native("flight_create_orthographic_matrix4")
	public static function createOrthographicMatrix4(left:Float, right:Float, bottom:Float, top:Float, zNear:Float, zFar:Float):flight._js.Matrix4;
	@:native("flight_create_perspective_matrix4")
	public static function createPerspectiveMatrix4(tanHalfFovY:Float, aspect:Float, zNear:Float, zFar:Float):flight._js.Matrix4;
	@:native("flight_append_matrix4")
	public static function appendMatrix4(out:flight._js.Matrix4, source:flight._js.Matrix4, other:flight._js.Matrix4):Void;
	@:native("flight_append_rotation_matrix4")
	public static function appendRotationMatrix4(out:flight._js.Matrix4, source:flight._js.Matrix4, radians:Float, axis:flight._js.Vector4, pivotPoint:flight._js.Vector4):Void;
	@:native("flight_append_scale_matrix4")
	public static function appendScaleMatrix4(out:flight._js.Matrix4, source:flight._js.Matrix4, xScale:Float, yScale:Float, zScale:Float):Void;
	@:native("flight_append_translation_matrix4")
	public static function appendTranslationMatrix4(out:flight._js.Matrix4, source:flight._js.Matrix4, x:Float, y:Float, z:Float):Void;
	@:native("flight_clone_matrix4")
	public static function cloneMatrix4(source:flight._js.Matrix4):flight._js.Matrix4;
	@:native("flight_compose_matrix4")
	public static function composeMatrix4(out:flight._js.Matrix4, position:flight._js.Vector3, rotation:flight._js.Quaternion, scale:flight._js.Vector3):Void;
	@:native("flight_copy_matrix4")
	public static function copyMatrix4(out:flight._js.Matrix4, source:flight._js.Matrix4):Void;
	@:native("flight_copy_matrix4_column_from_vector4")
	public static function copyMatrix4ColumnFromVector4(out:flight._js.Matrix4, column:Int, source:flight._js.Vector4):Void;
	@:native("flight_copy_matrix4_column_to_vector4")
	public static function copyMatrix4ColumnToVector4(out:flight._js.Vector4, column:Int, source:flight._js.Matrix4):Void;
	@:native("flight_copy_matrix4_row_from_vector4")
	public static function copyMatrix4RowFromVector4(out:flight._js.Matrix4, row:Int, source:flight._js.Vector4):Void;
	@:native("flight_copy_matrix4_row_to_vector4")
	public static function copyMatrix4RowToVector4(out:flight._js.Vector4, row:Int, source:flight._js.Matrix4):Void;
	@:native("flight_decompose_matrix4")
	public static function decomposeMatrix4(outPosition:flight._js.Vector3, outRotation:flight._js.Quaternion, outScale:flight._js.Vector3, m:flight._js.Matrix4):Void;
	@:native("flight_equals_matrix4")
	public static function equalsMatrix4(a:flight._js.Matrix4, b:flight._js.Matrix4):Bool;
	@:native("flight_get_matrix4_determinant")
	public static function getMatrix4Determinant(source:flight._js.Matrix4):Float;
	@:native("flight_get_matrix4_element")
	public static function getMatrix4Element(source:flight._js.Matrix4, row:Int, column:Int):Float;
	@:native("flight_get_matrix4_position")
	public static function getMatrix4Position(out:flight._js.Vector3, source:flight._js.Matrix4):Void;
	@:native("flight_interpolate_matrix4")
	public static function interpolateMatrix4(out:flight._js.Matrix4, a:flight._js.Matrix4, b:flight._js.Matrix4, t:Float):Void;
	@:native("flight_inverse_matrix4")
	public static function inverseMatrix4(out:flight._js.Matrix4, source:flight._js.Matrix4):Bool;
	@:native("flight_is_affine_matrix4")
	public static function isAffineMatrix4(source:flight._js.Matrix4):Bool;
	@:native("flight_matrix4_transform_point")
	public static function matrix4TransformPoint(out:flight._js.Vector3, source:flight._js.Matrix4, point:flight._js.Vector3):Void;
	@:native("flight_matrix4_transform_vector")
	public static function matrix4TransformVector(out:flight._js.Vector4, source:flight._js.Matrix4, vector:flight._js.Vector4):Void;
	@:native("flight_matrix4_transform_vectors")
	public static function matrix4TransformVectors(out:Dynamic, outLen:Int, source:flight._js.Matrix4, vectors:Dynamic, vectorsLen:Int):Void;
	@:native("flight_multiply_matrix4")
	public static function multiplyMatrix4(out:flight._js.Matrix4, a:flight._js.Matrix4, b:flight._js.Matrix4):Void;
	@:native("flight_prepend_matrix4")
	public static function prependMatrix4(out:flight._js.Matrix4, source:flight._js.Matrix4, other:flight._js.Matrix4):Void;
	@:native("flight_prepend_rotation_matrix4")
	public static function prependRotationMatrix4(out:flight._js.Matrix4, source:flight._js.Matrix4, radians:Float, axis:flight._js.Vector4, pivotPoint:flight._js.Vector4):Void;
	@:native("flight_prepend_scale_matrix4")
	public static function prependScaleMatrix4(out:flight._js.Matrix4, source:flight._js.Matrix4, xScale:Float, yScale:Float, zScale:Float):Void;
	@:native("flight_prepend_translation_matrix4")
	public static function prependTranslationMatrix4(out:flight._js.Matrix4, source:flight._js.Matrix4, x:Float, y:Float, z:Float):Void;
	@:native("flight_rotate_matrix4")
	public static function rotateMatrix4(out:flight._js.Matrix4, source:flight._js.Matrix4, axis:flight._js.Vector3, radians:Float):Void;
	@:native("flight_scale_matrix4")
	public static function scaleMatrix4(out:flight._js.Matrix4, source:flight._js.Matrix4, sx:Float, sy:Float, sz:Float):Void;
	@:native("flight_set_matrix4")
	public static function setMatrix4(out:flight._js.Matrix4, m00:Float, m01:Float, m02:Float, m03:Float, m10:Float, m11:Float, m12:Float, m13:Float, m20:Float, m21:Float, m22:Float, m23:Float, m30:Float, m31:Float, m32:Float, m33:Float):Void;
	@:native("flight_set_matrix4_element")
	public static function setMatrix4Element(out:flight._js.Matrix4, row:Int, column:Int, value:Float):Void;
	@:native("flight_set_matrix4_from_2d")
	public static function setMatrix4From2d(out:flight._js.Matrix4, a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):Void;
	@:native("flight_set_matrix4_from_float32_array")
	public static function setMatrix4FromFloat32Array(out:flight._js.Matrix4, offset:Int, source:Dynamic, sourceLen:Int):Void;
	@:native("flight_set_matrix4_from_matrix")
	public static function setMatrix4FromMatrix(out:flight._js.Matrix4, source:flight._js.Matrix):Void;
	@:native("flight_set_matrix4_from_matrix3")
	public static function setMatrix4FromMatrix3(out:flight._js.Matrix4, source:flight._js.Matrix3):Void;
	@:native("flight_set_matrix4_from_quaternion")
	public static function setMatrix4FromQuaternion(out:flight._js.Matrix4, source:flight._js.Quaternion):Void;
	@:native("flight_set_matrix4_identity")
	public static function setMatrix4Identity(out:flight._js.Matrix4):Void;
	@:native("flight_set_matrix4_look_at")
	public static function setMatrix4LookAt(out:flight._js.Matrix4, eye:flight._js.Vector3, target:flight._js.Vector3, up:flight._js.Vector3):Void;
	@:native("flight_set_matrix4_position")
	public static function setMatrix4Position(out:flight._js.Matrix4, source:flight._js.Vector3):Void;
	@:native("flight_set_orthographic_matrix4")
	public static function setOrthographicMatrix4(out:flight._js.Matrix4, left:Float, right:Float, bottom:Float, top:Float, zNear:Float, zFar:Float):Void;
	@:native("flight_set_perspective_matrix4")
	public static function setPerspectiveMatrix4(out:flight._js.Matrix4, tanHalfFovY:Float, aspect:Float, zNear:Float, zFar:Float):Void;
	@:native("flight_translate_matrix4")
	public static function translateMatrix4(out:flight._js.Matrix4, source:flight._js.Matrix4, tx:Float, ty:Float, tz:Float):Void;
	@:native("flight_transpose_matrix4")
	public static function transposeMatrix4(out:flight._js.Matrix4, source:flight._js.Matrix4):Void;
	@:native("flight_write_matrix4_to_float32_array")
	public static function writeMatrix4ToFloat32Array(out:Dynamic, outLen:Int, offset:Int, source:flight._js.Matrix4):Void;
	@:native("flight_acquire_identity_matrix4")
	public static function acquireIdentityMatrix4():flight._js.Matrix4;
	@:native("flight_acquire_matrix4")
	public static function acquireMatrix4():flight._js.Matrix4;
	@:native("flight_clear_matrix4_pool")
	public static function clearMatrix4Pool():Void;
	@:native("flight_release_matrix4")
	public static function releaseMatrix4(m:flight._js.Matrix4):Void;
	@:native("flight_acquire_identity_matrix")
	public static function acquireIdentityMatrix():flight._js.Matrix;
	@:native("flight_acquire_matrix")
	public static function acquireMatrix():flight._js.Matrix;
	@:native("flight_clear_matrix_pool")
	public static function clearMatrixPool():Void;
	@:native("flight_release_matrix")
	public static function releaseMatrix(m:flight._js.Matrix):Void;
	@:native("flight_create_obb")
	public static function createObb(centerX:Float, centerY:Float, centerZ:Float, halfExtentX:Float, halfExtentY:Float, halfExtentZ:Float, orientationX:Float, orientationY:Float, orientationZ:Float, orientationW:Float):flight._js.Obb;
	@:native("flight_get_closest_point_on_obb")
	public static function getClosestPointOnObb(out:flight._js.Vector3, obb:flight._js.Obb, point:flight._js.Vector3):Void;
	@:native("flight_intersect_ray3d_obb")
	public static function intersectRay3dObb(ray:flight._js.Ray3D, obb:flight._js.Obb):Float;
	@:native("flight_is_obb_intersecting_aabb")
	public static function isObbIntersectingAabb(obb:flight._js.Obb, aabb:flight._js.Aabb):Bool;
	@:native("flight_is_obb_intersecting_obb")
	public static function isObbIntersectingObb(a:flight._js.Obb, b:flight._js.Obb):Bool;
	@:native("flight_is_obb_intersecting_sphere")
	public static function isObbIntersectingSphere(obb:flight._js.Obb, sphere:flight._js.BoundingSphere):Bool;
	@:native("flight_set_obb")
	public static function setObb(out:flight._js.Obb, centerX:Float, centerY:Float, centerZ:Float, halfExtentX:Float, halfExtentY:Float, halfExtentZ:Float, orientationX:Float, orientationY:Float, orientationZ:Float, orientationW:Float):Void;
	@:native("flight_transform_obb_by_matrix4")
	public static function transformObbByMatrix4(out:flight._js.Obb, obb:flight._js.Obb, m:flight._js.Matrix4):Void;
	@:native("flight_create_plane")
	public static function createPlane(a:Float, b:Float, c:Float, d:Float):flight._js.Plane;
	@:native("flight_clone_plane")
	public static function clonePlane(source:flight._js.Plane):flight._js.Plane;
	@:native("flight_copy_plane")
	public static function copyPlane(out:flight._js.Plane, source:flight._js.Plane):Void;
	@:native("flight_get_closest_point_on_plane")
	public static function getClosestPointOnPlane(out:flight._js.Vector3, plane:flight._js.Plane, point:flight._js.Vector3):Void;
	@:native("flight_get_plane_coplanar_point")
	public static function getPlaneCoplanarPoint(out:flight._js.Vector3, plane:flight._js.Plane):Void;
	@:native("flight_get_plane_signed_distance_to_point")
	public static function getPlaneSignedDistanceToPoint(plane:flight._js.Plane, point:flight._js.Vector3):Float;
	@:native("flight_normalize_plane")
	public static function normalizePlane(out:flight._js.Plane, source:flight._js.Plane):Void;
	@:native("flight_project_vector3_onto_plane")
	public static function projectVector3OntoPlane(out:flight._js.Vector3, point:flight._js.Vector3, plane:flight._js.Plane):Void;
	@:native("flight_set_plane")
	public static function setPlane(out:flight._js.Plane, a:Float, b:Float, c:Float, d:Float):Void;
	@:native("flight_set_plane_from_normal_and_point")
	public static function setPlaneFromNormalAndPoint(out:flight._js.Plane, normal:flight._js.Vector3, point:flight._js.Vector3):Void;
	@:native("flight_set_plane_from_points")
	public static function setPlaneFromPoints(out:flight._js.Plane, a:flight._js.Vector3, b:flight._js.Vector3, c:flight._js.Vector3):Void;
	@:native("flight_create_quaternion")
	public static function createQuaternion(x:Float, y:Float, z:Float, w:Float):flight._js.Quaternion;
	@:native("flight_clone_quaternion")
	public static function cloneQuaternion(source:flight._js.Quaternion):flight._js.Quaternion;
	@:native("flight_conjugate_quaternion")
	public static function conjugateQuaternion(out:flight._js.Quaternion, source:flight._js.Quaternion):Void;
	@:native("flight_copy_quaternion")
	public static function copyQuaternion(out:flight._js.Quaternion, source:flight._js.Quaternion):Void;
	@:native("flight_equals_quaternion")
	public static function equalsQuaternion(a:flight._js.Quaternion, b:flight._js.Quaternion):Bool;
	@:native("flight_get_quaternion_angle_between")
	public static function getQuaternionAngleBetween(a:flight._js.Quaternion, b:flight._js.Quaternion):Float;
	@:native("flight_get_quaternion_axis_angle")
	public static function getQuaternionAxisAngle(outAxis:flight._js.Vector3, source:flight._js.Quaternion):Float;
	@:native("flight_get_quaternion_dot")
	public static function getQuaternionDot(a:flight._js.Quaternion, b:flight._js.Quaternion):Float;
	@:native("flight_get_quaternion_euler")
	public static function getQuaternionEuler(out:flight._js.Vector3, source:flight._js.Quaternion, order:Int):Void;
	@:native("flight_inverse_quaternion")
	public static function inverseQuaternion(out:flight._js.Quaternion, source:flight._js.Quaternion):Void;
	@:native("flight_multiply_quaternion")
	public static function multiplyQuaternion(out:flight._js.Quaternion, a:flight._js.Quaternion, b:flight._js.Quaternion):Void;
	@:native("flight_normalize_quaternion")
	public static function normalizeQuaternion(out:flight._js.Quaternion, source:flight._js.Quaternion):Float;
	@:native("flight_rotate_vector3_by_quaternion")
	public static function rotateVector3ByQuaternion(out:flight._js.Vector3, vector:flight._js.Vector3, q:flight._js.Quaternion):Void;
	@:native("flight_set_quaternion")
	public static function setQuaternion(out:flight._js.Quaternion, x:Float, y:Float, z:Float, w:Float):Void;
	@:native("flight_set_quaternion_from_axis_angle")
	public static function setQuaternionFromAxisAngle(out:flight._js.Quaternion, axis:flight._js.Vector3, angle:Float):Void;
	@:native("flight_set_quaternion_from_euler")
	public static function setQuaternionFromEuler(out:flight._js.Quaternion, x:Float, y:Float, z:Float, order:Int):Void;
	@:native("flight_set_quaternion_from_matrix4")
	public static function setQuaternionFromMatrix4(out:flight._js.Quaternion, source:flight._js.Matrix4):Void;
	@:native("flight_set_quaternion_from_unit_vectors")
	public static function setQuaternionFromUnitVectors(out:flight._js.Quaternion, from:flight._js.Vector3, to:flight._js.Vector3):Void;
	@:native("flight_set_quaternion_identity")
	public static function setQuaternionIdentity(out:flight._js.Quaternion):Void;
	@:native("flight_set_quaternion_look_rotation")
	public static function setQuaternionLookRotation(out:flight._js.Quaternion, forward:flight._js.Vector3, up:flight._js.Vector3):Void;
	@:native("flight_slerp_quaternion")
	public static function slerpQuaternion(out:flight._js.Quaternion, a:flight._js.Quaternion, b:flight._js.Quaternion, t:Float):Void;
	@:native("flight_acquire_identity_quaternion")
	public static function acquireIdentityQuaternion():flight._js.Quaternion;
	@:native("flight_acquire_quaternion")
	public static function acquireQuaternion():flight._js.Quaternion;
	@:native("flight_clear_quaternion_pool")
	public static function clearQuaternionPool():Void;
	@:native("flight_release_quaternion")
	public static function releaseQuaternion(q:flight._js.Quaternion):Void;
	@:native("flight_create_ray3d")
	public static function createRay3d(originX:Float, originY:Float, originZ:Float, directionX:Float, directionY:Float, directionZ:Float):flight._js.Ray3D;
	@:native("flight_get_closest_point_between_ray3ds")
	public static function getClosestPointBetweenRay3ds(outA:flight._js.Vector3, outB:flight._js.Vector3, a:flight._js.Ray3D, b:flight._js.Ray3D):Void;
	@:native("flight_get_closest_point_on_ray3d")
	public static function getClosestPointOnRay3d(out:flight._js.Vector3, ray:flight._js.Ray3D, point:flight._js.Vector3):Void;
	@:native("flight_get_ray3d_point_at")
	public static function getRay3dPointAt(out:flight._js.Vector3, ray:flight._js.Ray3D, t:Float):Void;
	@:native("flight_intersect_ray3d_aabb")
	public static function intersectRay3dAabb(ray:flight._js.Ray3D, aabb:flight._js.Aabb):Float;
	@:native("flight_intersect_ray3d_plane")
	public static function intersectRay3dPlane(ray:flight._js.Ray3D, plane:flight._js.Plane):Float;
	@:native("flight_intersect_ray3d_sphere")
	public static function intersectRay3dSphere(ray:flight._js.Ray3D, sphere:flight._js.BoundingSphere):Float;
	@:native("flight_intersect_ray3d_triangle")
	public static function intersectRay3dTriangle(ray:flight._js.Ray3D, a:flight._js.Vector3, b:flight._js.Vector3, c:flight._js.Vector3):Float;
	@:native("flight_set_ray3d")
	public static function setRay3d(out:flight._js.Ray3D, origin:flight._js.Vector3, direction:flight._js.Vector3):Void;
	@:native("flight_transform_ray3d_by_matrix4")
	public static function transformRay3dByMatrix4(out:flight._js.Ray3D, ray:flight._js.Ray3D, m:flight._js.Matrix4):Void;
	@:native("flight_create_rectangle")
	public static function createRectangle(x:Float, y:Float, width:Float, height:Float):flight._js.Rectangle;
	@:native("flight_clone_rectangle")
	public static function cloneRectangle(source:flight._js.Rectangle):flight._js.Rectangle;
	@:native("flight_compute_rectangle_intersection")
	public static function computeRectangleIntersection(out:flight._js.Rectangle, a:flight._js.Rectangle, b:flight._js.Rectangle):Void;
	@:native("flight_contains_rectangle_point")
	public static function containsRectanglePoint(source:flight._js.Rectangle, vector:flight._js.Vector2):Bool;
	@:native("flight_contains_rectangle_point_xy")
	public static function containsRectanglePointXy(source:flight._js.Rectangle, x:Float, y:Float):Bool;
	@:native("flight_copy_rectangle")
	public static function copyRectangle(out:flight._js.Rectangle, source:flight._js.Rectangle):Void;
	@:native("flight_encloses_rectangle")
	public static function enclosesRectangle(source:flight._js.Rectangle, other:flight._js.Rectangle):Bool;
	@:native("flight_equals_rectangle")
	public static function equalsRectangle(a:flight._js.Rectangle, b:flight._js.Rectangle):Bool;
	@:native("flight_expand_rectangle_to_point")
	public static function expandRectangleToPoint(out:flight._js.Rectangle, sourceRect:flight._js.Rectangle, sourceVec2:flight._js.Vector2):Void;
	@:native("flight_get_rectangle_bottom")
	public static function getRectangleBottom(source:flight._js.Rectangle):Float;
	@:native("flight_get_rectangle_bottom_right")
	public static function getRectangleBottomRight(out:flight._js.Vector2, source:flight._js.Rectangle):Void;
	@:native("flight_get_rectangle_left")
	public static function getRectangleLeft(source:flight._js.Rectangle):Float;
	@:native("flight_get_rectangle_max_x")
	public static function getRectangleMaxX(source:flight._js.Rectangle):Float;
	@:native("flight_get_rectangle_max_y")
	public static function getRectangleMaxY(source:flight._js.Rectangle):Float;
	@:native("flight_get_rectangle_min_x")
	public static function getRectangleMinX(source:flight._js.Rectangle):Float;
	@:native("flight_get_rectangle_min_y")
	public static function getRectangleMinY(source:flight._js.Rectangle):Float;
	@:native("flight_get_rectangle_normalized_bottom_right")
	public static function getRectangleNormalizedBottomRight(out:flight._js.Vector2, source:flight._js.Rectangle):Void;
	@:native("flight_get_rectangle_normalized_top_left")
	public static function getRectangleNormalizedTopLeft(out:flight._js.Vector2, source:flight._js.Rectangle):Void;
	@:native("flight_get_rectangle_right")
	public static function getRectangleRight(source:flight._js.Rectangle):Float;
	@:native("flight_get_rectangle_size")
	public static function getRectangleSize(out:flight._js.Vector2, source:flight._js.Rectangle):Void;
	@:native("flight_get_rectangle_top")
	public static function getRectangleTop(source:flight._js.Rectangle):Float;
	@:native("flight_get_rectangle_top_left")
	public static function getRectangleTopLeft(out:flight._js.Vector2, source:flight._js.Rectangle):Void;
	@:native("flight_inflate_rectangle")
	public static function inflateRectangle(out:flight._js.Rectangle, source:flight._js.Rectangle, dx:Float, dy:Float):Void;
	@:native("flight_intersects_rectangle")
	public static function intersectsRectangle(a:flight._js.Rectangle, b:flight._js.Rectangle):Bool;
	@:native("flight_is_empty_rectangle")
	public static function isEmptyRectangle(source:flight._js.Rectangle):Bool;
	@:native("flight_is_flipped_x_rectangle")
	public static function isFlippedXRectangle(source:flight._js.Rectangle):Bool;
	@:native("flight_is_flipped_y_rectangle")
	public static function isFlippedYRectangle(source:flight._js.Rectangle):Bool;
	@:native("flight_merge_rectangle")
	public static function mergeRectangle(out:flight._js.Rectangle, source:flight._js.Rectangle, other:flight._js.Rectangle):Void;
	@:native("flight_normalize_rectangle")
	public static function normalizeRectangle(out:flight._js.Rectangle, source:flight._js.Rectangle):Void;
	@:native("flight_offset_rectangle")
	public static function offsetRectangle(out:flight._js.Rectangle, source:flight._js.Rectangle, dx:Float, dy:Float):Void;
	@:native("flight_offset_rectangle_by_point")
	public static function offsetRectangleByPoint(out:flight._js.Rectangle, source:flight._js.Rectangle, point:flight._js.Vector2):Void;
	@:native("flight_set_empty_rectangle")
	public static function setEmptyRectangle(out:flight._js.Rectangle):Void;
	@:native("flight_set_rectangle")
	public static function setRectangle(out:flight._js.Rectangle, x:Float, y:Float, width:Float, height:Float):Void;
	@:native("flight_set_rectangle_bottom")
	public static function setRectangleBottom(target:flight._js.Rectangle, value:Float):Void;
	@:native("flight_set_rectangle_bottom_right")
	public static function setRectangleBottomRight(target:flight._js.Rectangle, point:flight._js.Vector2):Void;
	@:native("flight_set_rectangle_left")
	public static function setRectangleLeft(target:flight._js.Rectangle, value:Float):Void;
	@:native("flight_set_rectangle_right")
	public static function setRectangleRight(target:flight._js.Rectangle, value:Float):Void;
	@:native("flight_set_rectangle_size")
	public static function setRectangleSize(out:flight._js.Rectangle, size:flight._js.Vector2):Void;
	@:native("flight_set_rectangle_top")
	public static function setRectangleTop(target:flight._js.Rectangle, value:Float):Void;
	@:native("flight_set_rectangle_top_left")
	public static function setRectangleTopLeft(out:flight._js.Rectangle, point:flight._js.Vector2):Void;
	@:native("flight_acquire_empty_rectangle")
	public static function acquireEmptyRectangle():flight._js.Rectangle;
	@:native("flight_acquire_rectangle")
	public static function acquireRectangle():flight._js.Rectangle;
	@:native("flight_clear_rectangle_pool")
	public static function clearRectanglePool():Void;
	@:native("flight_release_rectangle")
	public static function releaseRectangle(r:flight._js.Rectangle):Void;
	@:native("flight_create_transform2d")
	public static function createTransform2d(x:Float, y:Float, rotation:Float, scaleX:Float, scaleY:Float, skewX:Float, skewY:Float, pivotX:Float, pivotY:Float):flight._js.Transform2D;
	@:native("flight_decompose_matrix_to_transform2d")
	public static function decomposeMatrixToTransform2d(out:flight._js.Transform2D, source:flight._js.Matrix):Void;
	@:native("flight_create_transform3d")
	public static function createTransform3d():flight._js.Transform3D;
	@:native("flight_compose_matrix4_from_transform3d")
	public static function composeMatrix4FromTransform3d(out:flight._js.Matrix4, source:flight._js.Transform3D):Void;
	@:native("flight_decompose_matrix4_to_transform3d")
	public static function decomposeMatrix4ToTransform3d(out:flight._js.Transform3D, m:flight._js.Matrix4):Void;
	@:native("flight_reserve_float32_array")
	public static function reserveFloat32Array(array:Dynamic, arrayLen:Int, capacity:Int):Dynamic;
	@:native("flight_reserve_int16_array")
	public static function reserveInt16Array(array:Dynamic, arrayLen:Int, capacity:Int):Dynamic;
	@:native("flight_reserve_uint16_array")
	public static function reserveUint16Array(array:Dynamic, arrayLen:Int, capacity:Int):Dynamic;
	@:native("flight_create_vector2")
	public static function createVector2(x:Float, y:Float):flight._js.Vector2;
	@:native("flight_create_vector2_from_polar")
	public static function createVector2FromPolar(length:Float, angle:Float):flight._js.Vector2;
	@:native("flight_add_vector2")
	public static function addVector2(out:flight._js.Vector2, a:flight._js.Vector2, b:flight._js.Vector2):Void;
	@:native("flight_clamp_vector2")
	public static function clampVector2(out:flight._js.Vector2, value:flight._js.Vector2, min:flight._js.Vector2, max:flight._js.Vector2):Void;
	@:native("flight_clone_vector2")
	public static function cloneVector2(source:flight._js.Vector2):flight._js.Vector2;
	@:native("flight_copy_vector2")
	public static function copyVector2(out:flight._js.Vector2, source:flight._js.Vector2):Void;
	@:native("flight_cross_vector2")
	public static function crossVector2(a:flight._js.Vector2, b:flight._js.Vector2):Float;
	@:native("flight_divide_vector2")
	public static function divideVector2(out:flight._js.Vector2, source:flight._js.Vector2, divisor:flight._js.Vector2):Void;
	@:native("flight_equals_vector2")
	public static function equalsVector2(a:flight._js.Vector2, b:flight._js.Vector2):Bool;
	@:native("flight_get_vector2_angle")
	public static function getVector2Angle(source:flight._js.Vector2):Float;
	@:native("flight_get_vector2_angle_between")
	public static function getVector2AngleBetween(a:flight._js.Vector2, b:flight._js.Vector2):Float;
	@:native("flight_get_vector2_distance")
	public static function getVector2Distance(a:flight._js.Vector2, b:flight._js.Vector2):Float;
	@:native("flight_get_vector2_distance_squared")
	public static function getVector2DistanceSquared(a:flight._js.Vector2, b:flight._js.Vector2):Float;
	@:native("flight_get_vector2_dot")
	public static function getVector2Dot(a:flight._js.Vector2, b:flight._js.Vector2):Float;
	@:native("flight_get_vector2_length")
	public static function getVector2Length(source:flight._js.Vector2):Float;
	@:native("flight_get_vector2_length_squared")
	public static function getVector2LengthSquared(source:flight._js.Vector2):Float;
	@:native("flight_interpolate_vector2")
	public static function interpolateVector2(out:flight._js.Vector2, a:flight._js.Vector2, b:flight._js.Vector2, t:Float):Void;
	@:native("flight_max_vector2")
	public static function maxVector2(out:flight._js.Vector2, a:flight._js.Vector2, b:flight._js.Vector2):Void;
	@:native("flight_min_vector2")
	public static function minVector2(out:flight._js.Vector2, a:flight._js.Vector2, b:flight._js.Vector2):Void;
	@:native("flight_multiply_vector2")
	public static function multiplyVector2(out:flight._js.Vector2, a:flight._js.Vector2, b:flight._js.Vector2):Void;
	@:native("flight_near_equals_vector2")
	public static function nearEqualsVector2(a:flight._js.Vector2, b:flight._js.Vector2, tolerance:Float):Bool;
	@:native("flight_negate_vector2")
	public static function negateVector2(out:flight._js.Vector2, source:flight._js.Vector2):Void;
	@:native("flight_normalize_vector2")
	public static function normalizeVector2(out:flight._js.Vector2, source:flight._js.Vector2):Float;
	@:native("flight_offset_vector2")
	public static function offsetVector2(out:flight._js.Vector2, source:flight._js.Vector2, dx:Float, dy:Float):Void;
	@:native("flight_reflect_vector2")
	public static function reflectVector2(out:flight._js.Vector2, incident:flight._js.Vector2, normal:flight._js.Vector2):Void;
	@:native("flight_rotate_vector2")
	public static function rotateVector2(out:flight._js.Vector2, source:flight._js.Vector2, angle:Float):Void;
	@:native("flight_scale_vector2")
	public static function scaleVector2(out:flight._js.Vector2, source:flight._js.Vector2, scalar:Float):Void;
	@:native("flight_scale_vector2_to_length")
	public static function scaleVector2ToLength(out:flight._js.Vector2, source:flight._js.Vector2, length:Float):Void;
	@:native("flight_set_vector2")
	public static function setVector2(out:flight._js.Vector2, x:Float, y:Float):Void;
	@:native("flight_set_vector2_from_float32_array")
	public static function setVector2FromFloat32Array(out:flight._js.Vector2, offset:Int, source:Dynamic, sourceLen:Int):Void;
	@:native("flight_set_vector2_from_polar")
	public static function setVector2FromPolar(out:flight._js.Vector2, length:Float, angle:Float):Void;
	@:native("flight_set_vector2_from_vector3")
	public static function setVector2FromVector3(out:flight._js.Vector2, source:flight._js.Vector3):Void;
	@:native("flight_subtract_vector2")
	public static function subtractVector2(out:flight._js.Vector2, source:flight._js.Vector2, other:flight._js.Vector2):Void;
	@:native("flight_write_vector2_to_float32_array")
	public static function writeVector2ToFloat32Array(out:Dynamic, outLen:Int, offset:Int, source:flight._js.Vector2):Void;
	@:native("flight_acquire_empty_vector2")
	public static function acquireEmptyVector2():flight._js.Vector2;
	@:native("flight_acquire_vector2")
	public static function acquireVector2():flight._js.Vector2;
	@:native("flight_clear_vector2_pool")
	public static function clearVector2Pool():Void;
	@:native("flight_release_vector2")
	public static function releaseVector2(v:flight._js.Vector2):Void;
	@:native("flight_create_vector3")
	public static function createVector3(x:Float, y:Float, z:Float):flight._js.Vector3;
	@:native("flight_create_vector3_from_spherical")
	public static function createVector3FromSpherical(radius:Float, theta:Float, phi:Float):flight._js.Vector3;
	@:native("flight_add_vector3")
	public static function addVector3(out:flight._js.Vector3, a:flight._js.Vector3, b:flight._js.Vector3):Void;
	@:native("flight_clamp_vector3")
	public static function clampVector3(out:flight._js.Vector3, value:flight._js.Vector3, min:flight._js.Vector3, max:flight._js.Vector3):Void;
	@:native("flight_clone_vector3")
	public static function cloneVector3(source:flight._js.Vector3):flight._js.Vector3;
	@:native("flight_copy_vector3")
	public static function copyVector3(out:flight._js.Vector3, source:flight._js.Vector3):Void;
	@:native("flight_cross_vector3")
	public static function crossVector3(out:flight._js.Vector3, source:flight._js.Vector3, other:flight._js.Vector3):Void;
	@:native("flight_divide_vector3")
	public static function divideVector3(out:flight._js.Vector3, source:flight._js.Vector3, divisor:flight._js.Vector3):Void;
	@:native("flight_equals_vector3")
	public static function equalsVector3(a:flight._js.Vector3, b:flight._js.Vector3):Bool;
	@:native("flight_get_vector3_angle_between")
	public static function getVector3AngleBetween(a:flight._js.Vector3, b:flight._js.Vector3):Float;
	@:native("flight_get_vector3_distance")
	public static function getVector3Distance(a:flight._js.Vector3, b:flight._js.Vector3):Float;
	@:native("flight_get_vector3_distance_squared")
	public static function getVector3DistanceSquared(a:flight._js.Vector3, b:flight._js.Vector3):Float;
	@:native("flight_get_vector3_dot")
	public static function getVector3Dot(a:flight._js.Vector3, b:flight._js.Vector3):Float;
	@:native("flight_get_vector3_length")
	public static function getVector3Length(source:flight._js.Vector3):Float;
	@:native("flight_get_vector3_length_squared")
	public static function getVector3LengthSquared(source:flight._js.Vector3):Float;
	@:native("flight_get_vector3_spherical")
	public static function getVector3Spherical(out:flight._js.Vector3, source:flight._js.Vector3):Void;
	@:native("flight_interpolate_vector3")
	public static function interpolateVector3(out:flight._js.Vector3, a:flight._js.Vector3, b:flight._js.Vector3, t:Float):Void;
	@:native("flight_max_vector3")
	public static function maxVector3(out:flight._js.Vector3, a:flight._js.Vector3, b:flight._js.Vector3):Void;
	@:native("flight_min_vector3")
	public static function minVector3(out:flight._js.Vector3, a:flight._js.Vector3, b:flight._js.Vector3):Void;
	@:native("flight_multiply_vector3")
	public static function multiplyVector3(out:flight._js.Vector3, a:flight._js.Vector3, b:flight._js.Vector3):Void;
	@:native("flight_near_equals_vector3")
	public static function nearEqualsVector3(a:flight._js.Vector3, b:flight._js.Vector3, tolerance:Float):Bool;
	@:native("flight_negate_vector3")
	public static function negateVector3(out:flight._js.Vector3, source:flight._js.Vector3):Void;
	@:native("flight_normalize_vector3")
	public static function normalizeVector3(out:flight._js.Vector3, source:flight._js.Vector3):Float;
	@:native("flight_offset_vector3")
	public static function offsetVector3(out:flight._js.Vector3, source:flight._js.Vector3, dx:Float, dy:Float, dz:Float):Void;
	@:native("flight_project_vector3")
	public static function projectVector3(out:flight._js.Vector2, source:flight._js.Vector3):Void;
	@:native("flight_reflect_vector3")
	public static function reflectVector3(out:flight._js.Vector3, incident:flight._js.Vector3, normal:flight._js.Vector3):Void;
	@:native("flight_scale_vector3")
	public static function scaleVector3(out:flight._js.Vector3, source:flight._js.Vector3, scalar:Float):Void;
	@:native("flight_set_vector3")
	public static function setVector3(out:flight._js.Vector3, x:Float, y:Float, z:Float):Void;
	@:native("flight_set_vector3_from_float32_array")
	public static function setVector3FromFloat32Array(out:flight._js.Vector3, offset:Int, source:Dynamic, sourceLen:Int):Void;
	@:native("flight_set_vector3_from_spherical")
	public static function setVector3FromSpherical(out:flight._js.Vector3, radius:Float, theta:Float, phi:Float):Void;
	@:native("flight_set_vector3_from_vector4")
	public static function setVector3FromVector4(out:flight._js.Vector3, source:flight._js.Vector4):Void;
	@:native("flight_subtract_vector3")
	public static function subtractVector3(out:flight._js.Vector3, source:flight._js.Vector3, other:flight._js.Vector3):Void;
	@:native("flight_transform_vector3_by_matrix3")
	public static function transformVector3ByMatrix3(out:flight._js.Vector3, source:flight._js.Vector3, matrix:flight._js.Matrix3):Void;
	@:native("flight_write_vector3_to_float32_array")
	public static function writeVector3ToFloat32Array(out:Dynamic, outLen:Int, offset:Int, source:flight._js.Vector3):Void;
	@:native("flight_acquire_empty_vector3")
	public static function acquireEmptyVector3():flight._js.Vector3;
	@:native("flight_acquire_vector3")
	public static function acquireVector3():flight._js.Vector3;
	@:native("flight_clear_vector3_pool")
	public static function clearVector3Pool():Void;
	@:native("flight_release_vector3")
	public static function releaseVector3(v:flight._js.Vector3):Void;
	@:native("flight_create_vector4")
	public static function createVector4(x:Float, y:Float, z:Float, w:Float):flight._js.Vector4;
	@:native("flight_add_vector4")
	public static function addVector4(out:flight._js.Vector4, a:flight._js.Vector4, b:flight._js.Vector4):Void;
	@:native("flight_clamp_vector4")
	public static function clampVector4(out:flight._js.Vector4, value:flight._js.Vector4, min:flight._js.Vector4, max:flight._js.Vector4):Void;
	@:native("flight_clone_vector4")
	public static function cloneVector4(source:flight._js.Vector4):flight._js.Vector4;
	@:native("flight_copy_vector4")
	public static function copyVector4(out:flight._js.Vector4, source:flight._js.Vector4):Void;
	@:native("flight_divide_vector4")
	public static function divideVector4(out:flight._js.Vector4, source:flight._js.Vector4, divisor:flight._js.Vector4):Void;
	@:native("flight_equals_vector4")
	public static function equalsVector4(a:flight._js.Vector4, b:flight._js.Vector4):Bool;
	@:native("flight_get_vector4_angle_between")
	public static function getVector4AngleBetween(a:flight._js.Vector4, b:flight._js.Vector4):Float;
	@:native("flight_get_vector4_distance")
	public static function getVector4Distance(a:flight._js.Vector4, b:flight._js.Vector4):Float;
	@:native("flight_get_vector4_distance_squared")
	public static function getVector4DistanceSquared(a:flight._js.Vector4, b:flight._js.Vector4):Float;
	@:native("flight_get_vector4_dot")
	public static function getVector4Dot(a:flight._js.Vector4, b:flight._js.Vector4):Float;
	@:native("flight_get_vector4_length")
	public static function getVector4Length(source:flight._js.Vector4):Float;
	@:native("flight_get_vector4_length_squared")
	public static function getVector4LengthSquared(source:flight._js.Vector4):Float;
	@:native("flight_interpolate_vector4")
	public static function interpolateVector4(out:flight._js.Vector4, a:flight._js.Vector4, b:flight._js.Vector4, t:Float):Void;
	@:native("flight_max_vector4")
	public static function maxVector4(out:flight._js.Vector4, a:flight._js.Vector4, b:flight._js.Vector4):Void;
	@:native("flight_min_vector4")
	public static function minVector4(out:flight._js.Vector4, a:flight._js.Vector4, b:flight._js.Vector4):Void;
	@:native("flight_multiply_vector4")
	public static function multiplyVector4(out:flight._js.Vector4, a:flight._js.Vector4, b:flight._js.Vector4):Void;
	@:native("flight_near_equals_vector4")
	public static function nearEqualsVector4(a:flight._js.Vector4, b:flight._js.Vector4, tolerance:Float):Bool;
	@:native("flight_negate_vector4")
	public static function negateVector4(out:flight._js.Vector4, source:flight._js.Vector4):Void;
	@:native("flight_normalize_vector4")
	public static function normalizeVector4(out:flight._js.Vector4, source:flight._js.Vector4):Float;
	@:native("flight_offset_vector4")
	public static function offsetVector4(out:flight._js.Vector4, source:flight._js.Vector4, dx:Float, dy:Float, dz:Float, dw:Float):Void;
	@:native("flight_project_vector4")
	public static function projectVector4(out:flight._js.Vector3, source:flight._js.Vector4):Void;
	@:native("flight_reflect_vector4")
	public static function reflectVector4(out:flight._js.Vector4, incident:flight._js.Vector4, normal:flight._js.Vector4):Void;
	@:native("flight_scale_vector4")
	public static function scaleVector4(out:flight._js.Vector4, source:flight._js.Vector4, scalar:Float):Void;
	@:native("flight_set_vector4")
	public static function setVector4(out:flight._js.Vector4, x:Float, y:Float, z:Float, w:Float):Void;
	@:native("flight_set_vector4_from_float32_array")
	public static function setVector4FromFloat32Array(out:flight._js.Vector4, offset:Int, source:Dynamic, sourceLen:Int):Void;
	@:native("flight_set_vector4_from_vector3")
	public static function setVector4FromVector3(out:flight._js.Vector4, source:flight._js.Vector3, w:Float):Void;
	@:native("flight_subtract_vector4")
	public static function subtractVector4(out:flight._js.Vector4, source:flight._js.Vector4, other:flight._js.Vector4):Void;
	@:native("flight_write_vector4_to_float32_array")
	public static function writeVector4ToFloat32Array(out:Dynamic, outLen:Int, offset:Int, source:flight._js.Vector4):Void;
	@:native("flight_acquire_empty_vector4")
	public static function acquireEmptyVector4():flight._js.Vector4;
	@:native("flight_acquire_vector4")
	public static function acquireVector4():flight._js.Vector4;
	@:native("flight_clear_vector4_pool")
	public static function clearVector4Pool():Void;
	@:native("flight_release_vector4")
	public static function releaseVector4(v:flight._js.Vector4):Void;
	@:native("flight_free_aabb")
	public static function freeAabb(ptr:flight._js.Aabb):Void;
	@:native("flight_free_bounding_sphere")
	public static function freeBoundingSphere(ptr:flight._js.BoundingSphere):Void;
	@:native("flight_free_capsule")
	public static function freeCapsule(ptr:flight._js.Capsule):Void;
	@:native("flight_free_frustum")
	public static function freeFrustum(ptr:flight._js.Frustum):Void;
	@:native("flight_free_matrix")
	public static function freeMatrix(ptr:flight._js.Matrix):Void;
	@:native("flight_free_matrix3")
	public static function freeMatrix3(ptr:flight._js.Matrix3):Void;
	@:native("flight_free_matrix4")
	public static function freeMatrix4(ptr:flight._js.Matrix4):Void;
	@:native("flight_free_obb")
	public static function freeObb(ptr:flight._js.Obb):Void;
	@:native("flight_free_plane")
	public static function freePlane(ptr:flight._js.Plane):Void;
	@:native("flight_free_quaternion")
	public static function freeQuaternion(ptr:flight._js.Quaternion):Void;
	@:native("flight_free_ray3_d")
	public static function freeRay3D(ptr:flight._js.Ray3D):Void;
	@:native("flight_free_rectangle")
	public static function freeRectangle(ptr:flight._js.Rectangle):Void;
	@:native("flight_free_transform2_d")
	public static function freeTransform2D(ptr:flight._js.Transform2D):Void;
	@:native("flight_free_transform3_d")
	public static function freeTransform3D(ptr:flight._js.Transform3D):Void;
	@:native("flight_free_vector2")
	public static function freeVector2(ptr:flight._js.Vector2):Void;
	@:native("flight_free_vector3")
	public static function freeVector3(ptr:flight._js.Vector3):Void;
	@:native("flight_free_vector4")
	public static function freeVector4(ptr:flight._js.Vector4):Void;
}
