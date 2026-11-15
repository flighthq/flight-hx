package flight._cpp._fn;

extern class Collision {
	@:native("flight_collide_capsule_aabb_contact_manifold2d")
	public static function collideCapsuleAabbContactManifold2d(a:flight._cpp.CollisionCapsule2D, b:flight._cpp.CollisionAabb2D, out:flight._cpp.CollisionContactManifold2D):Bool;
	@:native("flight_collide_capsule_capsule_contact_manifold2d")
	public static function collideCapsuleCapsuleContactManifold2d(a:flight._cpp.CollisionCapsule2D, b:flight._cpp.CollisionCapsule2D, out:flight._cpp.CollisionContactManifold2D):Bool;
	@:native("flight_collide_capsule_obb_contact_manifold2d")
	public static function collideCapsuleObbContactManifold2d(a:flight._cpp.CollisionCapsule2D, b:flight._cpp.CollisionObb2D, out:flight._cpp.CollisionContactManifold2D):Bool;
	@:native("flight_collide_capsule_polygon_contact_manifold2d")
	public static function collideCapsulePolygonContactManifold2d(a:flight._cpp.CollisionCapsule2D, b:flight._cpp.CollisionPolygon2D, out:flight._cpp.CollisionContactManifold2D):Bool;
	@:native("flight_collide_circle_capsule_contact_manifold2d")
	public static function collideCircleCapsuleContactManifold2d(a:flight._cpp.CollisionCircle2D, b:flight._cpp.CollisionCapsule2D, out:flight._cpp.CollisionContactManifold2D):Bool;
	@:native("flight_collide_contact_manifold2d")
	public static function collideContactManifold2d(a:flight._cpp.CollisionShape2D, b:flight._cpp.CollisionShape2D, out:flight._cpp.CollisionContactManifold2D):Bool;
	@:native("flight_collide_contact_manifold3d")
	public static function collideContactManifold3d(registry:flight._cpp.CollisionRegistry3D, a:flight._cpp.CollisionShape3D, b:flight._cpp.CollisionShape3D, out:flight._cpp.CollisionContactManifold3D):Bool;
	@:native("flight_query_collision_aabb_face3d")
	public static function queryCollisionAabbFace3d(shape:flight._cpp.CollisionShape3D, dirX:Single, dirY:Single, dirZ:Single, out:cpp.Star<cpp.Void>):Int;
	@:native("flight_query_collision_box_face3d")
	public static function queryCollisionBoxFace3d(shape:flight._cpp.CollisionShape3D, dirX:Single, dirY:Single, dirZ:Single, out:cpp.Star<cpp.Void>):Int;
	@:native("flight_query_collision_capsule_face3d")
	public static function queryCollisionCapsuleFace3d(shape:flight._cpp.CollisionShape3D, dirX:Single, dirY:Single, dirZ:Single, out:cpp.Star<cpp.Void>):Int;
	@:native("flight_query_collision_convex_face3d")
	public static function queryCollisionConvexFace3d(shape:flight._cpp.CollisionShape3D, dirX:Single, dirY:Single, dirZ:Single, out:cpp.Star<cpp.Void>):Int;
	@:native("flight_register_built_in_collision_face_queries3d")
	public static function registerBuiltInCollisionFaceQueries3d(registry:flight._cpp.CollisionRegistry3D):Void;
	@:native("flight_register_collision_face_query3d")
	public static function registerCollisionFaceQuery3d(registry:flight._cpp.CollisionRegistry3D, kind:cpp.ConstCharStar, query:flight._cpp.CollisionFaceQuery3D):Void;
	@:native("flight_get_collision_polygon_validation_status2d")
	public static function getCollisionPolygonValidationStatus2d(points:cpp.Star<cpp.Void>):Int;
	@:native("flight_get_collision_shape_validation_status2d")
	public static function getCollisionShapeValidationStatus2d(shape:flight._cpp.CollisionShape2D):Int;
	@:native("flight_get_collision_convex_validation_status3d")
	public static function getCollisionConvexValidationStatus3d(points:cpp.Star<cpp.Void>):Int;
	@:native("flight_get_collision_shape_validation_status3d")
	public static function getCollisionShapeValidationStatus3d(shape:flight._cpp.CollisionShape3D):Int;
	@:native("flight_register_built_in_collision_supports2d")
	public static function registerBuiltInCollisionSupports2d(registry:flight._cpp.CollisionRegistry2D):Void;
	@:native("flight_register_collision_pair_test2d")
	public static function registerCollisionPairTest2d(registry:flight._cpp.CollisionRegistry2D, kindA:cpp.ConstCharStar, kindB:cpp.ConstCharStar, test:flight._cpp.CollisionPairTest2D):Void;
	@:native("flight_register_collision_support2d")
	public static function registerCollisionSupport2d(registry:flight._cpp.CollisionRegistry2D, kind:cpp.ConstCharStar, support:flight._cpp.CollisionSupport2D):Void;
	@:native("flight_support_collision_aabb2d")
	public static function supportCollisionAabb2d(shape:flight._cpp.CollisionAabb2D, dirX:Single, dirY:Single, out:cpp.Star<cpp.Void>):Void;
	@:native("flight_support_collision_circle2d")
	public static function supportCollisionCircle2d(shape:flight._cpp.CollisionCircle2D, dirX:Single, dirY:Single, out:cpp.Star<cpp.Void>):Void;
	@:native("flight_support_collision_obb2d")
	public static function supportCollisionObb2d(shape:flight._cpp.CollisionObb2D, dirX:Single, dirY:Single, out:cpp.Star<cpp.Void>):Void;
	@:native("flight_support_collision_polygon2d")
	public static function supportCollisionPolygon2d(shape:flight._cpp.CollisionPolygon2D, dirX:Single, dirY:Single, out:cpp.Star<cpp.Void>):Void;
	@:native("flight_write_vertex_list_support2d")
	public static function writeVertexListSupport2d(vertices:cpp.Star<cpp.Void>, verticesLen:Int, count:Int, dirX:Single, dirY:Single, out:cpp.Star<cpp.Void>):Void;
	@:native("flight_clear_collision_pair_tests3d")
	public static function clearCollisionPairTests3d(registry:flight._cpp.CollisionRegistry3D):Void;
	@:native("flight_clear_collision_supports3d")
	public static function clearCollisionSupports3d(registry:flight._cpp.CollisionRegistry3D):Void;
	@:native("flight_register_built_in_collision_supports3d")
	public static function registerBuiltInCollisionSupports3d(registry:flight._cpp.CollisionRegistry3D):Void;
	@:native("flight_register_collision_pair_test3d")
	public static function registerCollisionPairTest3d(registry:flight._cpp.CollisionRegistry3D, kindA:cpp.ConstCharStar, kindB:cpp.ConstCharStar, test:flight._cpp.CollisionPairTest3D):Void;
	@:native("flight_register_collision_support3d")
	public static function registerCollisionSupport3d(registry:flight._cpp.CollisionRegistry3D, kind:cpp.ConstCharStar, support:flight._cpp.CollisionSupport3D):Void;
	@:native("flight_support_collision_aabb3d")
	public static function supportCollisionAabb3d(shape:flight._cpp.CollisionAabb3D, dirX:Single, dirY:Single, dirZ:Single, out:cpp.Star<cpp.Void>):Void;
	@:native("flight_support_collision_box3d")
	public static function supportCollisionBox3d(shape:flight._cpp.CollisionBox3D, dirX:Single, dirY:Single, dirZ:Single, out:cpp.Star<cpp.Void>):Void;
	@:native("flight_support_collision_capsule3d")
	public static function supportCollisionCapsule3d(shape:flight._cpp.CollisionCapsule3D, dirX:Single, dirY:Single, dirZ:Single, out:cpp.Star<cpp.Void>):Void;
	@:native("flight_support_collision_cone3d")
	public static function supportCollisionCone3d(shape:flight._cpp.CollisionCone3D, dirX:Single, dirY:Single, dirZ:Single, out:cpp.Star<cpp.Void>):Void;
	@:native("flight_support_collision_convex3d")
	public static function supportCollisionConvex3d(shape:flight._cpp.CollisionConvex3D, dirX:Single, dirY:Single, dirZ:Single, out:cpp.Star<cpp.Void>):Void;
	@:native("flight_support_collision_cylinder3d")
	public static function supportCollisionCylinder3d(shape:flight._cpp.CollisionCylinder3D, dirX:Single, dirY:Single, dirZ:Single, out:cpp.Star<cpp.Void>):Void;
	@:native("flight_support_collision_sphere3d")
	public static function supportCollisionSphere3d(shape:flight._cpp.CollisionSphere3D, dirX:Single, dirY:Single, dirZ:Single, out:cpp.Star<cpp.Void>):Void;
	@:native("flight_write_vertex_list_support3d")
	public static function writeVertexListSupport3d(vertices:cpp.Star<cpp.Void>, verticesLen:Int, count:Int, dirX:Single, dirY:Single, dirZ:Single, out:cpp.Star<cpp.Void>):Void;
	@:native("flight_pack_contact_feature_id")
	public static function packContactFeatureId(referenceIsA:Bool, referenceEdge:haxe.Int64, incidentEdge:haxe.Int64, secondPoint:Bool):haxe.Int64;
	@:native("flight_create_collision_contact_manifold2d")
	public static function createCollisionContactManifold2d():flight._cpp.CollisionContactManifold2D;
	@:native("flight_clear_collision_contact_manifold2d")
	public static function clearCollisionContactManifold2d(out:flight._cpp.CollisionContactManifold2D):Void;
	@:native("flight_create_collision_contact_manifold3d")
	public static function createCollisionContactManifold3d():flight._cpp.CollisionContactManifold3D;
	@:native("flight_clear_collision_contact_manifold3d")
	public static function clearCollisionContactManifold3d(out:flight._cpp.CollisionContactManifold3D):Void;
	@:native("flight_write_collision_convex_hull_faces3d")
	public static function writeCollisionConvexHullFaces3d(out:cpp.Star<cpp.Void>, points:cpp.Star<cpp.Void>):Int;
	@:native("flight_write_aabb_vertices")
	public static function writeAabbVertices(aabb:flight._cpp.CollisionAabb2D, out:cpp.Star<cpp.Void>):Void;
	@:native("flight_write_obb_vertices")
	public static function writeObbVertices(obb:flight._cpp.CollisionObb2D, out:cpp.Star<cpp.Void>):Void;
	@:native("flight_are_collision_guards_enabled")
	public static function areCollisionGuardsEnabled(registry2d:flight._cpp.CollisionRegistry2D, registry3d:flight._cpp.CollisionRegistry3D):Bool;
	@:native("flight_disable_collision_guards")
	public static function disableCollisionGuards(registry2d:flight._cpp.CollisionRegistry2D, registry3d:flight._cpp.CollisionRegistry3D):Void;
	@:native("flight_enable_collision_guards")
	public static function enableCollisionGuards(registry2d:flight._cpp.CollisionRegistry2D, registry3d:flight._cpp.CollisionRegistry3D, logState:cpp.Star<cpp.Void>, clockFn:cpp.Star<cpp.Void>, clockCtx:cpp.Star<cpp.Void>):Void;
	@:native("flight_test_collision_support2d")
	public static function testCollisionSupport2d(registry:flight._cpp.CollisionRegistry2D, a:flight._cpp.CollisionShape2D, b:flight._cpp.CollisionShape2D, out:flight._cpp.CollisionManifold2D):Bool;
	@:native("flight_test_collision_support_overlap2d")
	public static function testCollisionSupportOverlap2d(registry:flight._cpp.CollisionRegistry2D, a:flight._cpp.CollisionShape2D, b:flight._cpp.CollisionShape2D):Bool;
	@:native("flight_test_collision_support3d")
	public static function testCollisionSupport3d(registry:flight._cpp.CollisionRegistry3D, a:flight._cpp.CollisionShape3D, b:flight._cpp.CollisionShape3D, out:flight._cpp.CollisionManifold3D):Bool;
	@:native("flight_test_collision_support_overlap3d")
	public static function testCollisionSupportOverlap3d(registry:flight._cpp.CollisionRegistry3D, a:flight._cpp.CollisionShape3D, b:flight._cpp.CollisionShape3D):Bool;
	@:native("flight_create_collision_distance3d")
	public static function createCollisionDistance3d():flight._cpp.CollisionDistance3D;
	@:native("flight_write_collision_distance3d")
	public static function writeCollisionDistance3d(out:flight._cpp.CollisionDistance3D, registry:flight._cpp.CollisionRegistry3D, a:flight._cpp.CollisionShape3D, b:flight._cpp.CollisionShape3D, offsetX:Single, offsetY:Single, offsetZ:Single):Bool;
	@:native("flight_create_collision_manifold2d")
	public static function createCollisionManifold2d():flight._cpp.CollisionManifold2D;
	@:native("flight_clear_collision_manifold2d")
	public static function clearCollisionManifold2d(out:flight._cpp.CollisionManifold2D):Void;
	@:native("flight_create_collision_manifold3d")
	public static function createCollisionManifold3d():flight._cpp.CollisionManifold3D;
	@:native("flight_clear_collision_manifold3d")
	public static function clearCollisionManifold3d(out:flight._cpp.CollisionManifold3D):Void;
	@:native("flight_get_collision_shape_contains_point2d")
	public static function getCollisionShapeContainsPoint2d(shape:flight._cpp.CollisionShape2D, x:Single, y:Single):Bool;
	@:native("flight_get_collision_shape_contains_point3d")
	public static function getCollisionShapeContainsPoint3d(shape:flight._cpp.CollisionShape3D, x:Single, y:Single, z:Single):Bool;
	@:native("flight_create_collision_raycast_hit2d")
	public static function createCollisionRaycastHit2d():flight._cpp.CollisionRaycastHit2D;
	@:native("flight_raycast_collision_shape2d")
	public static function raycastCollisionShape2d(out:flight._cpp.CollisionRaycastHit2D, shape:flight._cpp.CollisionShape2D, originX:Float, originY:Float, directionX:Float, directionY:Float, maxFraction:Float):Bool;
	@:native("flight_create_collision_raycast_hit3d")
	public static function createCollisionRaycastHit3d():flight._cpp.CollisionRaycastHit3D;
	@:native("flight_raycast_collision_shape3d")
	public static function raycastCollisionShape3d(out:flight._cpp.CollisionRaycastHit3D, shape:flight._cpp.CollisionShape3D, originX:Single, originY:Single, originZ:Single, directionX:Single, directionY:Single, directionZ:Single, maxFraction:Single):Bool;
	@:native("flight_test_segment_aabb_collision2d")
	public static function testSegmentAabbCollision2d(a:flight._cpp.CollisionSegment2D, b:flight._cpp.CollisionAabb2D):Bool;
	@:native("flight_test_segment_capsule_collision2d")
	public static function testSegmentCapsuleCollision2d(a:flight._cpp.CollisionSegment2D, b:flight._cpp.CollisionCapsule2D):Bool;
	@:native("flight_test_segment_circle_collision2d")
	public static function testSegmentCircleCollision2d(a:flight._cpp.CollisionSegment2D, b:flight._cpp.CollisionCircle2D):Bool;
	@:native("flight_test_segment_obb_collision2d")
	public static function testSegmentObbCollision2d(a:flight._cpp.CollisionSegment2D, b:flight._cpp.CollisionObb2D):Bool;
	@:native("flight_test_segment_polygon_collision2d")
	public static function testSegmentPolygonCollision2d(a:flight._cpp.CollisionSegment2D, b:flight._cpp.CollisionPolygon2D):Bool;
	@:native("flight_test_segment_segment_collision2d")
	public static function testSegmentSegmentCollision2d(a:flight._cpp.CollisionSegment2D, b:flight._cpp.CollisionSegment2D):Bool;
	@:native("flight_test_aabb_aabb_collision2d")
	public static function testAabbAabbCollision2d(a:flight._cpp.CollisionAabb2D, b:flight._cpp.CollisionAabb2D, out:flight._cpp.CollisionManifold2D):Bool;
	@:native("flight_test_aabb_obb_collision2d")
	public static function testAabbObbCollision2d(a:flight._cpp.CollisionAabb2D, b:flight._cpp.CollisionObb2D, out:flight._cpp.CollisionManifold2D):Bool;
	@:native("flight_test_aabb_polygon_collision2d")
	public static function testAabbPolygonCollision2d(a:flight._cpp.CollisionAabb2D, b:flight._cpp.CollisionPolygon2D, out:flight._cpp.CollisionManifold2D):Bool;
	@:native("flight_test_circle_aabb_collision2d")
	public static function testCircleAabbCollision2d(a:flight._cpp.CollisionCircle2D, b:flight._cpp.CollisionAabb2D, out:flight._cpp.CollisionManifold2D):Bool;
	@:native("flight_test_circle_circle_collision2d")
	public static function testCircleCircleCollision2d(a:flight._cpp.CollisionCircle2D, b:flight._cpp.CollisionCircle2D, out:flight._cpp.CollisionManifold2D):Bool;
	@:native("flight_test_circle_obb_collision2d")
	public static function testCircleObbCollision2d(a:flight._cpp.CollisionCircle2D, b:flight._cpp.CollisionObb2D, out:flight._cpp.CollisionManifold2D):Bool;
	@:native("flight_test_circle_polygon_collision2d")
	public static function testCirclePolygonCollision2d(a:flight._cpp.CollisionCircle2D, b:flight._cpp.CollisionPolygon2D, out:flight._cpp.CollisionManifold2D):Bool;
	@:native("flight_test_obb_obb_collision2d")
	public static function testObbObbCollision2d(a:flight._cpp.CollisionObb2D, b:flight._cpp.CollisionObb2D, out:flight._cpp.CollisionManifold2D):Bool;
	@:native("flight_test_obb_polygon_collision2d")
	public static function testObbPolygonCollision2d(a:flight._cpp.CollisionObb2D, b:flight._cpp.CollisionPolygon2D, out:flight._cpp.CollisionManifold2D):Bool;
	@:native("flight_test_polygon_polygon_collision2d")
	public static function testPolygonPolygonCollision2d(a:flight._cpp.CollisionPolygon2D, b:flight._cpp.CollisionPolygon2D, out:flight._cpp.CollisionManifold2D):Bool;
	@:native("flight_test_aabb_aabb_collision3d")
	public static function testAabbAabbCollision3d(a:flight._cpp.CollisionAabb3D, b:flight._cpp.CollisionAabb3D, out:flight._cpp.CollisionManifold3D):Bool;
	@:native("flight_test_box_box_collision3d")
	public static function testBoxBoxCollision3d(a:flight._cpp.CollisionBox3D, b:flight._cpp.CollisionBox3D, out:flight._cpp.CollisionManifold3D):Bool;
	@:native("flight_test_capsule_capsule_collision3d")
	public static function testCapsuleCapsuleCollision3d(a:flight._cpp.CollisionCapsule3D, b:flight._cpp.CollisionCapsule3D, out:flight._cpp.CollisionManifold3D):Bool;
	@:native("flight_test_sphere_aabb_collision3d")
	public static function testSphereAabbCollision3d(a:flight._cpp.CollisionSphere3D, b:flight._cpp.CollisionAabb3D, out:flight._cpp.CollisionManifold3D):Bool;
	@:native("flight_test_sphere_box_collision3d")
	public static function testSphereBoxCollision3d(a:flight._cpp.CollisionSphere3D, b:flight._cpp.CollisionBox3D, out:flight._cpp.CollisionManifold3D):Bool;
	@:native("flight_test_sphere_capsule_collision3d")
	public static function testSphereCapsuleCollision3d(a:flight._cpp.CollisionSphere3D, b:flight._cpp.CollisionCapsule3D, out:flight._cpp.CollisionManifold3D):Bool;
	@:native("flight_test_sphere_sphere_collision3d")
	public static function testSphereSphereCollision3d(a:flight._cpp.CollisionSphere3D, b:flight._cpp.CollisionSphere3D, out:flight._cpp.CollisionManifold3D):Bool;
	@:native("flight_collide_aabb_aabb_contact_manifold2d")
	public static function collideAabbAabbContactManifold2d(a:flight._cpp.CollisionAabb2D, b:flight._cpp.CollisionAabb2D, out:flight._cpp.CollisionContactManifold2D):Bool;
	@:native("flight_collide_aabb_obb_contact_manifold2d")
	public static function collideAabbObbContactManifold2d(a:flight._cpp.CollisionAabb2D, b:flight._cpp.CollisionObb2D, out:flight._cpp.CollisionContactManifold2D):Bool;
	@:native("flight_collide_aabb_polygon_contact_manifold2d")
	public static function collideAabbPolygonContactManifold2d(a:flight._cpp.CollisionAabb2D, b:flight._cpp.CollisionPolygon2D, out:flight._cpp.CollisionContactManifold2D):Bool;
	@:native("flight_collide_circle_aabb_contact_manifold2d")
	public static function collideCircleAabbContactManifold2d(a:flight._cpp.CollisionCircle2D, b:flight._cpp.CollisionAabb2D, out:flight._cpp.CollisionContactManifold2D):Bool;
	@:native("flight_collide_circle_circle_contact_manifold2d")
	public static function collideCircleCircleContactManifold2d(a:flight._cpp.CollisionCircle2D, b:flight._cpp.CollisionCircle2D, out:flight._cpp.CollisionContactManifold2D):Bool;
	@:native("flight_collide_circle_obb_contact_manifold2d")
	public static function collideCircleObbContactManifold2d(a:flight._cpp.CollisionCircle2D, b:flight._cpp.CollisionObb2D, out:flight._cpp.CollisionContactManifold2D):Bool;
	@:native("flight_collide_circle_polygon_contact_manifold2d")
	public static function collideCirclePolygonContactManifold2d(a:flight._cpp.CollisionCircle2D, b:flight._cpp.CollisionPolygon2D, out:flight._cpp.CollisionContactManifold2D):Bool;
	@:native("flight_collide_obb_obb_contact_manifold2d")
	public static function collideObbObbContactManifold2d(a:flight._cpp.CollisionObb2D, b:flight._cpp.CollisionObb2D, out:flight._cpp.CollisionContactManifold2D):Bool;
	@:native("flight_collide_obb_polygon_contact_manifold2d")
	public static function collideObbPolygonContactManifold2d(a:flight._cpp.CollisionObb2D, b:flight._cpp.CollisionPolygon2D, out:flight._cpp.CollisionContactManifold2D):Bool;
	@:native("flight_collide_polygon_polygon_contact_manifold2d")
	public static function collidePolygonPolygonContactManifold2d(a:flight._cpp.CollisionPolygon2D, b:flight._cpp.CollisionPolygon2D, out:flight._cpp.CollisionContactManifold2D):Bool;
	@:native("flight_create_collision_time_of_impact2d")
	public static function createCollisionTimeOfImpact2d():flight._cpp.CollisionTimeOfImpact2D;
	@:native("flight_sweep_collision_shape2d")
	public static function sweepCollisionShape2d(out:flight._cpp.CollisionTimeOfImpact2D, registry:flight._cpp.CollisionRegistry2D, shapeA:flight._cpp.CollisionShape2D, translationAx:Single, translationAy:Single, shapeB:flight._cpp.CollisionShape2D, translationBx:Single, translationBy:Single, maxFraction:Single):Bool;
	@:native("flight_create_collision_time_of_impact3d")
	public static function createCollisionTimeOfImpact3d():flight._cpp.CollisionTimeOfImpact3D;
	@:native("flight_sweep_collision_shape3d")
	public static function sweepCollisionShape3d(out:flight._cpp.CollisionTimeOfImpact3D, registry:flight._cpp.CollisionRegistry3D, shapeA:flight._cpp.CollisionShape3D, translationAx:Single, translationAy:Single, translationAz:Single, shapeB:flight._cpp.CollisionShape3D, translationBx:Single, translationBy:Single, translationBz:Single, maxFraction:Single):Bool;
	@:native("flight_create_collision_heightfield3d")
	public static function createCollisionHeightfield3d():flight._cpp.CollisionHeightfield3D;
	@:native("flight_create_collision_triangle_mesh3d")
	public static function createCollisionTriangleMesh3d():flight._cpp.CollisionTriangleMesh3D;
	@:native("flight_clone_collision_collider_shape3d")
	public static function cloneCollisionColliderShape3d(shape:flight._cpp.CollisionColliderShape3D):Int;
	@:native("flight_collide_collision_heightfield3d")
	public static function collideCollisionHeightfield3d(out:flight._cpp.CollisionContactManifold3D, registry:flight._cpp.CollisionRegistry3D, convex:flight._cpp.CollisionShape3D, heightfield:flight._cpp.CollisionHeightfield3D):Bool;
	@:native("flight_collide_collision_triangle_mesh3d")
	public static function collideCollisionTriangleMesh3d(out:flight._cpp.CollisionContactManifold3D, registry:flight._cpp.CollisionRegistry3D, convex:flight._cpp.CollisionShape3D, mesh:flight._cpp.CollisionTriangleMesh3D):Bool;
	@:native("flight_get_collision_heightfield_validation_status3d")
	public static function getCollisionHeightfieldValidationStatus3d(heightfield:flight._cpp.CollisionHeightfield3D):Int;
	@:native("flight_get_collision_triangle_mesh_validation_status3d")
	public static function getCollisionTriangleMeshValidationStatus3d(mesh:flight._cpp.CollisionTriangleMesh3D):Int;
	@:native("flight_invalidate_collision_heightfield3d")
	public static function invalidateCollisionHeightfield3d(heightfield:flight._cpp.CollisionHeightfield3D):Void;
	@:native("flight_invalidate_collision_triangle_mesh3d")
	public static function invalidateCollisionTriangleMesh3d(mesh:flight._cpp.CollisionTriangleMesh3D):Void;
	@:native("flight_raycast_collision_heightfield3d")
	public static function raycastCollisionHeightfield3d(out:flight._cpp.CollisionRaycastHit3D, heightfield:flight._cpp.CollisionHeightfield3D, originX:Single, originY:Single, originZ:Single, directionX:Single, directionY:Single, directionZ:Single, maxFraction:Single):Bool;
	@:native("flight_raycast_collision_triangle_mesh3d")
	public static function raycastCollisionTriangleMesh3d(out:flight._cpp.CollisionRaycastHit3D, mesh:flight._cpp.CollisionTriangleMesh3D, originX:Single, originY:Single, originZ:Single, directionX:Single, directionY:Single, directionZ:Single, maxFraction:Single):Bool;
	@:native("flight_sweep_collision_heightfield3d")
	public static function sweepCollisionHeightfield3d(out:flight._cpp.CollisionTimeOfImpact3D, registry:flight._cpp.CollisionRegistry3D, convex:flight._cpp.CollisionShape3D, deltaX:Single, deltaY:Single, deltaZ:Single, heightfield:flight._cpp.CollisionHeightfield3D, maxFraction:Single):Bool;
	@:native("flight_sweep_collision_triangle_mesh3d")
	public static function sweepCollisionTriangleMesh3d(out:flight._cpp.CollisionTimeOfImpact3D, registry:flight._cpp.CollisionRegistry3D, convex:flight._cpp.CollisionShape3D, deltaX:Single, deltaY:Single, deltaZ:Single, mesh:flight._cpp.CollisionTriangleMesh3D, maxFraction:Single):Bool;
	@:native("flight_write_collision_heightfield_bounds3d")
	public static function writeCollisionHeightfieldBounds3d(heightfield:flight._cpp.CollisionHeightfield3D, out:flight._cpp.CollisionAabb3D):Void;
	@:native("flight_write_collision_triangle_mesh_bounds3d")
	public static function writeCollisionTriangleMeshBounds3d(mesh:flight._cpp.CollisionTriangleMesh3D, out:flight._cpp.CollisionAabb3D):Void;
	@:native("flight_free_collision_contact_manifold2_d")
	public static function freeCollisionContactManifold2D(ptr:flight._cpp.CollisionContactManifold2D):Void;
	@:native("flight_free_collision_contact_manifold3_d")
	public static function freeCollisionContactManifold3D(ptr:flight._cpp.CollisionContactManifold3D):Void;
	@:native("flight_free_collision_distance3_d")
	public static function freeCollisionDistance3D(ptr:flight._cpp.CollisionDistance3D):Void;
	@:native("flight_free_collision_manifold2_d")
	public static function freeCollisionManifold2D(ptr:flight._cpp.CollisionManifold2D):Void;
	@:native("flight_free_collision_manifold3_d")
	public static function freeCollisionManifold3D(ptr:flight._cpp.CollisionManifold3D):Void;
	@:native("flight_free_collision_raycast_hit2_d")
	public static function freeCollisionRaycastHit2D(ptr:flight._cpp.CollisionRaycastHit2D):Void;
	@:native("flight_free_collision_raycast_hit3_d")
	public static function freeCollisionRaycastHit3D(ptr:flight._cpp.CollisionRaycastHit3D):Void;
	@:native("flight_free_collision_time_of_impact2_d")
	public static function freeCollisionTimeOfImpact2D(ptr:flight._cpp.CollisionTimeOfImpact2D):Void;
	@:native("flight_free_collision_time_of_impact3_d")
	public static function freeCollisionTimeOfImpact3D(ptr:flight._cpp.CollisionTimeOfImpact3D):Void;
	@:native("flight_free_collision_heightfield3_d")
	public static function freeCollisionHeightfield3D(ptr:flight._cpp.CollisionHeightfield3D):Void;
	@:native("flight_free_collision_triangle_mesh3_d")
	public static function freeCollisionTriangleMesh3D(ptr:flight._cpp.CollisionTriangleMesh3D):Void;
}
