package flight;

inline function collideCapsuleAabbContactManifold2d(a:CollisionCapsule2D, b:CollisionAabb2D, out:CollisionContactManifold2D):Bool {
#if hl
	return flight._hl._fn.Collision.collideCapsuleAabbContactManifold2d(a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.collideCapsuleAabbContactManifold2d(a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.collideCapsuleAabbContactManifold2d(a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function collideCapsuleCapsuleContactManifold2d(a:CollisionCapsule2D, b:CollisionCapsule2D, out:CollisionContactManifold2D):Bool {
#if hl
	return flight._hl._fn.Collision.collideCapsuleCapsuleContactManifold2d(a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.collideCapsuleCapsuleContactManifold2d(a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.collideCapsuleCapsuleContactManifold2d(a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function collideCapsuleObbContactManifold2d(a:CollisionCapsule2D, b:CollisionObb2D, out:CollisionContactManifold2D):Bool {
#if hl
	return flight._hl._fn.Collision.collideCapsuleObbContactManifold2d(a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.collideCapsuleObbContactManifold2d(a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.collideCapsuleObbContactManifold2d(a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function collideCapsulePolygonContactManifold2d(a:CollisionCapsule2D, b:CollisionPolygon2D, out:CollisionContactManifold2D):Bool {
#if hl
	return flight._hl._fn.Collision.collideCapsulePolygonContactManifold2d(a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.collideCapsulePolygonContactManifold2d(a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.collideCapsulePolygonContactManifold2d(a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function collideCircleCapsuleContactManifold2d(a:CollisionCircle2D, b:CollisionCapsule2D, out:CollisionContactManifold2D):Bool {
#if hl
	return flight._hl._fn.Collision.collideCircleCapsuleContactManifold2d(a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.collideCircleCapsuleContactManifold2d(a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.collideCircleCapsuleContactManifold2d(a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function collideContactManifold2d(a:CollisionShape2D, b:CollisionShape2D, out:CollisionContactManifold2D):Bool {
#if hl
	return flight._hl._fn.Collision.collideContactManifold2d(a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.collideContactManifold2d(a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.collideContactManifold2d(a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function collideContactManifold3d(registry:CollisionRegistry3D, a:CollisionShape3D, b:CollisionShape3D, out:CollisionContactManifold3D):Bool {
#if hl
	return flight._hl._fn.Collision.collideContactManifold3d(registry, a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.collideContactManifold3d(registry, a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.collideContactManifold3d(registry, a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function queryCollisionAabbFace3d(shape:CollisionShape3D, dirX:Float, dirY:Float, dirZ:Float, out:Dynamic):Int {
#if hl
	return flight._hl._fn.Collision.queryCollisionAabbFace3d(shape, dirX, dirY, dirZ, out);
#elseif cpp
	return flight._cpp._fn.Collision.queryCollisionAabbFace3d(shape, dirX, dirY, dirZ, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.queryCollisionAabbFace3d(shape, dirX, dirY, dirZ, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function queryCollisionBoxFace3d(shape:CollisionShape3D, dirX:Float, dirY:Float, dirZ:Float, out:Dynamic):Int {
#if hl
	return flight._hl._fn.Collision.queryCollisionBoxFace3d(shape, dirX, dirY, dirZ, out);
#elseif cpp
	return flight._cpp._fn.Collision.queryCollisionBoxFace3d(shape, dirX, dirY, dirZ, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.queryCollisionBoxFace3d(shape, dirX, dirY, dirZ, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function queryCollisionCapsuleFace3d(shape:CollisionShape3D, dirX:Float, dirY:Float, dirZ:Float, out:Dynamic):Int {
#if hl
	return flight._hl._fn.Collision.queryCollisionCapsuleFace3d(shape, dirX, dirY, dirZ, out);
#elseif cpp
	return flight._cpp._fn.Collision.queryCollisionCapsuleFace3d(shape, dirX, dirY, dirZ, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.queryCollisionCapsuleFace3d(shape, dirX, dirY, dirZ, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function queryCollisionConvexFace3d(shape:CollisionShape3D, dirX:Float, dirY:Float, dirZ:Float, out:Dynamic):Int {
#if hl
	return flight._hl._fn.Collision.queryCollisionConvexFace3d(shape, dirX, dirY, dirZ, out);
#elseif cpp
	return flight._cpp._fn.Collision.queryCollisionConvexFace3d(shape, dirX, dirY, dirZ, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.queryCollisionConvexFace3d(shape, dirX, dirY, dirZ, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function registerBuiltInCollisionFaceQueries3d(registry:CollisionRegistry3D):Void {
#if hl
	flight._hl._fn.Collision.registerBuiltInCollisionFaceQueries3d(registry);
#elseif cpp
	flight._cpp._fn.Collision.registerBuiltInCollisionFaceQueries3d(registry);
#elseif (js && flight_esm)
	flight._js._fn.Collision.registerBuiltInCollisionFaceQueries3d(registry);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function registerCollisionFaceQuery3d(registry:CollisionRegistry3D, kind:String, query:CollisionFaceQuery3D):Void {
#if hl
	flight._hl._fn.Collision.registerCollisionFaceQuery3d(registry, cast kind, query);
#elseif cpp
	flight._cpp._fn.Collision.registerCollisionFaceQuery3d(registry, cast kind, query);
#elseif (js && flight_esm)
	flight._js._fn.Collision.registerCollisionFaceQuery3d(registry, kind, query);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function getCollisionPolygonValidationStatus2d(points:Dynamic):Int {
#if hl
	return flight._hl._fn.Collision.getCollisionPolygonValidationStatus2d(points);
#elseif cpp
	return flight._cpp._fn.Collision.getCollisionPolygonValidationStatus2d(points);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.getCollisionPolygonValidationStatus2d(points);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function getCollisionShapeValidationStatus2d(shape:CollisionShape2D):Int {
#if hl
	return flight._hl._fn.Collision.getCollisionShapeValidationStatus2d(shape);
#elseif cpp
	return flight._cpp._fn.Collision.getCollisionShapeValidationStatus2d(shape);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.getCollisionShapeValidationStatus2d(shape);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function getCollisionConvexValidationStatus3d(points:Dynamic):Int {
#if hl
	return flight._hl._fn.Collision.getCollisionConvexValidationStatus3d(points);
#elseif cpp
	return flight._cpp._fn.Collision.getCollisionConvexValidationStatus3d(points);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.getCollisionConvexValidationStatus3d(points);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function getCollisionShapeValidationStatus3d(shape:CollisionShape3D):Int {
#if hl
	return flight._hl._fn.Collision.getCollisionShapeValidationStatus3d(shape);
#elseif cpp
	return flight._cpp._fn.Collision.getCollisionShapeValidationStatus3d(shape);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.getCollisionShapeValidationStatus3d(shape);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function registerBuiltInCollisionSupports2d(registry:CollisionRegistry2D):Void {
#if hl
	flight._hl._fn.Collision.registerBuiltInCollisionSupports2d(registry);
#elseif cpp
	flight._cpp._fn.Collision.registerBuiltInCollisionSupports2d(registry);
#elseif (js && flight_esm)
	flight._js._fn.Collision.registerBuiltInCollisionSupports2d(registry);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function registerCollisionPairTest2d(registry:CollisionRegistry2D, kindA:String, kindB:String, test:CollisionPairTest2D):Void {
#if hl
	flight._hl._fn.Collision.registerCollisionPairTest2d(registry, cast kindA, cast kindB, test);
#elseif cpp
	flight._cpp._fn.Collision.registerCollisionPairTest2d(registry, cast kindA, cast kindB, test);
#elseif (js && flight_esm)
	flight._js._fn.Collision.registerCollisionPairTest2d(registry, kindA, kindB, test);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function registerCollisionSupport2d(registry:CollisionRegistry2D, kind:String, support:CollisionSupport2D):Void {
#if hl
	flight._hl._fn.Collision.registerCollisionSupport2d(registry, cast kind, support);
#elseif cpp
	flight._cpp._fn.Collision.registerCollisionSupport2d(registry, cast kind, support);
#elseif (js && flight_esm)
	flight._js._fn.Collision.registerCollisionSupport2d(registry, kind, support);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function supportCollisionAabb2d(shape:CollisionAabb2D, dirX:Float, dirY:Float, out:Dynamic):Void {
#if hl
	flight._hl._fn.Collision.supportCollisionAabb2d(shape, dirX, dirY, out);
#elseif cpp
	flight._cpp._fn.Collision.supportCollisionAabb2d(shape, dirX, dirY, out);
#elseif (js && flight_esm)
	flight._js._fn.Collision.supportCollisionAabb2d(shape, dirX, dirY, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function supportCollisionCircle2d(shape:CollisionCircle2D, dirX:Float, dirY:Float, out:Dynamic):Void {
#if hl
	flight._hl._fn.Collision.supportCollisionCircle2d(shape, dirX, dirY, out);
#elseif cpp
	flight._cpp._fn.Collision.supportCollisionCircle2d(shape, dirX, dirY, out);
#elseif (js && flight_esm)
	flight._js._fn.Collision.supportCollisionCircle2d(shape, dirX, dirY, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function supportCollisionObb2d(shape:CollisionObb2D, dirX:Float, dirY:Float, out:Dynamic):Void {
#if hl
	flight._hl._fn.Collision.supportCollisionObb2d(shape, dirX, dirY, out);
#elseif cpp
	flight._cpp._fn.Collision.supportCollisionObb2d(shape, dirX, dirY, out);
#elseif (js && flight_esm)
	flight._js._fn.Collision.supportCollisionObb2d(shape, dirX, dirY, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function supportCollisionPolygon2d(shape:CollisionPolygon2D, dirX:Float, dirY:Float, out:Dynamic):Void {
#if hl
	flight._hl._fn.Collision.supportCollisionPolygon2d(shape, dirX, dirY, out);
#elseif cpp
	flight._cpp._fn.Collision.supportCollisionPolygon2d(shape, dirX, dirY, out);
#elseif (js && flight_esm)
	flight._js._fn.Collision.supportCollisionPolygon2d(shape, dirX, dirY, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function writeVertexListSupport2d(vertices:Dynamic, verticesLen:Int, count:Int, dirX:Float, dirY:Float, out:Dynamic):Void {
#if hl
	flight._hl._fn.Collision.writeVertexListSupport2d(vertices, verticesLen, count, dirX, dirY, out);
#elseif cpp
	flight._cpp._fn.Collision.writeVertexListSupport2d(vertices, verticesLen, count, dirX, dirY, out);
#elseif (js && flight_esm)
	flight._js._fn.Collision.writeVertexListSupport2d(vertices, verticesLen, count, dirX, dirY, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function clearCollisionPairTests3d(registry:CollisionRegistry3D):Void {
#if hl
	flight._hl._fn.Collision.clearCollisionPairTests3d(registry);
#elseif cpp
	flight._cpp._fn.Collision.clearCollisionPairTests3d(registry);
#elseif (js && flight_esm)
	flight._js._fn.Collision.clearCollisionPairTests3d(registry);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function clearCollisionSupports3d(registry:CollisionRegistry3D):Void {
#if hl
	flight._hl._fn.Collision.clearCollisionSupports3d(registry);
#elseif cpp
	flight._cpp._fn.Collision.clearCollisionSupports3d(registry);
#elseif (js && flight_esm)
	flight._js._fn.Collision.clearCollisionSupports3d(registry);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function registerBuiltInCollisionSupports3d(registry:CollisionRegistry3D):Void {
#if hl
	flight._hl._fn.Collision.registerBuiltInCollisionSupports3d(registry);
#elseif cpp
	flight._cpp._fn.Collision.registerBuiltInCollisionSupports3d(registry);
#elseif (js && flight_esm)
	flight._js._fn.Collision.registerBuiltInCollisionSupports3d(registry);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function registerCollisionPairTest3d(registry:CollisionRegistry3D, kindA:String, kindB:String, test:CollisionPairTest3D):Void {
#if hl
	flight._hl._fn.Collision.registerCollisionPairTest3d(registry, cast kindA, cast kindB, test);
#elseif cpp
	flight._cpp._fn.Collision.registerCollisionPairTest3d(registry, cast kindA, cast kindB, test);
#elseif (js && flight_esm)
	flight._js._fn.Collision.registerCollisionPairTest3d(registry, kindA, kindB, test);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function registerCollisionSupport3d(registry:CollisionRegistry3D, kind:String, support:CollisionSupport3D):Void {
#if hl
	flight._hl._fn.Collision.registerCollisionSupport3d(registry, cast kind, support);
#elseif cpp
	flight._cpp._fn.Collision.registerCollisionSupport3d(registry, cast kind, support);
#elseif (js && flight_esm)
	flight._js._fn.Collision.registerCollisionSupport3d(registry, kind, support);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function supportCollisionAabb3d(shape:CollisionAabb3D, dirX:Float, dirY:Float, dirZ:Float, out:Dynamic):Void {
#if hl
	flight._hl._fn.Collision.supportCollisionAabb3d(shape, dirX, dirY, dirZ, out);
#elseif cpp
	flight._cpp._fn.Collision.supportCollisionAabb3d(shape, dirX, dirY, dirZ, out);
#elseif (js && flight_esm)
	flight._js._fn.Collision.supportCollisionAabb3d(shape, dirX, dirY, dirZ, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function supportCollisionBox3d(shape:CollisionBox3D, dirX:Float, dirY:Float, dirZ:Float, out:Dynamic):Void {
#if hl
	flight._hl._fn.Collision.supportCollisionBox3d(shape, dirX, dirY, dirZ, out);
#elseif cpp
	flight._cpp._fn.Collision.supportCollisionBox3d(shape, dirX, dirY, dirZ, out);
#elseif (js && flight_esm)
	flight._js._fn.Collision.supportCollisionBox3d(shape, dirX, dirY, dirZ, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function supportCollisionCapsule3d(shape:CollisionCapsule3D, dirX:Float, dirY:Float, dirZ:Float, out:Dynamic):Void {
#if hl
	flight._hl._fn.Collision.supportCollisionCapsule3d(shape, dirX, dirY, dirZ, out);
#elseif cpp
	flight._cpp._fn.Collision.supportCollisionCapsule3d(shape, dirX, dirY, dirZ, out);
#elseif (js && flight_esm)
	flight._js._fn.Collision.supportCollisionCapsule3d(shape, dirX, dirY, dirZ, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function supportCollisionCone3d(shape:CollisionCone3D, dirX:Float, dirY:Float, dirZ:Float, out:Dynamic):Void {
#if hl
	flight._hl._fn.Collision.supportCollisionCone3d(shape, dirX, dirY, dirZ, out);
#elseif cpp
	flight._cpp._fn.Collision.supportCollisionCone3d(shape, dirX, dirY, dirZ, out);
#elseif (js && flight_esm)
	flight._js._fn.Collision.supportCollisionCone3d(shape, dirX, dirY, dirZ, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function supportCollisionConvex3d(shape:CollisionConvex3D, dirX:Float, dirY:Float, dirZ:Float, out:Dynamic):Void {
#if hl
	flight._hl._fn.Collision.supportCollisionConvex3d(shape, dirX, dirY, dirZ, out);
#elseif cpp
	flight._cpp._fn.Collision.supportCollisionConvex3d(shape, dirX, dirY, dirZ, out);
#elseif (js && flight_esm)
	flight._js._fn.Collision.supportCollisionConvex3d(shape, dirX, dirY, dirZ, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function supportCollisionCylinder3d(shape:CollisionCylinder3D, dirX:Float, dirY:Float, dirZ:Float, out:Dynamic):Void {
#if hl
	flight._hl._fn.Collision.supportCollisionCylinder3d(shape, dirX, dirY, dirZ, out);
#elseif cpp
	flight._cpp._fn.Collision.supportCollisionCylinder3d(shape, dirX, dirY, dirZ, out);
#elseif (js && flight_esm)
	flight._js._fn.Collision.supportCollisionCylinder3d(shape, dirX, dirY, dirZ, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function supportCollisionSphere3d(shape:CollisionSphere3D, dirX:Float, dirY:Float, dirZ:Float, out:Dynamic):Void {
#if hl
	flight._hl._fn.Collision.supportCollisionSphere3d(shape, dirX, dirY, dirZ, out);
#elseif cpp
	flight._cpp._fn.Collision.supportCollisionSphere3d(shape, dirX, dirY, dirZ, out);
#elseif (js && flight_esm)
	flight._js._fn.Collision.supportCollisionSphere3d(shape, dirX, dirY, dirZ, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function writeVertexListSupport3d(vertices:Dynamic, verticesLen:Int, count:Int, dirX:Float, dirY:Float, dirZ:Float, out:Dynamic):Void {
#if hl
	flight._hl._fn.Collision.writeVertexListSupport3d(vertices, verticesLen, count, dirX, dirY, dirZ, out);
#elseif cpp
	flight._cpp._fn.Collision.writeVertexListSupport3d(vertices, verticesLen, count, dirX, dirY, dirZ, out);
#elseif (js && flight_esm)
	flight._js._fn.Collision.writeVertexListSupport3d(vertices, verticesLen, count, dirX, dirY, dirZ, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function packContactFeatureId(referenceIsA:Bool, referenceEdge:haxe.Int64, incidentEdge:haxe.Int64, secondPoint:Bool):haxe.Int64 {
#if hl
	return flight._hl._fn.Collision.packContactFeatureId(referenceIsA, referenceEdge, incidentEdge, secondPoint);
#elseif cpp
	return flight._cpp._fn.Collision.packContactFeatureId(referenceIsA, referenceEdge, incidentEdge, secondPoint);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.packContactFeatureId(referenceIsA, referenceEdge, incidentEdge, secondPoint);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function createCollisionContactManifold2d():CollisionContactManifold2D {
#if hl
	return flight._hl._fn.Collision.createCollisionContactManifold2d();
#elseif cpp
	return flight._cpp._fn.Collision.createCollisionContactManifold2d();
#elseif (js && flight_esm)
	return flight._js._fn.Collision.createCollisionContactManifold2d();
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function clearCollisionContactManifold2d(out:CollisionContactManifold2D):Void {
#if hl
	flight._hl._fn.Collision.clearCollisionContactManifold2d(out);
#elseif cpp
	flight._cpp._fn.Collision.clearCollisionContactManifold2d(out);
#elseif (js && flight_esm)
	flight._js._fn.Collision.clearCollisionContactManifold2d(out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function createCollisionContactManifold3d():CollisionContactManifold3D {
#if hl
	return flight._hl._fn.Collision.createCollisionContactManifold3d();
#elseif cpp
	return flight._cpp._fn.Collision.createCollisionContactManifold3d();
#elseif (js && flight_esm)
	return flight._js._fn.Collision.createCollisionContactManifold3d();
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function clearCollisionContactManifold3d(out:CollisionContactManifold3D):Void {
#if hl
	flight._hl._fn.Collision.clearCollisionContactManifold3d(out);
#elseif cpp
	flight._cpp._fn.Collision.clearCollisionContactManifold3d(out);
#elseif (js && flight_esm)
	flight._js._fn.Collision.clearCollisionContactManifold3d(out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function writeCollisionConvexHullFaces3d(out:Dynamic, points:Dynamic):Int {
#if hl
	return flight._hl._fn.Collision.writeCollisionConvexHullFaces3d(out, points);
#elseif cpp
	return flight._cpp._fn.Collision.writeCollisionConvexHullFaces3d(out, points);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.writeCollisionConvexHullFaces3d(out, points);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function writeAabbVertices(aabb:CollisionAabb2D, out:Dynamic):Void {
#if hl
	flight._hl._fn.Collision.writeAabbVertices(aabb, out);
#elseif cpp
	flight._cpp._fn.Collision.writeAabbVertices(aabb, out);
#elseif (js && flight_esm)
	flight._js._fn.Collision.writeAabbVertices(aabb, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function writeObbVertices(obb:CollisionObb2D, out:Dynamic):Void {
#if hl
	flight._hl._fn.Collision.writeObbVertices(obb, out);
#elseif cpp
	flight._cpp._fn.Collision.writeObbVertices(obb, out);
#elseif (js && flight_esm)
	flight._js._fn.Collision.writeObbVertices(obb, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function areCollisionGuardsEnabled(registry2d:CollisionRegistry2D, registry3d:CollisionRegistry3D):Bool {
#if hl
	return flight._hl._fn.Collision.areCollisionGuardsEnabled(registry2d, registry3d);
#elseif cpp
	return flight._cpp._fn.Collision.areCollisionGuardsEnabled(registry2d, registry3d);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.areCollisionGuardsEnabled(registry2d, registry3d);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function disableCollisionGuards(registry2d:CollisionRegistry2D, registry3d:CollisionRegistry3D):Void {
#if hl
	flight._hl._fn.Collision.disableCollisionGuards(registry2d, registry3d);
#elseif cpp
	flight._cpp._fn.Collision.disableCollisionGuards(registry2d, registry3d);
#elseif (js && flight_esm)
	flight._js._fn.Collision.disableCollisionGuards(registry2d, registry3d);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function enableCollisionGuards(registry2d:CollisionRegistry2D, registry3d:CollisionRegistry3D, logState:Dynamic, clockFn:Dynamic, clockCtx:Dynamic):Void {
#if hl
	flight._hl._fn.Collision.enableCollisionGuards(registry2d, registry3d, logState, clockFn, clockCtx);
#elseif cpp
	flight._cpp._fn.Collision.enableCollisionGuards(registry2d, registry3d, logState, clockFn, clockCtx);
#elseif (js && flight_esm)
	flight._js._fn.Collision.enableCollisionGuards(registry2d, registry3d, logState, clockFn, clockCtx);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function testCollisionSupport2d(registry:CollisionRegistry2D, a:CollisionShape2D, b:CollisionShape2D, out:CollisionManifold2D):Bool {
#if hl
	return flight._hl._fn.Collision.testCollisionSupport2d(registry, a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.testCollisionSupport2d(registry, a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.testCollisionSupport2d(registry, a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function testCollisionSupportOverlap2d(registry:CollisionRegistry2D, a:CollisionShape2D, b:CollisionShape2D):Bool {
#if hl
	return flight._hl._fn.Collision.testCollisionSupportOverlap2d(registry, a, b);
#elseif cpp
	return flight._cpp._fn.Collision.testCollisionSupportOverlap2d(registry, a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.testCollisionSupportOverlap2d(registry, a, b);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function testCollisionSupport3d(registry:CollisionRegistry3D, a:CollisionShape3D, b:CollisionShape3D, out:CollisionManifold3D):Bool {
#if hl
	return flight._hl._fn.Collision.testCollisionSupport3d(registry, a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.testCollisionSupport3d(registry, a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.testCollisionSupport3d(registry, a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function testCollisionSupportOverlap3d(registry:CollisionRegistry3D, a:CollisionShape3D, b:CollisionShape3D):Bool {
#if hl
	return flight._hl._fn.Collision.testCollisionSupportOverlap3d(registry, a, b);
#elseif cpp
	return flight._cpp._fn.Collision.testCollisionSupportOverlap3d(registry, a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.testCollisionSupportOverlap3d(registry, a, b);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function createCollisionDistance3d():CollisionDistance3D {
#if hl
	return flight._hl._fn.Collision.createCollisionDistance3d();
#elseif cpp
	return flight._cpp._fn.Collision.createCollisionDistance3d();
#elseif (js && flight_esm)
	return flight._js._fn.Collision.createCollisionDistance3d();
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function writeCollisionDistance3d(out:CollisionDistance3D, registry:CollisionRegistry3D, a:CollisionShape3D, b:CollisionShape3D, offsetX:Float, offsetY:Float, offsetZ:Float):Bool {
#if hl
	return flight._hl._fn.Collision.writeCollisionDistance3d(out, registry, a, b, offsetX, offsetY, offsetZ);
#elseif cpp
	return flight._cpp._fn.Collision.writeCollisionDistance3d(out, registry, a, b, offsetX, offsetY, offsetZ);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.writeCollisionDistance3d(out, registry, a, b, offsetX, offsetY, offsetZ);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function createCollisionManifold2d():CollisionManifold2D {
#if hl
	return flight._hl._fn.Collision.createCollisionManifold2d();
#elseif cpp
	return flight._cpp._fn.Collision.createCollisionManifold2d();
#elseif (js && flight_esm)
	return flight._js._fn.Collision.createCollisionManifold2d();
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function clearCollisionManifold2d(out:CollisionManifold2D):Void {
#if hl
	flight._hl._fn.Collision.clearCollisionManifold2d(out);
#elseif cpp
	flight._cpp._fn.Collision.clearCollisionManifold2d(out);
#elseif (js && flight_esm)
	flight._js._fn.Collision.clearCollisionManifold2d(out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function createCollisionManifold3d():CollisionManifold3D {
#if hl
	return flight._hl._fn.Collision.createCollisionManifold3d();
#elseif cpp
	return flight._cpp._fn.Collision.createCollisionManifold3d();
#elseif (js && flight_esm)
	return flight._js._fn.Collision.createCollisionManifold3d();
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function clearCollisionManifold3d(out:CollisionManifold3D):Void {
#if hl
	flight._hl._fn.Collision.clearCollisionManifold3d(out);
#elseif cpp
	flight._cpp._fn.Collision.clearCollisionManifold3d(out);
#elseif (js && flight_esm)
	flight._js._fn.Collision.clearCollisionManifold3d(out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function getCollisionShapeContainsPoint2d(shape:CollisionShape2D, x:Float, y:Float):Bool {
#if hl
	return flight._hl._fn.Collision.getCollisionShapeContainsPoint2d(shape, x, y);
#elseif cpp
	return flight._cpp._fn.Collision.getCollisionShapeContainsPoint2d(shape, x, y);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.getCollisionShapeContainsPoint2d(shape, x, y);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function getCollisionShapeContainsPoint3d(shape:CollisionShape3D, x:Float, y:Float, z:Float):Bool {
#if hl
	return flight._hl._fn.Collision.getCollisionShapeContainsPoint3d(shape, x, y, z);
#elseif cpp
	return flight._cpp._fn.Collision.getCollisionShapeContainsPoint3d(shape, x, y, z);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.getCollisionShapeContainsPoint3d(shape, x, y, z);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function createCollisionRaycastHit2d():CollisionRaycastHit2D {
#if hl
	return flight._hl._fn.Collision.createCollisionRaycastHit2d();
#elseif cpp
	return flight._cpp._fn.Collision.createCollisionRaycastHit2d();
#elseif (js && flight_esm)
	return flight._js._fn.Collision.createCollisionRaycastHit2d();
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function raycastCollisionShape2d(out:CollisionRaycastHit2D, shape:CollisionShape2D, originX:Float, originY:Float, directionX:Float, directionY:Float, maxFraction:Float):Bool {
#if hl
	return flight._hl._fn.Collision.raycastCollisionShape2d(out, shape, originX, originY, directionX, directionY, maxFraction);
#elseif cpp
	return flight._cpp._fn.Collision.raycastCollisionShape2d(out, shape, originX, originY, directionX, directionY, maxFraction);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.raycastCollisionShape2d(out, shape, originX, originY, directionX, directionY, maxFraction);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function createCollisionRaycastHit3d():CollisionRaycastHit3D {
#if hl
	return flight._hl._fn.Collision.createCollisionRaycastHit3d();
#elseif cpp
	return flight._cpp._fn.Collision.createCollisionRaycastHit3d();
#elseif (js && flight_esm)
	return flight._js._fn.Collision.createCollisionRaycastHit3d();
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function raycastCollisionShape3d(out:CollisionRaycastHit3D, shape:CollisionShape3D, originX:Float, originY:Float, originZ:Float, directionX:Float, directionY:Float, directionZ:Float, maxFraction:Float):Bool {
#if hl
	return flight._hl._fn.Collision.raycastCollisionShape3d(out, shape, originX, originY, originZ, directionX, directionY, directionZ, maxFraction);
#elseif cpp
	return flight._cpp._fn.Collision.raycastCollisionShape3d(out, shape, originX, originY, originZ, directionX, directionY, directionZ, maxFraction);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.raycastCollisionShape3d(out, shape, originX, originY, originZ, directionX, directionY, directionZ, maxFraction);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function testSegmentAabbCollision2d(a:CollisionSegment2D, b:CollisionAabb2D):Bool {
#if hl
	return flight._hl._fn.Collision.testSegmentAabbCollision2d(a, b);
#elseif cpp
	return flight._cpp._fn.Collision.testSegmentAabbCollision2d(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.testSegmentAabbCollision2d(a, b);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function testSegmentCapsuleCollision2d(a:CollisionSegment2D, b:CollisionCapsule2D):Bool {
#if hl
	return flight._hl._fn.Collision.testSegmentCapsuleCollision2d(a, b);
#elseif cpp
	return flight._cpp._fn.Collision.testSegmentCapsuleCollision2d(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.testSegmentCapsuleCollision2d(a, b);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function testSegmentCircleCollision2d(a:CollisionSegment2D, b:CollisionCircle2D):Bool {
#if hl
	return flight._hl._fn.Collision.testSegmentCircleCollision2d(a, b);
#elseif cpp
	return flight._cpp._fn.Collision.testSegmentCircleCollision2d(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.testSegmentCircleCollision2d(a, b);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function testSegmentObbCollision2d(a:CollisionSegment2D, b:CollisionObb2D):Bool {
#if hl
	return flight._hl._fn.Collision.testSegmentObbCollision2d(a, b);
#elseif cpp
	return flight._cpp._fn.Collision.testSegmentObbCollision2d(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.testSegmentObbCollision2d(a, b);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function testSegmentPolygonCollision2d(a:CollisionSegment2D, b:CollisionPolygon2D):Bool {
#if hl
	return flight._hl._fn.Collision.testSegmentPolygonCollision2d(a, b);
#elseif cpp
	return flight._cpp._fn.Collision.testSegmentPolygonCollision2d(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.testSegmentPolygonCollision2d(a, b);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function testSegmentSegmentCollision2d(a:CollisionSegment2D, b:CollisionSegment2D):Bool {
#if hl
	return flight._hl._fn.Collision.testSegmentSegmentCollision2d(a, b);
#elseif cpp
	return flight._cpp._fn.Collision.testSegmentSegmentCollision2d(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.testSegmentSegmentCollision2d(a, b);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function testAabbAabbCollision2d(a:CollisionAabb2D, b:CollisionAabb2D, out:CollisionManifold2D):Bool {
#if hl
	return flight._hl._fn.Collision.testAabbAabbCollision2d(a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.testAabbAabbCollision2d(a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.testAabbAabbCollision2d(a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function testAabbObbCollision2d(a:CollisionAabb2D, b:CollisionObb2D, out:CollisionManifold2D):Bool {
#if hl
	return flight._hl._fn.Collision.testAabbObbCollision2d(a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.testAabbObbCollision2d(a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.testAabbObbCollision2d(a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function testAabbPolygonCollision2d(a:CollisionAabb2D, b:CollisionPolygon2D, out:CollisionManifold2D):Bool {
#if hl
	return flight._hl._fn.Collision.testAabbPolygonCollision2d(a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.testAabbPolygonCollision2d(a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.testAabbPolygonCollision2d(a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function testCircleAabbCollision2d(a:CollisionCircle2D, b:CollisionAabb2D, out:CollisionManifold2D):Bool {
#if hl
	return flight._hl._fn.Collision.testCircleAabbCollision2d(a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.testCircleAabbCollision2d(a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.testCircleAabbCollision2d(a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function testCircleCircleCollision2d(a:CollisionCircle2D, b:CollisionCircle2D, out:CollisionManifold2D):Bool {
#if hl
	return flight._hl._fn.Collision.testCircleCircleCollision2d(a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.testCircleCircleCollision2d(a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.testCircleCircleCollision2d(a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function testCircleObbCollision2d(a:CollisionCircle2D, b:CollisionObb2D, out:CollisionManifold2D):Bool {
#if hl
	return flight._hl._fn.Collision.testCircleObbCollision2d(a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.testCircleObbCollision2d(a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.testCircleObbCollision2d(a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function testCirclePolygonCollision2d(a:CollisionCircle2D, b:CollisionPolygon2D, out:CollisionManifold2D):Bool {
#if hl
	return flight._hl._fn.Collision.testCirclePolygonCollision2d(a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.testCirclePolygonCollision2d(a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.testCirclePolygonCollision2d(a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function testObbObbCollision2d(a:CollisionObb2D, b:CollisionObb2D, out:CollisionManifold2D):Bool {
#if hl
	return flight._hl._fn.Collision.testObbObbCollision2d(a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.testObbObbCollision2d(a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.testObbObbCollision2d(a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function testObbPolygonCollision2d(a:CollisionObb2D, b:CollisionPolygon2D, out:CollisionManifold2D):Bool {
#if hl
	return flight._hl._fn.Collision.testObbPolygonCollision2d(a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.testObbPolygonCollision2d(a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.testObbPolygonCollision2d(a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function testPolygonPolygonCollision2d(a:CollisionPolygon2D, b:CollisionPolygon2D, out:CollisionManifold2D):Bool {
#if hl
	return flight._hl._fn.Collision.testPolygonPolygonCollision2d(a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.testPolygonPolygonCollision2d(a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.testPolygonPolygonCollision2d(a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function testAabbAabbCollision3d(a:CollisionAabb3D, b:CollisionAabb3D, out:CollisionManifold3D):Bool {
#if hl
	return flight._hl._fn.Collision.testAabbAabbCollision3d(a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.testAabbAabbCollision3d(a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.testAabbAabbCollision3d(a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function testBoxBoxCollision3d(a:CollisionBox3D, b:CollisionBox3D, out:CollisionManifold3D):Bool {
#if hl
	return flight._hl._fn.Collision.testBoxBoxCollision3d(a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.testBoxBoxCollision3d(a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.testBoxBoxCollision3d(a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function testCapsuleCapsuleCollision3d(a:CollisionCapsule3D, b:CollisionCapsule3D, out:CollisionManifold3D):Bool {
#if hl
	return flight._hl._fn.Collision.testCapsuleCapsuleCollision3d(a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.testCapsuleCapsuleCollision3d(a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.testCapsuleCapsuleCollision3d(a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function testSphereAabbCollision3d(a:CollisionSphere3D, b:CollisionAabb3D, out:CollisionManifold3D):Bool {
#if hl
	return flight._hl._fn.Collision.testSphereAabbCollision3d(a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.testSphereAabbCollision3d(a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.testSphereAabbCollision3d(a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function testSphereBoxCollision3d(a:CollisionSphere3D, b:CollisionBox3D, out:CollisionManifold3D):Bool {
#if hl
	return flight._hl._fn.Collision.testSphereBoxCollision3d(a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.testSphereBoxCollision3d(a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.testSphereBoxCollision3d(a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function testSphereCapsuleCollision3d(a:CollisionSphere3D, b:CollisionCapsule3D, out:CollisionManifold3D):Bool {
#if hl
	return flight._hl._fn.Collision.testSphereCapsuleCollision3d(a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.testSphereCapsuleCollision3d(a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.testSphereCapsuleCollision3d(a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function testSphereSphereCollision3d(a:CollisionSphere3D, b:CollisionSphere3D, out:CollisionManifold3D):Bool {
#if hl
	return flight._hl._fn.Collision.testSphereSphereCollision3d(a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.testSphereSphereCollision3d(a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.testSphereSphereCollision3d(a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function collideAabbAabbContactManifold2d(a:CollisionAabb2D, b:CollisionAabb2D, out:CollisionContactManifold2D):Bool {
#if hl
	return flight._hl._fn.Collision.collideAabbAabbContactManifold2d(a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.collideAabbAabbContactManifold2d(a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.collideAabbAabbContactManifold2d(a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function collideAabbObbContactManifold2d(a:CollisionAabb2D, b:CollisionObb2D, out:CollisionContactManifold2D):Bool {
#if hl
	return flight._hl._fn.Collision.collideAabbObbContactManifold2d(a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.collideAabbObbContactManifold2d(a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.collideAabbObbContactManifold2d(a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function collideAabbPolygonContactManifold2d(a:CollisionAabb2D, b:CollisionPolygon2D, out:CollisionContactManifold2D):Bool {
#if hl
	return flight._hl._fn.Collision.collideAabbPolygonContactManifold2d(a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.collideAabbPolygonContactManifold2d(a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.collideAabbPolygonContactManifold2d(a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function collideCircleAabbContactManifold2d(a:CollisionCircle2D, b:CollisionAabb2D, out:CollisionContactManifold2D):Bool {
#if hl
	return flight._hl._fn.Collision.collideCircleAabbContactManifold2d(a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.collideCircleAabbContactManifold2d(a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.collideCircleAabbContactManifold2d(a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function collideCircleCircleContactManifold2d(a:CollisionCircle2D, b:CollisionCircle2D, out:CollisionContactManifold2D):Bool {
#if hl
	return flight._hl._fn.Collision.collideCircleCircleContactManifold2d(a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.collideCircleCircleContactManifold2d(a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.collideCircleCircleContactManifold2d(a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function collideCircleObbContactManifold2d(a:CollisionCircle2D, b:CollisionObb2D, out:CollisionContactManifold2D):Bool {
#if hl
	return flight._hl._fn.Collision.collideCircleObbContactManifold2d(a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.collideCircleObbContactManifold2d(a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.collideCircleObbContactManifold2d(a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function collideCirclePolygonContactManifold2d(a:CollisionCircle2D, b:CollisionPolygon2D, out:CollisionContactManifold2D):Bool {
#if hl
	return flight._hl._fn.Collision.collideCirclePolygonContactManifold2d(a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.collideCirclePolygonContactManifold2d(a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.collideCirclePolygonContactManifold2d(a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function collideObbObbContactManifold2d(a:CollisionObb2D, b:CollisionObb2D, out:CollisionContactManifold2D):Bool {
#if hl
	return flight._hl._fn.Collision.collideObbObbContactManifold2d(a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.collideObbObbContactManifold2d(a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.collideObbObbContactManifold2d(a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function collideObbPolygonContactManifold2d(a:CollisionObb2D, b:CollisionPolygon2D, out:CollisionContactManifold2D):Bool {
#if hl
	return flight._hl._fn.Collision.collideObbPolygonContactManifold2d(a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.collideObbPolygonContactManifold2d(a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.collideObbPolygonContactManifold2d(a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function collidePolygonPolygonContactManifold2d(a:CollisionPolygon2D, b:CollisionPolygon2D, out:CollisionContactManifold2D):Bool {
#if hl
	return flight._hl._fn.Collision.collidePolygonPolygonContactManifold2d(a, b, out);
#elseif cpp
	return flight._cpp._fn.Collision.collidePolygonPolygonContactManifold2d(a, b, out);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.collidePolygonPolygonContactManifold2d(a, b, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function createCollisionTimeOfImpact2d():CollisionTimeOfImpact2D {
#if hl
	return flight._hl._fn.Collision.createCollisionTimeOfImpact2d();
#elseif cpp
	return flight._cpp._fn.Collision.createCollisionTimeOfImpact2d();
#elseif (js && flight_esm)
	return flight._js._fn.Collision.createCollisionTimeOfImpact2d();
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function sweepCollisionShape2d(out:CollisionTimeOfImpact2D, registry:CollisionRegistry2D, shapeA:CollisionShape2D, translationAx:Float, translationAy:Float, shapeB:CollisionShape2D, translationBx:Float, translationBy:Float, maxFraction:Float):Bool {
#if hl
	return flight._hl._fn.Collision.sweepCollisionShape2d(out, registry, shapeA, translationAx, translationAy, shapeB, translationBx, translationBy, maxFraction);
#elseif cpp
	return flight._cpp._fn.Collision.sweepCollisionShape2d(out, registry, shapeA, translationAx, translationAy, shapeB, translationBx, translationBy, maxFraction);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.sweepCollisionShape2d(out, registry, shapeA, translationAx, translationAy, shapeB, translationBx, translationBy, maxFraction);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function createCollisionTimeOfImpact3d():CollisionTimeOfImpact3D {
#if hl
	return flight._hl._fn.Collision.createCollisionTimeOfImpact3d();
#elseif cpp
	return flight._cpp._fn.Collision.createCollisionTimeOfImpact3d();
#elseif (js && flight_esm)
	return flight._js._fn.Collision.createCollisionTimeOfImpact3d();
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function sweepCollisionShape3d(out:CollisionTimeOfImpact3D, registry:CollisionRegistry3D, shapeA:CollisionShape3D, translationAx:Float, translationAy:Float, translationAz:Float, shapeB:CollisionShape3D, translationBx:Float, translationBy:Float, translationBz:Float, maxFraction:Float):Bool {
#if hl
	return flight._hl._fn.Collision.sweepCollisionShape3d(out, registry, shapeA, translationAx, translationAy, translationAz, shapeB, translationBx, translationBy, translationBz, maxFraction);
#elseif cpp
	return flight._cpp._fn.Collision.sweepCollisionShape3d(out, registry, shapeA, translationAx, translationAy, translationAz, shapeB, translationBx, translationBy, translationBz, maxFraction);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.sweepCollisionShape3d(out, registry, shapeA, translationAx, translationAy, translationAz, shapeB, translationBx, translationBy, translationBz, maxFraction);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function createCollisionHeightfield3d():CollisionHeightfield3D {
#if hl
	return flight._hl._fn.Collision.createCollisionHeightfield3d();
#elseif cpp
	return flight._cpp._fn.Collision.createCollisionHeightfield3d();
#elseif (js && flight_esm)
	return flight._js._fn.Collision.createCollisionHeightfield3d();
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function createCollisionTriangleMesh3d():CollisionTriangleMesh3D {
#if hl
	return flight._hl._fn.Collision.createCollisionTriangleMesh3d();
#elseif cpp
	return flight._cpp._fn.Collision.createCollisionTriangleMesh3d();
#elseif (js && flight_esm)
	return flight._js._fn.Collision.createCollisionTriangleMesh3d();
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function cloneCollisionColliderShape3d(shape:CollisionColliderShape3D):Int {
#if hl
	return flight._hl._fn.Collision.cloneCollisionColliderShape3d(shape);
#elseif cpp
	return flight._cpp._fn.Collision.cloneCollisionColliderShape3d(shape);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.cloneCollisionColliderShape3d(shape);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function collideCollisionHeightfield3d(out:CollisionContactManifold3D, registry:CollisionRegistry3D, convex:CollisionShape3D, heightfield:CollisionHeightfield3D):Bool {
#if hl
	return flight._hl._fn.Collision.collideCollisionHeightfield3d(out, registry, convex, heightfield);
#elseif cpp
	return flight._cpp._fn.Collision.collideCollisionHeightfield3d(out, registry, convex, heightfield);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.collideCollisionHeightfield3d(out, registry, convex, heightfield);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function collideCollisionTriangleMesh3d(out:CollisionContactManifold3D, registry:CollisionRegistry3D, convex:CollisionShape3D, mesh:CollisionTriangleMesh3D):Bool {
#if hl
	return flight._hl._fn.Collision.collideCollisionTriangleMesh3d(out, registry, convex, mesh);
#elseif cpp
	return flight._cpp._fn.Collision.collideCollisionTriangleMesh3d(out, registry, convex, mesh);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.collideCollisionTriangleMesh3d(out, registry, convex, mesh);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function getCollisionHeightfieldValidationStatus3d(heightfield:CollisionHeightfield3D):Int {
#if hl
	return flight._hl._fn.Collision.getCollisionHeightfieldValidationStatus3d(heightfield);
#elseif cpp
	return flight._cpp._fn.Collision.getCollisionHeightfieldValidationStatus3d(heightfield);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.getCollisionHeightfieldValidationStatus3d(heightfield);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function getCollisionTriangleMeshValidationStatus3d(mesh:CollisionTriangleMesh3D):Int {
#if hl
	return flight._hl._fn.Collision.getCollisionTriangleMeshValidationStatus3d(mesh);
#elseif cpp
	return flight._cpp._fn.Collision.getCollisionTriangleMeshValidationStatus3d(mesh);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.getCollisionTriangleMeshValidationStatus3d(mesh);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function invalidateCollisionHeightfield3d(heightfield:CollisionHeightfield3D):Void {
#if hl
	flight._hl._fn.Collision.invalidateCollisionHeightfield3d(heightfield);
#elseif cpp
	flight._cpp._fn.Collision.invalidateCollisionHeightfield3d(heightfield);
#elseif (js && flight_esm)
	flight._js._fn.Collision.invalidateCollisionHeightfield3d(heightfield);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function invalidateCollisionTriangleMesh3d(mesh:CollisionTriangleMesh3D):Void {
#if hl
	flight._hl._fn.Collision.invalidateCollisionTriangleMesh3d(mesh);
#elseif cpp
	flight._cpp._fn.Collision.invalidateCollisionTriangleMesh3d(mesh);
#elseif (js && flight_esm)
	flight._js._fn.Collision.invalidateCollisionTriangleMesh3d(mesh);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function raycastCollisionHeightfield3d(out:CollisionRaycastHit3D, heightfield:CollisionHeightfield3D, originX:Float, originY:Float, originZ:Float, directionX:Float, directionY:Float, directionZ:Float, maxFraction:Float):Bool {
#if hl
	return flight._hl._fn.Collision.raycastCollisionHeightfield3d(out, heightfield, originX, originY, originZ, directionX, directionY, directionZ, maxFraction);
#elseif cpp
	return flight._cpp._fn.Collision.raycastCollisionHeightfield3d(out, heightfield, originX, originY, originZ, directionX, directionY, directionZ, maxFraction);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.raycastCollisionHeightfield3d(out, heightfield, originX, originY, originZ, directionX, directionY, directionZ, maxFraction);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function raycastCollisionTriangleMesh3d(out:CollisionRaycastHit3D, mesh:CollisionTriangleMesh3D, originX:Float, originY:Float, originZ:Float, directionX:Float, directionY:Float, directionZ:Float, maxFraction:Float):Bool {
#if hl
	return flight._hl._fn.Collision.raycastCollisionTriangleMesh3d(out, mesh, originX, originY, originZ, directionX, directionY, directionZ, maxFraction);
#elseif cpp
	return flight._cpp._fn.Collision.raycastCollisionTriangleMesh3d(out, mesh, originX, originY, originZ, directionX, directionY, directionZ, maxFraction);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.raycastCollisionTriangleMesh3d(out, mesh, originX, originY, originZ, directionX, directionY, directionZ, maxFraction);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function sweepCollisionHeightfield3d(out:CollisionTimeOfImpact3D, registry:CollisionRegistry3D, convex:CollisionShape3D, deltaX:Float, deltaY:Float, deltaZ:Float, heightfield:CollisionHeightfield3D, maxFraction:Float):Bool {
#if hl
	return flight._hl._fn.Collision.sweepCollisionHeightfield3d(out, registry, convex, deltaX, deltaY, deltaZ, heightfield, maxFraction);
#elseif cpp
	return flight._cpp._fn.Collision.sweepCollisionHeightfield3d(out, registry, convex, deltaX, deltaY, deltaZ, heightfield, maxFraction);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.sweepCollisionHeightfield3d(out, registry, convex, deltaX, deltaY, deltaZ, heightfield, maxFraction);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function sweepCollisionTriangleMesh3d(out:CollisionTimeOfImpact3D, registry:CollisionRegistry3D, convex:CollisionShape3D, deltaX:Float, deltaY:Float, deltaZ:Float, mesh:CollisionTriangleMesh3D, maxFraction:Float):Bool {
#if hl
	return flight._hl._fn.Collision.sweepCollisionTriangleMesh3d(out, registry, convex, deltaX, deltaY, deltaZ, mesh, maxFraction);
#elseif cpp
	return flight._cpp._fn.Collision.sweepCollisionTriangleMesh3d(out, registry, convex, deltaX, deltaY, deltaZ, mesh, maxFraction);
#elseif (js && flight_esm)
	return flight._js._fn.Collision.sweepCollisionTriangleMesh3d(out, registry, convex, deltaX, deltaY, deltaZ, mesh, maxFraction);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function writeCollisionHeightfieldBounds3d(heightfield:CollisionHeightfield3D, out:CollisionAabb3D):Void {
#if hl
	flight._hl._fn.Collision.writeCollisionHeightfieldBounds3d(heightfield, out);
#elseif cpp
	flight._cpp._fn.Collision.writeCollisionHeightfieldBounds3d(heightfield, out);
#elseif (js && flight_esm)
	flight._js._fn.Collision.writeCollisionHeightfieldBounds3d(heightfield, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function writeCollisionTriangleMeshBounds3d(mesh:CollisionTriangleMesh3D, out:CollisionAabb3D):Void {
#if hl
	flight._hl._fn.Collision.writeCollisionTriangleMeshBounds3d(mesh, out);
#elseif cpp
	flight._cpp._fn.Collision.writeCollisionTriangleMeshBounds3d(mesh, out);
#elseif (js && flight_esm)
	flight._js._fn.Collision.writeCollisionTriangleMeshBounds3d(mesh, out);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function freeCollisionContactManifold2D(ptr:CollisionContactManifold2D):Void {
#if hl
	flight._hl._fn.Collision.freeCollisionContactManifold2D(ptr);
#elseif cpp
	flight._cpp._fn.Collision.freeCollisionContactManifold2D(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Collision.freeCollisionContactManifold2D(ptr);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function freeCollisionContactManifold3D(ptr:CollisionContactManifold3D):Void {
#if hl
	flight._hl._fn.Collision.freeCollisionContactManifold3D(ptr);
#elseif cpp
	flight._cpp._fn.Collision.freeCollisionContactManifold3D(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Collision.freeCollisionContactManifold3D(ptr);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function freeCollisionDistance3D(ptr:CollisionDistance3D):Void {
#if hl
	flight._hl._fn.Collision.freeCollisionDistance3D(ptr);
#elseif cpp
	flight._cpp._fn.Collision.freeCollisionDistance3D(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Collision.freeCollisionDistance3D(ptr);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function freeCollisionManifold2D(ptr:CollisionManifold2D):Void {
#if hl
	flight._hl._fn.Collision.freeCollisionManifold2D(ptr);
#elseif cpp
	flight._cpp._fn.Collision.freeCollisionManifold2D(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Collision.freeCollisionManifold2D(ptr);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function freeCollisionManifold3D(ptr:CollisionManifold3D):Void {
#if hl
	flight._hl._fn.Collision.freeCollisionManifold3D(ptr);
#elseif cpp
	flight._cpp._fn.Collision.freeCollisionManifold3D(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Collision.freeCollisionManifold3D(ptr);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function freeCollisionRaycastHit2D(ptr:CollisionRaycastHit2D):Void {
#if hl
	flight._hl._fn.Collision.freeCollisionRaycastHit2D(ptr);
#elseif cpp
	flight._cpp._fn.Collision.freeCollisionRaycastHit2D(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Collision.freeCollisionRaycastHit2D(ptr);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function freeCollisionRaycastHit3D(ptr:CollisionRaycastHit3D):Void {
#if hl
	flight._hl._fn.Collision.freeCollisionRaycastHit3D(ptr);
#elseif cpp
	flight._cpp._fn.Collision.freeCollisionRaycastHit3D(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Collision.freeCollisionRaycastHit3D(ptr);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function freeCollisionTimeOfImpact2D(ptr:CollisionTimeOfImpact2D):Void {
#if hl
	flight._hl._fn.Collision.freeCollisionTimeOfImpact2D(ptr);
#elseif cpp
	flight._cpp._fn.Collision.freeCollisionTimeOfImpact2D(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Collision.freeCollisionTimeOfImpact2D(ptr);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function freeCollisionTimeOfImpact3D(ptr:CollisionTimeOfImpact3D):Void {
#if hl
	flight._hl._fn.Collision.freeCollisionTimeOfImpact3D(ptr);
#elseif cpp
	flight._cpp._fn.Collision.freeCollisionTimeOfImpact3D(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Collision.freeCollisionTimeOfImpact3D(ptr);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function freeCollisionHeightfield3D(ptr:CollisionHeightfield3D):Void {
#if hl
	flight._hl._fn.Collision.freeCollisionHeightfield3D(ptr);
#elseif cpp
	flight._cpp._fn.Collision.freeCollisionHeightfield3D(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Collision.freeCollisionHeightfield3D(ptr);
#else
	#error "flight.Collision: no backend for this target."
#end
}
inline function freeCollisionTriangleMesh3D(ptr:CollisionTriangleMesh3D):Void {
#if hl
	flight._hl._fn.Collision.freeCollisionTriangleMesh3D(ptr);
#elseif cpp
	flight._cpp._fn.Collision.freeCollisionTriangleMesh3D(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Collision.freeCollisionTriangleMesh3D(ptr);
#else
	#error "flight.Collision: no backend for this target."
#end
}
