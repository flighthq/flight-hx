package flight._js._fn;

@:jsRequire("@flighthq/skeleton2d")
extern class Skeleton2D {
	@:native("registerSkeleton2DDeformAnimationTarget")
	public static function registerSkeleton2dDeformAnimationTarget(registry:flight._js.Skeleton2DAnimationTargetBinderRegistry):Void;
	@:native("isSkeleton2DSteppedChannelSubject")
	public static function isSkeleton2dSteppedChannelSubject(subject:String):Bool;
	@:native("explainSkeleton2DDeformLength")
	public static function explainSkeleton2dDeformLength(skin:Null<flight._js.Skin2D>, vertices:Null<Dynamic>, deform:Null<Dynamic>):flight._js.Skeleton2DDeformLengthExplanation;
	@:native("registerSkeleton2DIkConstraintSolver")
	public static function registerSkeleton2dIkConstraintSolver(registry:flight._js.Skeleton2DConstraintRegistry):Void;
	@:native("solveSkeleton2DIkConstraint")
	public static function solveSkeleton2dIkConstraintSkeleton2DikConstraint(skeleton:flight._js.Skeleton2D, constraint:flight._js.Skeleton2DIkConstraint):Void;
	@:native("solveSkeleton2DIkConstraint")
	public static function solveSkeleton2dIkConstraintSkeleton2DpathConstraint(skeleton:flight._js.Skeleton2D, constraint:flight._js.Skeleton2DPathConstraint):Void;
	@:native("solveSkeleton2DIkConstraint")
	public static function solveSkeleton2dIkConstraintSkeleton2DtransformConstraint(skeleton:flight._js.Skeleton2D, constraint:flight._js.Skeleton2DTransformConstraint):Void;
	@:native("registerSkeleton2DPathConstraintSolver")
	public static function registerSkeleton2dPathConstraintSolver(registry:flight._js.Skeleton2DConstraintRegistry):Void;
	@:native("solveSkeleton2DPathConstraint")
	public static function solveSkeleton2dPathConstraintSkeleton2DikConstraint(skeleton:flight._js.Skeleton2D, constraint:flight._js.Skeleton2DIkConstraint):Void;
	@:native("solveSkeleton2DPathConstraint")
	public static function solveSkeleton2dPathConstraintSkeleton2DpathConstraint(skeleton:flight._js.Skeleton2D, constraint:flight._js.Skeleton2DPathConstraint):Void;
	@:native("solveSkeleton2DPathConstraint")
	public static function solveSkeleton2dPathConstraintSkeleton2DtransformConstraint(skeleton:flight._js.Skeleton2D, constraint:flight._js.Skeleton2DTransformConstraint):Void;
	@:native("computeSkeleton2DBoneMatrices")
	public static function computeSkeleton2dBoneMatrices(skeleton:flight._js.Skeleton2D):Void;
	@:native("computeSkeleton2DBoneWorldTransform")
	public static function computeSkeleton2dBoneWorldTransform(skeleton:flight._js.Skeleton2D, boneIndex:Int):Void;
	@:native("computeSkeleton2DWorldTransforms")
	public static function computeSkeleton2dWorldTransforms(skeleton:flight._js.Skeleton2D):Void;
	@:native("disposeSkeleton2D")
	public static function disposeSkeleton2d(skeleton:flight._js.Skeleton2D):Void;
	@:native("equalsSkeleton2D")
	public static function equalsSkeleton2d(a:flight._js.Skeleton2D, b:flight._js.Skeleton2D):Bool;
	@:native("getSkeleton2DBoneIndexByName")
	public static function getSkeleton2dBoneIndexByName(skeleton:flight._js.Skeleton2D, name:String):Int;
	@:native("getSkeleton2DBoneWorldMatrix")
	public static function getSkeleton2dBoneWorldMatrix(out:flight._js.Matrix, skeleton:flight._js.Skeleton2D, boneIndex:Int):Bool;
	@:native("setSkeleton2DBindPose")
	public static function setSkeleton2dBindPose(skeleton:flight._js.Skeleton2D):Void;
	@:native("validateSkeleton2D")
	public static function validateSkeleton2d(skeleton:flight._js.Skeleton2D):Null<String>;
	@:native("createSkeleton2DBoneAnimationTarget")
	public static function createSkeleton2dBoneAnimationTarget(boneIndex:Int, path:String):flight._js.Skeleton2DAnimationTarget;
	@:native("createSkeleton2DSlotAnimationTarget")
	public static function createSkeleton2dSlotAnimationTarget():flight._js.Skeleton2DSlotAnimationTarget;
	@:native("findSkeleton2DStepKeyframe")
	public static function findSkeleton2dStepKeyframe(times:Dynamic, time:Float):Int;
	@:native("getSkeleton2DAnimationTargetBinder")
	public static function getSkeleton2dAnimationTargetBinder(registry:flight._js.Skeleton2DAnimationTargetBinderRegistry, kind:String):Null<flight._js.Skeleton2DAnimationTargetBinder>;
	@:native("getSkeleton2DAnimationTargetBinderKinds")
	public static function getSkeleton2dAnimationTargetBinderKinds(out:Dynamic, registry:flight._js.Skeleton2DAnimationTargetBinderRegistry):Void;
	@:native("registerSkeleton2DAnimationTargetBinder")
	public static function registerSkeleton2dAnimationTargetBinder(registry:flight._js.Skeleton2DAnimationTargetBinderRegistry, kind:String, bind:flight._js.Skeleton2DAnimationTargetBinder):Void;
	@:native("unregisterSkeleton2DAnimationTargetBinder")
	public static function unregisterSkeleton2dAnimationTargetBinder(registry:flight._js.Skeleton2DAnimationTargetBinderRegistry, kind:String):Void;
	@:native("solveSkeleton2DConstraints")
	public static function solveSkeleton2dConstraints(registry:flight._js.Skeleton2DConstraintRegistry, skeleton:flight._js.Skeleton2D, constraints:Dynamic):Void;
	@:native("unregisterSkeleton2DConstraintSolver")
	public static function unregisterSkeleton2dConstraintSolver(registry:flight._js.Skeleton2DConstraintRegistry, kind:String):Void;
	@:native("registerSkeleton2DDrawOrderAnimationBinder")
	public static function registerSkeleton2dDrawOrderAnimationBinder(registry:flight._js.Skeleton2DAnimationTargetBinderRegistry):Void;
	@:native("unregisterSkeleton2DDrawOrderAnimationBinder")
	public static function unregisterSkeleton2dDrawOrderAnimationBinder(registry:flight._js.Skeleton2DAnimationTargetBinderRegistry):Void;
	@:native("createSkin2D")
	public static function createSkin2d(influenceCounts:Dynamic, influences:Dynamic):flight._js.Skin2D;
	@:native("registerSkeleton2DTransformConstraintSolver")
	public static function registerSkeleton2dTransformConstraintSolver(registry:flight._js.Skeleton2DConstraintRegistry):Void;
	@:native("solveSkeleton2DTransformConstraint")
	public static function solveSkeleton2dTransformConstraintSkeleton2DikConstraint(skeleton:flight._js.Skeleton2D, constraint:flight._js.Skeleton2DIkConstraint):Void;
	@:native("solveSkeleton2DTransformConstraint")
	public static function solveSkeleton2dTransformConstraintSkeleton2DpathConstraint(skeleton:flight._js.Skeleton2D, constraint:flight._js.Skeleton2DPathConstraint):Void;
	@:native("solveSkeleton2DTransformConstraint")
	public static function solveSkeleton2dTransformConstraintSkeleton2DtransformConstraint(skeleton:flight._js.Skeleton2D, constraint:flight._js.Skeleton2DTransformConstraint):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSkeleton2DdeformLengthExplanation(ptr:flight._js.Skeleton2DDeformLengthExplanation):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSkeleton2DanimationTarget(ptr:flight._js.Skeleton2DAnimationTarget):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSkeleton2DslotAnimationTarget(ptr:flight._js.Skeleton2DSlotAnimationTarget):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSkeleton2DanimationTargetBinder(ptr:flight._js.Skeleton2DAnimationTargetBinder):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSkin2D(ptr:flight._js.Skin2D):Void {}
}
