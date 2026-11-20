package flight.esm.types.camera;

#if (js && flight_esm)
typedef Camera2D = { rotation:Float, x:Float, y:Float, zoom:Float };

typedef Camera2DFollowOptions = { ?deadzoneHalfHeight:Null<Float>, ?deadzoneHalfWidth:Null<Float>, ?smoothTime:Null<Float>, ?worldBounds:Null<flight.esm.types.geometry.Types.Rectangle> };

typedef Camera2DOptions = { ?rotation:Null<Float>, ?x:Null<Float>, ?y:Null<Float>, ?zoom:Null<Float> };

typedef Camera3D = { far:Float, inverseViewProjection:flight.esm.types.geometry.Types.Matrix4, jitter:flight.esm.types.geometry.Types.Vector2, near:Float, nearClipPlane:Null<flight.esm.types.geometry.Types.Plane>, projection:flight.esm.types.camera.Types.Projection, view:flight.esm.types.geometry.Types.Matrix4 };

typedef Camera3DLike = { far:Float, inverseViewProjection:flight.esm.types.geometry.Types.Matrix4, jitter:flight.esm.types.geometry.Types.Vector2, near:Float, nearClipPlane:Null<flight.esm.types.geometry.Types.Plane>, projection:flight.esm.types.camera.Types.Projection, view:flight.esm.types.geometry.Types.Matrix4 };

typedef Camera3DOptions = { far:Float, near:Float, ?nearClipPlane:Null<flight.esm.types.geometry.Types.Plane>, projection:flight.esm.types.camera.Types.Projection };

typedef Camera3DViewExplanation = { determinant:Float, isOrthonormal:Bool, isReflection:Bool, scaleDeviation:Float, shearDeviation:Float };

typedef OrthographicProjection = { halfHeight:Float, halfWidth:Float, kind:String };

typedef OrthographicProjectionOptions = { halfHeight:Float, halfWidth:Float };

typedef PerspectiveProjection = { aspect:Float, fovY:Float, kind:String };

typedef PerspectiveProjectionOptions = { ?aspect:Null<Float>, fovY:Float };

typedef Projection = Dynamic;

typedef RawProjection = { kind:String, matrix:flight.esm.types.geometry.Types.Matrix4 };

typedef RawProjectionOptions = { matrix:flight.esm.types.geometry.Types.Matrix4Like };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
