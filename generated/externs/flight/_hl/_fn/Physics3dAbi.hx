package flight._hl._fn;

extern class Physics3dAbi {
	@:hlNative("flight", "flight_create_physics3d_abi")
	public static function createPhysics3dAbi():flight._hl.Physics3DAbi;
	@:hlNative("flight", "flight_create_physics3d_abi_world")
	public static function createPhysics3dAbiWorld(abi:flight._hl.Physics3DAbi):Int;
	@:hlNative("flight", "flight_destroy_physics3d_abi_world")
	public static function destroyPhysics3dAbiWorld(abi:flight._hl.Physics3DAbi, world:Int):Bool;
	@:hlNative("flight", "flight_execute_physics3d_abi_commands")
	public static function executePhysics3dAbiCommands(out:flight._hl.Physics3DAbiExecutionResult, abi:flight._hl.Physics3DAbi, world:Int, commands:flight._hl.Physics3DAbiCommandBuffer):Bool;
	@:hlNative("flight", "flight_get_physics3d_abi_world_status")
	public static function getPhysics3dAbiWorldStatus(abi:flight._hl.Physics3DAbi, world:Int):Int;
	@:hlNative("flight", "flight_read_physics3d_abi_bodies")
	public static function readPhysics3dAbiBodies(out:flight._hl.Physics3DAbiBodyBuffer, abi:flight._hl.Physics3DAbi, world:Int, bodyIds:hl.Bytes, bodyIdsLen:Int):Bool;
	@:hlNative("flight", "flight_read_physics3d_abi_contacts")
	public static function readPhysics3dAbiContacts(out:flight._hl.Physics3DAbiContactBuffer, abi:flight._hl.Physics3DAbi, world:Int, selection:Int):Bool;
	@:hlNative("flight", "flight_read_physics3d_abi_joints")
	public static function readPhysics3dAbiJoints(out:flight._hl.Physics3DAbiJointBuffer, abi:flight._hl.Physics3DAbi, world:Int):Bool;
	@:hlNative("flight", "flight_step_physics3d_abi_world")
	public static function stepPhysics3dAbiWorld(abi:flight._hl.Physics3DAbi, world:Int, dt:Single, hooks:flight._hl.Physics3DAbiContactHooks):Int;
	@:hlNative("flight", "flight_create_physics3d_abi_body_buffer")
	public static function createPhysics3dAbiBodyBuffer(capacity:Int):flight._hl.Physics3DAbiBodyBuffer;
	@:hlNative("flight", "flight_create_physics3d_abi_command_buffer")
	public static function createPhysics3dAbiCommandBuffer(byteCapacity:Int):flight._hl.Physics3DAbiCommandBuffer;
	@:hlNative("flight", "flight_create_physics3d_abi_contact_buffer")
	public static function createPhysics3dAbiContactBuffer(contactCapacity:Int, pointCapacity:Int):flight._hl.Physics3DAbiContactBuffer;
	@:hlNative("flight", "flight_create_physics3d_abi_execution_result")
	public static function createPhysics3dAbiExecutionResult():flight._hl.Physics3DAbiExecutionResult;
	@:hlNative("flight", "flight_create_physics3d_abi_joint_buffer")
	public static function createPhysics3dAbiJointBuffer(capacity:Int):flight._hl.Physics3DAbiJointBuffer;
	@:hlNative("flight", "flight_create_physics3d_abi_query_buffer")
	public static function createPhysics3dAbiQueryBuffer(capacity:Int):flight._hl.Physics3DAbiQueryBuffer;
	@:hlNative("flight", "flight_clear_physics3d_abi_command_buffer")
	public static function clearPhysics3dAbiCommandBuffer(out:flight._hl.Physics3DAbiCommandBuffer):Void;
	@:hlNative("flight", "flight_get_physics3d_abi_command_buffer_remaining_byte_length")
	public static function getPhysics3dAbiCommandBufferRemainingByteLength(buffer:flight._hl.Physics3DAbiCommandBuffer):Int;
	@:hlNative("flight", "flight_get_physics3d_abi_set_collider_command_byte_length")
	public static function getPhysics3dAbiSetColliderCommandByteLength(collider:flight._hl.Physics3DCollider):haxe.Int64;
	@:hlNative("flight", "flight_write_physics3d_abi_apply_force_at_point_command")
	public static function writePhysics3dAbiApplyForceAtPointCommand(out:flight._hl.Physics3DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, z:Float, pointX:Float, pointY:Float, pointZ:Float):Bool;
	@:hlNative("flight", "flight_write_physics3d_abi_apply_force_command")
	public static function writePhysics3dAbiApplyForceCommand(out:flight._hl.Physics3DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, z:Float):Bool;
	@:hlNative("flight", "flight_write_physics3d_abi_apply_linear_impulse_at_point_command")
	public static function writePhysics3dAbiApplyLinearImpulseAtPointCommand(out:flight._hl.Physics3DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, z:Float, pointX:Float, pointY:Float, pointZ:Float):Bool;
	@:hlNative("flight", "flight_write_physics3d_abi_apply_linear_impulse_command")
	public static function writePhysics3dAbiApplyLinearImpulseCommand(out:flight._hl.Physics3DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, z:Float):Bool;
	@:hlNative("flight", "flight_write_physics3d_abi_apply_torque_command")
	public static function writePhysics3dAbiApplyTorqueCommand(out:flight._hl.Physics3DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, z:Float):Bool;
	@:hlNative("flight", "flight_write_physics3d_abi_destroy_body_command")
	public static function writePhysics3dAbiDestroyBodyCommand(out:flight._hl.Physics3DAbiCommandBuffer, bodyId:Int):Bool;
	@:hlNative("flight", "flight_write_physics3d_abi_destroy_collider_command")
	public static function writePhysics3dAbiDestroyColliderCommand(out:flight._hl.Physics3DAbiCommandBuffer, colliderId:Int):Bool;
	@:hlNative("flight", "flight_write_physics3d_abi_destroy_joint_command")
	public static function writePhysics3dAbiDestroyJointCommand(out:flight._hl.Physics3DAbiCommandBuffer, jointId:Int):Bool;
	@:hlNative("flight", "flight_write_physics3d_abi_set_body_command")
	public static function writePhysics3dAbiSetBodyCommand(out:flight._hl.Physics3DAbiCommandBuffer, bodyId:Int, body:flight._hl.RigidBody3D):Bool;
	@:hlNative("flight", "flight_write_physics3d_abi_set_collider_command")
	public static function writePhysics3dAbiSetColliderCommand(out:flight._hl.Physics3DAbiCommandBuffer, colliderId:Int, bodyId:Int, collider:flight._hl.Physics3DCollider):Bool;
	@:hlNative("flight", "flight_write_physics3d_abi_set_gravity_command")
	public static function writePhysics3dAbiSetGravityCommand(out:flight._hl.Physics3DAbiCommandBuffer, x:Float, y:Float, z:Float):Bool;
	@:hlNative("flight", "flight_write_physics3d_abi_set_joint_command__physics3_dball_and_socket_joint")
	public static function writePhysics3dAbiSetJointCommandPhysics3DballAndSocketJoint(out:flight._hl.Physics3DAbiCommandBuffer, jointId:Int, joint:flight._hl.Physics3DBallAndSocketJoint):Bool;
	@:hlNative("flight", "flight_write_physics3d_abi_set_joint_command__physics3_dcone_twist_joint")
	public static function writePhysics3dAbiSetJointCommandPhysics3DconeTwistJoint(out:flight._hl.Physics3DAbiCommandBuffer, jointId:Int, joint:flight._hl.Physics3DConeTwistJoint):Bool;
	@:hlNative("flight", "flight_write_physics3d_abi_set_joint_command__physics3_ddistance_joint")
	public static function writePhysics3dAbiSetJointCommandPhysics3DdistanceJoint(out:flight._hl.Physics3DAbiCommandBuffer, jointId:Int, joint:flight._hl.Physics3DDistanceJoint):Bool;
	@:hlNative("flight", "flight_write_physics3d_abi_set_joint_command__physics3_dfixed_joint")
	public static function writePhysics3dAbiSetJointCommandPhysics3DfixedJoint(out:flight._hl.Physics3DAbiCommandBuffer, jointId:Int, joint:flight._hl.Physics3DFixedJoint):Bool;
	@:hlNative("flight", "flight_write_physics3d_abi_set_joint_command__physics3_dgeneric6_dof_joint")
	public static function writePhysics3dAbiSetJointCommandPhysics3Dgeneric6DofJoint(out:flight._hl.Physics3DAbiCommandBuffer, jointId:Int, joint:flight._hl.Physics3DGeneric6DofJoint):Bool;
	@:hlNative("flight", "flight_write_physics3d_abi_set_joint_command__physics3_dhinge_joint")
	public static function writePhysics3dAbiSetJointCommandPhysics3DhingeJoint(out:flight._hl.Physics3DAbiCommandBuffer, jointId:Int, joint:flight._hl.Physics3DHingeJoint):Bool;
	@:hlNative("flight", "flight_write_physics3d_abi_set_joint_command__physics3_dslider_joint")
	public static function writePhysics3dAbiSetJointCommandPhysics3DsliderJoint(out:flight._hl.Physics3DAbiCommandBuffer, jointId:Int, joint:flight._hl.Physics3DSliderJoint):Bool;
	@:hlNative("flight", "flight_write_physics3d_abi_set_solver_config_command")
	public static function writePhysics3dAbiSetSolverConfigCommand(out:flight._hl.Physics3DAbiCommandBuffer, config:flight._hl.Physics3DSolverConfig):Bool;
	@:hlNative("flight", "flight_write_physics3d_abi_wake_body_command")
	public static function writePhysics3dAbiWakeBodyCommand(out:flight._hl.Physics3DAbiCommandBuffer, bodyId:Int):Bool;
	@:hlNative("flight", "flight_query_physics3d_abi_point")
	public static function queryPhysics3dAbiPoint(out:flight._hl.Physics3DAbiQueryBuffer, abi:flight._hl.Physics3DAbi, world:Int, x:Single, y:Single, z:Single, filter:flight._hl.Physics3DQueryFilter):Bool;
	@:hlNative("flight", "flight_query_physics3d_abi_ray")
	public static function queryPhysics3dAbiRay(out:flight._hl.Physics3DAbiQueryBuffer, abi:flight._hl.Physics3DAbi, world:Int, originX:Single, originY:Single, originZ:Single, directionX:Single, directionY:Single, directionZ:Single, maxFraction:Single, filter:flight._hl.Physics3DQueryFilter):Bool;
	@:hlNative("flight", "flight_query_physics3d_abi_ray_closest")
	public static function queryPhysics3dAbiRayClosest(out:flight._hl.Physics3DAbiQueryBuffer, abi:flight._hl.Physics3DAbi, world:Int, originX:Single, originY:Single, originZ:Single, directionX:Single, directionY:Single, directionZ:Single, maxFraction:Single, filter:flight._hl.Physics3DQueryFilter):Bool;
	@:hlNative("flight", "flight_query_physics3d_abi_region")
	public static function queryPhysics3dAbiRegion(out:flight._hl.Physics3DAbiQueryBuffer, abi:flight._hl.Physics3DAbi, world:Int, region:flight._hl.SpatialAabb3D, filter:flight._hl.Physics3DQueryFilter):Bool;
	@:hlNative("flight", "flight_query_physics3d_abi_shape_cast")
	public static function queryPhysics3dAbiShapeCast(out:flight._hl.Physics3DAbiQueryBuffer, abi:flight._hl.Physics3DAbi, world:Int, shape:flight._hl.CollisionShape3D, dx:Single, dy:Single, dz:Single, maxFraction:Single, filter:flight._hl.Physics3DQueryFilter):Bool;
	@:hlNative("flight", "flight_create_reference_physics3d_abi")
	public static function createReferencePhysics3dAbi():flight._hl.Physics3DAbi;
	@:hlNative("flight", "flight_free_physics3_dabi")
	public static function freePhysics3Dabi(ptr:flight._hl.Physics3DAbi):Void;
	@:hlNative("flight", "flight_free_physics3_dabi_body_buffer")
	public static function freePhysics3DabiBodyBuffer(ptr:flight._hl.Physics3DAbiBodyBuffer):Void;
	@:hlNative("flight", "flight_free_physics3_dabi_command_buffer")
	public static function freePhysics3DabiCommandBuffer(ptr:flight._hl.Physics3DAbiCommandBuffer):Void;
	@:hlNative("flight", "flight_free_physics3_dabi_contact_buffer")
	public static function freePhysics3DabiContactBuffer(ptr:flight._hl.Physics3DAbiContactBuffer):Void;
	@:hlNative("flight", "flight_free_physics3_dabi_execution_result")
	public static function freePhysics3DabiExecutionResult(ptr:flight._hl.Physics3DAbiExecutionResult):Void;
	@:hlNative("flight", "flight_free_physics3_dabi_joint_buffer")
	public static function freePhysics3DabiJointBuffer(ptr:flight._hl.Physics3DAbiJointBuffer):Void;
	@:hlNative("flight", "flight_free_physics3_dabi_query_buffer")
	public static function freePhysics3DabiQueryBuffer(ptr:flight._hl.Physics3DAbiQueryBuffer):Void;
}
