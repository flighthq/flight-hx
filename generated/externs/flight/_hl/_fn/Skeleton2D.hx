package flight._hl._fn;

extern class Skeleton2D {
	@:hlNative("flight", "flight_register_skeleton_2d_deform_animation_target")
	public static function registerSkeleton2dDeformAnimationTarget(registry:flight._hl.Skeleton2DAnimationTargetBinderRegistry):Void;
	@:hlNative("flight", "flight_is_skeleton_2d_stepped_channel_subject")
	public static function isSkeleton2dSteppedChannelSubject(subject:hl.Bytes):Bool;
	@:hlNative("flight", "flight_explain_skeleton_2d_deform_length")
	public static function explainSkeleton2dDeformLength(skin:flight._hl.Skin2D, vertices:hl.Bytes, verticesLen:Int, deform:hl.Bytes, deformLen:Int):flight._hl.Skeleton2DDeformLengthExplanation;
	@:hlNative("flight", "flight_register_skeleton_2d_ik_constraint_solver")
	public static function registerSkeleton2dIkConstraintSolver(registry:flight._hl.Skeleton2DConstraintRegistry):Void;
	@:hlNative("flight", "flight_solve_skeleton_2d_ik_constraint__skeleton2_dik_constraint")
	public static function solveSkeleton2dIkConstraintSkeleton2DikConstraint(skeleton:flight._hl.Skeleton2D, constraint:flight._hl.Skeleton2DIkConstraint):Void;
	@:hlNative("flight", "flight_solve_skeleton_2d_ik_constraint__skeleton2_dpath_constraint")
	public static function solveSkeleton2dIkConstraintSkeleton2DpathConstraint(skeleton:flight._hl.Skeleton2D, constraint:flight._hl.Skeleton2DPathConstraint):Void;
	@:hlNative("flight", "flight_solve_skeleton_2d_ik_constraint__skeleton2_dtransform_constraint")
	public static function solveSkeleton2dIkConstraintSkeleton2DtransformConstraint(skeleton:flight._hl.Skeleton2D, constraint:flight._hl.Skeleton2DTransformConstraint):Void;
	@:hlNative("flight", "flight_register_skeleton_2d_path_constraint_solver")
	public static function registerSkeleton2dPathConstraintSolver(registry:flight._hl.Skeleton2DConstraintRegistry):Void;
	@:hlNative("flight", "flight_solve_skeleton_2d_path_constraint__skeleton2_dik_constraint")
	public static function solveSkeleton2dPathConstraintSkeleton2DikConstraint(skeleton:flight._hl.Skeleton2D, constraint:flight._hl.Skeleton2DIkConstraint):Void;
	@:hlNative("flight", "flight_solve_skeleton_2d_path_constraint__skeleton2_dpath_constraint")
	public static function solveSkeleton2dPathConstraintSkeleton2DpathConstraint(skeleton:flight._hl.Skeleton2D, constraint:flight._hl.Skeleton2DPathConstraint):Void;
	@:hlNative("flight", "flight_solve_skeleton_2d_path_constraint__skeleton2_dtransform_constraint")
	public static function solveSkeleton2dPathConstraintSkeleton2DtransformConstraint(skeleton:flight._hl.Skeleton2D, constraint:flight._hl.Skeleton2DTransformConstraint):Void;
	@:hlNative("flight", "flight_compute_skeleton_2d_bone_matrices")
	public static function computeSkeleton2dBoneMatrices(skeleton:flight._hl.Skeleton2D):Void;
	@:hlNative("flight", "flight_compute_skeleton_2d_bone_world_transform")
	public static function computeSkeleton2dBoneWorldTransform(skeleton:flight._hl.Skeleton2D, boneIndex:Int):Void;
	@:hlNative("flight", "flight_compute_skeleton_2d_world_transforms")
	public static function computeSkeleton2dWorldTransforms(skeleton:flight._hl.Skeleton2D):Void;
	@:hlNative("flight", "flight_dispose_skeleton_2d")
	public static function disposeSkeleton2d(skeleton:flight._hl.Skeleton2D):Void;
	@:hlNative("flight", "flight_equals_skeleton_2d")
	public static function equalsSkeleton2d(a:flight._hl.Skeleton2D, b:flight._hl.Skeleton2D):Bool;
	@:hlNative("flight", "flight_get_skeleton_2d_bone_index_by_name")
	public static function getSkeleton2dBoneIndexByName(skeleton:flight._hl.Skeleton2D, name:hl.Bytes):Int;
	@:hlNative("flight", "flight_get_skeleton_2d_bone_world_matrix")
	public static function getSkeleton2dBoneWorldMatrix(out:flight._hl.Matrix, skeleton:flight._hl.Skeleton2D, boneIndex:Int):Bool;
	@:hlNative("flight", "flight_set_skeleton_2d_bind_pose")
	public static function setSkeleton2dBindPose(skeleton:flight._hl.Skeleton2D):Void;
	@:hlNative("flight", "flight_validate_skeleton_2d")
	public static function validateSkeleton2d(skeleton:flight._hl.Skeleton2D):hl.Bytes;
	@:hlNative("flight", "flight_create_skeleton_2d_bone_animation_target")
	public static function createSkeleton2dBoneAnimationTarget(boneIndex:Int, path:hl.Bytes):flight._hl.Skeleton2DAnimationTarget;
	@:hlNative("flight", "flight_create_skeleton_2d_slot_animation_target")
	public static function createSkeleton2dSlotAnimationTarget():flight._hl.Skeleton2DSlotAnimationTarget;
	@:hlNative("flight", "flight_find_skeleton_2d_step_keyframe")
	public static function findSkeleton2dStepKeyframe(times:hl.Bytes, timesLen:Int, time:Single):Int;
	@:hlNative("flight", "flight_get_skeleton_2d_animation_target_binder")
	public static function getSkeleton2dAnimationTargetBinder(registry:flight._hl.Skeleton2DAnimationTargetBinderRegistry, kind:hl.Bytes):flight._hl.Skeleton2DAnimationTargetBinder;
	@:hlNative("flight", "flight_get_skeleton_2d_animation_target_binder_kinds")
	public static function getSkeleton2dAnimationTargetBinderKinds(out:hl.Bytes, registry:flight._hl.Skeleton2DAnimationTargetBinderRegistry):Void;
	@:hlNative("flight", "flight_register_skeleton_2d_animation_target_binder")
	public static function registerSkeleton2dAnimationTargetBinder(registry:flight._hl.Skeleton2DAnimationTargetBinderRegistry, kind:hl.Bytes, bind:flight._hl.Skeleton2DAnimationTargetBinder):Void;
	@:hlNative("flight", "flight_unregister_skeleton_2d_animation_target_binder")
	public static function unregisterSkeleton2dAnimationTargetBinder(registry:flight._hl.Skeleton2DAnimationTargetBinderRegistry, kind:hl.Bytes):Void;
	@:hlNative("flight", "flight_solve_skeleton_2d_constraints")
	public static function solveSkeleton2dConstraints(registry:flight._hl.Skeleton2DConstraintRegistry, skeleton:flight._hl.Skeleton2D, constraints:hl.Bytes, constraintsLen:Int):Void;
	@:hlNative("flight", "flight_unregister_skeleton_2d_constraint_solver")
	public static function unregisterSkeleton2dConstraintSolver(registry:flight._hl.Skeleton2DConstraintRegistry, kind:hl.Bytes):Void;
	@:hlNative("flight", "flight_register_skeleton_2d_draw_order_animation_binder")
	public static function registerSkeleton2dDrawOrderAnimationBinder(registry:flight._hl.Skeleton2DAnimationTargetBinderRegistry):Void;
	@:hlNative("flight", "flight_unregister_skeleton_2d_draw_order_animation_binder")
	public static function unregisterSkeleton2dDrawOrderAnimationBinder(registry:flight._hl.Skeleton2DAnimationTargetBinderRegistry):Void;
	@:hlNative("flight", "flight_create_skin_2d")
	public static function createSkin2d(influenceCounts:hl.Bytes, influences:hl.Bytes):flight._hl.Skin2D;
	@:hlNative("flight", "flight_register_skeleton_2d_transform_constraint_solver")
	public static function registerSkeleton2dTransformConstraintSolver(registry:flight._hl.Skeleton2DConstraintRegistry):Void;
	@:hlNative("flight", "flight_solve_skeleton_2d_transform_constraint__skeleton2_dik_constraint")
	public static function solveSkeleton2dTransformConstraintSkeleton2DikConstraint(skeleton:flight._hl.Skeleton2D, constraint:flight._hl.Skeleton2DIkConstraint):Void;
	@:hlNative("flight", "flight_solve_skeleton_2d_transform_constraint__skeleton2_dpath_constraint")
	public static function solveSkeleton2dTransformConstraintSkeleton2DpathConstraint(skeleton:flight._hl.Skeleton2D, constraint:flight._hl.Skeleton2DPathConstraint):Void;
	@:hlNative("flight", "flight_solve_skeleton_2d_transform_constraint__skeleton2_dtransform_constraint")
	public static function solveSkeleton2dTransformConstraintSkeleton2DtransformConstraint(skeleton:flight._hl.Skeleton2D, constraint:flight._hl.Skeleton2DTransformConstraint):Void;
	@:hlNative("flight", "flight_free_skeleton2_ddeform_length_explanation")
	public static function freeSkeleton2DdeformLengthExplanation(ptr:flight._hl.Skeleton2DDeformLengthExplanation):Void;
	@:hlNative("flight", "flight_free_skeleton2_danimation_target")
	public static function freeSkeleton2DanimationTarget(ptr:flight._hl.Skeleton2DAnimationTarget):Void;
	@:hlNative("flight", "flight_free_skeleton2_dslot_animation_target")
	public static function freeSkeleton2DslotAnimationTarget(ptr:flight._hl.Skeleton2DSlotAnimationTarget):Void;
	@:hlNative("flight", "flight_free_skeleton2_danimation_target_binder")
	public static function freeSkeleton2DanimationTargetBinder(ptr:flight._hl.Skeleton2DAnimationTargetBinder):Void;
	@:hlNative("flight", "flight_free_skin2_d")
	public static function freeSkin2D(ptr:flight._hl.Skin2D):Void;
}
