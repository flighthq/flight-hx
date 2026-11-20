package flight.esm.types.collision;

#if (js && flight_esm)
typedef CollisionAabb2D = { minX:Float, minY:Float, maxX:Float, maxY:Float };

typedef CollisionAabb3D = { minX:Float, minY:Float, minZ:Float, maxX:Float, maxY:Float, maxZ:Float };

typedef CollisionBox3D = { x:Float, y:Float, z:Float, halfX:Float, halfY:Float, halfZ:Float, rotationX:Float, rotationY:Float, rotationZ:Float, rotationW:Float };

typedef CollisionBuiltInShape2D = Dynamic;

typedef CollisionBuiltInShape3D = Dynamic;

typedef CollisionCapsule2D = { x0:Float, y0:Float, x1:Float, y1:Float, radius:Float };

typedef CollisionCapsule3D = { x0:Float, y0:Float, z0:Float, x1:Float, y1:Float, z1:Float, radius:Float };

typedef CollisionCircle2D = { x:Float, y:Float, radius:Float };

typedef CollisionColliderShape3D = Dynamic;

typedef CollisionCone3D = { apexX:Float, apexY:Float, apexZ:Float, baseX:Float, baseY:Float, baseZ:Float, radius:Float };

typedef CollisionContactManifold2D = { overlapping:Bool, normalX:Float, normalY:Float, depth:Float, pointCount:Float, points:Array<flight.esm.types.collision.Types.CollisionContactPoint2D>, raw:Dynamic };

typedef CollisionContactManifold3D = { overlapping:Bool, normalX:Float, normalY:Float, normalZ:Float, pointCount:Float, points:Array<flight.esm.types.collision.Types.CollisionContactPoint3D>, raw:Dynamic };

typedef CollisionContactPoint2D = { x:Float, y:Float, depth:Float, featureId:Float };

typedef CollisionContactPoint3D = { x:Float, y:Float, z:Float, depth:Float, featureId:Float };

typedef CollisionConvex3D = { points:Array<Float> };

typedef CollisionCylinder3D = { x0:Float, y0:Float, z0:Float, x1:Float, y1:Float, z1:Float, radius:Float };

typedef CollisionDistance3D = { distance:Float, directionX:Float, directionY:Float, directionZ:Float, pointAX:Float, pointAY:Float, pointAZ:Float, pointBX:Float, pointBY:Float, pointBZ:Float, overlapping:Bool, raw:Dynamic };

typedef CollisionFaceQuery3D = ((shape:flight.esm.types.collision.Types.CollisionShape3D, dirX:Float, dirY:Float, dirZ:Float, out:Array<Float>) -> Float);

typedef CollisionHeightfield3D = { kind:String, columns:Float, rows:Float, heights:Array<Float>, cellSizeX:Float, cellSizeZ:Float, version:Float, x:Float, y:Float, z:Float, rotationX:Float, rotationY:Float, rotationZ:Float, rotationW:Float, raw:Dynamic };

typedef CollisionManifold2D = { overlapping:Bool, normalX:Float, normalY:Float, depth:Float, raw:Dynamic };

typedef CollisionManifold3D = { overlapping:Bool, normalX:Float, normalY:Float, normalZ:Float, depth:Float, raw:Dynamic };

typedef CollisionObb2D = { x:Float, y:Float, halfW:Float, halfH:Float, rotation:Float };

typedef CollisionPairTest2D = ((a:flight.esm.types.collision.Types.CollisionShape2D, b:flight.esm.types.collision.Types.CollisionShape2D, out:flight.esm.types.collision.Types.CollisionManifold2D) -> Bool);

typedef CollisionPairTest3D = ((a:flight.esm.types.collision.Types.CollisionShape3D, b:flight.esm.types.collision.Types.CollisionShape3D, out:flight.esm.types.collision.Types.CollisionManifold3D) -> Bool);

typedef CollisionPoint2D = { x:Float, y:Float };

typedef CollisionPolygon2D = { points:Array<Float> };

typedef CollisionRaycastHit2D = { fraction:Float, x:Float, y:Float, normalX:Float, normalY:Float, raw:Dynamic };

typedef CollisionRaycastHit3D = { fraction:Float, x:Float, y:Float, z:Float, normalX:Float, normalY:Float, normalZ:Float, raw:Dynamic };

typedef CollisionSegment2D = { x0:Float, y0:Float, x1:Float, y1:Float };

typedef CollisionShape2D = Dynamic;

typedef CollisionShape3D = Dynamic;

typedef CollisionShapeKind2D = Dynamic;

typedef CollisionShapeKind3D = Dynamic;

typedef CollisionSphere3D = { x:Float, y:Float, z:Float, radius:Float };

typedef CollisionStaticShape3D = Dynamic;

typedef CollisionSupport2D = ((shape:flight.esm.types.collision.Types.CollisionShape2D, dirX:Float, dirY:Float, out:Array<Float>) -> Void);

typedef CollisionSupport3D = ((shape:flight.esm.types.collision.Types.CollisionShape3D, dirX:Float, dirY:Float, dirZ:Float, out:Array<Float>) -> Void);

typedef CollisionTestExplanation2D = { kind:Dynamic, overlapping:Bool, shapeIndex:Null<Float>, status:flight.esm.types.collision.Types.CollisionTestStatus };

typedef CollisionTestExplanation3D = { kind:Dynamic, overlapping:Bool, shapeIndex:Null<Float>, status:flight.esm.types.collision.Types.CollisionTestStatus };

typedef CollisionTestGuard2D = ((a:flight.esm.types.collision.Types.CollisionShape2D, b:flight.esm.types.collision.Types.CollisionShape2D) -> Void);

typedef CollisionTestGuard3D = ((a:flight.esm.types.collision.Types.CollisionShape3D, b:flight.esm.types.collision.Types.CollisionShape3D) -> Void);

typedef CollisionTestStatus = String;

typedef CollisionTimeOfImpact2D = { fraction:Float, x:Float, y:Float, normalX:Float, normalY:Float, raw:Dynamic };

typedef CollisionTimeOfImpact3D = { fraction:Float, x:Float, y:Float, z:Float, normalX:Float, normalY:Float, normalZ:Float, raw:Dynamic };

typedef CollisionTriangleMesh3D = { kind:String, points:Array<Float>, indices:Array<Float>, version:Float, x:Float, y:Float, z:Float, rotationX:Float, rotationY:Float, rotationZ:Float, rotationW:Float, raw:Dynamic };

typedef CollisionVendorKind2D = String;

typedef CollisionVendorKind3D = String;

typedef CollisionVendorShape2D = { kind:String };

typedef CollisionVendorShape3D = { kind:String };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
