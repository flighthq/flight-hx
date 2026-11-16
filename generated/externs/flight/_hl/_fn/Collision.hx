package flight._hl._fn;

extern class Collision {
	@:hlNative("flight", "flight_collide_capsule_aabb_contact_manifold2d")
	public static function collideCapsuleAabbContactManifold2d(a:flight._hl.CollisionCapsule2D, b:flight._hl.CollisionAabb2D, out:flight._hl.CollisionContactManifold2D):Bool;
	@:hlNative("flight", "flight_collide_capsule_capsule_contact_manifold2d")
	public static function collideCapsuleCapsuleContactManifold2d(a:flight._hl.CollisionCapsule2D, b:flight._hl.CollisionCapsule2D, out:flight._hl.CollisionContactManifold2D):Bool;
	@:hlNative("flight", "flight_collide_capsule_obb_contact_manifold2d")
	public static function collideCapsuleObbContactManifold2d(a:flight._hl.CollisionCapsule2D, b:flight._hl.CollisionObb2D, out:flight._hl.CollisionContactManifold2D):Bool;
	@:hlNative("flight", "flight_collide_capsule_polygon_contact_manifold2d")
	public static function collideCapsulePolygonContactManifold2d(a:flight._hl.CollisionCapsule2D, b:flight._hl.CollisionPolygon2D, out:flight._hl.CollisionContactManifold2D):Bool;
	@:hlNative("flight", "flight_collide_circle_capsule_contact_manifold2d")
	public static function collideCircleCapsuleContactManifold2d(a:flight._hl.CollisionCircle2D, b:flight._hl.CollisionCapsule2D, out:flight._hl.CollisionContactManifold2D):Bool;
	@:hlNative("flight", "flight_collide_contact_manifold2d")
	public static function collideContactManifold2d(a:flight._hl.CollisionShape2D, b:flight._hl.CollisionShape2D, out:flight._hl.CollisionContactManifold2D):Bool;
	@:hlNative("flight", "flight_collide_contact_manifold3d")
	public static function collideContactManifold3d(registry:flight._hl.CollisionRegistry3D, a:flight._hl.CollisionShape3D, b:flight._hl.CollisionShape3D, out:flight._hl.CollisionContactManifold3D):Bool;
	@:hlNative("flight", "flight_query_collision_aabb_face3d")
	public static function queryCollisionAabbFace3d(shape:flight._hl.CollisionShape3D, dirX:Single, dirY:Single, dirZ:Single, out:hl.Bytes):Int;
	@:hlNative("flight", "flight_query_collision_box_face3d")
	public static function queryCollisionBoxFace3d(shape:flight._hl.CollisionShape3D, dirX:Single, dirY:Single, dirZ:Single, out:hl.Bytes):Int;
	@:hlNative("flight", "flight_query_collision_capsule_face3d")
	public static function queryCollisionCapsuleFace3d(shape:flight._hl.CollisionShape3D, dirX:Single, dirY:Single, dirZ:Single, out:hl.Bytes):Int;
	@:hlNative("flight", "flight_query_collision_convex_face3d")
	public static function queryCollisionConvexFace3d(shape:flight._hl.CollisionShape3D, dirX:Single, dirY:Single, dirZ:Single, out:hl.Bytes):Int;
	@:hlNative("flight", "flight_register_built_in_collision_face_queries3d")
	public static function registerBuiltInCollisionFaceQueries3d(registry:flight._hl.CollisionRegistry3D):Void;
	@:hlNative("flight", "flight_register_collision_face_query3d")
	public static function registerCollisionFaceQuery3d(registry:flight._hl.CollisionRegistry3D, kind:hl.Bytes, query:flight._hl.CollisionFaceQuery3D):Void;
	@:hlNative("flight", "flight_get_collision_polygon_validation_status2d")
	public static function getCollisionPolygonValidationStatus2d(points:hl.Bytes):Int;
	@:hlNative("flight", "flight_get_collision_shape_validation_status2d")
	public static function getCollisionShapeValidationStatus2d(shape:flight._hl.CollisionShape2D):Int;
	@:hlNative("flight", "flight_get_collision_convex_validation_status3d")
	public static function getCollisionConvexValidationStatus3d(points:hl.Bytes):Int;
	@:hlNative("flight", "flight_get_collision_shape_validation_status3d")
	public static function getCollisionShapeValidationStatus3d(shape:flight._hl.CollisionShape3D):Int;
	@:hlNative("flight", "flight_register_built_in_collision_supports2d")
	public static function registerBuiltInCollisionSupports2d(registry:flight._hl.CollisionRegistry2D):Void;
	@:hlNative("flight", "flight_register_collision_pair_test2d")
	public static function registerCollisionPairTest2d(registry:flight._hl.CollisionRegistry2D, kindA:hl.Bytes, kindB:hl.Bytes, test:flight._hl.CollisionPairTest2D):Void;
	@:hlNative("flight", "flight_register_collision_support2d")
	public static function registerCollisionSupport2d(registry:flight._hl.CollisionRegistry2D, kind:hl.Bytes, support:flight._hl.CollisionSupport2D):Void;
	@:hlNative("flight", "flight_support_collision_aabb2d")
	public static function supportCollisionAabb2d(shape:flight._hl.CollisionAabb2D, dirX:Single, dirY:Single, out:hl.Bytes):Void;
	@:hlNative("flight", "flight_support_collision_circle2d")
	public static function supportCollisionCircle2d(shape:flight._hl.CollisionCircle2D, dirX:Single, dirY:Single, out:hl.Bytes):Void;
	@:hlNative("flight", "flight_support_collision_obb2d")
	public static function supportCollisionObb2d(shape:flight._hl.CollisionObb2D, dirX:Single, dirY:Single, out:hl.Bytes):Void;
	@:hlNative("flight", "flight_support_collision_polygon2d")
	public static function supportCollisionPolygon2d(shape:flight._hl.CollisionPolygon2D, dirX:Single, dirY:Single, out:hl.Bytes):Void;
	@:hlNative("flight", "flight_write_vertex_list_support2d")
	public static function writeVertexListSupport2d(vertices:hl.Bytes, verticesLen:Int, count:Int, dirX:Single, dirY:Single, out:hl.Bytes):Void;
	@:hlNative("flight", "flight_clear_collision_pair_tests3d")
	public static function clearCollisionPairTests3d(registry:flight._hl.CollisionRegistry3D):Void;
	@:hlNative("flight", "flight_clear_collision_supports3d")
	public static function clearCollisionSupports3d(registry:flight._hl.CollisionRegistry3D):Void;
	@:hlNative("flight", "flight_register_built_in_collision_supports3d")
	public static function registerBuiltInCollisionSupports3d(registry:flight._hl.CollisionRegistry3D):Void;
	@:hlNative("flight", "flight_register_collision_pair_test3d")
	public static function registerCollisionPairTest3d(registry:flight._hl.CollisionRegistry3D, kindA:hl.Bytes, kindB:hl.Bytes, test:flight._hl.CollisionPairTest3D):Void;
	@:hlNative("flight", "flight_register_collision_support3d")
	public static function registerCollisionSupport3d(registry:flight._hl.CollisionRegistry3D, kind:hl.Bytes, support:flight._hl.CollisionSupport3D):Void;
	@:hlNative("flight", "flight_support_collision_aabb3d")
	public static function supportCollisionAabb3d(shape:flight._hl.CollisionAabb3D, dirX:Single, dirY:Single, dirZ:Single, out:hl.Bytes):Void;
	@:hlNative("flight", "flight_support_collision_box3d")
	public static function supportCollisionBox3d(shape:flight._hl.CollisionBox3D, dirX:Single, dirY:Single, dirZ:Single, out:hl.Bytes):Void;
	@:hlNative("flight", "flight_support_collision_capsule3d")
	public static function supportCollisionCapsule3d(shape:flight._hl.CollisionCapsule3D, dirX:Single, dirY:Single, dirZ:Single, out:hl.Bytes):Void;
	@:hlNative("flight", "flight_support_collision_cone3d")
	public static function supportCollisionCone3d(shape:flight._hl.CollisionCone3D, dirX:Single, dirY:Single, dirZ:Single, out:hl.Bytes):Void;
	@:hlNative("flight", "flight_support_collision_convex3d")
	public static function supportCollisionConvex3d(shape:flight._hl.CollisionConvex3D, dirX:Single, dirY:Single, dirZ:Single, out:hl.Bytes):Void;
	@:hlNative("flight", "flight_support_collision_cylinder3d")
	public static function supportCollisionCylinder3d(shape:flight._hl.CollisionCylinder3D, dirX:Single, dirY:Single, dirZ:Single, out:hl.Bytes):Void;
	@:hlNative("flight", "flight_support_collision_sphere3d")
	public static function supportCollisionSphere3d(shape:flight._hl.CollisionSphere3D, dirX:Single, dirY:Single, dirZ:Single, out:hl.Bytes):Void;
	@:hlNative("flight", "flight_write_vertex_list_support3d")
	public static function writeVertexListSupport3d(vertices:hl.Bytes, verticesLen:Int, count:Int, dirX:Single, dirY:Single, dirZ:Single, out:hl.Bytes):Void;
	@:hlNative("flight", "flight_pack_contact_feature_id")
	public static function packContactFeatureId(referenceIsA:Bool, referenceEdge:haxe.Int64, incidentEdge:haxe.Int64, secondPoint:Bool):haxe.Int64;
	@:hlNative("flight", "flight_create_collision_contact_manifold2d")
	public static function createCollisionContactManifold2d():flight._hl.CollisionContactManifold2D;
	@:hlNative("flight", "flight_clear_collision_contact_manifold2d")
	public static function clearCollisionContactManifold2d(out:flight._hl.CollisionContactManifold2D):Void;
	@:hlNative("flight", "flight_create_collision_contact_manifold3d")
	public static function createCollisionContactManifold3d():flight._hl.CollisionContactManifold3D;
	@:hlNative("flight", "flight_clear_collision_contact_manifold3d")
	public static function clearCollisionContactManifold3d(out:flight._hl.CollisionContactManifold3D):Void;
	@:hlNative("flight", "flight_write_collision_convex_hull_faces3d")
	public static function writeCollisionConvexHullFaces3d(out:hl.Bytes, points:hl.Bytes):Int;
	@:hlNative("flight", "flight_write_aabb_vertices")
	public static function writeAabbVertices(aabb:flight._hl.CollisionAabb2D, out:hl.Bytes):Void;
	@:hlNative("flight", "flight_write_obb_vertices")
	public static function writeObbVertices(obb:flight._hl.CollisionObb2D, out:hl.Bytes):Void;
	@:hlNative("flight", "flight_are_collision_guards_enabled")
	public static function areCollisionGuardsEnabled(registry2d:flight._hl.CollisionRegistry2D, registry3d:flight._hl.CollisionRegistry3D):Bool;
	@:hlNative("flight", "flight_disable_collision_guards")
	public static function disableCollisionGuards(registry2d:flight._hl.CollisionRegistry2D, registry3d:flight._hl.CollisionRegistry3D):Void;
	@:hlNative("flight", "flight_enable_collision_guards")
	public static function enableCollisionGuards(registry2d:flight._hl.CollisionRegistry2D, registry3d:flight._hl.CollisionRegistry3D, logState:hl.Bytes, clockFn:hl.Bytes, clockCtx:hl.Bytes):Void;
	@:hlNative("flight", "flight_test_collision_support2d")
	public static function testCollisionSupport2d(registry:flight._hl.CollisionRegistry2D, a:flight._hl.CollisionShape2D, b:flight._hl.CollisionShape2D, out:flight._hl.CollisionManifold2D):Bool;
	@:hlNative("flight", "flight_test_collision_support_overlap2d")
	public static function testCollisionSupportOverlap2d(registry:flight._hl.CollisionRegistry2D, a:flight._hl.CollisionShape2D, b:flight._hl.CollisionShape2D):Bool;
	@:hlNative("flight", "flight_test_collision_support3d")
	public static function testCollisionSupport3d(registry:flight._hl.CollisionRegistry3D, a:flight._hl.CollisionShape3D, b:flight._hl.CollisionShape3D, out:flight._hl.CollisionManifold3D):Bool;
	@:hlNative("flight", "flight_test_collision_support_overlap3d")
	public static function testCollisionSupportOverlap3d(registry:flight._hl.CollisionRegistry3D, a:flight._hl.CollisionShape3D, b:flight._hl.CollisionShape3D):Bool;
	@:hlNative("flight", "flight_create_collision_distance3d")
	public static function createCollisionDistance3d():flight._hl.CollisionDistance3D;
	@:hlNative("flight", "flight_write_collision_distance3d")
	public static function writeCollisionDistance3d(out:flight._hl.CollisionDistance3D, registry:flight._hl.CollisionRegistry3D, a:flight._hl.CollisionShape3D, b:flight._hl.CollisionShape3D, offsetX:Single, offsetY:Single, offsetZ:Single):Bool;
	@:hlNative("flight", "flight_create_collision_manifold2d")
	public static function createCollisionManifold2d():flight._hl.CollisionManifold2D;
	@:hlNative("flight", "flight_clear_collision_manifold2d")
	public static function clearCollisionManifold2d(out:flight._hl.CollisionManifold2D):Void;
	@:hlNative("flight", "flight_create_collision_manifold3d")
	public static function createCollisionManifold3d():flight._hl.CollisionManifold3D;
	@:hlNative("flight", "flight_clear_collision_manifold3d")
	public static function clearCollisionManifold3d(out:flight._hl.CollisionManifold3D):Void;
	@:hlNative("flight", "flight_get_collision_shape_contains_point2d")
	public static function getCollisionShapeContainsPoint2d(shape:flight._hl.CollisionShape2D, x:Single, y:Single):Bool;
	@:hlNative("flight", "flight_get_collision_shape_contains_point3d")
	public static function getCollisionShapeContainsPoint3d(shape:flight._hl.CollisionShape3D, x:Single, y:Single, z:Single):Bool;
	@:hlNative("flight", "flight_create_collision_raycast_hit2d")
	public static function createCollisionRaycastHit2d():flight._hl.CollisionRaycastHit2D;
	@:hlNative("flight", "flight_raycast_collision_shape2d")
	public static function raycastCollisionShape2d(out:flight._hl.CollisionRaycastHit2D, shape:flight._hl.CollisionShape2D, originX:Float, originY:Float, directionX:Float, directionY:Float, maxFraction:Float):Bool;
	@:hlNative("flight", "flight_create_collision_raycast_hit3d")
	public static function createCollisionRaycastHit3d():flight._hl.CollisionRaycastHit3D;
	@:hlNative("flight", "flight_raycast_collision_shape3d")
	public static function raycastCollisionShape3d(out:flight._hl.CollisionRaycastHit3D, shape:flight._hl.CollisionShape3D, originX:Single, originY:Single, originZ:Single, directionX:Single, directionY:Single, directionZ:Single, maxFraction:Single):Bool;
	@:hlNative("flight", "flight_test_segment_aabb_collision2d")
	public static function testSegmentAabbCollision2d(a:flight._hl.CollisionSegment2D, b:flight._hl.CollisionAabb2D):Bool;
	@:hlNative("flight", "flight_test_segment_capsule_collision2d")
	public static function testSegmentCapsuleCollision2d(a:flight._hl.CollisionSegment2D, b:flight._hl.CollisionCapsule2D):Bool;
	@:hlNative("flight", "flight_test_segment_circle_collision2d")
	public static function testSegmentCircleCollision2d(a:flight._hl.CollisionSegment2D, b:flight._hl.CollisionCircle2D):Bool;
	@:hlNative("flight", "flight_test_segment_obb_collision2d")
	public static function testSegmentObbCollision2d(a:flight._hl.CollisionSegment2D, b:flight._hl.CollisionObb2D):Bool;
	@:hlNative("flight", "flight_test_segment_polygon_collision2d")
	public static function testSegmentPolygonCollision2d(a:flight._hl.CollisionSegment2D, b:flight._hl.CollisionPolygon2D):Bool;
	@:hlNative("flight", "flight_test_segment_segment_collision2d")
	public static function testSegmentSegmentCollision2d(a:flight._hl.CollisionSegment2D, b:flight._hl.CollisionSegment2D):Bool;
	@:hlNative("flight", "flight_test_aabb_aabb_collision2d")
	public static function testAabbAabbCollision2d(a:flight._hl.CollisionAabb2D, b:flight._hl.CollisionAabb2D, out:flight._hl.CollisionManifold2D):Bool;
	@:hlNative("flight", "flight_test_aabb_obb_collision2d")
	public static function testAabbObbCollision2d(a:flight._hl.CollisionAabb2D, b:flight._hl.CollisionObb2D, out:flight._hl.CollisionManifold2D):Bool;
	@:hlNative("flight", "flight_test_aabb_polygon_collision2d")
	public static function testAabbPolygonCollision2d(a:flight._hl.CollisionAabb2D, b:flight._hl.CollisionPolygon2D, out:flight._hl.CollisionManifold2D):Bool;
	@:hlNative("flight", "flight_test_circle_aabb_collision2d")
	public static function testCircleAabbCollision2d(a:flight._hl.CollisionCircle2D, b:flight._hl.CollisionAabb2D, out:flight._hl.CollisionManifold2D):Bool;
	@:hlNative("flight", "flight_test_circle_circle_collision2d")
	public static function testCircleCircleCollision2d(a:flight._hl.CollisionCircle2D, b:flight._hl.CollisionCircle2D, out:flight._hl.CollisionManifold2D):Bool;
	@:hlNative("flight", "flight_test_circle_obb_collision2d")
	public static function testCircleObbCollision2d(a:flight._hl.CollisionCircle2D, b:flight._hl.CollisionObb2D, out:flight._hl.CollisionManifold2D):Bool;
	@:hlNative("flight", "flight_test_circle_polygon_collision2d")
	public static function testCirclePolygonCollision2d(a:flight._hl.CollisionCircle2D, b:flight._hl.CollisionPolygon2D, out:flight._hl.CollisionManifold2D):Bool;
	@:hlNative("flight", "flight_test_obb_obb_collision2d")
	public static function testObbObbCollision2d(a:flight._hl.CollisionObb2D, b:flight._hl.CollisionObb2D, out:flight._hl.CollisionManifold2D):Bool;
	@:hlNative("flight", "flight_test_obb_polygon_collision2d")
	public static function testObbPolygonCollision2d(a:flight._hl.CollisionObb2D, b:flight._hl.CollisionPolygon2D, out:flight._hl.CollisionManifold2D):Bool;
	@:hlNative("flight", "flight_test_polygon_polygon_collision2d")
	public static function testPolygonPolygonCollision2d(a:flight._hl.CollisionPolygon2D, b:flight._hl.CollisionPolygon2D, out:flight._hl.CollisionManifold2D):Bool;
	@:hlNative("flight", "flight_test_aabb_aabb_collision3d")
	public static function testAabbAabbCollision3d(a:flight._hl.CollisionAabb3D, b:flight._hl.CollisionAabb3D, out:flight._hl.CollisionManifold3D):Bool;
	@:hlNative("flight", "flight_test_box_box_collision3d")
	public static function testBoxBoxCollision3d(a:flight._hl.CollisionBox3D, b:flight._hl.CollisionBox3D, out:flight._hl.CollisionManifold3D):Bool;
	@:hlNative("flight", "flight_test_capsule_capsule_collision3d")
	public static function testCapsuleCapsuleCollision3d(a:flight._hl.CollisionCapsule3D, b:flight._hl.CollisionCapsule3D, out:flight._hl.CollisionManifold3D):Bool;
	@:hlNative("flight", "flight_test_sphere_aabb_collision3d")
	public static function testSphereAabbCollision3d(a:flight._hl.CollisionSphere3D, b:flight._hl.CollisionAabb3D, out:flight._hl.CollisionManifold3D):Bool;
	@:hlNative("flight", "flight_test_sphere_box_collision3d")
	public static function testSphereBoxCollision3d(a:flight._hl.CollisionSphere3D, b:flight._hl.CollisionBox3D, out:flight._hl.CollisionManifold3D):Bool;
	@:hlNative("flight", "flight_test_sphere_capsule_collision3d")
	public static function testSphereCapsuleCollision3d(a:flight._hl.CollisionSphere3D, b:flight._hl.CollisionCapsule3D, out:flight._hl.CollisionManifold3D):Bool;
	@:hlNative("flight", "flight_test_sphere_sphere_collision3d")
	public static function testSphereSphereCollision3d(a:flight._hl.CollisionSphere3D, b:flight._hl.CollisionSphere3D, out:flight._hl.CollisionManifold3D):Bool;
	@:hlNative("flight", "flight_collide_aabb_aabb_contact_manifold2d")
	public static function collideAabbAabbContactManifold2d(a:flight._hl.CollisionAabb2D, b:flight._hl.CollisionAabb2D, out:flight._hl.CollisionContactManifold2D):Bool;
	@:hlNative("flight", "flight_collide_aabb_obb_contact_manifold2d")
	public static function collideAabbObbContactManifold2d(a:flight._hl.CollisionAabb2D, b:flight._hl.CollisionObb2D, out:flight._hl.CollisionContactManifold2D):Bool;
	@:hlNative("flight", "flight_collide_aabb_polygon_contact_manifold2d")
	public static function collideAabbPolygonContactManifold2d(a:flight._hl.CollisionAabb2D, b:flight._hl.CollisionPolygon2D, out:flight._hl.CollisionContactManifold2D):Bool;
	@:hlNative("flight", "flight_collide_circle_aabb_contact_manifold2d")
	public static function collideCircleAabbContactManifold2d(a:flight._hl.CollisionCircle2D, b:flight._hl.CollisionAabb2D, out:flight._hl.CollisionContactManifold2D):Bool;
	@:hlNative("flight", "flight_collide_circle_circle_contact_manifold2d")
	public static function collideCircleCircleContactManifold2d(a:flight._hl.CollisionCircle2D, b:flight._hl.CollisionCircle2D, out:flight._hl.CollisionContactManifold2D):Bool;
	@:hlNative("flight", "flight_collide_circle_obb_contact_manifold2d")
	public static function collideCircleObbContactManifold2d(a:flight._hl.CollisionCircle2D, b:flight._hl.CollisionObb2D, out:flight._hl.CollisionContactManifold2D):Bool;
	@:hlNative("flight", "flight_collide_circle_polygon_contact_manifold2d")
	public static function collideCirclePolygonContactManifold2d(a:flight._hl.CollisionCircle2D, b:flight._hl.CollisionPolygon2D, out:flight._hl.CollisionContactManifold2D):Bool;
	@:hlNative("flight", "flight_collide_obb_obb_contact_manifold2d")
	public static function collideObbObbContactManifold2d(a:flight._hl.CollisionObb2D, b:flight._hl.CollisionObb2D, out:flight._hl.CollisionContactManifold2D):Bool;
	@:hlNative("flight", "flight_collide_obb_polygon_contact_manifold2d")
	public static function collideObbPolygonContactManifold2d(a:flight._hl.CollisionObb2D, b:flight._hl.CollisionPolygon2D, out:flight._hl.CollisionContactManifold2D):Bool;
	@:hlNative("flight", "flight_collide_polygon_polygon_contact_manifold2d")
	public static function collidePolygonPolygonContactManifold2d(a:flight._hl.CollisionPolygon2D, b:flight._hl.CollisionPolygon2D, out:flight._hl.CollisionContactManifold2D):Bool;
	@:hlNative("flight", "flight_create_collision_time_of_impact2d")
	public static function createCollisionTimeOfImpact2d():flight._hl.CollisionTimeOfImpact2D;
	@:hlNative("flight", "flight_sweep_collision_shape2d")
	public static function sweepCollisionShape2d(out:flight._hl.CollisionTimeOfImpact2D, registry:flight._hl.CollisionRegistry2D, shapeA:flight._hl.CollisionShape2D, translationAx:Single, translationAy:Single, shapeB:flight._hl.CollisionShape2D, translationBx:Single, translationBy:Single, maxFraction:Single):Bool;
	@:hlNative("flight", "flight_create_collision_time_of_impact3d")
	public static function createCollisionTimeOfImpact3d():flight._hl.CollisionTimeOfImpact3D;
	@:hlNative("flight", "flight_sweep_collision_shape3d")
	public static function sweepCollisionShape3d(out:flight._hl.CollisionTimeOfImpact3D, registry:flight._hl.CollisionRegistry3D, shapeA:flight._hl.CollisionShape3D, translationAx:Single, translationAy:Single, translationAz:Single, shapeB:flight._hl.CollisionShape3D, translationBx:Single, translationBy:Single, translationBz:Single, maxFraction:Single):Bool;
	@:hlNative("flight", "flight_create_collision_heightfield3d")
	public static function createCollisionHeightfield3d():flight._hl.CollisionHeightfield3D;
	@:hlNative("flight", "flight_create_collision_triangle_mesh3d")
	public static function createCollisionTriangleMesh3d():flight._hl.CollisionTriangleMesh3D;
	@:hlNative("flight", "flight_clone_collision_collider_shape3d")
	public static function cloneCollisionColliderShape3d(shape:flight._hl.CollisionColliderShape3D):flight._hl.CollisionColliderShape3D;
	@:hlNative("flight", "flight_collide_collision_heightfield3d")
	public static function collideCollisionHeightfield3d(out:flight._hl.CollisionContactManifold3D, registry:flight._hl.CollisionRegistry3D, convex:flight._hl.CollisionShape3D, heightfield:flight._hl.CollisionHeightfield3D):Bool;
	@:hlNative("flight", "flight_collide_collision_triangle_mesh3d")
	public static function collideCollisionTriangleMesh3d(out:flight._hl.CollisionContactManifold3D, registry:flight._hl.CollisionRegistry3D, convex:flight._hl.CollisionShape3D, mesh:flight._hl.CollisionTriangleMesh3D):Bool;
	@:hlNative("flight", "flight_get_collision_heightfield_validation_status3d")
	public static function getCollisionHeightfieldValidationStatus3d(heightfield:flight._hl.CollisionHeightfield3D):Int;
	@:hlNative("flight", "flight_get_collision_triangle_mesh_validation_status3d")
	public static function getCollisionTriangleMeshValidationStatus3d(mesh:flight._hl.CollisionTriangleMesh3D):Int;
	@:hlNative("flight", "flight_invalidate_collision_heightfield3d")
	public static function invalidateCollisionHeightfield3d(heightfield:flight._hl.CollisionHeightfield3D):Void;
	@:hlNative("flight", "flight_invalidate_collision_triangle_mesh3d")
	public static function invalidateCollisionTriangleMesh3d(mesh:flight._hl.CollisionTriangleMesh3D):Void;
	@:hlNative("flight", "flight_raycast_collision_heightfield3d")
	public static function raycastCollisionHeightfield3d(out:flight._hl.CollisionRaycastHit3D, heightfield:flight._hl.CollisionHeightfield3D, originX:Single, originY:Single, originZ:Single, directionX:Single, directionY:Single, directionZ:Single, maxFraction:Single):Bool;
	@:hlNative("flight", "flight_raycast_collision_triangle_mesh3d")
	public static function raycastCollisionTriangleMesh3d(out:flight._hl.CollisionRaycastHit3D, mesh:flight._hl.CollisionTriangleMesh3D, originX:Single, originY:Single, originZ:Single, directionX:Single, directionY:Single, directionZ:Single, maxFraction:Single):Bool;
	@:hlNative("flight", "flight_sweep_collision_heightfield3d")
	public static function sweepCollisionHeightfield3d(out:flight._hl.CollisionTimeOfImpact3D, registry:flight._hl.CollisionRegistry3D, convex:flight._hl.CollisionShape3D, deltaX:Single, deltaY:Single, deltaZ:Single, heightfield:flight._hl.CollisionHeightfield3D, maxFraction:Single):Bool;
	@:hlNative("flight", "flight_sweep_collision_triangle_mesh3d")
	public static function sweepCollisionTriangleMesh3d(out:flight._hl.CollisionTimeOfImpact3D, registry:flight._hl.CollisionRegistry3D, convex:flight._hl.CollisionShape3D, deltaX:Single, deltaY:Single, deltaZ:Single, mesh:flight._hl.CollisionTriangleMesh3D, maxFraction:Single):Bool;
	@:hlNative("flight", "flight_write_collision_heightfield_bounds3d")
	public static function writeCollisionHeightfieldBounds3d(heightfield:flight._hl.CollisionHeightfield3D, out:flight._hl.CollisionAabb3D):Void;
	@:hlNative("flight", "flight_write_collision_triangle_mesh_bounds3d")
	public static function writeCollisionTriangleMeshBounds3d(mesh:flight._hl.CollisionTriangleMesh3D, out:flight._hl.CollisionAabb3D):Void;
	@:hlNative("flight", "flight_free_collision_contact_manifold2_d")
	public static function freeCollisionContactManifold2D(ptr:flight._hl.CollisionContactManifold2D):Void;
	@:hlNative("flight", "flight_free_collision_contact_manifold3_d")
	public static function freeCollisionContactManifold3D(ptr:flight._hl.CollisionContactManifold3D):Void;
	@:hlNative("flight", "flight_free_collision_distance3_d")
	public static function freeCollisionDistance3D(ptr:flight._hl.CollisionDistance3D):Void;
	@:hlNative("flight", "flight_free_collision_manifold2_d")
	public static function freeCollisionManifold2D(ptr:flight._hl.CollisionManifold2D):Void;
	@:hlNative("flight", "flight_free_collision_manifold3_d")
	public static function freeCollisionManifold3D(ptr:flight._hl.CollisionManifold3D):Void;
	@:hlNative("flight", "flight_free_collision_raycast_hit2_d")
	public static function freeCollisionRaycastHit2D(ptr:flight._hl.CollisionRaycastHit2D):Void;
	@:hlNative("flight", "flight_free_collision_raycast_hit3_d")
	public static function freeCollisionRaycastHit3D(ptr:flight._hl.CollisionRaycastHit3D):Void;
	@:hlNative("flight", "flight_free_collision_time_of_impact2_d")
	public static function freeCollisionTimeOfImpact2D(ptr:flight._hl.CollisionTimeOfImpact2D):Void;
	@:hlNative("flight", "flight_free_collision_time_of_impact3_d")
	public static function freeCollisionTimeOfImpact3D(ptr:flight._hl.CollisionTimeOfImpact3D):Void;
	@:hlNative("flight", "flight_free_collision_heightfield3_d")
	public static function freeCollisionHeightfield3D(ptr:flight._hl.CollisionHeightfield3D):Void;
	@:hlNative("flight", "flight_free_collision_triangle_mesh3_d")
	public static function freeCollisionTriangleMesh3D(ptr:flight._hl.CollisionTriangleMesh3D):Void;
	@:hlNative("flight", "flight_free_collision_collider_shape3_d")
	public static function freeCollisionColliderShape3D(ptr:flight._hl.CollisionColliderShape3D):Void;
}
