package flight._js._fn;

@:jsRequire("flight")
extern class Physics2d {
	@:native("flight_synchronize_physics2d_broadphase")
	public static function synchronizePhysics2dBroadphase(world:flight._js.Physics2DWorld):Void;
	@:native("flight_synchronize_physics2d_swept_broadphase")
	public static function synchronizePhysics2dSweptBroadphase(world:flight._js.Physics2DWorld, dt:Float):Void;
	@:native("flight_create_physics2d_collider_world_shape")
	public static function createPhysics2dColliderWorldShape(local:flight._js.CollisionShape2D):flight._js.CollisionShape2D;
	@:native("flight_update_physics2d_collider_world_shape")
	public static function updatePhysics2dColliderWorldShape(collider:flight._js.Physics2DCollider, body:flight._js.RigidBody2D):Void;
	@:native("flight_write_physics2d_collider_bounds")
	public static function writePhysics2dColliderBounds(out:flight._js.SpatialAabb2D, collider:flight._js.Physics2DCollider):Void;
	@:native("flight_create_physics2d_debug_geometry")
	public static function createPhysics2dDebugGeometry():flight._js.Physics2DDebugGeometry;
	@:native("flight_write_physics2d_debug_geometry")
	public static function writePhysics2dDebugGeometry(out:flight._js.Physics2DDebugGeometry, world:flight._js.Physics2DWorld, options:flight._js.Physics2DDebugGeometryOptions):Void;
	@:native("flight_are_physics2d_guards_enabled")
	public static function arePhysics2dGuardsEnabled(guards:flight._js.Physics2DGuardState):Bool;
	@:native("flight_disable_physics2d_guards")
	public static function disablePhysics2dGuards(guards:flight._js.Physics2DGuardState):Void;
	@:native("flight_enable_physics2d_guards")
	public static function enablePhysics2dGuards(guards:flight._js.Physics2DGuardState, logState:Dynamic, clockFn:Dynamic, clockCtx:Dynamic):Void;
	@:native("flight_explain_physics2d_collision")
	public static function explainPhysics2dCollision(world:flight._js.Physics2DWorld):flight._js.Physics2DCollisionExplanation;
	@:native("flight_explain_physics2d_joints")
	public static function explainPhysics2dJoints(world:flight._js.Physics2DWorld):flight._js.Physics2DJointResolutionExplanation;
	@:native("flight_explain_physics2d_step")
	public static function explainPhysics2dStep(world:flight._js.Physics2DWorld, dt:Float):flight._js.Physics2DStepExplanation;
	@:native("flight_build_physics2d_solve_islands")
	public static function buildPhysics2dSolveIslands(world:flight._js.Physics2DWorld):Void;
	@:native("flight_is_rigid_body2d_pair_awake")
	public static function isRigidBody2dPairAwake(a:flight._js.RigidBody2D, b:flight._js.RigidBody2D):Bool;
	@:native("flight_update_physics2d_sleep")
	public static function updatePhysics2dSleep(world:flight._js.Physics2DWorld, dt:Float):Void;
	@:native("flight_wake_physics2d_body")
	public static function wakePhysics2dBody(body:flight._js.RigidBody2D):Void;
	@:native("flight_is_physics2d_pair_joint_suppressed")
	public static function isPhysics2dPairJointSuppressed(world:flight._js.Physics2DWorld, bodyA:Int, bodyB:Int):Bool;
	@:native("flight_rebuild_physics2d_joint_collision_suppressions")
	public static function rebuildPhysics2dJointCollisionSuppressions(world:flight._js.Physics2DWorld):Void;
	@:native("flight_create_physics2d_distance_joint")
	public static function createPhysics2dDistanceJoint():Dynamic;
	@:native("flight_create_physics2d_gear_joint")
	public static function createPhysics2dGearJoint():Dynamic;
	@:native("flight_create_physics2d_mouse_joint")
	public static function createPhysics2dMouseJoint():Dynamic;
	@:native("flight_create_physics2d_prismatic_joint")
	public static function createPhysics2dPrismaticJoint():Dynamic;
	@:native("flight_create_physics2d_pulley_joint")
	public static function createPhysics2dPulleyJoint():Dynamic;
	@:native("flight_create_physics2d_revolute_joint")
	public static function createPhysics2dRevoluteJoint():Dynamic;
	@:native("flight_create_physics2d_rope_joint")
	public static function createPhysics2dRopeJoint():Dynamic;
	@:native("flight_create_physics2d_weld_joint")
	public static function createPhysics2dWeldJoint():Dynamic;
	@:native("flight_create_physics2d_wheel_joint")
	public static function createPhysics2dWheelJoint():Dynamic;
	@:native("flight_create_physics2d_joint_reaction")
	public static function createPhysics2dJointReaction():flight._js.Physics2DJointReaction;
	@:native("flight_write_physics2d_joint_reaction__physics2_ddistance_joint")
	public static function writePhysics2dJointReactionPhysics2DdistanceJoint(out:flight._js.Physics2DJointReaction, world:flight._js.Physics2DWorld, joint:flight._js.Physics2DDistanceJoint, dt:Float):Bool;
	@:native("flight_write_physics2d_joint_reaction__physics2_dgear_joint")
	public static function writePhysics2dJointReactionPhysics2DgearJoint(out:flight._js.Physics2DJointReaction, world:flight._js.Physics2DWorld, joint:flight._js.Physics2DGearJoint, dt:Float):Bool;
	@:native("flight_write_physics2d_joint_reaction__physics2_dmouse_joint")
	public static function writePhysics2dJointReactionPhysics2DmouseJoint(out:flight._js.Physics2DJointReaction, world:flight._js.Physics2DWorld, joint:flight._js.Physics2DMouseJoint, dt:Float):Bool;
	@:native("flight_write_physics2d_joint_reaction__physics2_dprismatic_joint")
	public static function writePhysics2dJointReactionPhysics2DprismaticJoint(out:flight._js.Physics2DJointReaction, world:flight._js.Physics2DWorld, joint:flight._js.Physics2DPrismaticJoint, dt:Float):Bool;
	@:native("flight_write_physics2d_joint_reaction__physics2_dpulley_joint")
	public static function writePhysics2dJointReactionPhysics2DpulleyJoint(out:flight._js.Physics2DJointReaction, world:flight._js.Physics2DWorld, joint:flight._js.Physics2DPulleyJoint, dt:Float):Bool;
	@:native("flight_write_physics2d_joint_reaction__physics2_drevolute_joint")
	public static function writePhysics2dJointReactionPhysics2DrevoluteJoint(out:flight._js.Physics2DJointReaction, world:flight._js.Physics2DWorld, joint:flight._js.Physics2DRevoluteJoint, dt:Float):Bool;
	@:native("flight_write_physics2d_joint_reaction__physics2_drope_joint")
	public static function writePhysics2dJointReactionPhysics2DropeJoint(out:flight._js.Physics2DJointReaction, world:flight._js.Physics2DWorld, joint:flight._js.Physics2DRopeJoint, dt:Float):Bool;
	@:native("flight_write_physics2d_joint_reaction__physics2_dweld_joint")
	public static function writePhysics2dJointReactionPhysics2DweldJoint(out:flight._js.Physics2DJointReaction, world:flight._js.Physics2DWorld, joint:flight._js.Physics2DWeldJoint, dt:Float):Bool;
	@:native("flight_write_physics2d_joint_reaction__physics2_dwheel_joint")
	public static function writePhysics2dJointReactionPhysics2DwheelJoint(out:flight._js.Physics2DJointReaction, world:flight._js.Physics2DWorld, joint:flight._js.Physics2DWheelJoint, dt:Float):Bool;
	@:native("flight_add_physics2d_joint")
	public static function addPhysics2dJoint(world:flight._js.Physics2DWorld, joint:flight._js.Physics2DJointRef):Void;
	@:native("flight_get_physics2d_joint_solver")
	public static function getPhysics2dJointSolver(world:flight._js.Physics2DWorld, kind:String):Dynamic;
	@:native("flight_invalidate_physics2d_joint")
	public static function invalidatePhysics2dJoint(world:flight._js.Physics2DWorld, joint:flight._js.Physics2DJointRef):Bool;
	@:native("flight_register_physics2d_joint_solver")
	public static function registerPhysics2dJointSolver(world:flight._js.Physics2DWorld, kind:String, solver:flight._js.Physics2DJointSolverRef):Void;
	@:native("flight_remove_physics2d_joint")
	public static function removePhysics2dJoint(world:flight._js.Physics2DWorld, joint:flight._js.Physics2DJointRef):Bool;
	@:native("flight_write_physics2d_soft_row_parameters")
	public static function writePhysics2dSoftRowParameters(out:Dynamic, outLen:Int, mass:Float, frequencyHz:Float, dampingRatio:Float, dt:Float, hardBiasFactor:Float):Void;
	@:native("flight_compute_physics2d_collider_mass_data")
	public static function computePhysics2dColliderMassData(out:flight._js.Physics2DMassData, collider:flight._js.Physics2DCollider):Void;
	@:native("flight_update_rigid_body2d_mass_data")
	public static function updateRigidBody2dMassData(body:flight._js.RigidBody2D):Void;
	@:native("flight_mix_physics2d_friction")
	public static function mixPhysics2dFriction(first:Float, second:Float):Float;
	@:native("flight_mix_physics2d_restitution")
	public static function mixPhysics2dRestitution(first:Float, second:Float):Float;
	@:native("flight_sync_physics2d_body_to_node2d")
	public static function syncPhysics2dBodyToNode2d(body:flight._js.RigidBody2D, node:Dynamic):Void;
	@:native("flight_assert_physics2d_body_not_stepping")
	public static function assertPhysics2dBodyNotStepping(body:flight._js.RigidBody2D):Void;
	@:native("flight_assert_physics2d_world_not_stepping")
	public static function assertPhysics2dWorldNotStepping(world:flight._js.Physics2DWorld):Void;
	@:native("flight_register_built_in_physics2d_joint_solvers")
	public static function registerBuiltInPhysics2dJointSolvers(world:flight._js.Physics2DWorld):Void;
	@:native("flight_apply_physics2d_impulse")
	public static function applyPhysics2dImpulse(bodyA:flight._js.RigidBody2D, bodyB:flight._js.RigidBody2D, rAx:Float, rAy:Float, rBx:Float, rBy:Float, impulseX:Float, impulseY:Float):Void;
	@:native("flight_relative_normal_velocity")
	public static function relativeNormalVelocity(bodyA:flight._js.RigidBody2D, bodyB:flight._js.RigidBody2D, point:flight._js.Physics2DContactPoint, normalX:Float, normalY:Float):Float;
	@:native("flight_solve_physics2d_contact_indices_once")
	public static function solvePhysics2dContactIndicesOnce(world:flight._js.Physics2DWorld, indices:Dynamic, indicesLen:Int, start:Int, count:Int):Void;
	@:native("flight_solve_physics2d_contacts")
	public static function solvePhysics2dContacts(world:flight._js.Physics2DWorld):Void;
	@:native("flight_solve_physics2d_contacts_once")
	public static function solvePhysics2dContactsOnce(world:flight._js.Physics2DWorld):Void;
	@:native("flight_warm_start_physics2d_contact_indices")
	public static function warmStartPhysics2dContactIndices(world:flight._js.Physics2DWorld, indices:Dynamic, indicesLen:Int, start:Int, count:Int):Void;
	@:native("flight_warm_start_physics2d_contacts")
	public static function warmStartPhysics2dContacts(world:flight._js.Physics2DWorld):Void;
	@:native("flight_step_physics2d")
	public static function stepPhysics2d(world:flight._js.Physics2DWorld, dt:Float, registry:flight._js.CollisionRegistry2D, guards:flight._js.Physics2DGuardState):Void;
	@:native("flight_is_physics2d_body_state_valid")
	public static function isPhysics2dBodyStateValid(world:flight._js.Physics2DWorld):Bool;
	@:native("flight_is_physics2d_contact_state_valid")
	public static function isPhysics2dContactStateValid(world:flight._js.Physics2DWorld):Bool;
	@:native("flight_is_physics2d_contact_valid")
	public static function isPhysics2dContactValid(contact:flight._js.Physics2DContact):Bool;
	@:native("flight_is_physics2d_gravity_valid")
	public static function isPhysics2dGravityValid(world:flight._js.Physics2DWorld):Bool;
	@:native("flight_is_physics2d_joint_state_valid")
	public static function isPhysics2dJointStateValid(world:flight._js.Physics2DWorld):Bool;
	@:native("flight_is_physics2d_previous_timestep_valid")
	public static function isPhysics2dPreviousTimestepValid(world:flight._js.Physics2DWorld):Bool;
	@:native("flight_is_physics2d_solver_config_valid")
	public static function isPhysics2dSolverConfigValid(config:flight._js.Physics2DSolverConfig):Bool;
	@:native("flight_is_physics2d_timestep_valid")
	public static function isPhysics2dTimestepValid(dt:Float):Bool;
	@:native("flight_visit_physics2d_joint_base_number_fields")
	public static function visitPhysics2dJointBaseNumberFields(fields:flight._js.Physics2DJointFields, visitFn:Dynamic, visitCtx:Dynamic):Void;
	@:native("flight_create_physics2d_collider")
	public static function createPhysics2dCollider(local:flight._js.CollisionShape2D):Dynamic;
	@:native("flight_create_physics2d_solver_config")
	public static function createPhysics2dSolverConfig(options:flight._js.Physics2DSolverConfigOptions):flight._js.Physics2DSolverConfig;
	@:native("flight_create_physics2d_world")
	public static function createPhysics2dWorld():flight._js.Physics2DWorld;
	@:native("flight_create_rigid_body2d")
	public static function createRigidBody2d():Dynamic;
	@:native("flight_add_physics2d_body")
	public static function addPhysics2dBody(world:flight._js.Physics2DWorld, body:Dynamic):Void;
	@:native("flight_add_physics2d_collider")
	public static function addPhysics2dCollider(world:flight._js.Physics2DWorld, body:Dynamic, collider:Dynamic):Void;
	@:native("flight_apply_physics2d_force")
	public static function applyPhysics2dForce(body:flight._js.RigidBody2D, forceX:Float, forceY:Float):Bool;
	@:native("flight_apply_physics2d_force_at_point")
	public static function applyPhysics2dForceAtPoint(body:flight._js.RigidBody2D, forceX:Float, forceY:Float, pointX:Float, pointY:Float):Bool;
	@:native("flight_apply_physics2d_linear_impulse")
	public static function applyPhysics2dLinearImpulse(body:flight._js.RigidBody2D, impulseX:Float, impulseY:Float):Bool;
	@:native("flight_apply_physics2d_linear_impulse_at_point")
	public static function applyPhysics2dLinearImpulseAtPoint(body:flight._js.RigidBody2D, impulseX:Float, impulseY:Float, pointX:Float, pointY:Float):Bool;
	@:native("flight_apply_physics2d_torque")
	public static function applyPhysics2dTorque(body:flight._js.RigidBody2D, torque:Float):Bool;
	@:native("flight_find_physics2d_body")
	public static function findPhysics2dBody(world:flight._js.Physics2DWorld, index:Int):Dynamic;
	@:native("flight_hydrate_physics2d_world")
	public static function hydratePhysics2dWorld(world:flight._js.Physics2DWorld):Bool;
	@:native("flight_invalidate_physics2d_collider")
	public static function invalidatePhysics2dCollider(world:flight._js.Physics2DWorld, body:Dynamic, collider:Dynamic):Bool;
	@:native("flight_is_physics2d_pair_ordered")
	public static function isPhysics2dPairOrdered(a:flight._js.RigidBody2D, b:flight._js.RigidBody2D):Bool;
	@:native("flight_remove_physics2d_body")
	public static function removePhysics2dBody(world:flight._js.Physics2DWorld, body:Dynamic):Bool;
	@:native("flight_remove_physics2d_collider")
	public static function removePhysics2dCollider(world:flight._js.Physics2DWorld, body:Dynamic, collider:Dynamic):Bool;
	@:native("flight_set_physics2d_body_bullet")
	public static function setPhysics2dBodyBullet(world:flight._js.Physics2DWorld, body:Dynamic, bullet:Bool):Bool;
	@:native("flight_set_physics2d_body_fixed_rotation")
	public static function setPhysics2dBodyFixedRotation(world:flight._js.Physics2DWorld, body:Dynamic, fixedRotation:Bool):Bool;
	@:native("flight_set_physics2d_body_sleep_enabled")
	public static function setPhysics2dBodySleepEnabled(world:flight._js.Physics2DWorld, body:Dynamic, sleepEnabled:Bool):Bool;
	@:native("flight_set_physics2d_body_transform")
	public static function setPhysics2dBodyTransform(world:flight._js.Physics2DWorld, body:Dynamic, x:Float, y:Float, angle:Float):Bool;
	@:native("flight_set_physics2d_body_type")
	public static function setPhysics2dBodyType(world:flight._js.Physics2DWorld, body:Dynamic, bodyType:Int):Bool;
	@:native("flight_create_physics2d_query_filter")
	public static function createPhysics2dQueryFilter():flight._js.Physics2DQueryFilter;
	@:native("flight_create_physics2d_query_result")
	public static function createPhysics2dQueryResult():flight._js.Physics2DQueryResult;
	@:native("flight_create_physics2d_ray_result")
	public static function createPhysics2dRayResult():flight._js.Physics2DRayResult;
	@:native("flight_create_physics2d_shape_cast_result")
	public static function createPhysics2dShapeCastResult():flight._js.Physics2DShapeCastResult;
	@:native("flight_query_physics2d_point")
	public static function queryPhysics2dPoint(out:flight._js.Physics2DQueryResult, world:flight._js.Physics2DWorld, x:Float, y:Float, filter:flight._js.Physics2DQueryFilter):Void;
	@:native("flight_query_physics2d_ray")
	public static function queryPhysics2dRay(out:flight._js.Physics2DRayResult, world:flight._js.Physics2DWorld, originX:Float, originY:Float, directionX:Float, directionY:Float, maxFraction:Float, filter:flight._js.Physics2DQueryFilter):Void;
	@:native("flight_query_physics2d_ray_closest")
	public static function queryPhysics2dRayClosest(out:flight._js.Physics2DRayResult, world:flight._js.Physics2DWorld, originX:Float, originY:Float, directionX:Float, directionY:Float, maxFraction:Float, filter:flight._js.Physics2DQueryFilter):Void;
	@:native("flight_query_physics2d_region")
	public static function queryPhysics2dRegion(out:flight._js.Physics2DQueryResult, world:flight._js.Physics2DWorld, region:flight._js.SpatialAabb2D, filter:flight._js.Physics2DQueryFilter):Void;
	@:native("flight_query_physics2d_shape_cast")
	public static function queryPhysics2dShapeCast(out:flight._js.Physics2DShapeCastResult, world:flight._js.Physics2DWorld, registry:flight._js.CollisionRegistry2D, shape:flight._js.CollisionShape2D, dx:Float, dy:Float, maxFraction:Float, filter:flight._js.Physics2DQueryFilter):Void;
	@:native("flight_free_collision_shape2_d")
	public static function freeCollisionShape2D(ptr:flight._js.CollisionShape2D):Void;
	@:native("flight_free_physics2_ddebug_geometry")
	public static function freePhysics2DdebugGeometry(ptr:flight._js.Physics2DDebugGeometry):Void;
	@:native("flight_free_physics2_dcollision_explanation")
	public static function freePhysics2DcollisionExplanation(ptr:flight._js.Physics2DCollisionExplanation):Void;
	@:native("flight_free_physics2_djoint_resolution_explanation")
	public static function freePhysics2DjointResolutionExplanation(ptr:flight._js.Physics2DJointResolutionExplanation):Void;
	@:native("flight_free_physics2_dstep_explanation")
	public static function freePhysics2DstepExplanation(ptr:flight._js.Physics2DStepExplanation):Void;
	@:native("flight_free_physics2_djoint_reaction")
	public static function freePhysics2DjointReaction(ptr:flight._js.Physics2DJointReaction):Void;
	@:native("flight_free_physics2_djoint_solver_ref")
	public static function freePhysics2DjointSolverRef(ptr:flight._js.Physics2DJointSolverRef):Void;
	@:native("flight_free_physics2_dsolver_config")
	public static function freePhysics2DsolverConfig(ptr:flight._js.Physics2DSolverConfig):Void;
	@:native("flight_free_physics2_dworld")
	public static function freePhysics2Dworld(ptr:flight._js.Physics2DWorld):Void;
	@:native("flight_free_physics2_dquery_filter")
	public static function freePhysics2DqueryFilter(ptr:flight._js.Physics2DQueryFilter):Void;
	@:native("flight_free_physics2_dquery_result")
	public static function freePhysics2DqueryResult(ptr:flight._js.Physics2DQueryResult):Void;
	@:native("flight_free_physics2_dray_result")
	public static function freePhysics2DrayResult(ptr:flight._js.Physics2DRayResult):Void;
	@:native("flight_free_physics2_dshape_cast_result")
	public static function freePhysics2DshapeCastResult(ptr:flight._js.Physics2DShapeCastResult):Void;
}
