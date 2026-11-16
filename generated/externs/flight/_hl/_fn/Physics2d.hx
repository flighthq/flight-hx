package flight._hl._fn;

extern class Physics2d {
	@:hlNative("flight", "flight_synchronize_physics2d_broadphase")
	public static function synchronizePhysics2dBroadphase(world:flight._hl.Physics2DWorld):Void;
	@:hlNative("flight", "flight_synchronize_physics2d_swept_broadphase")
	public static function synchronizePhysics2dSweptBroadphase(world:flight._hl.Physics2DWorld, dt:Single):Void;
	@:hlNative("flight", "flight_create_physics2d_collider_world_shape")
	public static function createPhysics2dColliderWorldShape(local:flight._hl.CollisionShape2D):flight._hl.CollisionShape2D;
	@:hlNative("flight", "flight_update_physics2d_collider_world_shape")
	public static function updatePhysics2dColliderWorldShape(collider:flight._hl.Physics2DCollider, body:flight._hl.RigidBody2D):Void;
	@:hlNative("flight", "flight_write_physics2d_collider_bounds")
	public static function writePhysics2dColliderBounds(out:flight._hl.SpatialAabb2D, collider:flight._hl.Physics2DCollider):Void;
	@:hlNative("flight", "flight_create_physics2d_debug_geometry")
	public static function createPhysics2dDebugGeometry():flight._hl.Physics2DDebugGeometry;
	@:hlNative("flight", "flight_write_physics2d_debug_geometry")
	public static function writePhysics2dDebugGeometry(out:flight._hl.Physics2DDebugGeometry, world:flight._hl.Physics2DWorld, options:flight._hl.Physics2DDebugGeometryOptions):Void;
	@:hlNative("flight", "flight_are_physics2d_guards_enabled")
	public static function arePhysics2dGuardsEnabled(guards:flight._hl.Physics2DGuardState):Bool;
	@:hlNative("flight", "flight_disable_physics2d_guards")
	public static function disablePhysics2dGuards(guards:flight._hl.Physics2DGuardState):Void;
	@:hlNative("flight", "flight_enable_physics2d_guards")
	public static function enablePhysics2dGuards(guards:flight._hl.Physics2DGuardState, logState:hl.Bytes, clockFn:hl.Bytes, clockCtx:hl.Bytes):Void;
	@:hlNative("flight", "flight_explain_physics2d_collision")
	public static function explainPhysics2dCollision(world:flight._hl.Physics2DWorld):flight._hl.Physics2DCollisionExplanation;
	@:hlNative("flight", "flight_explain_physics2d_joints")
	public static function explainPhysics2dJoints(world:flight._hl.Physics2DWorld):flight._hl.Physics2DJointResolutionExplanation;
	@:hlNative("flight", "flight_explain_physics2d_step")
	public static function explainPhysics2dStep(world:flight._hl.Physics2DWorld, dt:Float):flight._hl.Physics2DStepExplanation;
	@:hlNative("flight", "flight_build_physics2d_solve_islands")
	public static function buildPhysics2dSolveIslands(world:flight._hl.Physics2DWorld):Void;
	@:hlNative("flight", "flight_is_rigid_body2d_pair_awake")
	public static function isRigidBody2dPairAwake(a:flight._hl.RigidBody2D, b:flight._hl.RigidBody2D):Bool;
	@:hlNative("flight", "flight_update_physics2d_sleep")
	public static function updatePhysics2dSleep(world:flight._hl.Physics2DWorld, dt:Float):Void;
	@:hlNative("flight", "flight_wake_physics2d_body")
	public static function wakePhysics2dBody(body:flight._hl.RigidBody2D):Void;
	@:hlNative("flight", "flight_is_physics2d_pair_joint_suppressed")
	public static function isPhysics2dPairJointSuppressed(world:flight._hl.Physics2DWorld, bodyA:Int, bodyB:Int):Bool;
	@:hlNative("flight", "flight_rebuild_physics2d_joint_collision_suppressions")
	public static function rebuildPhysics2dJointCollisionSuppressions(world:flight._hl.Physics2DWorld):Void;
	@:hlNative("flight", "flight_create_physics2d_distance_joint")
	public static function createPhysics2dDistanceJoint():hl.Bytes;
	@:hlNative("flight", "flight_create_physics2d_gear_joint")
	public static function createPhysics2dGearJoint():hl.Bytes;
	@:hlNative("flight", "flight_create_physics2d_mouse_joint")
	public static function createPhysics2dMouseJoint():hl.Bytes;
	@:hlNative("flight", "flight_create_physics2d_prismatic_joint")
	public static function createPhysics2dPrismaticJoint():hl.Bytes;
	@:hlNative("flight", "flight_create_physics2d_pulley_joint")
	public static function createPhysics2dPulleyJoint():hl.Bytes;
	@:hlNative("flight", "flight_create_physics2d_revolute_joint")
	public static function createPhysics2dRevoluteJoint():hl.Bytes;
	@:hlNative("flight", "flight_create_physics2d_rope_joint")
	public static function createPhysics2dRopeJoint():hl.Bytes;
	@:hlNative("flight", "flight_create_physics2d_weld_joint")
	public static function createPhysics2dWeldJoint():hl.Bytes;
	@:hlNative("flight", "flight_create_physics2d_wheel_joint")
	public static function createPhysics2dWheelJoint():hl.Bytes;
	@:hlNative("flight", "flight_create_physics2d_joint_reaction")
	public static function createPhysics2dJointReaction():flight._hl.Physics2DJointReaction;
	@:hlNative("flight", "flight_write_physics2d_joint_reaction__physics2_ddistance_joint")
	public static function writePhysics2dJointReactionPhysics2DdistanceJoint(out:flight._hl.Physics2DJointReaction, world:flight._hl.Physics2DWorld, joint:flight._hl.Physics2DDistanceJoint, dt:Single):Bool;
	@:hlNative("flight", "flight_write_physics2d_joint_reaction__physics2_dgear_joint")
	public static function writePhysics2dJointReactionPhysics2DgearJoint(out:flight._hl.Physics2DJointReaction, world:flight._hl.Physics2DWorld, joint:flight._hl.Physics2DGearJoint, dt:Single):Bool;
	@:hlNative("flight", "flight_write_physics2d_joint_reaction__physics2_dmouse_joint")
	public static function writePhysics2dJointReactionPhysics2DmouseJoint(out:flight._hl.Physics2DJointReaction, world:flight._hl.Physics2DWorld, joint:flight._hl.Physics2DMouseJoint, dt:Single):Bool;
	@:hlNative("flight", "flight_write_physics2d_joint_reaction__physics2_dprismatic_joint")
	public static function writePhysics2dJointReactionPhysics2DprismaticJoint(out:flight._hl.Physics2DJointReaction, world:flight._hl.Physics2DWorld, joint:flight._hl.Physics2DPrismaticJoint, dt:Single):Bool;
	@:hlNative("flight", "flight_write_physics2d_joint_reaction__physics2_dpulley_joint")
	public static function writePhysics2dJointReactionPhysics2DpulleyJoint(out:flight._hl.Physics2DJointReaction, world:flight._hl.Physics2DWorld, joint:flight._hl.Physics2DPulleyJoint, dt:Single):Bool;
	@:hlNative("flight", "flight_write_physics2d_joint_reaction__physics2_drevolute_joint")
	public static function writePhysics2dJointReactionPhysics2DrevoluteJoint(out:flight._hl.Physics2DJointReaction, world:flight._hl.Physics2DWorld, joint:flight._hl.Physics2DRevoluteJoint, dt:Single):Bool;
	@:hlNative("flight", "flight_write_physics2d_joint_reaction__physics2_drope_joint")
	public static function writePhysics2dJointReactionPhysics2DropeJoint(out:flight._hl.Physics2DJointReaction, world:flight._hl.Physics2DWorld, joint:flight._hl.Physics2DRopeJoint, dt:Single):Bool;
	@:hlNative("flight", "flight_write_physics2d_joint_reaction__physics2_dweld_joint")
	public static function writePhysics2dJointReactionPhysics2DweldJoint(out:flight._hl.Physics2DJointReaction, world:flight._hl.Physics2DWorld, joint:flight._hl.Physics2DWeldJoint, dt:Single):Bool;
	@:hlNative("flight", "flight_write_physics2d_joint_reaction__physics2_dwheel_joint")
	public static function writePhysics2dJointReactionPhysics2DwheelJoint(out:flight._hl.Physics2DJointReaction, world:flight._hl.Physics2DWorld, joint:flight._hl.Physics2DWheelJoint, dt:Single):Bool;
	@:hlNative("flight", "flight_add_physics2d_joint")
	public static function addPhysics2dJoint(world:flight._hl.Physics2DWorld, joint:flight._hl.Physics2DJointRef):Void;
	@:hlNative("flight", "flight_get_physics2d_joint_solver")
	public static function getPhysics2dJointSolver(world:flight._hl.Physics2DWorld, kind:hl.Bytes):flight._hl.Physics2DJointSolverRef;
	@:hlNative("flight", "flight_invalidate_physics2d_joint")
	public static function invalidatePhysics2dJoint(world:flight._hl.Physics2DWorld, joint:flight._hl.Physics2DJointRef):Bool;
	@:hlNative("flight", "flight_register_physics2d_joint_solver")
	public static function registerPhysics2dJointSolver(world:flight._hl.Physics2DWorld, kind:hl.Bytes, solver:flight._hl.Physics2DJointSolverRef):Void;
	@:hlNative("flight", "flight_remove_physics2d_joint")
	public static function removePhysics2dJoint(world:flight._hl.Physics2DWorld, joint:flight._hl.Physics2DJointRef):Bool;
	@:hlNative("flight", "flight_write_physics2d_soft_row_parameters")
	public static function writePhysics2dSoftRowParameters(out:hl.Bytes, outLen:Int, mass:Single, frequencyHz:Single, dampingRatio:Single, dt:Single, hardBiasFactor:Single):Void;
	@:hlNative("flight", "flight_compute_physics2d_collider_mass_data")
	public static function computePhysics2dColliderMassData(out:flight._hl.Physics2DMassData, collider:flight._hl.Physics2DCollider):Void;
	@:hlNative("flight", "flight_update_rigid_body2d_mass_data")
	public static function updateRigidBody2dMassData(body:flight._hl.RigidBody2D):Void;
	@:hlNative("flight", "flight_mix_physics2d_friction")
	public static function mixPhysics2dFriction(first:Single, second:Single):Single;
	@:hlNative("flight", "flight_mix_physics2d_restitution")
	public static function mixPhysics2dRestitution(first:Single, second:Single):Single;
	@:hlNative("flight", "flight_sync_physics2d_body_to_node2d")
	public static function syncPhysics2dBodyToNode2d(body:flight._hl.RigidBody2D, node:hl.Bytes):Void;
	@:hlNative("flight", "flight_assert_physics2d_body_not_stepping")
	public static function assertPhysics2dBodyNotStepping(body:flight._hl.RigidBody2D):Void;
	@:hlNative("flight", "flight_assert_physics2d_world_not_stepping")
	public static function assertPhysics2dWorldNotStepping(world:flight._hl.Physics2DWorld):Void;
	@:hlNative("flight", "flight_register_built_in_physics2d_joint_solvers")
	public static function registerBuiltInPhysics2dJointSolvers(world:flight._hl.Physics2DWorld):Void;
	@:hlNative("flight", "flight_apply_physics2d_impulse")
	public static function applyPhysics2dImpulse(bodyA:flight._hl.RigidBody2D, bodyB:flight._hl.RigidBody2D, rAx:Single, rAy:Single, rBx:Single, rBy:Single, impulseX:Single, impulseY:Single):Void;
	@:hlNative("flight", "flight_relative_normal_velocity")
	public static function relativeNormalVelocity(bodyA:flight._hl.RigidBody2D, bodyB:flight._hl.RigidBody2D, point:flight._hl.Physics2DContactPoint, normalX:Single, normalY:Single):Single;
	@:hlNative("flight", "flight_solve_physics2d_contact_indices_once")
	public static function solvePhysics2dContactIndicesOnce(world:flight._hl.Physics2DWorld, indices:hl.Bytes, indicesLen:Int, start:Int, count:Int):Void;
	@:hlNative("flight", "flight_solve_physics2d_contacts")
	public static function solvePhysics2dContacts(world:flight._hl.Physics2DWorld):Void;
	@:hlNative("flight", "flight_solve_physics2d_contacts_once")
	public static function solvePhysics2dContactsOnce(world:flight._hl.Physics2DWorld):Void;
	@:hlNative("flight", "flight_warm_start_physics2d_contact_indices")
	public static function warmStartPhysics2dContactIndices(world:flight._hl.Physics2DWorld, indices:hl.Bytes, indicesLen:Int, start:Int, count:Int):Void;
	@:hlNative("flight", "flight_warm_start_physics2d_contacts")
	public static function warmStartPhysics2dContacts(world:flight._hl.Physics2DWorld):Void;
	@:hlNative("flight", "flight_step_physics2d")
	public static function stepPhysics2d(world:flight._hl.Physics2DWorld, dt:Float, registry:flight._hl.CollisionRegistry2D, guards:flight._hl.Physics2DGuardState):Void;
	@:hlNative("flight", "flight_is_physics2d_body_state_valid")
	public static function isPhysics2dBodyStateValid(world:flight._hl.Physics2DWorld):Bool;
	@:hlNative("flight", "flight_is_physics2d_contact_state_valid")
	public static function isPhysics2dContactStateValid(world:flight._hl.Physics2DWorld):Bool;
	@:hlNative("flight", "flight_is_physics2d_contact_valid")
	public static function isPhysics2dContactValid(contact:flight._hl.Physics2DContact):Bool;
	@:hlNative("flight", "flight_is_physics2d_gravity_valid")
	public static function isPhysics2dGravityValid(world:flight._hl.Physics2DWorld):Bool;
	@:hlNative("flight", "flight_is_physics2d_joint_state_valid")
	public static function isPhysics2dJointStateValid(world:flight._hl.Physics2DWorld):Bool;
	@:hlNative("flight", "flight_is_physics2d_previous_timestep_valid")
	public static function isPhysics2dPreviousTimestepValid(world:flight._hl.Physics2DWorld):Bool;
	@:hlNative("flight", "flight_is_physics2d_solver_config_valid")
	public static function isPhysics2dSolverConfigValid(config:flight._hl.Physics2DSolverConfig):Bool;
	@:hlNative("flight", "flight_is_physics2d_timestep_valid")
	public static function isPhysics2dTimestepValid(dt:Float):Bool;
	@:hlNative("flight", "flight_visit_physics2d_joint_base_number_fields")
	public static function visitPhysics2dJointBaseNumberFields(fields:flight._hl.Physics2DJointFields, visitFn:hl.Bytes, visitCtx:hl.Bytes):Void;
	@:hlNative("flight", "flight_create_physics2d_collider")
	public static function createPhysics2dCollider(local:flight._hl.CollisionShape2D):hl.Bytes;
	@:hlNative("flight", "flight_create_physics2d_solver_config")
	public static function createPhysics2dSolverConfig(options:flight._hl.Physics2DSolverConfigOptions):flight._hl.Physics2DSolverConfig;
	@:hlNative("flight", "flight_create_physics2d_world")
	public static function createPhysics2dWorld():flight._hl.Physics2DWorld;
	@:hlNative("flight", "flight_create_rigid_body2d")
	public static function createRigidBody2d():hl.Bytes;
	@:hlNative("flight", "flight_add_physics2d_body")
	public static function addPhysics2dBody(world:flight._hl.Physics2DWorld, body:hl.Bytes):Void;
	@:hlNative("flight", "flight_add_physics2d_collider")
	public static function addPhysics2dCollider(world:flight._hl.Physics2DWorld, body:hl.Bytes, collider:hl.Bytes):Void;
	@:hlNative("flight", "flight_apply_physics2d_force")
	public static function applyPhysics2dForce(body:flight._hl.RigidBody2D, forceX:Single, forceY:Single):Bool;
	@:hlNative("flight", "flight_apply_physics2d_force_at_point")
	public static function applyPhysics2dForceAtPoint(body:flight._hl.RigidBody2D, forceX:Single, forceY:Single, pointX:Single, pointY:Single):Bool;
	@:hlNative("flight", "flight_apply_physics2d_linear_impulse")
	public static function applyPhysics2dLinearImpulse(body:flight._hl.RigidBody2D, impulseX:Single, impulseY:Single):Bool;
	@:hlNative("flight", "flight_apply_physics2d_linear_impulse_at_point")
	public static function applyPhysics2dLinearImpulseAtPoint(body:flight._hl.RigidBody2D, impulseX:Single, impulseY:Single, pointX:Single, pointY:Single):Bool;
	@:hlNative("flight", "flight_apply_physics2d_torque")
	public static function applyPhysics2dTorque(body:flight._hl.RigidBody2D, torque:Single):Bool;
	@:hlNative("flight", "flight_find_physics2d_body")
	public static function findPhysics2dBody(world:flight._hl.Physics2DWorld, index:Int):hl.Bytes;
	@:hlNative("flight", "flight_hydrate_physics2d_world")
	public static function hydratePhysics2dWorld(world:flight._hl.Physics2DWorld):Bool;
	@:hlNative("flight", "flight_invalidate_physics2d_collider")
	public static function invalidatePhysics2dCollider(world:flight._hl.Physics2DWorld, body:hl.Bytes, collider:hl.Bytes):Bool;
	@:hlNative("flight", "flight_is_physics2d_pair_ordered")
	public static function isPhysics2dPairOrdered(a:flight._hl.RigidBody2D, b:flight._hl.RigidBody2D):Bool;
	@:hlNative("flight", "flight_remove_physics2d_body")
	public static function removePhysics2dBody(world:flight._hl.Physics2DWorld, body:hl.Bytes):Bool;
	@:hlNative("flight", "flight_remove_physics2d_collider")
	public static function removePhysics2dCollider(world:flight._hl.Physics2DWorld, body:hl.Bytes, collider:hl.Bytes):Bool;
	@:hlNative("flight", "flight_set_physics2d_body_bullet")
	public static function setPhysics2dBodyBullet(world:flight._hl.Physics2DWorld, body:hl.Bytes, bullet:Bool):Bool;
	@:hlNative("flight", "flight_set_physics2d_body_fixed_rotation")
	public static function setPhysics2dBodyFixedRotation(world:flight._hl.Physics2DWorld, body:hl.Bytes, fixedRotation:Bool):Bool;
	@:hlNative("flight", "flight_set_physics2d_body_sleep_enabled")
	public static function setPhysics2dBodySleepEnabled(world:flight._hl.Physics2DWorld, body:hl.Bytes, sleepEnabled:Bool):Bool;
	@:hlNative("flight", "flight_set_physics2d_body_transform")
	public static function setPhysics2dBodyTransform(world:flight._hl.Physics2DWorld, body:hl.Bytes, x:Single, y:Single, angle:Single):Bool;
	@:hlNative("flight", "flight_set_physics2d_body_type")
	public static function setPhysics2dBodyType(world:flight._hl.Physics2DWorld, body:hl.Bytes, bodyType:Int):Bool;
	@:hlNative("flight", "flight_create_physics2d_query_filter")
	public static function createPhysics2dQueryFilter():flight._hl.Physics2DQueryFilter;
	@:hlNative("flight", "flight_create_physics2d_query_result")
	public static function createPhysics2dQueryResult():flight._hl.Physics2DQueryResult;
	@:hlNative("flight", "flight_create_physics2d_ray_result")
	public static function createPhysics2dRayResult():flight._hl.Physics2DRayResult;
	@:hlNative("flight", "flight_create_physics2d_shape_cast_result")
	public static function createPhysics2dShapeCastResult():flight._hl.Physics2DShapeCastResult;
	@:hlNative("flight", "flight_query_physics2d_point")
	public static function queryPhysics2dPoint(out:flight._hl.Physics2DQueryResult, world:flight._hl.Physics2DWorld, x:Single, y:Single, filter:flight._hl.Physics2DQueryFilter):Void;
	@:hlNative("flight", "flight_query_physics2d_ray")
	public static function queryPhysics2dRay(out:flight._hl.Physics2DRayResult, world:flight._hl.Physics2DWorld, originX:Single, originY:Single, directionX:Single, directionY:Single, maxFraction:Single, filter:flight._hl.Physics2DQueryFilter):Void;
	@:hlNative("flight", "flight_query_physics2d_ray_closest")
	public static function queryPhysics2dRayClosest(out:flight._hl.Physics2DRayResult, world:flight._hl.Physics2DWorld, originX:Single, originY:Single, directionX:Single, directionY:Single, maxFraction:Single, filter:flight._hl.Physics2DQueryFilter):Void;
	@:hlNative("flight", "flight_query_physics2d_region")
	public static function queryPhysics2dRegion(out:flight._hl.Physics2DQueryResult, world:flight._hl.Physics2DWorld, region:flight._hl.SpatialAabb2D, filter:flight._hl.Physics2DQueryFilter):Void;
	@:hlNative("flight", "flight_query_physics2d_shape_cast")
	public static function queryPhysics2dShapeCast(out:flight._hl.Physics2DShapeCastResult, world:flight._hl.Physics2DWorld, registry:flight._hl.CollisionRegistry2D, shape:flight._hl.CollisionShape2D, dx:Single, dy:Single, maxFraction:Single, filter:flight._hl.Physics2DQueryFilter):Void;
	@:hlNative("flight", "flight_free_collision_shape2_d")
	public static function freeCollisionShape2D(ptr:flight._hl.CollisionShape2D):Void;
	@:hlNative("flight", "flight_free_physics2_ddebug_geometry")
	public static function freePhysics2DdebugGeometry(ptr:flight._hl.Physics2DDebugGeometry):Void;
	@:hlNative("flight", "flight_free_physics2_dcollision_explanation")
	public static function freePhysics2DcollisionExplanation(ptr:flight._hl.Physics2DCollisionExplanation):Void;
	@:hlNative("flight", "flight_free_physics2_djoint_resolution_explanation")
	public static function freePhysics2DjointResolutionExplanation(ptr:flight._hl.Physics2DJointResolutionExplanation):Void;
	@:hlNative("flight", "flight_free_physics2_dstep_explanation")
	public static function freePhysics2DstepExplanation(ptr:flight._hl.Physics2DStepExplanation):Void;
	@:hlNative("flight", "flight_free_physics2_djoint_reaction")
	public static function freePhysics2DjointReaction(ptr:flight._hl.Physics2DJointReaction):Void;
	@:hlNative("flight", "flight_free_physics2_djoint_solver_ref")
	public static function freePhysics2DjointSolverRef(ptr:flight._hl.Physics2DJointSolverRef):Void;
	@:hlNative("flight", "flight_free_physics2_dsolver_config")
	public static function freePhysics2DsolverConfig(ptr:flight._hl.Physics2DSolverConfig):Void;
	@:hlNative("flight", "flight_free_physics2_dworld")
	public static function freePhysics2Dworld(ptr:flight._hl.Physics2DWorld):Void;
	@:hlNative("flight", "flight_free_physics2_dquery_filter")
	public static function freePhysics2DqueryFilter(ptr:flight._hl.Physics2DQueryFilter):Void;
	@:hlNative("flight", "flight_free_physics2_dquery_result")
	public static function freePhysics2DqueryResult(ptr:flight._hl.Physics2DQueryResult):Void;
	@:hlNative("flight", "flight_free_physics2_dray_result")
	public static function freePhysics2DrayResult(ptr:flight._hl.Physics2DRayResult):Void;
	@:hlNative("flight", "flight_free_physics2_dshape_cast_result")
	public static function freePhysics2DshapeCastResult(ptr:flight._hl.Physics2DShapeCastResult):Void;
}
