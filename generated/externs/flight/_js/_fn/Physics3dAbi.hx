package flight._js._fn;

@:jsRequire("flight")
extern class Physics3dAbi {
	@:native("flight_create_physics3d_abi")
	public static function createPhysics3dAbi():flight._js.Physics3DAbi;
	@:native("flight_create_physics3d_abi_world")
	public static function createPhysics3dAbiWorld(abi:flight._js.Physics3DAbi):Int;
	@:native("flight_destroy_physics3d_abi_world")
	public static function destroyPhysics3dAbiWorld(abi:flight._js.Physics3DAbi, world:Int):Bool;
	@:native("flight_execute_physics3d_abi_commands")
	public static function executePhysics3dAbiCommands(out:flight._js.Physics3DAbiExecutionResult, abi:flight._js.Physics3DAbi, world:Int, commands:flight._js.Physics3DAbiCommandBuffer):Bool;
	@:native("flight_get_physics3d_abi_world_status")
	public static function getPhysics3dAbiWorldStatus(abi:flight._js.Physics3DAbi, world:Int):Int;
	@:native("flight_read_physics3d_abi_bodies")
	public static function readPhysics3dAbiBodies(out:flight._js.Physics3DAbiBodyBuffer, abi:flight._js.Physics3DAbi, world:Int, bodyIds:Dynamic, bodyIdsLen:Int):Bool;
	@:native("flight_read_physics3d_abi_contacts")
	public static function readPhysics3dAbiContacts(out:flight._js.Physics3DAbiContactBuffer, abi:flight._js.Physics3DAbi, world:Int, selection:Int):Bool;
	@:native("flight_read_physics3d_abi_joints")
	public static function readPhysics3dAbiJoints(out:flight._js.Physics3DAbiJointBuffer, abi:flight._js.Physics3DAbi, world:Int):Bool;
	@:native("flight_step_physics3d_abi_world")
	public static function stepPhysics3dAbiWorld(abi:flight._js.Physics3DAbi, world:Int, dt:Float, hooks:flight._js.Physics3DAbiContactHooks):Int;
	@:native("flight_create_physics3d_abi_body_buffer")
	public static function createPhysics3dAbiBodyBuffer(capacity:Int):flight._js.Physics3DAbiBodyBuffer;
	@:native("flight_create_physics3d_abi_command_buffer")
	public static function createPhysics3dAbiCommandBuffer(byteCapacity:Int):flight._js.Physics3DAbiCommandBuffer;
	@:native("flight_create_physics3d_abi_contact_buffer")
	public static function createPhysics3dAbiContactBuffer(contactCapacity:Int, pointCapacity:Int):flight._js.Physics3DAbiContactBuffer;
	@:native("flight_create_physics3d_abi_execution_result")
	public static function createPhysics3dAbiExecutionResult():flight._js.Physics3DAbiExecutionResult;
	@:native("flight_create_physics3d_abi_joint_buffer")
	public static function createPhysics3dAbiJointBuffer(capacity:Int):flight._js.Physics3DAbiJointBuffer;
	@:native("flight_create_physics3d_abi_query_buffer")
	public static function createPhysics3dAbiQueryBuffer(capacity:Int):flight._js.Physics3DAbiQueryBuffer;
	@:native("flight_clear_physics3d_abi_command_buffer")
	public static function clearPhysics3dAbiCommandBuffer(out:flight._js.Physics3DAbiCommandBuffer):Void;
	@:native("flight_get_physics3d_abi_command_buffer_remaining_byte_length")
	public static function getPhysics3dAbiCommandBufferRemainingByteLength(buffer:flight._js.Physics3DAbiCommandBuffer):Int;
	@:native("flight_get_physics3d_abi_set_collider_command_byte_length")
	public static function getPhysics3dAbiSetColliderCommandByteLength(collider:flight._js.Physics3DCollider):haxe.Int64;
	@:native("flight_write_physics3d_abi_apply_force_at_point_command")
	public static function writePhysics3dAbiApplyForceAtPointCommand(out:flight._js.Physics3DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, z:Float, pointX:Float, pointY:Float, pointZ:Float):Bool;
	@:native("flight_write_physics3d_abi_apply_force_command")
	public static function writePhysics3dAbiApplyForceCommand(out:flight._js.Physics3DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, z:Float):Bool;
	@:native("flight_write_physics3d_abi_apply_linear_impulse_at_point_command")
	public static function writePhysics3dAbiApplyLinearImpulseAtPointCommand(out:flight._js.Physics3DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, z:Float, pointX:Float, pointY:Float, pointZ:Float):Bool;
	@:native("flight_write_physics3d_abi_apply_linear_impulse_command")
	public static function writePhysics3dAbiApplyLinearImpulseCommand(out:flight._js.Physics3DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, z:Float):Bool;
	@:native("flight_write_physics3d_abi_apply_torque_command")
	public static function writePhysics3dAbiApplyTorqueCommand(out:flight._js.Physics3DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, z:Float):Bool;
	@:native("flight_write_physics3d_abi_destroy_body_command")
	public static function writePhysics3dAbiDestroyBodyCommand(out:flight._js.Physics3DAbiCommandBuffer, bodyId:Int):Bool;
	@:native("flight_write_physics3d_abi_destroy_collider_command")
	public static function writePhysics3dAbiDestroyColliderCommand(out:flight._js.Physics3DAbiCommandBuffer, colliderId:Int):Bool;
	@:native("flight_write_physics3d_abi_destroy_joint_command")
	public static function writePhysics3dAbiDestroyJointCommand(out:flight._js.Physics3DAbiCommandBuffer, jointId:Int):Bool;
	@:native("flight_write_physics3d_abi_set_body_command")
	public static function writePhysics3dAbiSetBodyCommand(out:flight._js.Physics3DAbiCommandBuffer, bodyId:Int, body:flight._js.RigidBody3D):Bool;
	@:native("flight_write_physics3d_abi_set_collider_command")
	public static function writePhysics3dAbiSetColliderCommand(out:flight._js.Physics3DAbiCommandBuffer, colliderId:Int, bodyId:Int, collider:flight._js.Physics3DCollider):Bool;
	@:native("flight_write_physics3d_abi_set_gravity_command")
	public static function writePhysics3dAbiSetGravityCommand(out:flight._js.Physics3DAbiCommandBuffer, x:Float, y:Float, z:Float):Bool;
	@:native("flight_write_physics3d_abi_set_joint_command__physics3_dball_and_socket_joint")
	public static function writePhysics3dAbiSetJointCommandPhysics3DballAndSocketJoint(out:flight._js.Physics3DAbiCommandBuffer, jointId:Int, joint:flight._js.Physics3DBallAndSocketJoint):Bool;
	@:native("flight_write_physics3d_abi_set_joint_command__physics3_dcone_twist_joint")
	public static function writePhysics3dAbiSetJointCommandPhysics3DconeTwistJoint(out:flight._js.Physics3DAbiCommandBuffer, jointId:Int, joint:flight._js.Physics3DConeTwistJoint):Bool;
	@:native("flight_write_physics3d_abi_set_joint_command__physics3_ddistance_joint")
	public static function writePhysics3dAbiSetJointCommandPhysics3DdistanceJoint(out:flight._js.Physics3DAbiCommandBuffer, jointId:Int, joint:flight._js.Physics3DDistanceJoint):Bool;
	@:native("flight_write_physics3d_abi_set_joint_command__physics3_dfixed_joint")
	public static function writePhysics3dAbiSetJointCommandPhysics3DfixedJoint(out:flight._js.Physics3DAbiCommandBuffer, jointId:Int, joint:flight._js.Physics3DFixedJoint):Bool;
	@:native("flight_write_physics3d_abi_set_joint_command__physics3_dgeneric6_dof_joint")
	public static function writePhysics3dAbiSetJointCommandPhysics3Dgeneric6DofJoint(out:flight._js.Physics3DAbiCommandBuffer, jointId:Int, joint:flight._js.Physics3DGeneric6DofJoint):Bool;
	@:native("flight_write_physics3d_abi_set_joint_command__physics3_dhinge_joint")
	public static function writePhysics3dAbiSetJointCommandPhysics3DhingeJoint(out:flight._js.Physics3DAbiCommandBuffer, jointId:Int, joint:flight._js.Physics3DHingeJoint):Bool;
	@:native("flight_write_physics3d_abi_set_joint_command__physics3_dslider_joint")
	public static function writePhysics3dAbiSetJointCommandPhysics3DsliderJoint(out:flight._js.Physics3DAbiCommandBuffer, jointId:Int, joint:flight._js.Physics3DSliderJoint):Bool;
	@:native("flight_write_physics3d_abi_set_solver_config_command")
	public static function writePhysics3dAbiSetSolverConfigCommand(out:flight._js.Physics3DAbiCommandBuffer, config:flight._js.Physics3DSolverConfig):Bool;
	@:native("flight_write_physics3d_abi_wake_body_command")
	public static function writePhysics3dAbiWakeBodyCommand(out:flight._js.Physics3DAbiCommandBuffer, bodyId:Int):Bool;
	@:native("flight_query_physics3d_abi_point")
	public static function queryPhysics3dAbiPoint(out:flight._js.Physics3DAbiQueryBuffer, abi:flight._js.Physics3DAbi, world:Int, x:Float, y:Float, z:Float, filter:flight._js.Physics3DQueryFilter):Bool;
	@:native("flight_query_physics3d_abi_ray")
	public static function queryPhysics3dAbiRay(out:flight._js.Physics3DAbiQueryBuffer, abi:flight._js.Physics3DAbi, world:Int, originX:Float, originY:Float, originZ:Float, directionX:Float, directionY:Float, directionZ:Float, maxFraction:Float, filter:flight._js.Physics3DQueryFilter):Bool;
	@:native("flight_query_physics3d_abi_ray_closest")
	public static function queryPhysics3dAbiRayClosest(out:flight._js.Physics3DAbiQueryBuffer, abi:flight._js.Physics3DAbi, world:Int, originX:Float, originY:Float, originZ:Float, directionX:Float, directionY:Float, directionZ:Float, maxFraction:Float, filter:flight._js.Physics3DQueryFilter):Bool;
	@:native("flight_query_physics3d_abi_region")
	public static function queryPhysics3dAbiRegion(out:flight._js.Physics3DAbiQueryBuffer, abi:flight._js.Physics3DAbi, world:Int, region:flight._js.SpatialAabb3D, filter:flight._js.Physics3DQueryFilter):Bool;
	@:native("flight_query_physics3d_abi_shape_cast")
	public static function queryPhysics3dAbiShapeCast(out:flight._js.Physics3DAbiQueryBuffer, abi:flight._js.Physics3DAbi, world:Int, shape:flight._js.CollisionShape3D, dx:Float, dy:Float, dz:Float, maxFraction:Float, filter:flight._js.Physics3DQueryFilter):Bool;
	@:native("flight_create_reference_physics3d_abi")
	public static function createReferencePhysics3dAbi():flight._js.Physics3DAbi;
	@:native("flight_free_physics3_dabi")
	public static function freePhysics3Dabi(ptr:flight._js.Physics3DAbi):Void;
	@:native("flight_free_physics3_dabi_body_buffer")
	public static function freePhysics3DabiBodyBuffer(ptr:flight._js.Physics3DAbiBodyBuffer):Void;
	@:native("flight_free_physics3_dabi_command_buffer")
	public static function freePhysics3DabiCommandBuffer(ptr:flight._js.Physics3DAbiCommandBuffer):Void;
	@:native("flight_free_physics3_dabi_contact_buffer")
	public static function freePhysics3DabiContactBuffer(ptr:flight._js.Physics3DAbiContactBuffer):Void;
	@:native("flight_free_physics3_dabi_execution_result")
	public static function freePhysics3DabiExecutionResult(ptr:flight._js.Physics3DAbiExecutionResult):Void;
	@:native("flight_free_physics3_dabi_joint_buffer")
	public static function freePhysics3DabiJointBuffer(ptr:flight._js.Physics3DAbiJointBuffer):Void;
	@:native("flight_free_physics3_dabi_query_buffer")
	public static function freePhysics3DabiQueryBuffer(ptr:flight._js.Physics3DAbiQueryBuffer):Void;
}
