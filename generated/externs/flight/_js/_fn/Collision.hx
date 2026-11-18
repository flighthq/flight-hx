package flight._js._fn;

@:jsRequire("@flighthq/collision")
extern class Collision {
	@:native("collideCapsuleAabbContactManifold2D")
	public static function collideCapsuleAabbContactManifold2d(a:flight._js.CollisionCapsule2D, b:flight._js.CollisionAabb2D, out:flight._js.CollisionContactManifold2D):Bool;
	@:native("collideCapsuleCapsuleContactManifold2D")
	public static function collideCapsuleCapsuleContactManifold2d(a:flight._js.CollisionCapsule2D, b:flight._js.CollisionCapsule2D, out:flight._js.CollisionContactManifold2D):Bool;
	@:native("collideCapsuleObbContactManifold2D")
	public static function collideCapsuleObbContactManifold2d(a:flight._js.CollisionCapsule2D, b:flight._js.CollisionObb2D, out:flight._js.CollisionContactManifold2D):Bool;
	@:native("collideCapsulePolygonContactManifold2D")
	public static function collideCapsulePolygonContactManifold2d(a:flight._js.CollisionCapsule2D, b:flight._js.CollisionPolygon2D, out:flight._js.CollisionContactManifold2D):Bool;
	@:native("collideCircleCapsuleContactManifold2D")
	public static function collideCircleCapsuleContactManifold2d(a:flight._js.CollisionCircle2D, b:flight._js.CollisionCapsule2D, out:flight._js.CollisionContactManifold2D):Bool;
	@:native("collideContactManifold2D")
	public static function collideContactManifold2d(a:flight._js.CollisionShape2D, b:flight._js.CollisionShape2D, out:flight._js.CollisionContactManifold2D):Bool;
	@:native("collideContactManifold3D")
	public static function collideContactManifold3d(registry:flight._js.CollisionRegistry3D, a:flight._js.CollisionShape3D, b:flight._js.CollisionShape3D, out:flight._js.CollisionContactManifold3D):Bool;
	@:native("queryCollisionAabbFace3D")
	public static function queryCollisionAabbFace3d(shape:flight._js.CollisionShape3D, dirX:Float, dirY:Float, dirZ:Float, out:Dynamic):Int;
	@:native("queryCollisionBoxFace3D")
	public static function queryCollisionBoxFace3d(shape:flight._js.CollisionShape3D, dirX:Float, dirY:Float, dirZ:Float, out:Dynamic):Int;
	@:native("queryCollisionCapsuleFace3D")
	public static function queryCollisionCapsuleFace3d(shape:flight._js.CollisionShape3D, dirX:Float, dirY:Float, dirZ:Float, out:Dynamic):Int;
	@:native("queryCollisionConvexFace3D")
	public static function queryCollisionConvexFace3d(shape:flight._js.CollisionShape3D, dirX:Float, dirY:Float, dirZ:Float, out:Dynamic):Int;
	@:native("registerBuiltInCollisionFaceQueries3D")
	public static function registerBuiltInCollisionFaceQueries3d(registry:flight._js.CollisionRegistry3D):Void;
	@:native("registerCollisionFaceQuery3D")
	public static function registerCollisionFaceQuery3d(registry:flight._js.CollisionRegistry3D, kind:String, query:flight._js.CollisionFaceQuery3D):Void;
	@:native("getCollisionPolygonValidationStatus2D")
	public static function getCollisionPolygonValidationStatus2d(points:Dynamic):Null<Dynamic>;
	@:native("getCollisionShapeValidationStatus2D")
	public static function getCollisionShapeValidationStatus2d(shape:flight._js.CollisionShape2D):Null<Dynamic>;
	@:native("getCollisionConvexValidationStatus3D")
	public static function getCollisionConvexValidationStatus3d(points:Dynamic):Null<Dynamic>;
	@:native("getCollisionShapeValidationStatus3D")
	public static function getCollisionShapeValidationStatus3d(shape:flight._js.CollisionShape3D):Null<Dynamic>;
	@:native("registerBuiltInCollisionSupports2D")
	public static function registerBuiltInCollisionSupports2d(registry:flight._js.CollisionRegistry2D):Void;
	@:native("registerCollisionPairTest2D")
	public static function registerCollisionPairTest2d(registry:flight._js.CollisionRegistry2D, kindA:String, kindB:String, test:flight._js.CollisionPairTest2D):Void;
	@:native("registerCollisionSupport2D")
	public static function registerCollisionSupport2d(registry:flight._js.CollisionRegistry2D, kind:String, support:flight._js.CollisionSupport2D):Void;
	@:native("supportCollisionAabb2D")
	public static function supportCollisionAabb2d(shape:flight._js.CollisionAabb2D, dirX:Float, dirY:Float, out:Dynamic):Void;
	@:native("supportCollisionCircle2D")
	public static function supportCollisionCircle2d(shape:flight._js.CollisionCircle2D, dirX:Float, dirY:Float, out:Dynamic):Void;
	@:native("supportCollisionObb2D")
	public static function supportCollisionObb2d(shape:flight._js.CollisionObb2D, dirX:Float, dirY:Float, out:Dynamic):Void;
	@:native("supportCollisionPolygon2D")
	public static function supportCollisionPolygon2d(shape:flight._js.CollisionPolygon2D, dirX:Float, dirY:Float, out:Dynamic):Void;
	@:native("writeVertexListSupport2D")
	public static function writeVertexListSupport2d(vertices:Dynamic, count:Int, dirX:Float, dirY:Float, out:Dynamic):Void;
	@:native("clearCollisionPairTests3D")
	public static function clearCollisionPairTests3d(registry:flight._js.CollisionRegistry3D):Void;
	@:native("clearCollisionSupports3D")
	public static function clearCollisionSupports3d(registry:flight._js.CollisionRegistry3D):Void;
	@:native("registerBuiltInCollisionSupports3D")
	public static function registerBuiltInCollisionSupports3d(registry:flight._js.CollisionRegistry3D):Void;
	@:native("registerCollisionPairTest3D")
	public static function registerCollisionPairTest3d(registry:flight._js.CollisionRegistry3D, kindA:String, kindB:String, test:flight._js.CollisionPairTest3D):Void;
	@:native("registerCollisionSupport3D")
	public static function registerCollisionSupport3d(registry:flight._js.CollisionRegistry3D, kind:String, support:flight._js.CollisionSupport3D):Void;
	@:native("supportCollisionAabb3D")
	public static function supportCollisionAabb3d(shape:flight._js.CollisionAabb3D, dirX:Float, dirY:Float, dirZ:Float, out:Dynamic):Void;
	@:native("supportCollisionBox3D")
	public static function supportCollisionBox3d(shape:flight._js.CollisionBox3D, dirX:Float, dirY:Float, dirZ:Float, out:Dynamic):Void;
	@:native("supportCollisionCapsule3D")
	public static function supportCollisionCapsule3d(shape:flight._js.CollisionCapsule3D, dirX:Float, dirY:Float, dirZ:Float, out:Dynamic):Void;
	@:native("supportCollisionCone3D")
	public static function supportCollisionCone3d(shape:flight._js.CollisionCone3D, dirX:Float, dirY:Float, dirZ:Float, out:Dynamic):Void;
	@:native("supportCollisionConvex3D")
	public static function supportCollisionConvex3d(shape:flight._js.CollisionConvex3D, dirX:Float, dirY:Float, dirZ:Float, out:Dynamic):Void;
	@:native("supportCollisionCylinder3D")
	public static function supportCollisionCylinder3d(shape:flight._js.CollisionCylinder3D, dirX:Float, dirY:Float, dirZ:Float, out:Dynamic):Void;
	@:native("supportCollisionSphere3D")
	public static function supportCollisionSphere3d(shape:flight._js.CollisionSphere3D, dirX:Float, dirY:Float, dirZ:Float, out:Dynamic):Void;
	@:native("writeVertexListSupport3D")
	public static function writeVertexListSupport3d(vertices:Dynamic, count:Int, dirX:Float, dirY:Float, dirZ:Float, out:Dynamic):Void;
	@:native("packContactFeatureId")
	public static function packContactFeatureId(referenceIsA:Bool, referenceEdge:Float, incidentEdge:Float, secondPoint:Bool):Float;
	@:native("createCollisionContactManifold2D")
	public static function createCollisionContactManifold2d():flight._js.CollisionContactManifold2D;
	@:native("clearCollisionContactManifold2D")
	public static function clearCollisionContactManifold2d(out:flight._js.CollisionContactManifold2D):Void;
	@:native("createCollisionContactManifold3D")
	public static function createCollisionContactManifold3d():flight._js.CollisionContactManifold3D;
	@:native("clearCollisionContactManifold3D")
	public static function clearCollisionContactManifold3d(out:flight._js.CollisionContactManifold3D):Void;
	@:native("writeCollisionConvexHullFaces3D")
	public static function writeCollisionConvexHullFaces3d(out:Dynamic, points:Dynamic):Int;
	@:native("writeAabbVertices")
	public static function writeAabbVertices(aabb:flight._js.CollisionAabb2D, out:Dynamic):Void;
	@:native("writeObbVertices")
	public static function writeObbVertices(obb:flight._js.CollisionObb2D, out:Dynamic):Void;
	@:native("areCollisionGuardsEnabled")
	public static function areCollisionGuardsEnabled(registry2d:flight._js.CollisionRegistry2D, registry3d:flight._js.CollisionRegistry3D):Bool;
	@:native("disableCollisionGuards")
	public static function disableCollisionGuards(registry2d:flight._js.CollisionRegistry2D, registry3d:flight._js.CollisionRegistry3D):Void;
	@:native("enableCollisionGuards")
	public static function enableCollisionGuards(registry2d:flight._js.CollisionRegistry2D, registry3d:flight._js.CollisionRegistry3D, logState:Dynamic, clock:Dynamic):Void;
	@:native("testCollisionSupport2D")
	public static function testCollisionSupport2d(registry:flight._js.CollisionRegistry2D, a:flight._js.CollisionShape2D, b:flight._js.CollisionShape2D, out:flight._js.CollisionManifold2D):Bool;
	@:native("testCollisionSupportOverlap2D")
	public static function testCollisionSupportOverlap2d(registry:flight._js.CollisionRegistry2D, a:flight._js.CollisionShape2D, b:flight._js.CollisionShape2D):Bool;
	@:native("testCollisionSupport3D")
	public static function testCollisionSupport3d(registry:flight._js.CollisionRegistry3D, a:flight._js.CollisionShape3D, b:flight._js.CollisionShape3D, out:flight._js.CollisionManifold3D):Bool;
	@:native("testCollisionSupportOverlap3D")
	public static function testCollisionSupportOverlap3d(registry:flight._js.CollisionRegistry3D, a:flight._js.CollisionShape3D, b:flight._js.CollisionShape3D):Bool;
	@:native("createCollisionDistance3D")
	public static function createCollisionDistance3d():flight._js.CollisionDistance3D;
	@:native("writeCollisionDistance3D")
	public static function writeCollisionDistance3d(out:flight._js.CollisionDistance3D, registry:flight._js.CollisionRegistry3D, a:flight._js.CollisionShape3D, b:flight._js.CollisionShape3D, offsetX:Null<Float>, offsetY:Null<Float>, offsetZ:Null<Float>):Bool;
	@:native("createCollisionManifold2D")
	public static function createCollisionManifold2d():flight._js.CollisionManifold2D;
	@:native("clearCollisionManifold2D")
	public static function clearCollisionManifold2d(out:flight._js.CollisionManifold2D):Void;
	@:native("createCollisionManifold3D")
	public static function createCollisionManifold3d():flight._js.CollisionManifold3D;
	@:native("clearCollisionManifold3D")
	public static function clearCollisionManifold3d(out:flight._js.CollisionManifold3D):Void;
	@:native("getCollisionShapeContainsPoint2D")
	public static function getCollisionShapeContainsPoint2d(shape:flight._js.CollisionShape2D, x:Float, y:Float):Bool;
	@:native("getCollisionShapeContainsPoint3D")
	public static function getCollisionShapeContainsPoint3d(shape:flight._js.CollisionShape3D, x:Float, y:Float, z:Float):Bool;
	@:native("createCollisionRaycastHit2D")
	public static function createCollisionRaycastHit2d():flight._js.CollisionRaycastHit2D;
	@:native("raycastCollisionShape2D")
	public static function raycastCollisionShape2d(out:flight._js.CollisionRaycastHit2D, shape:flight._js.CollisionShape2D, originX:Float, originY:Float, directionX:Float, directionY:Float, maxFraction:Null<Float>):Bool;
	@:native("createCollisionRaycastHit3D")
	public static function createCollisionRaycastHit3d():flight._js.CollisionRaycastHit3D;
	@:native("raycastCollisionShape3D")
	public static function raycastCollisionShape3d(out:flight._js.CollisionRaycastHit3D, shape:flight._js.CollisionShape3D, originX:Float, originY:Float, originZ:Float, directionX:Float, directionY:Float, directionZ:Float, maxFraction:Null<Float>):Bool;
	@:native("testSegmentAabbCollision2D")
	public static function testSegmentAabbCollision2d(a:flight._js.CollisionSegment2D, b:flight._js.CollisionAabb2D):Bool;
	@:native("testSegmentCapsuleCollision2D")
	public static function testSegmentCapsuleCollision2d(a:flight._js.CollisionSegment2D, b:flight._js.CollisionCapsule2D):Bool;
	@:native("testSegmentCircleCollision2D")
	public static function testSegmentCircleCollision2d(a:flight._js.CollisionSegment2D, b:flight._js.CollisionCircle2D):Bool;
	@:native("testSegmentObbCollision2D")
	public static function testSegmentObbCollision2d(a:flight._js.CollisionSegment2D, b:flight._js.CollisionObb2D):Bool;
	@:native("testSegmentPolygonCollision2D")
	public static function testSegmentPolygonCollision2d(a:flight._js.CollisionSegment2D, b:flight._js.CollisionPolygon2D):Bool;
	@:native("testSegmentSegmentCollision2D")
	public static function testSegmentSegmentCollision2d(a:flight._js.CollisionSegment2D, b:flight._js.CollisionSegment2D):Bool;
	@:native("testAabbAabbCollision2D")
	public static function testAabbAabbCollision2d(a:flight._js.CollisionAabb2D, b:flight._js.CollisionAabb2D, out:flight._js.CollisionManifold2D):Bool;
	@:native("testAabbObbCollision2D")
	public static function testAabbObbCollision2d(a:flight._js.CollisionAabb2D, b:flight._js.CollisionObb2D, out:flight._js.CollisionManifold2D):Bool;
	@:native("testAabbPolygonCollision2D")
	public static function testAabbPolygonCollision2d(a:flight._js.CollisionAabb2D, b:flight._js.CollisionPolygon2D, out:flight._js.CollisionManifold2D):Bool;
	@:native("testCircleAabbCollision2D")
	public static function testCircleAabbCollision2d(a:flight._js.CollisionCircle2D, b:flight._js.CollisionAabb2D, out:flight._js.CollisionManifold2D):Bool;
	@:native("testCircleCircleCollision2D")
	public static function testCircleCircleCollision2d(a:flight._js.CollisionCircle2D, b:flight._js.CollisionCircle2D, out:flight._js.CollisionManifold2D):Bool;
	@:native("testCircleObbCollision2D")
	public static function testCircleObbCollision2d(a:flight._js.CollisionCircle2D, b:flight._js.CollisionObb2D, out:flight._js.CollisionManifold2D):Bool;
	@:native("testCirclePolygonCollision2D")
	public static function testCirclePolygonCollision2d(a:flight._js.CollisionCircle2D, b:flight._js.CollisionPolygon2D, out:flight._js.CollisionManifold2D):Bool;
	@:native("testObbObbCollision2D")
	public static function testObbObbCollision2d(a:flight._js.CollisionObb2D, b:flight._js.CollisionObb2D, out:flight._js.CollisionManifold2D):Bool;
	@:native("testObbPolygonCollision2D")
	public static function testObbPolygonCollision2d(a:flight._js.CollisionObb2D, b:flight._js.CollisionPolygon2D, out:flight._js.CollisionManifold2D):Bool;
	@:native("testPolygonPolygonCollision2D")
	public static function testPolygonPolygonCollision2d(a:flight._js.CollisionPolygon2D, b:flight._js.CollisionPolygon2D, out:flight._js.CollisionManifold2D):Bool;
	@:native("testAabbAabbCollision3D")
	public static function testAabbAabbCollision3d(a:flight._js.CollisionAabb3D, b:flight._js.CollisionAabb3D, out:flight._js.CollisionManifold3D):Bool;
	@:native("testBoxBoxCollision3D")
	public static function testBoxBoxCollision3d(a:flight._js.CollisionBox3D, b:flight._js.CollisionBox3D, out:flight._js.CollisionManifold3D):Bool;
	@:native("testCapsuleCapsuleCollision3D")
	public static function testCapsuleCapsuleCollision3d(a:flight._js.CollisionCapsule3D, b:flight._js.CollisionCapsule3D, out:flight._js.CollisionManifold3D):Bool;
	@:native("testSphereAabbCollision3D")
	public static function testSphereAabbCollision3d(a:flight._js.CollisionSphere3D, b:flight._js.CollisionAabb3D, out:flight._js.CollisionManifold3D):Bool;
	@:native("testSphereBoxCollision3D")
	public static function testSphereBoxCollision3d(a:flight._js.CollisionSphere3D, b:flight._js.CollisionBox3D, out:flight._js.CollisionManifold3D):Bool;
	@:native("testSphereCapsuleCollision3D")
	public static function testSphereCapsuleCollision3d(a:flight._js.CollisionSphere3D, b:flight._js.CollisionCapsule3D, out:flight._js.CollisionManifold3D):Bool;
	@:native("testSphereSphereCollision3D")
	public static function testSphereSphereCollision3d(a:flight._js.CollisionSphere3D, b:flight._js.CollisionSphere3D, out:flight._js.CollisionManifold3D):Bool;
	@:native("collideAabbAabbContactManifold2D")
	public static function collideAabbAabbContactManifold2d(a:flight._js.CollisionAabb2D, b:flight._js.CollisionAabb2D, out:flight._js.CollisionContactManifold2D):Bool;
	@:native("collideAabbObbContactManifold2D")
	public static function collideAabbObbContactManifold2d(a:flight._js.CollisionAabb2D, b:flight._js.CollisionObb2D, out:flight._js.CollisionContactManifold2D):Bool;
	@:native("collideAabbPolygonContactManifold2D")
	public static function collideAabbPolygonContactManifold2d(a:flight._js.CollisionAabb2D, b:flight._js.CollisionPolygon2D, out:flight._js.CollisionContactManifold2D):Bool;
	@:native("collideCircleAabbContactManifold2D")
	public static function collideCircleAabbContactManifold2d(a:flight._js.CollisionCircle2D, b:flight._js.CollisionAabb2D, out:flight._js.CollisionContactManifold2D):Bool;
	@:native("collideCircleCircleContactManifold2D")
	public static function collideCircleCircleContactManifold2d(a:flight._js.CollisionCircle2D, b:flight._js.CollisionCircle2D, out:flight._js.CollisionContactManifold2D):Bool;
	@:native("collideCircleObbContactManifold2D")
	public static function collideCircleObbContactManifold2d(a:flight._js.CollisionCircle2D, b:flight._js.CollisionObb2D, out:flight._js.CollisionContactManifold2D):Bool;
	@:native("collideCirclePolygonContactManifold2D")
	public static function collideCirclePolygonContactManifold2d(a:flight._js.CollisionCircle2D, b:flight._js.CollisionPolygon2D, out:flight._js.CollisionContactManifold2D):Bool;
	@:native("collideObbObbContactManifold2D")
	public static function collideObbObbContactManifold2d(a:flight._js.CollisionObb2D, b:flight._js.CollisionObb2D, out:flight._js.CollisionContactManifold2D):Bool;
	@:native("collideObbPolygonContactManifold2D")
	public static function collideObbPolygonContactManifold2d(a:flight._js.CollisionObb2D, b:flight._js.CollisionPolygon2D, out:flight._js.CollisionContactManifold2D):Bool;
	@:native("collidePolygonPolygonContactManifold2D")
	public static function collidePolygonPolygonContactManifold2d(a:flight._js.CollisionPolygon2D, b:flight._js.CollisionPolygon2D, out:flight._js.CollisionContactManifold2D):Bool;
	@:native("createCollisionTimeOfImpact2D")
	public static function createCollisionTimeOfImpact2d():flight._js.CollisionTimeOfImpact2D;
	@:native("sweepCollisionShape2D")
	public static function sweepCollisionShape2d(out:flight._js.CollisionTimeOfImpact2D, registry:flight._js.CollisionRegistry2D, shapeA:flight._js.CollisionShape2D, translationAx:Float, translationAy:Float, shapeB:flight._js.CollisionShape2D, translationBx:Float, translationBy:Float, maxFraction:Null<Float>):Bool;
	@:native("createCollisionTimeOfImpact3D")
	public static function createCollisionTimeOfImpact3d():flight._js.CollisionTimeOfImpact3D;
	@:native("sweepCollisionShape3D")
	public static function sweepCollisionShape3d(out:flight._js.CollisionTimeOfImpact3D, registry:flight._js.CollisionRegistry3D, shapeA:flight._js.CollisionShape3D, translationAx:Float, translationAy:Float, translationAz:Float, shapeB:flight._js.CollisionShape3D, translationBx:Float, translationBy:Float, translationBz:Float, maxFraction:Null<Float>):Bool;
	@:native("createCollisionHeightfield3D")
	public static function createCollisionHeightfield3d():flight._js.CollisionHeightfield3D;
	@:native("createCollisionTriangleMesh3D")
	public static function createCollisionTriangleMesh3d():flight._js.CollisionTriangleMesh3D;
	@:native("cloneCollisionColliderShape3D")
	public static function cloneCollisionColliderShape3d(shape:flight._js.CollisionColliderShape3D):flight._js.CollisionColliderShape3D;
	@:native("collideCollisionHeightfield3D")
	public static function collideCollisionHeightfield3d(out:flight._js.CollisionContactManifold3D, registry:flight._js.CollisionRegistry3D, convex:flight._js.CollisionShape3D, heightfield:flight._js.CollisionHeightfield3D):Bool;
	@:native("collideCollisionTriangleMesh3D")
	public static function collideCollisionTriangleMesh3d(out:flight._js.CollisionContactManifold3D, registry:flight._js.CollisionRegistry3D, convex:flight._js.CollisionShape3D, mesh:flight._js.CollisionTriangleMesh3D):Bool;
	@:native("getCollisionHeightfieldValidationStatus3D")
	public static function getCollisionHeightfieldValidationStatus3d(heightfield:flight._js.CollisionHeightfield3D):Null<Dynamic>;
	@:native("getCollisionTriangleMeshValidationStatus3D")
	public static function getCollisionTriangleMeshValidationStatus3d(mesh:flight._js.CollisionTriangleMesh3D):Null<Dynamic>;
	@:native("invalidateCollisionHeightfield3D")
	public static function invalidateCollisionHeightfield3d(heightfield:flight._js.CollisionHeightfield3D):Void;
	@:native("invalidateCollisionTriangleMesh3D")
	public static function invalidateCollisionTriangleMesh3d(mesh:flight._js.CollisionTriangleMesh3D):Void;
	@:native("raycastCollisionHeightfield3D")
	public static function raycastCollisionHeightfield3d(out:flight._js.CollisionRaycastHit3D, heightfield:flight._js.CollisionHeightfield3D, originX:Float, originY:Float, originZ:Float, directionX:Float, directionY:Float, directionZ:Float, maxFraction:Null<Float>):Bool;
	@:native("raycastCollisionTriangleMesh3D")
	public static function raycastCollisionTriangleMesh3d(out:flight._js.CollisionRaycastHit3D, mesh:flight._js.CollisionTriangleMesh3D, originX:Float, originY:Float, originZ:Float, directionX:Float, directionY:Float, directionZ:Float, maxFraction:Null<Float>):Bool;
	@:native("sweepCollisionHeightfield3D")
	public static function sweepCollisionHeightfield3d(out:flight._js.CollisionTimeOfImpact3D, registry:flight._js.CollisionRegistry3D, convex:flight._js.CollisionShape3D, deltaX:Float, deltaY:Float, deltaZ:Float, heightfield:flight._js.CollisionHeightfield3D, maxFraction:Null<Float>):Bool;
	@:native("sweepCollisionTriangleMesh3D")
	public static function sweepCollisionTriangleMesh3d(out:flight._js.CollisionTimeOfImpact3D, registry:flight._js.CollisionRegistry3D, convex:flight._js.CollisionShape3D, deltaX:Float, deltaY:Float, deltaZ:Float, mesh:flight._js.CollisionTriangleMesh3D, maxFraction:Null<Float>):Bool;
	@:native("writeCollisionHeightfieldBounds3D")
	public static function writeCollisionHeightfieldBounds3d(heightfield:flight._js.CollisionHeightfield3D, out:flight._js.CollisionAabb3D):Void;
	@:native("writeCollisionTriangleMeshBounds3D")
	public static function writeCollisionTriangleMeshBounds3d(mesh:flight._js.CollisionTriangleMesh3D, out:flight._js.CollisionAabb3D):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeCollisionContactManifold2D(ptr:flight._js.CollisionContactManifold2D):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeCollisionContactManifold3D(ptr:flight._js.CollisionContactManifold3D):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeCollisionDistance3D(ptr:flight._js.CollisionDistance3D):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeCollisionManifold2D(ptr:flight._js.CollisionManifold2D):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeCollisionManifold3D(ptr:flight._js.CollisionManifold3D):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeCollisionRaycastHit2D(ptr:flight._js.CollisionRaycastHit2D):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeCollisionRaycastHit3D(ptr:flight._js.CollisionRaycastHit3D):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeCollisionTimeOfImpact2D(ptr:flight._js.CollisionTimeOfImpact2D):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeCollisionTimeOfImpact3D(ptr:flight._js.CollisionTimeOfImpact3D):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeCollisionHeightfield3D(ptr:flight._js.CollisionHeightfield3D):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeCollisionTriangleMesh3D(ptr:flight._js.CollisionTriangleMesh3D):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeCollisionColliderShape3D(ptr:flight._js.CollisionColliderShape3D):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeCollisionShape2D(ptr:flight._js.CollisionShape2D):Void {}
}
