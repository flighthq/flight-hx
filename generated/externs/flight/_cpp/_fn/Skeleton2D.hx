package flight._cpp._fn;

extern class Skeleton2D {
	@:native("flight_register_skeleton_2d_deform_animation_target")
	public static function registerSkeleton2dDeformAnimationTarget(registry:flight._cpp.Skeleton2DAnimationTargetBinderRegistry):Void;
	@:native("flight_is_skeleton_2d_stepped_channel_subject")
	public static function isSkeleton2dSteppedChannelSubject(subject:cpp.ConstCharStar):Bool;
	@:native("flight_explain_skeleton_2d_deform_length")
	public static function explainSkeleton2dDeformLength(skin:flight._cpp.Skin2D, vertices:cpp.Star<cpp.Void>, verticesLen:Int, deform:cpp.Star<cpp.Void>, deformLen:Int):flight._cpp.Skeleton2DDeformLengthExplanation;
	@:native("flight_register_skeleton_2d_ik_constraint_solver")
	public static function registerSkeleton2dIkConstraintSolver(registry:flight._cpp.Skeleton2DConstraintRegistry):Void;
	@:native("flight_solve_skeleton_2d_ik_constraint__skeleton2_dik_constraint")
	public static function solveSkeleton2dIkConstraintSkeleton2DikConstraint(skeleton:flight._cpp.Skeleton2D, constraint:flight._cpp.Skeleton2DIkConstraint):Void;
	@:native("flight_solve_skeleton_2d_ik_constraint__skeleton2_dpath_constraint")
	public static function solveSkeleton2dIkConstraintSkeleton2DpathConstraint(skeleton:flight._cpp.Skeleton2D, constraint:flight._cpp.Skeleton2DPathConstraint):Void;
	@:native("flight_solve_skeleton_2d_ik_constraint__skeleton2_dtransform_constraint")
	public static function solveSkeleton2dIkConstraintSkeleton2DtransformConstraint(skeleton:flight._cpp.Skeleton2D, constraint:flight._cpp.Skeleton2DTransformConstraint):Void;
	@:native("flight_register_skeleton_2d_path_constraint_solver")
	public static function registerSkeleton2dPathConstraintSolver(registry:flight._cpp.Skeleton2DConstraintRegistry):Void;
	@:native("flight_solve_skeleton_2d_path_constraint__skeleton2_dik_constraint")
	public static function solveSkeleton2dPathConstraintSkeleton2DikConstraint(skeleton:flight._cpp.Skeleton2D, constraint:flight._cpp.Skeleton2DIkConstraint):Void;
	@:native("flight_solve_skeleton_2d_path_constraint__skeleton2_dpath_constraint")
	public static function solveSkeleton2dPathConstraintSkeleton2DpathConstraint(skeleton:flight._cpp.Skeleton2D, constraint:flight._cpp.Skeleton2DPathConstraint):Void;
	@:native("flight_solve_skeleton_2d_path_constraint__skeleton2_dtransform_constraint")
	public static function solveSkeleton2dPathConstraintSkeleton2DtransformConstraint(skeleton:flight._cpp.Skeleton2D, constraint:flight._cpp.Skeleton2DTransformConstraint):Void;
	@:native("flight_compute_skeleton_2d_bone_matrices")
	public static function computeSkeleton2dBoneMatrices(skeleton:flight._cpp.Skeleton2D):Void;
	@:native("flight_compute_skeleton_2d_bone_world_transform")
	public static function computeSkeleton2dBoneWorldTransform(skeleton:flight._cpp.Skeleton2D, boneIndex:Int):Void;
	@:native("flight_compute_skeleton_2d_world_transforms")
	public static function computeSkeleton2dWorldTransforms(skeleton:flight._cpp.Skeleton2D):Void;
	@:native("flight_dispose_skeleton_2d")
	public static function disposeSkeleton2d(skeleton:flight._cpp.Skeleton2D):Void;
	@:native("flight_equals_skeleton_2d")
	public static function equalsSkeleton2d(a:flight._cpp.Skeleton2D, b:flight._cpp.Skeleton2D):Bool;
	@:native("flight_get_skeleton_2d_bone_index_by_name")
	public static function getSkeleton2dBoneIndexByName(skeleton:flight._cpp.Skeleton2D, name:cpp.ConstCharStar):Int;
	@:native("flight_get_skeleton_2d_bone_world_matrix")
	public static function getSkeleton2dBoneWorldMatrix(out:flight._cpp.Matrix, skeleton:flight._cpp.Skeleton2D, boneIndex:Int):Bool;
	@:native("flight_set_skeleton_2d_bind_pose")
	public static function setSkeleton2dBindPose(skeleton:flight._cpp.Skeleton2D):Void;
	@:native("flight_validate_skeleton_2d")
	public static function validateSkeleton2d(skeleton:flight._cpp.Skeleton2D):cpp.ConstCharStar;
	@:native("flight_create_skeleton_2d_animation_target_handle")
	public static function createSkeleton2dAnimationTargetHandle(kind:cpp.ConstCharStar, target:flight._cpp.Unknown):flight._cpp.Skeleton2DAnimationTargetHandle;
	@:native("flight_create_skeleton_2d_animation_target_registry")
	public static function createSkeleton2dAnimationTargetRegistry():flight._cpp.Skeleton2DAnimationTargetBinderRegistry;
	@:native("flight_create_skeleton_2d_bone_animation_target")
	public static function createSkeleton2dBoneAnimationTarget(boneIndex:Int, path:cpp.ConstCharStar):flight._cpp.Skeleton2DAnimationTarget;
	@:native("flight_create_skeleton_2d_slot_animation_target")
	public static function createSkeleton2dSlotAnimationTarget():flight._cpp.Skeleton2DSlotAnimationTarget;
	@:native("flight_find_skeleton_2d_step_keyframe")
	public static function findSkeleton2dStepKeyframe(times:cpp.Star<cpp.Void>, timesLen:Int, time:Single):Int;
	@:native("flight_get_skeleton_2d_animation_target_binder")
	public static function getSkeleton2dAnimationTargetBinder(registry:flight._cpp.Skeleton2DAnimationTargetBinderRegistry, kind:cpp.ConstCharStar):flight._cpp.Skeleton2DAnimationTargetBinder;
	@:native("flight_get_skeleton_2d_animation_target_binder_kinds")
	public static function getSkeleton2dAnimationTargetBinderKinds(out:cpp.Star<cpp.Void>, registry:flight._cpp.Skeleton2DAnimationTargetBinderRegistry):Void;
	@:native("flight_register_skeleton_2d_animation_target_binder")
	public static function registerSkeleton2dAnimationTargetBinder(registry:flight._cpp.Skeleton2DAnimationTargetBinderRegistry, kind:cpp.ConstCharStar, bind:flight._cpp.Skeleton2DAnimationTargetBinder):Void;
	@:native("flight_unregister_skeleton_2d_animation_target_binder")
	public static function unregisterSkeleton2dAnimationTargetBinder(registry:flight._cpp.Skeleton2DAnimationTargetBinderRegistry, kind:cpp.ConstCharStar):Void;
	@:native("flight_solve_skeleton_2d_constraints")
	public static function solveSkeleton2dConstraints(registry:flight._cpp.Skeleton2DConstraintRegistry, skeleton:flight._cpp.Skeleton2D, constraints:cpp.Star<cpp.Void>, constraintsLen:Int):Void;
	@:native("flight_unregister_skeleton_2d_constraint_solver")
	public static function unregisterSkeleton2dConstraintSolver(registry:flight._cpp.Skeleton2DConstraintRegistry, kind:cpp.ConstCharStar):Void;
	@:native("flight_register_skeleton_2d_draw_order_animation_binder")
	public static function registerSkeleton2dDrawOrderAnimationBinder(registry:flight._cpp.Skeleton2DAnimationTargetBinderRegistry):Void;
	@:native("flight_unregister_skeleton_2d_draw_order_animation_binder")
	public static function unregisterSkeleton2dDrawOrderAnimationBinder(registry:flight._cpp.Skeleton2DAnimationTargetBinderRegistry):Void;
	@:native("flight_create_skin_2d")
	public static function createSkin2d(influenceCounts:cpp.Star<cpp.Void>, influences:cpp.Star<cpp.Void>):flight._cpp.Skin2D;
	@:native("flight_register_skeleton_2d_transform_constraint_solver")
	public static function registerSkeleton2dTransformConstraintSolver(registry:flight._cpp.Skeleton2DConstraintRegistry):Void;
	@:native("flight_solve_skeleton_2d_transform_constraint__skeleton2_dik_constraint")
	public static function solveSkeleton2dTransformConstraintSkeleton2DikConstraint(skeleton:flight._cpp.Skeleton2D, constraint:flight._cpp.Skeleton2DIkConstraint):Void;
	@:native("flight_solve_skeleton_2d_transform_constraint__skeleton2_dpath_constraint")
	public static function solveSkeleton2dTransformConstraintSkeleton2DpathConstraint(skeleton:flight._cpp.Skeleton2D, constraint:flight._cpp.Skeleton2DPathConstraint):Void;
	@:native("flight_solve_skeleton_2d_transform_constraint__skeleton2_dtransform_constraint")
	public static function solveSkeleton2dTransformConstraintSkeleton2DtransformConstraint(skeleton:flight._cpp.Skeleton2D, constraint:flight._cpp.Skeleton2DTransformConstraint):Void;
	@:native("flight_free_skeleton2_ddeform_length_explanation")
	public static function freeSkeleton2DdeformLengthExplanation(ptr:flight._cpp.Skeleton2DDeformLengthExplanation):Void;
	@:native("flight_free_skeleton2_danimation_target_handle")
	public static function freeSkeleton2DanimationTargetHandle(ptr:flight._cpp.Skeleton2DAnimationTargetHandle):Void;
	@:native("flight_free_skeleton2_danimation_target_binder_registry")
	public static function freeSkeleton2DanimationTargetBinderRegistry(ptr:flight._cpp.Skeleton2DAnimationTargetBinderRegistry):Void;
	@:native("flight_free_skeleton2_danimation_target")
	public static function freeSkeleton2DanimationTarget(ptr:flight._cpp.Skeleton2DAnimationTarget):Void;
	@:native("flight_free_skeleton2_dslot_animation_target")
	public static function freeSkeleton2DslotAnimationTarget(ptr:flight._cpp.Skeleton2DSlotAnimationTarget):Void;
	@:native("flight_free_skeleton2_danimation_target_binder")
	public static function freeSkeleton2DanimationTargetBinder(ptr:flight._cpp.Skeleton2DAnimationTargetBinder):Void;
	@:native("flight_free_skin2_d")
	public static function freeSkin2D(ptr:flight._cpp.Skin2D):Void;
}
