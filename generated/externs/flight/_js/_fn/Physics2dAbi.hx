package flight._js._fn;

@:jsRequire("flight")
extern class Physics2dAbi {
	@:native("flight_create_physics2d_abi")
	public static function createPhysics2dAbi():flight._js.Physics2DAbi;
	@:native("flight_create_physics2d_abi_world")
	public static function createPhysics2dAbiWorld(abi:flight._js.Physics2DAbi):Int;
	@:native("flight_destroy_physics2d_abi_world")
	public static function destroyPhysics2dAbiWorld(abi:flight._js.Physics2DAbi, world:Int):Bool;
	@:native("flight_execute_physics2d_abi_commands")
	public static function executePhysics2dAbiCommands(out:flight._js.Physics2DAbiExecutionResult, abi:flight._js.Physics2DAbi, world:Int, commands:flight._js.Physics2DAbiCommandBuffer):Bool;
	@:native("flight_get_physics2d_abi_world_status")
	public static function getPhysics2dAbiWorldStatus(abi:flight._js.Physics2DAbi, world:Int):Int;
	@:native("flight_read_physics2d_abi_bodies")
	public static function readPhysics2dAbiBodies(out:flight._js.Physics2DAbiBodyBuffer, abi:flight._js.Physics2DAbi, world:Int, bodyIds:Dynamic, bodyIdsLen:Int):Bool;
	@:native("flight_read_physics2d_abi_contacts")
	public static function readPhysics2dAbiContacts(out:flight._js.Physics2DAbiContactBuffer, abi:flight._js.Physics2DAbi, world:Int, selection:Int):Bool;
	@:native("flight_read_physics2d_abi_joints")
	public static function readPhysics2dAbiJoints(out:flight._js.Physics2DAbiJointBuffer, abi:flight._js.Physics2DAbi, world:Int):Bool;
	@:native("flight_step_physics2d_abi_world")
	public static function stepPhysics2dAbiWorld(abi:flight._js.Physics2DAbi, world:Int, dt:Float, hooks:flight._js.Physics2DAbiContactHooks):Int;
	@:native("flight_create_physics2d_abi_body_buffer")
	public static function createPhysics2dAbiBodyBuffer(capacity:Int):flight._js.Physics2DAbiBodyBuffer;
	@:native("flight_create_physics2d_abi_command_buffer")
	public static function createPhysics2dAbiCommandBuffer(byteCapacity:haxe.Int64):flight._js.Physics2DAbiCommandBuffer;
	@:native("flight_create_physics2d_abi_contact_buffer")
	public static function createPhysics2dAbiContactBuffer(contactCapacity:Int, pointCapacity:Int):flight._js.Physics2DAbiContactBuffer;
	@:native("flight_create_physics2d_abi_execution_result")
	public static function createPhysics2dAbiExecutionResult():flight._js.Physics2DAbiExecutionResult;
	@:native("flight_create_physics2d_abi_joint_buffer")
	public static function createPhysics2dAbiJointBuffer(capacity:Int):flight._js.Physics2DAbiJointBuffer;
	@:native("flight_create_physics2d_abi_query_buffer")
	public static function createPhysics2dAbiQueryBuffer(capacity:Int):flight._js.Physics2DAbiQueryBuffer;
	@:native("flight_clear_physics2d_abi_command_buffer")
	public static function clearPhysics2dAbiCommandBuffer(out:flight._js.Physics2DAbiCommandBuffer):Void;
	@:native("flight_get_physics2d_abi_command_buffer_remaining_byte_length")
	public static function getPhysics2dAbiCommandBufferRemainingByteLength(buffer:flight._js.Physics2DAbiCommandBuffer):Int;
	@:native("flight_get_physics2d_abi_set_collider_command_byte_length")
	public static function getPhysics2dAbiSetColliderCommandByteLength(collider:flight._js.Physics2DCollider):haxe.Int64;
	@:native("flight_write_physics2d_abi_apply_force_at_point_command")
	public static function writePhysics2dAbiApplyForceAtPointCommand(out:flight._js.Physics2DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, pointX:Float, pointY:Float):Bool;
	@:native("flight_write_physics2d_abi_apply_force_command")
	public static function writePhysics2dAbiApplyForceCommand(out:flight._js.Physics2DAbiCommandBuffer, bodyId:Int, x:Float, y:Float):Bool;
	@:native("flight_write_physics2d_abi_apply_linear_impulse_at_point_command")
	public static function writePhysics2dAbiApplyLinearImpulseAtPointCommand(out:flight._js.Physics2DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, pointX:Float, pointY:Float):Bool;
	@:native("flight_write_physics2d_abi_apply_linear_impulse_command")
	public static function writePhysics2dAbiApplyLinearImpulseCommand(out:flight._js.Physics2DAbiCommandBuffer, bodyId:Int, x:Float, y:Float):Bool;
	@:native("flight_write_physics2d_abi_apply_torque_command")
	public static function writePhysics2dAbiApplyTorqueCommand(out:flight._js.Physics2DAbiCommandBuffer, bodyId:Int, torque:Float):Bool;
	@:native("flight_write_physics2d_abi_destroy_body_command")
	public static function writePhysics2dAbiDestroyBodyCommand(out:flight._js.Physics2DAbiCommandBuffer, bodyId:Int):Bool;
	@:native("flight_write_physics2d_abi_destroy_collider_command")
	public static function writePhysics2dAbiDestroyColliderCommand(out:flight._js.Physics2DAbiCommandBuffer, colliderId:Int):Bool;
	@:native("flight_write_physics2d_abi_destroy_joint_command")
	public static function writePhysics2dAbiDestroyJointCommand(out:flight._js.Physics2DAbiCommandBuffer, jointId:Int):Bool;
	@:native("flight_write_physics2d_abi_set_body_command")
	public static function writePhysics2dAbiSetBodyCommand(out:flight._js.Physics2DAbiCommandBuffer, bodyId:Int, body:flight._js.RigidBody2D):Bool;
	@:native("flight_write_physics2d_abi_set_collider_command")
	public static function writePhysics2dAbiSetColliderCommand(out:flight._js.Physics2DAbiCommandBuffer, colliderId:Int, bodyId:Int, collider:flight._js.Physics2DCollider):Bool;
	@:native("flight_write_physics2d_abi_set_gravity_command")
	public static function writePhysics2dAbiSetGravityCommand(out:flight._js.Physics2DAbiCommandBuffer, x:Float, y:Float):Bool;
	@:native("flight_write_physics2d_abi_set_joint_command__physics2_ddistance_joint")
	public static function writePhysics2dAbiSetJointCommandPhysics2DdistanceJoint(out:flight._js.Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:flight._js.Physics2DDistanceJoint):Bool;
	@:native("flight_write_physics2d_abi_set_joint_command__physics2_dgear_joint")
	public static function writePhysics2dAbiSetJointCommandPhysics2DgearJoint(out:flight._js.Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:flight._js.Physics2DGearJoint):Bool;
	@:native("flight_write_physics2d_abi_set_joint_command__physics2_dmouse_joint")
	public static function writePhysics2dAbiSetJointCommandPhysics2DmouseJoint(out:flight._js.Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:flight._js.Physics2DMouseJoint):Bool;
	@:native("flight_write_physics2d_abi_set_joint_command__physics2_dprismatic_joint")
	public static function writePhysics2dAbiSetJointCommandPhysics2DprismaticJoint(out:flight._js.Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:flight._js.Physics2DPrismaticJoint):Bool;
	@:native("flight_write_physics2d_abi_set_joint_command__physics2_dpulley_joint")
	public static function writePhysics2dAbiSetJointCommandPhysics2DpulleyJoint(out:flight._js.Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:flight._js.Physics2DPulleyJoint):Bool;
	@:native("flight_write_physics2d_abi_set_joint_command__physics2_drevolute_joint")
	public static function writePhysics2dAbiSetJointCommandPhysics2DrevoluteJoint(out:flight._js.Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:flight._js.Physics2DRevoluteJoint):Bool;
	@:native("flight_write_physics2d_abi_set_joint_command__physics2_drope_joint")
	public static function writePhysics2dAbiSetJointCommandPhysics2DropeJoint(out:flight._js.Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:flight._js.Physics2DRopeJoint):Bool;
	@:native("flight_write_physics2d_abi_set_joint_command__physics2_dweld_joint")
	public static function writePhysics2dAbiSetJointCommandPhysics2DweldJoint(out:flight._js.Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:flight._js.Physics2DWeldJoint):Bool;
	@:native("flight_write_physics2d_abi_set_joint_command__physics2_dwheel_joint")
	public static function writePhysics2dAbiSetJointCommandPhysics2DwheelJoint(out:flight._js.Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:flight._js.Physics2DWheelJoint):Bool;
	@:native("flight_write_physics2d_abi_set_solver_config_command")
	public static function writePhysics2dAbiSetSolverConfigCommand(out:flight._js.Physics2DAbiCommandBuffer, config:flight._js.Physics2DSolverConfig):Bool;
	@:native("flight_write_physics2d_abi_wake_body_command")
	public static function writePhysics2dAbiWakeBodyCommand(out:flight._js.Physics2DAbiCommandBuffer, bodyId:Int):Bool;
	@:native("flight_query_physics2d_abi_point")
	public static function queryPhysics2dAbiPoint(out:flight._js.Physics2DAbiQueryBuffer, abi:flight._js.Physics2DAbi, world:Int, x:Float, y:Float, filter:flight._js.Physics2DQueryFilter):Bool;
	@:native("flight_query_physics2d_abi_ray")
	public static function queryPhysics2dAbiRay(out:flight._js.Physics2DAbiQueryBuffer, abi:flight._js.Physics2DAbi, world:Int, originX:Float, originY:Float, directionX:Float, directionY:Float, maxFraction:Float, filter:flight._js.Physics2DQueryFilter):Bool;
	@:native("flight_query_physics2d_abi_ray_closest")
	public static function queryPhysics2dAbiRayClosest(out:flight._js.Physics2DAbiQueryBuffer, abi:flight._js.Physics2DAbi, world:Int, originX:Float, originY:Float, directionX:Float, directionY:Float, maxFraction:Float, filter:flight._js.Physics2DQueryFilter):Bool;
	@:native("flight_query_physics2d_abi_region")
	public static function queryPhysics2dAbiRegion(out:flight._js.Physics2DAbiQueryBuffer, abi:flight._js.Physics2DAbi, world:Int, region:flight._js.SpatialAabb2D, filter:flight._js.Physics2DQueryFilter):Bool;
	@:native("flight_query_physics2d_abi_shape_cast")
	public static function queryPhysics2dAbiShapeCast(out:flight._js.Physics2DAbiQueryBuffer, abi:flight._js.Physics2DAbi, world:Int, shape:flight._js.CollisionShape2D, dx:Float, dy:Float, maxFraction:Float, filter:flight._js.Physics2DQueryFilter):Bool;
	@:native("flight_create_reference_physics2d_abi")
	public static function createReferencePhysics2dAbi():flight._js.Physics2DAbi;
	@:native("flight_free_physics2_dabi")
	public static function freePhysics2Dabi(ptr:flight._js.Physics2DAbi):Void;
	@:native("flight_free_physics2_dabi_body_buffer")
	public static function freePhysics2DabiBodyBuffer(ptr:flight._js.Physics2DAbiBodyBuffer):Void;
	@:native("flight_free_physics2_dabi_command_buffer")
	public static function freePhysics2DabiCommandBuffer(ptr:flight._js.Physics2DAbiCommandBuffer):Void;
	@:native("flight_free_physics2_dabi_contact_buffer")
	public static function freePhysics2DabiContactBuffer(ptr:flight._js.Physics2DAbiContactBuffer):Void;
	@:native("flight_free_physics2_dabi_execution_result")
	public static function freePhysics2DabiExecutionResult(ptr:flight._js.Physics2DAbiExecutionResult):Void;
	@:native("flight_free_physics2_dabi_joint_buffer")
	public static function freePhysics2DabiJointBuffer(ptr:flight._js.Physics2DAbiJointBuffer):Void;
	@:native("flight_free_physics2_dabi_query_buffer")
	public static function freePhysics2DabiQueryBuffer(ptr:flight._js.Physics2DAbiQueryBuffer):Void;
}
