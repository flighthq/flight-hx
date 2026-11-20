package flight.esm.types.geometry;

#if (js && flight_esm)
typedef Aabb = { max:flight.esm.types.geometry.Types.Vector3, min:flight.esm.types.geometry.Types.Vector3 };

typedef AabbLike = { max:flight.esm.types.geometry.Types.Vector3Like, min:flight.esm.types.geometry.Types.Vector3Like };

typedef BoundingSphere = { center:flight.esm.types.geometry.Types.Vector3, radius:Float };

typedef BoundingSphereLike = { center:flight.esm.types.geometry.Types.Vector3, radius:Float };

typedef Capsule = { endX:Float, endY:Float, endZ:Float, radius:Float, startX:Float, startY:Float, startZ:Float };

typedef CapsuleLike = { radius:Float, endX:Float, endY:Float, endZ:Float, startX:Float, startY:Float, startZ:Float };

typedef EulerOrder = String;

typedef Frustum = { bottom:flight.esm.types.geometry.Types.Plane, far:flight.esm.types.geometry.Types.Plane, left:flight.esm.types.geometry.Types.Plane, near:flight.esm.types.geometry.Types.Plane, right:flight.esm.types.geometry.Types.Plane, top:flight.esm.types.geometry.Types.Plane };

typedef FrustumLike = { left:flight.esm.types.geometry.Types.Plane, right:flight.esm.types.geometry.Types.Plane, far:flight.esm.types.geometry.Types.Plane, near:flight.esm.types.geometry.Types.Plane, bottom:flight.esm.types.geometry.Types.Plane, top:flight.esm.types.geometry.Types.Plane };

typedef Matrix = { a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float };

typedef Matrix3 = { m:js.lib.Float32Array };

typedef Matrix3Like = { m:js.lib.Float32Array };

typedef Matrix4 = { m:js.lib.Float32Array };

typedef Matrix4Like = { m:js.lib.Float32Array };

typedef MatrixLike = { a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float };

typedef Obb = { centerX:Float, centerY:Float, centerZ:Float, halfExtentX:Float, halfExtentY:Float, halfExtentZ:Float, orientationW:Float, orientationX:Float, orientationY:Float, orientationZ:Float };

typedef ObbLike = { centerX:Float, centerY:Float, centerZ:Float, halfExtentX:Float, halfExtentY:Float, halfExtentZ:Float, orientationW:Float, orientationX:Float, orientationY:Float, orientationZ:Float };

typedef Plane = { a:Float, b:Float, c:Float, d:Float };

typedef PlaneLike = { a:Float, b:Float, c:Float, d:Float };

typedef Quaternion = { x:Float, y:Float, z:Float, w:Float };

typedef QuaternionLike = { x:Float, y:Float, z:Float, w:Float };

typedef Ray3D = { direction:flight.esm.types.geometry.Types.Vector3, origin:flight.esm.types.geometry.Types.Vector3 };

typedef Ray3DLike = { direction:flight.esm.types.geometry.Types.Vector3, origin:flight.esm.types.geometry.Types.Vector3 };

typedef Rectangle = { height:Float, width:Float, x:Float, y:Float };

typedef RectangleLike = { height:Float, width:Float, x:Float, y:Float };

typedef Transform2D = { pivotX:Float, pivotY:Float, rotation:Float, scaleX:Float, scaleY:Float, skewX:Float, skewY:Float, x:Float, y:Float };

typedef Transform2DLike = { x:Float, y:Float, scaleX:Float, scaleY:Float, pivotX:Float, pivotY:Float, rotation:Float, skewX:Float, skewY:Float };

typedef Transform3D = { position:flight.esm.types.geometry.Types.Vector3, rotation:flight.esm.types.geometry.Types.Quaternion, scale:flight.esm.types.geometry.Types.Vector3 };

typedef Transform3DLike = { scale:flight.esm.types.geometry.Types.Vector3, rotation:flight.esm.types.geometry.Types.Quaternion, position:flight.esm.types.geometry.Types.Vector3 };

typedef Vector2 = { x:Float, y:Float };

typedef Vector2Like = { x:Float, y:Float };

typedef Vector3 = { x:Float, y:Float, z:Float };

typedef Vector3Like = { x:Float, y:Float, z:Float };

typedef Vector4 = { w:Float, x:Float, y:Float, z:Float };

typedef Vector4Like = { x:Float, y:Float, z:Float, w:Float };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
