package flight._hl._fn;

extern class Physics2dAbi {
	@:hlNative("flight", "flight_create_physics2d_abi")
	public static function createPhysics2dAbi():flight._hl.Physics2DAbi;
	@:hlNative("flight", "flight_create_physics2d_abi_world")
	public static function createPhysics2dAbiWorld(abi:flight._hl.Physics2DAbi):Int;
	@:hlNative("flight", "flight_destroy_physics2d_abi_world")
	public static function destroyPhysics2dAbiWorld(abi:flight._hl.Physics2DAbi, world:Int):Bool;
	@:hlNative("flight", "flight_execute_physics2d_abi_commands")
	public static function executePhysics2dAbiCommands(out:flight._hl.Physics2DAbiExecutionResult, abi:flight._hl.Physics2DAbi, world:Int, commands:flight._hl.Physics2DAbiCommandBuffer):Bool;
	@:hlNative("flight", "flight_get_physics2d_abi_world_status")
	public static function getPhysics2dAbiWorldStatus(abi:flight._hl.Physics2DAbi, world:Int):Int;
	@:hlNative("flight", "flight_read_physics2d_abi_bodies")
	public static function readPhysics2dAbiBodies(out:flight._hl.Physics2DAbiBodyBuffer, abi:flight._hl.Physics2DAbi, world:Int, bodyIds:hl.Bytes, bodyIdsLen:Int):Bool;
	@:hlNative("flight", "flight_read_physics2d_abi_contacts")
	public static function readPhysics2dAbiContacts(out:flight._hl.Physics2DAbiContactBuffer, abi:flight._hl.Physics2DAbi, world:Int, selection:Int):Bool;
	@:hlNative("flight", "flight_read_physics2d_abi_joints")
	public static function readPhysics2dAbiJoints(out:flight._hl.Physics2DAbiJointBuffer, abi:flight._hl.Physics2DAbi, world:Int):Bool;
	@:hlNative("flight", "flight_step_physics2d_abi_world")
	public static function stepPhysics2dAbiWorld(abi:flight._hl.Physics2DAbi, world:Int, dt:Float, hooks:flight._hl.Physics2DAbiContactHooks):Int;
	@:hlNative("flight", "flight_create_physics2d_abi_body_buffer")
	public static function createPhysics2dAbiBodyBuffer(capacity:Int):flight._hl.Physics2DAbiBodyBuffer;
	@:hlNative("flight", "flight_create_physics2d_abi_command_buffer")
	public static function createPhysics2dAbiCommandBuffer(byteCapacity:Int):flight._hl.Physics2DAbiCommandBuffer;
	@:hlNative("flight", "flight_create_physics2d_abi_contact_buffer")
	public static function createPhysics2dAbiContactBuffer(contactCapacity:Int, pointCapacity:Int):flight._hl.Physics2DAbiContactBuffer;
	@:hlNative("flight", "flight_create_physics2d_abi_execution_result")
	public static function createPhysics2dAbiExecutionResult():flight._hl.Physics2DAbiExecutionResult;
	@:hlNative("flight", "flight_create_physics2d_abi_joint_buffer")
	public static function createPhysics2dAbiJointBuffer(capacity:Int):flight._hl.Physics2DAbiJointBuffer;
	@:hlNative("flight", "flight_create_physics2d_abi_query_buffer")
	public static function createPhysics2dAbiQueryBuffer(capacity:Int):flight._hl.Physics2DAbiQueryBuffer;
	@:hlNative("flight", "flight_clear_physics2d_abi_command_buffer")
	public static function clearPhysics2dAbiCommandBuffer(out:flight._hl.Physics2DAbiCommandBuffer):Void;
	@:hlNative("flight", "flight_get_physics2d_abi_command_buffer_remaining_byte_length")
	public static function getPhysics2dAbiCommandBufferRemainingByteLength(buffer:flight._hl.Physics2DAbiCommandBuffer):Int;
	@:hlNative("flight", "flight_get_physics2d_abi_set_collider_command_byte_length")
	public static function getPhysics2dAbiSetColliderCommandByteLength(collider:flight._hl.Physics2DCollider):haxe.Int64;
	@:hlNative("flight", "flight_write_physics2d_abi_apply_force_at_point_command")
	public static function writePhysics2dAbiApplyForceAtPointCommand(out:flight._hl.Physics2DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, pointX:Float, pointY:Float):Bool;
	@:hlNative("flight", "flight_write_physics2d_abi_apply_force_command")
	public static function writePhysics2dAbiApplyForceCommand(out:flight._hl.Physics2DAbiCommandBuffer, bodyId:Int, x:Float, y:Float):Bool;
	@:hlNative("flight", "flight_write_physics2d_abi_apply_linear_impulse_at_point_command")
	public static function writePhysics2dAbiApplyLinearImpulseAtPointCommand(out:flight._hl.Physics2DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, pointX:Float, pointY:Float):Bool;
	@:hlNative("flight", "flight_write_physics2d_abi_apply_linear_impulse_command")
	public static function writePhysics2dAbiApplyLinearImpulseCommand(out:flight._hl.Physics2DAbiCommandBuffer, bodyId:Int, x:Float, y:Float):Bool;
	@:hlNative("flight", "flight_write_physics2d_abi_apply_torque_command")
	public static function writePhysics2dAbiApplyTorqueCommand(out:flight._hl.Physics2DAbiCommandBuffer, bodyId:Int, torque:Float):Bool;
	@:hlNative("flight", "flight_write_physics2d_abi_destroy_body_command")
	public static function writePhysics2dAbiDestroyBodyCommand(out:flight._hl.Physics2DAbiCommandBuffer, bodyId:Int):Bool;
	@:hlNative("flight", "flight_write_physics2d_abi_destroy_collider_command")
	public static function writePhysics2dAbiDestroyColliderCommand(out:flight._hl.Physics2DAbiCommandBuffer, colliderId:Int):Bool;
	@:hlNative("flight", "flight_write_physics2d_abi_destroy_joint_command")
	public static function writePhysics2dAbiDestroyJointCommand(out:flight._hl.Physics2DAbiCommandBuffer, jointId:Int):Bool;
	@:hlNative("flight", "flight_write_physics2d_abi_set_body_command")
	public static function writePhysics2dAbiSetBodyCommand(out:flight._hl.Physics2DAbiCommandBuffer, bodyId:Int, body:flight._hl.RigidBody2D):Bool;
	@:hlNative("flight", "flight_write_physics2d_abi_set_collider_command")
	public static function writePhysics2dAbiSetColliderCommand(out:flight._hl.Physics2DAbiCommandBuffer, colliderId:Int, bodyId:Int, collider:flight._hl.Physics2DCollider):Bool;
	@:hlNative("flight", "flight_write_physics2d_abi_set_gravity_command")
	public static function writePhysics2dAbiSetGravityCommand(out:flight._hl.Physics2DAbiCommandBuffer, x:Float, y:Float):Bool;
	@:hlNative("flight", "flight_write_physics2d_abi_set_joint_command__physics2_ddistance_joint")
	public static function writePhysics2dAbiSetJointCommandPhysics2DdistanceJoint(out:flight._hl.Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:flight._hl.Physics2DDistanceJoint):Bool;
	@:hlNative("flight", "flight_write_physics2d_abi_set_joint_command__physics2_dgear_joint")
	public static function writePhysics2dAbiSetJointCommandPhysics2DgearJoint(out:flight._hl.Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:flight._hl.Physics2DGearJoint):Bool;
	@:hlNative("flight", "flight_write_physics2d_abi_set_joint_command__physics2_dmouse_joint")
	public static function writePhysics2dAbiSetJointCommandPhysics2DmouseJoint(out:flight._hl.Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:flight._hl.Physics2DMouseJoint):Bool;
	@:hlNative("flight", "flight_write_physics2d_abi_set_joint_command__physics2_dprismatic_joint")
	public static function writePhysics2dAbiSetJointCommandPhysics2DprismaticJoint(out:flight._hl.Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:flight._hl.Physics2DPrismaticJoint):Bool;
	@:hlNative("flight", "flight_write_physics2d_abi_set_joint_command__physics2_dpulley_joint")
	public static function writePhysics2dAbiSetJointCommandPhysics2DpulleyJoint(out:flight._hl.Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:flight._hl.Physics2DPulleyJoint):Bool;
	@:hlNative("flight", "flight_write_physics2d_abi_set_joint_command__physics2_drevolute_joint")
	public static function writePhysics2dAbiSetJointCommandPhysics2DrevoluteJoint(out:flight._hl.Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:flight._hl.Physics2DRevoluteJoint):Bool;
	@:hlNative("flight", "flight_write_physics2d_abi_set_joint_command__physics2_drope_joint")
	public static function writePhysics2dAbiSetJointCommandPhysics2DropeJoint(out:flight._hl.Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:flight._hl.Physics2DRopeJoint):Bool;
	@:hlNative("flight", "flight_write_physics2d_abi_set_joint_command__physics2_dweld_joint")
	public static function writePhysics2dAbiSetJointCommandPhysics2DweldJoint(out:flight._hl.Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:flight._hl.Physics2DWeldJoint):Bool;
	@:hlNative("flight", "flight_write_physics2d_abi_set_joint_command__physics2_dwheel_joint")
	public static function writePhysics2dAbiSetJointCommandPhysics2DwheelJoint(out:flight._hl.Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:flight._hl.Physics2DWheelJoint):Bool;
	@:hlNative("flight", "flight_write_physics2d_abi_set_solver_config_command")
	public static function writePhysics2dAbiSetSolverConfigCommand(out:flight._hl.Physics2DAbiCommandBuffer, config:flight._hl.Physics2DSolverConfig):Bool;
	@:hlNative("flight", "flight_write_physics2d_abi_wake_body_command")
	public static function writePhysics2dAbiWakeBodyCommand(out:flight._hl.Physics2DAbiCommandBuffer, bodyId:Int):Bool;
	@:hlNative("flight", "flight_query_physics2d_abi_point")
	public static function queryPhysics2dAbiPoint(out:flight._hl.Physics2DAbiQueryBuffer, abi:flight._hl.Physics2DAbi, world:Int, x:Single, y:Single, filter:flight._hl.Physics2DQueryFilter):Bool;
	@:hlNative("flight", "flight_query_physics2d_abi_ray")
	public static function queryPhysics2dAbiRay(out:flight._hl.Physics2DAbiQueryBuffer, abi:flight._hl.Physics2DAbi, world:Int, originX:Single, originY:Single, directionX:Single, directionY:Single, maxFraction:Single, filter:flight._hl.Physics2DQueryFilter):Bool;
	@:hlNative("flight", "flight_query_physics2d_abi_ray_closest")
	public static function queryPhysics2dAbiRayClosest(out:flight._hl.Physics2DAbiQueryBuffer, abi:flight._hl.Physics2DAbi, world:Int, originX:Single, originY:Single, directionX:Single, directionY:Single, maxFraction:Single, filter:flight._hl.Physics2DQueryFilter):Bool;
	@:hlNative("flight", "flight_query_physics2d_abi_region")
	public static function queryPhysics2dAbiRegion(out:flight._hl.Physics2DAbiQueryBuffer, abi:flight._hl.Physics2DAbi, world:Int, region:flight._hl.SpatialAabb2D, filter:flight._hl.Physics2DQueryFilter):Bool;
	@:hlNative("flight", "flight_query_physics2d_abi_shape_cast")
	public static function queryPhysics2dAbiShapeCast(out:flight._hl.Physics2DAbiQueryBuffer, abi:flight._hl.Physics2DAbi, world:Int, shape:flight._hl.CollisionShape2D, dx:Single, dy:Single, maxFraction:Single, filter:flight._hl.Physics2DQueryFilter):Bool;
	@:hlNative("flight", "flight_create_reference_physics2d_abi")
	public static function createReferencePhysics2dAbi():flight._hl.Physics2DAbi;
	@:hlNative("flight", "flight_free_physics2_dabi")
	public static function freePhysics2Dabi(ptr:flight._hl.Physics2DAbi):Void;
	@:hlNative("flight", "flight_free_physics2_dabi_body_buffer")
	public static function freePhysics2DabiBodyBuffer(ptr:flight._hl.Physics2DAbiBodyBuffer):Void;
	@:hlNative("flight", "flight_free_physics2_dabi_command_buffer")
	public static function freePhysics2DabiCommandBuffer(ptr:flight._hl.Physics2DAbiCommandBuffer):Void;
	@:hlNative("flight", "flight_free_physics2_dabi_contact_buffer")
	public static function freePhysics2DabiContactBuffer(ptr:flight._hl.Physics2DAbiContactBuffer):Void;
	@:hlNative("flight", "flight_free_physics2_dabi_execution_result")
	public static function freePhysics2DabiExecutionResult(ptr:flight._hl.Physics2DAbiExecutionResult):Void;
	@:hlNative("flight", "flight_free_physics2_dabi_joint_buffer")
	public static function freePhysics2DabiJointBuffer(ptr:flight._hl.Physics2DAbiJointBuffer):Void;
	@:hlNative("flight", "flight_free_physics2_dabi_query_buffer")
	public static function freePhysics2DabiQueryBuffer(ptr:flight._hl.Physics2DAbiQueryBuffer):Void;
}
