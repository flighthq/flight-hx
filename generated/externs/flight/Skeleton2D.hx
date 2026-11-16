package flight;

#if hl

typedef Skeleton2D = flight._hl.Skeleton2D;

#elseif cpp

typedef Skeleton2D = flight._cpp.Skeleton2D;

#elseif (js && flight_esm)

typedef Skeleton2D = flight._js.Skeleton2D;

#elseif js

#error "flight.Skeleton2D on js requires flight_esm."

#else

#error "flight.Skeleton2D: no backend for this target."

#end

#if (js && flight_esm)
extern inline function registerSkeleton2dDeformAnimationTarget(registry:Skeleton2DAnimationTargetBinderRegistry):Void {
	flight._js._fn.Skeleton2D.registerSkeleton2dDeformAnimationTarget(registry);
}
#else
extern inline function registerSkeleton2dDeformAnimationTarget(registry:Skeleton2DAnimationTargetBinderRegistry):Void {
#if hl
	flight._hl._fn.Skeleton2D.registerSkeleton2dDeformAnimationTarget(registry);
#elseif cpp
	flight._cpp._fn.Skeleton2D.registerSkeleton2dDeformAnimationTarget(registry);
#elseif (js && flight_esm)
	flight._js._fn.Skeleton2D.registerSkeleton2dDeformAnimationTarget(registry);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isSkeleton2dSteppedChannelSubject(subject:String):Bool {
	return flight._js._fn.Skeleton2D.isSkeleton2dSteppedChannelSubject(subject);
}
#else
extern inline function isSkeleton2dSteppedChannelSubject(subject:String):Bool {
#if hl
	return flight._hl._fn.Skeleton2D.isSkeleton2dSteppedChannelSubject(cast subject);
#elseif cpp
	return flight._cpp._fn.Skeleton2D.isSkeleton2dSteppedChannelSubject(cast subject);
#elseif (js && flight_esm)
	return flight._js._fn.Skeleton2D.isSkeleton2dSteppedChannelSubject(subject);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function explainSkeleton2dDeformLength(skin:Null<Skin2D>, vertices:Null<Dynamic>, deform:Null<Dynamic>):Skeleton2DDeformLengthExplanation {
	return flight._js._fn.Skeleton2D.explainSkeleton2dDeformLength(skin, vertices, deform);
}
#else
extern inline function explainSkeleton2dDeformLength(skin:Skin2D, vertices:Dynamic, verticesLen:Int, deform:Dynamic, deformLen:Int):Skeleton2DDeformLengthExplanation {
#if hl
	return flight._hl._fn.Skeleton2D.explainSkeleton2dDeformLength(skin, vertices, verticesLen, deform, deformLen);
#elseif cpp
	return flight._cpp._fn.Skeleton2D.explainSkeleton2dDeformLength(skin, vertices, verticesLen, deform, deformLen);
#elseif (js && flight_esm)
	return flight._js._fn.Skeleton2D.explainSkeleton2dDeformLength(skin, vertices, verticesLen, deform, deformLen);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerSkeleton2dIkConstraintSolver(registry:Skeleton2DConstraintRegistry):Void {
	flight._js._fn.Skeleton2D.registerSkeleton2dIkConstraintSolver(registry);
}
#else
extern inline function registerSkeleton2dIkConstraintSolver(registry:Skeleton2DConstraintRegistry):Void {
#if hl
	flight._hl._fn.Skeleton2D.registerSkeleton2dIkConstraintSolver(registry);
#elseif cpp
	flight._cpp._fn.Skeleton2D.registerSkeleton2dIkConstraintSolver(registry);
#elseif (js && flight_esm)
	flight._js._fn.Skeleton2D.registerSkeleton2dIkConstraintSolver(registry);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function solveSkeleton2dIkConstraintSkeleton2DikConstraint(skeleton:Skeleton2D, constraint:Skeleton2DIkConstraint):Void {
	flight._js._fn.Skeleton2D.solveSkeleton2dIkConstraintSkeleton2DikConstraint(skeleton, constraint);
}
#else
extern inline function solveSkeleton2dIkConstraintSkeleton2DikConstraint(skeleton:Skeleton2D, constraint:Skeleton2DIkConstraint):Void {
#if hl
	flight._hl._fn.Skeleton2D.solveSkeleton2dIkConstraintSkeleton2DikConstraint(skeleton, constraint);
#elseif cpp
	flight._cpp._fn.Skeleton2D.solveSkeleton2dIkConstraintSkeleton2DikConstraint(skeleton, constraint);
#elseif (js && flight_esm)
	flight._js._fn.Skeleton2D.solveSkeleton2dIkConstraintSkeleton2DikConstraint(skeleton, constraint);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function solveSkeleton2dIkConstraintSkeleton2DpathConstraint(skeleton:Skeleton2D, constraint:Skeleton2DPathConstraint):Void {
	flight._js._fn.Skeleton2D.solveSkeleton2dIkConstraintSkeleton2DpathConstraint(skeleton, constraint);
}
#else
extern inline function solveSkeleton2dIkConstraintSkeleton2DpathConstraint(skeleton:Skeleton2D, constraint:Skeleton2DPathConstraint):Void {
#if hl
	flight._hl._fn.Skeleton2D.solveSkeleton2dIkConstraintSkeleton2DpathConstraint(skeleton, constraint);
#elseif cpp
	flight._cpp._fn.Skeleton2D.solveSkeleton2dIkConstraintSkeleton2DpathConstraint(skeleton, constraint);
#elseif (js && flight_esm)
	flight._js._fn.Skeleton2D.solveSkeleton2dIkConstraintSkeleton2DpathConstraint(skeleton, constraint);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function solveSkeleton2dIkConstraintSkeleton2DtransformConstraint(skeleton:Skeleton2D, constraint:Skeleton2DTransformConstraint):Void {
	flight._js._fn.Skeleton2D.solveSkeleton2dIkConstraintSkeleton2DtransformConstraint(skeleton, constraint);
}
#else
extern inline function solveSkeleton2dIkConstraintSkeleton2DtransformConstraint(skeleton:Skeleton2D, constraint:Skeleton2DTransformConstraint):Void {
#if hl
	flight._hl._fn.Skeleton2D.solveSkeleton2dIkConstraintSkeleton2DtransformConstraint(skeleton, constraint);
#elseif cpp
	flight._cpp._fn.Skeleton2D.solveSkeleton2dIkConstraintSkeleton2DtransformConstraint(skeleton, constraint);
#elseif (js && flight_esm)
	flight._js._fn.Skeleton2D.solveSkeleton2dIkConstraintSkeleton2DtransformConstraint(skeleton, constraint);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerSkeleton2dPathConstraintSolver(registry:Skeleton2DConstraintRegistry):Void {
	flight._js._fn.Skeleton2D.registerSkeleton2dPathConstraintSolver(registry);
}
#else
extern inline function registerSkeleton2dPathConstraintSolver(registry:Skeleton2DConstraintRegistry):Void {
#if hl
	flight._hl._fn.Skeleton2D.registerSkeleton2dPathConstraintSolver(registry);
#elseif cpp
	flight._cpp._fn.Skeleton2D.registerSkeleton2dPathConstraintSolver(registry);
#elseif (js && flight_esm)
	flight._js._fn.Skeleton2D.registerSkeleton2dPathConstraintSolver(registry);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function solveSkeleton2dPathConstraintSkeleton2DikConstraint(skeleton:Skeleton2D, constraint:Skeleton2DIkConstraint):Void {
	flight._js._fn.Skeleton2D.solveSkeleton2dPathConstraintSkeleton2DikConstraint(skeleton, constraint);
}
#else
extern inline function solveSkeleton2dPathConstraintSkeleton2DikConstraint(skeleton:Skeleton2D, constraint:Skeleton2DIkConstraint):Void {
#if hl
	flight._hl._fn.Skeleton2D.solveSkeleton2dPathConstraintSkeleton2DikConstraint(skeleton, constraint);
#elseif cpp
	flight._cpp._fn.Skeleton2D.solveSkeleton2dPathConstraintSkeleton2DikConstraint(skeleton, constraint);
#elseif (js && flight_esm)
	flight._js._fn.Skeleton2D.solveSkeleton2dPathConstraintSkeleton2DikConstraint(skeleton, constraint);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function solveSkeleton2dPathConstraintSkeleton2DpathConstraint(skeleton:Skeleton2D, constraint:Skeleton2DPathConstraint):Void {
	flight._js._fn.Skeleton2D.solveSkeleton2dPathConstraintSkeleton2DpathConstraint(skeleton, constraint);
}
#else
extern inline function solveSkeleton2dPathConstraintSkeleton2DpathConstraint(skeleton:Skeleton2D, constraint:Skeleton2DPathConstraint):Void {
#if hl
	flight._hl._fn.Skeleton2D.solveSkeleton2dPathConstraintSkeleton2DpathConstraint(skeleton, constraint);
#elseif cpp
	flight._cpp._fn.Skeleton2D.solveSkeleton2dPathConstraintSkeleton2DpathConstraint(skeleton, constraint);
#elseif (js && flight_esm)
	flight._js._fn.Skeleton2D.solveSkeleton2dPathConstraintSkeleton2DpathConstraint(skeleton, constraint);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function solveSkeleton2dPathConstraintSkeleton2DtransformConstraint(skeleton:Skeleton2D, constraint:Skeleton2DTransformConstraint):Void {
	flight._js._fn.Skeleton2D.solveSkeleton2dPathConstraintSkeleton2DtransformConstraint(skeleton, constraint);
}
#else
extern inline function solveSkeleton2dPathConstraintSkeleton2DtransformConstraint(skeleton:Skeleton2D, constraint:Skeleton2DTransformConstraint):Void {
#if hl
	flight._hl._fn.Skeleton2D.solveSkeleton2dPathConstraintSkeleton2DtransformConstraint(skeleton, constraint);
#elseif cpp
	flight._cpp._fn.Skeleton2D.solveSkeleton2dPathConstraintSkeleton2DtransformConstraint(skeleton, constraint);
#elseif (js && flight_esm)
	flight._js._fn.Skeleton2D.solveSkeleton2dPathConstraintSkeleton2DtransformConstraint(skeleton, constraint);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeSkeleton2dBoneMatrices(skeleton:Skeleton2D):Void {
	flight._js._fn.Skeleton2D.computeSkeleton2dBoneMatrices(skeleton);
}
#else
extern inline function computeSkeleton2dBoneMatrices(skeleton:Skeleton2D):Void {
#if hl
	flight._hl._fn.Skeleton2D.computeSkeleton2dBoneMatrices(skeleton);
#elseif cpp
	flight._cpp._fn.Skeleton2D.computeSkeleton2dBoneMatrices(skeleton);
#elseif (js && flight_esm)
	flight._js._fn.Skeleton2D.computeSkeleton2dBoneMatrices(skeleton);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeSkeleton2dBoneWorldTransform(skeleton:Skeleton2D, boneIndex:Int):Void {
	flight._js._fn.Skeleton2D.computeSkeleton2dBoneWorldTransform(skeleton, boneIndex);
}
#else
extern inline function computeSkeleton2dBoneWorldTransform(skeleton:Skeleton2D, boneIndex:Int):Void {
#if hl
	flight._hl._fn.Skeleton2D.computeSkeleton2dBoneWorldTransform(skeleton, boneIndex);
#elseif cpp
	flight._cpp._fn.Skeleton2D.computeSkeleton2dBoneWorldTransform(skeleton, boneIndex);
#elseif (js && flight_esm)
	flight._js._fn.Skeleton2D.computeSkeleton2dBoneWorldTransform(skeleton, boneIndex);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeSkeleton2dWorldTransforms(skeleton:Skeleton2D):Void {
	flight._js._fn.Skeleton2D.computeSkeleton2dWorldTransforms(skeleton);
}
#else
extern inline function computeSkeleton2dWorldTransforms(skeleton:Skeleton2D):Void {
#if hl
	flight._hl._fn.Skeleton2D.computeSkeleton2dWorldTransforms(skeleton);
#elseif cpp
	flight._cpp._fn.Skeleton2D.computeSkeleton2dWorldTransforms(skeleton);
#elseif (js && flight_esm)
	flight._js._fn.Skeleton2D.computeSkeleton2dWorldTransforms(skeleton);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disposeSkeleton2d(skeleton:Skeleton2D):Void {
	flight._js._fn.Skeleton2D.disposeSkeleton2d(skeleton);
}
#else
extern inline function disposeSkeleton2d(skeleton:Skeleton2D):Void {
#if hl
	flight._hl._fn.Skeleton2D.disposeSkeleton2d(skeleton);
#elseif cpp
	flight._cpp._fn.Skeleton2D.disposeSkeleton2d(skeleton);
#elseif (js && flight_esm)
	flight._js._fn.Skeleton2D.disposeSkeleton2d(skeleton);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function equalsSkeleton2d(a:Skeleton2D, b:Skeleton2D):Bool {
	return flight._js._fn.Skeleton2D.equalsSkeleton2d(a, b);
}
#else
extern inline function equalsSkeleton2d(a:Skeleton2D, b:Skeleton2D):Bool {
#if hl
	return flight._hl._fn.Skeleton2D.equalsSkeleton2d(a, b);
#elseif cpp
	return flight._cpp._fn.Skeleton2D.equalsSkeleton2d(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Skeleton2D.equalsSkeleton2d(a, b);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getSkeleton2dBoneIndexByName(skeleton:Skeleton2D, name:String):Int {
	return flight._js._fn.Skeleton2D.getSkeleton2dBoneIndexByName(skeleton, name);
}
#else
extern inline function getSkeleton2dBoneIndexByName(skeleton:Skeleton2D, name:String):Int {
#if hl
	return flight._hl._fn.Skeleton2D.getSkeleton2dBoneIndexByName(skeleton, cast name);
#elseif cpp
	return flight._cpp._fn.Skeleton2D.getSkeleton2dBoneIndexByName(skeleton, cast name);
#elseif (js && flight_esm)
	return flight._js._fn.Skeleton2D.getSkeleton2dBoneIndexByName(skeleton, name);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getSkeleton2dBoneWorldMatrix(out:Matrix, skeleton:Skeleton2D, boneIndex:Int):Bool {
	return flight._js._fn.Skeleton2D.getSkeleton2dBoneWorldMatrix(out, skeleton, boneIndex);
}
#else
extern inline function getSkeleton2dBoneWorldMatrix(out:Matrix, skeleton:Skeleton2D, boneIndex:Int):Bool {
#if hl
	return flight._hl._fn.Skeleton2D.getSkeleton2dBoneWorldMatrix(out, skeleton, boneIndex);
#elseif cpp
	return flight._cpp._fn.Skeleton2D.getSkeleton2dBoneWorldMatrix(out, skeleton, boneIndex);
#elseif (js && flight_esm)
	return flight._js._fn.Skeleton2D.getSkeleton2dBoneWorldMatrix(out, skeleton, boneIndex);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setSkeleton2dBindPose(skeleton:Skeleton2D):Void {
	flight._js._fn.Skeleton2D.setSkeleton2dBindPose(skeleton);
}
#else
extern inline function setSkeleton2dBindPose(skeleton:Skeleton2D):Void {
#if hl
	flight._hl._fn.Skeleton2D.setSkeleton2dBindPose(skeleton);
#elseif cpp
	flight._cpp._fn.Skeleton2D.setSkeleton2dBindPose(skeleton);
#elseif (js && flight_esm)
	flight._js._fn.Skeleton2D.setSkeleton2dBindPose(skeleton);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function validateSkeleton2d(skeleton:Skeleton2D):Null<String> {
	return flight._js._fn.Skeleton2D.validateSkeleton2d(skeleton);
}
#else
extern inline function validateSkeleton2d(skeleton:Skeleton2D):String {
#if hl
	return cast flight._hl._fn.Skeleton2D.validateSkeleton2d(skeleton);
#elseif cpp
	return cast flight._cpp._fn.Skeleton2D.validateSkeleton2d(skeleton);
#elseif (js && flight_esm)
	return cast flight._js._fn.Skeleton2D.validateSkeleton2d(skeleton);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSkeleton2dAnimationTargetHandle(kind:String, target:Unknown):Skeleton2DAnimationTargetHandle {
	return flight._js._fn.Skeleton2D.createSkeleton2dAnimationTargetHandle(kind, target);
}
#else
extern inline function createSkeleton2dAnimationTargetHandle(kind:String, target:Unknown):Skeleton2DAnimationTargetHandle {
#if hl
	return flight._hl._fn.Skeleton2D.createSkeleton2dAnimationTargetHandle(cast kind, target);
#elseif cpp
	return flight._cpp._fn.Skeleton2D.createSkeleton2dAnimationTargetHandle(cast kind, target);
#elseif (js && flight_esm)
	return flight._js._fn.Skeleton2D.createSkeleton2dAnimationTargetHandle(kind, target);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSkeleton2dAnimationTargetRegistry():Skeleton2DAnimationTargetBinderRegistry {
	return flight._js._fn.Skeleton2D.createSkeleton2dAnimationTargetRegistry();
}
#else
extern inline function createSkeleton2dAnimationTargetRegistry():Skeleton2DAnimationTargetBinderRegistry {
#if hl
	return flight._hl._fn.Skeleton2D.createSkeleton2dAnimationTargetRegistry();
#elseif cpp
	return flight._cpp._fn.Skeleton2D.createSkeleton2dAnimationTargetRegistry();
#elseif (js && flight_esm)
	return flight._js._fn.Skeleton2D.createSkeleton2dAnimationTargetRegistry();
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSkeleton2dBoneAnimationTarget(boneIndex:Int, path:String):Skeleton2DAnimationTarget {
	return flight._js._fn.Skeleton2D.createSkeleton2dBoneAnimationTarget(boneIndex, path);
}
#else
extern inline function createSkeleton2dBoneAnimationTarget(boneIndex:Int, path:String):Skeleton2DAnimationTarget {
#if hl
	return flight._hl._fn.Skeleton2D.createSkeleton2dBoneAnimationTarget(boneIndex, cast path);
#elseif cpp
	return flight._cpp._fn.Skeleton2D.createSkeleton2dBoneAnimationTarget(boneIndex, cast path);
#elseif (js && flight_esm)
	return flight._js._fn.Skeleton2D.createSkeleton2dBoneAnimationTarget(boneIndex, path);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSkeleton2dSlotAnimationTarget():Skeleton2DSlotAnimationTarget {
	return flight._js._fn.Skeleton2D.createSkeleton2dSlotAnimationTarget();
}
#else
extern inline function createSkeleton2dSlotAnimationTarget():Skeleton2DSlotAnimationTarget {
#if hl
	return flight._hl._fn.Skeleton2D.createSkeleton2dSlotAnimationTarget();
#elseif cpp
	return flight._cpp._fn.Skeleton2D.createSkeleton2dSlotAnimationTarget();
#elseif (js && flight_esm)
	return flight._js._fn.Skeleton2D.createSkeleton2dSlotAnimationTarget();
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function findSkeleton2dStepKeyframe(times:Dynamic, time:Float):Int {
	return flight._js._fn.Skeleton2D.findSkeleton2dStepKeyframe(times, time);
}
#else
extern inline function findSkeleton2dStepKeyframe(times:Dynamic, timesLen:Int, time:Float):Int {
#if hl
	return flight._hl._fn.Skeleton2D.findSkeleton2dStepKeyframe(times, timesLen, time);
#elseif cpp
	return flight._cpp._fn.Skeleton2D.findSkeleton2dStepKeyframe(times, timesLen, time);
#elseif (js && flight_esm)
	return flight._js._fn.Skeleton2D.findSkeleton2dStepKeyframe(times, timesLen, time);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getSkeleton2dAnimationTargetBinder(registry:Skeleton2DAnimationTargetBinderRegistry, kind:String):Null<Skeleton2DAnimationTargetBinder> {
	return flight._js._fn.Skeleton2D.getSkeleton2dAnimationTargetBinder(registry, kind);
}
#else
extern inline function getSkeleton2dAnimationTargetBinder(registry:Skeleton2DAnimationTargetBinderRegistry, kind:String):Skeleton2DAnimationTargetBinder {
#if hl
	return flight._hl._fn.Skeleton2D.getSkeleton2dAnimationTargetBinder(registry, cast kind);
#elseif cpp
	return flight._cpp._fn.Skeleton2D.getSkeleton2dAnimationTargetBinder(registry, cast kind);
#elseif (js && flight_esm)
	return flight._js._fn.Skeleton2D.getSkeleton2dAnimationTargetBinder(registry, kind);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getSkeleton2dAnimationTargetBinderKinds(out:Dynamic, registry:Skeleton2DAnimationTargetBinderRegistry):Void {
	flight._js._fn.Skeleton2D.getSkeleton2dAnimationTargetBinderKinds(out, registry);
}
#else
extern inline function getSkeleton2dAnimationTargetBinderKinds(out:Dynamic, registry:Skeleton2DAnimationTargetBinderRegistry):Void {
#if hl
	flight._hl._fn.Skeleton2D.getSkeleton2dAnimationTargetBinderKinds(out, registry);
#elseif cpp
	flight._cpp._fn.Skeleton2D.getSkeleton2dAnimationTargetBinderKinds(out, registry);
#elseif (js && flight_esm)
	flight._js._fn.Skeleton2D.getSkeleton2dAnimationTargetBinderKinds(out, registry);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerSkeleton2dAnimationTargetBinder(registry:Skeleton2DAnimationTargetBinderRegistry, kind:String, bind:Skeleton2DAnimationTargetBinder):Void {
	flight._js._fn.Skeleton2D.registerSkeleton2dAnimationTargetBinder(registry, kind, bind);
}
#else
extern inline function registerSkeleton2dAnimationTargetBinder(registry:Skeleton2DAnimationTargetBinderRegistry, kind:String, bind:Skeleton2DAnimationTargetBinder):Void {
#if hl
	flight._hl._fn.Skeleton2D.registerSkeleton2dAnimationTargetBinder(registry, cast kind, bind);
#elseif cpp
	flight._cpp._fn.Skeleton2D.registerSkeleton2dAnimationTargetBinder(registry, cast kind, bind);
#elseif (js && flight_esm)
	flight._js._fn.Skeleton2D.registerSkeleton2dAnimationTargetBinder(registry, kind, bind);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function unregisterSkeleton2dAnimationTargetBinder(registry:Skeleton2DAnimationTargetBinderRegistry, kind:String):Void {
	flight._js._fn.Skeleton2D.unregisterSkeleton2dAnimationTargetBinder(registry, kind);
}
#else
extern inline function unregisterSkeleton2dAnimationTargetBinder(registry:Skeleton2DAnimationTargetBinderRegistry, kind:String):Void {
#if hl
	flight._hl._fn.Skeleton2D.unregisterSkeleton2dAnimationTargetBinder(registry, cast kind);
#elseif cpp
	flight._cpp._fn.Skeleton2D.unregisterSkeleton2dAnimationTargetBinder(registry, cast kind);
#elseif (js && flight_esm)
	flight._js._fn.Skeleton2D.unregisterSkeleton2dAnimationTargetBinder(registry, kind);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function solveSkeleton2dConstraints(registry:Skeleton2DConstraintRegistry, skeleton:Skeleton2D, constraints:Dynamic):Void {
	flight._js._fn.Skeleton2D.solveSkeleton2dConstraints(registry, skeleton, constraints);
}
#else
extern inline function solveSkeleton2dConstraints(registry:Skeleton2DConstraintRegistry, skeleton:Skeleton2D, constraints:Dynamic, constraintsLen:Int):Void {
#if hl
	flight._hl._fn.Skeleton2D.solveSkeleton2dConstraints(registry, skeleton, constraints, constraintsLen);
#elseif cpp
	flight._cpp._fn.Skeleton2D.solveSkeleton2dConstraints(registry, skeleton, constraints, constraintsLen);
#elseif (js && flight_esm)
	flight._js._fn.Skeleton2D.solveSkeleton2dConstraints(registry, skeleton, constraints, constraintsLen);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function unregisterSkeleton2dConstraintSolver(registry:Skeleton2DConstraintRegistry, kind:String):Void {
	flight._js._fn.Skeleton2D.unregisterSkeleton2dConstraintSolver(registry, kind);
}
#else
extern inline function unregisterSkeleton2dConstraintSolver(registry:Skeleton2DConstraintRegistry, kind:String):Void {
#if hl
	flight._hl._fn.Skeleton2D.unregisterSkeleton2dConstraintSolver(registry, cast kind);
#elseif cpp
	flight._cpp._fn.Skeleton2D.unregisterSkeleton2dConstraintSolver(registry, cast kind);
#elseif (js && flight_esm)
	flight._js._fn.Skeleton2D.unregisterSkeleton2dConstraintSolver(registry, kind);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerSkeleton2dDrawOrderAnimationBinder(registry:Skeleton2DAnimationTargetBinderRegistry):Void {
	flight._js._fn.Skeleton2D.registerSkeleton2dDrawOrderAnimationBinder(registry);
}
#else
extern inline function registerSkeleton2dDrawOrderAnimationBinder(registry:Skeleton2DAnimationTargetBinderRegistry):Void {
#if hl
	flight._hl._fn.Skeleton2D.registerSkeleton2dDrawOrderAnimationBinder(registry);
#elseif cpp
	flight._cpp._fn.Skeleton2D.registerSkeleton2dDrawOrderAnimationBinder(registry);
#elseif (js && flight_esm)
	flight._js._fn.Skeleton2D.registerSkeleton2dDrawOrderAnimationBinder(registry);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function unregisterSkeleton2dDrawOrderAnimationBinder(registry:Skeleton2DAnimationTargetBinderRegistry):Void {
	flight._js._fn.Skeleton2D.unregisterSkeleton2dDrawOrderAnimationBinder(registry);
}
#else
extern inline function unregisterSkeleton2dDrawOrderAnimationBinder(registry:Skeleton2DAnimationTargetBinderRegistry):Void {
#if hl
	flight._hl._fn.Skeleton2D.unregisterSkeleton2dDrawOrderAnimationBinder(registry);
#elseif cpp
	flight._cpp._fn.Skeleton2D.unregisterSkeleton2dDrawOrderAnimationBinder(registry);
#elseif (js && flight_esm)
	flight._js._fn.Skeleton2D.unregisterSkeleton2dDrawOrderAnimationBinder(registry);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSkin2d(influenceCounts:Dynamic, influences:Dynamic):Skin2D {
	return flight._js._fn.Skeleton2D.createSkin2d(influenceCounts, influences);
}
#else
extern inline function createSkin2d(influenceCounts:Dynamic, influences:Dynamic):Skin2D {
#if hl
	return flight._hl._fn.Skeleton2D.createSkin2d(influenceCounts, influences);
#elseif cpp
	return flight._cpp._fn.Skeleton2D.createSkin2d(influenceCounts, influences);
#elseif (js && flight_esm)
	return flight._js._fn.Skeleton2D.createSkin2d(influenceCounts, influences);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerSkeleton2dTransformConstraintSolver(registry:Skeleton2DConstraintRegistry):Void {
	flight._js._fn.Skeleton2D.registerSkeleton2dTransformConstraintSolver(registry);
}
#else
extern inline function registerSkeleton2dTransformConstraintSolver(registry:Skeleton2DConstraintRegistry):Void {
#if hl
	flight._hl._fn.Skeleton2D.registerSkeleton2dTransformConstraintSolver(registry);
#elseif cpp
	flight._cpp._fn.Skeleton2D.registerSkeleton2dTransformConstraintSolver(registry);
#elseif (js && flight_esm)
	flight._js._fn.Skeleton2D.registerSkeleton2dTransformConstraintSolver(registry);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function solveSkeleton2dTransformConstraintSkeleton2DikConstraint(skeleton:Skeleton2D, constraint:Skeleton2DIkConstraint):Void {
	flight._js._fn.Skeleton2D.solveSkeleton2dTransformConstraintSkeleton2DikConstraint(skeleton, constraint);
}
#else
extern inline function solveSkeleton2dTransformConstraintSkeleton2DikConstraint(skeleton:Skeleton2D, constraint:Skeleton2DIkConstraint):Void {
#if hl
	flight._hl._fn.Skeleton2D.solveSkeleton2dTransformConstraintSkeleton2DikConstraint(skeleton, constraint);
#elseif cpp
	flight._cpp._fn.Skeleton2D.solveSkeleton2dTransformConstraintSkeleton2DikConstraint(skeleton, constraint);
#elseif (js && flight_esm)
	flight._js._fn.Skeleton2D.solveSkeleton2dTransformConstraintSkeleton2DikConstraint(skeleton, constraint);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function solveSkeleton2dTransformConstraintSkeleton2DpathConstraint(skeleton:Skeleton2D, constraint:Skeleton2DPathConstraint):Void {
	flight._js._fn.Skeleton2D.solveSkeleton2dTransformConstraintSkeleton2DpathConstraint(skeleton, constraint);
}
#else
extern inline function solveSkeleton2dTransformConstraintSkeleton2DpathConstraint(skeleton:Skeleton2D, constraint:Skeleton2DPathConstraint):Void {
#if hl
	flight._hl._fn.Skeleton2D.solveSkeleton2dTransformConstraintSkeleton2DpathConstraint(skeleton, constraint);
#elseif cpp
	flight._cpp._fn.Skeleton2D.solveSkeleton2dTransformConstraintSkeleton2DpathConstraint(skeleton, constraint);
#elseif (js && flight_esm)
	flight._js._fn.Skeleton2D.solveSkeleton2dTransformConstraintSkeleton2DpathConstraint(skeleton, constraint);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function solveSkeleton2dTransformConstraintSkeleton2DtransformConstraint(skeleton:Skeleton2D, constraint:Skeleton2DTransformConstraint):Void {
	flight._js._fn.Skeleton2D.solveSkeleton2dTransformConstraintSkeleton2DtransformConstraint(skeleton, constraint);
}
#else
extern inline function solveSkeleton2dTransformConstraintSkeleton2DtransformConstraint(skeleton:Skeleton2D, constraint:Skeleton2DTransformConstraint):Void {
#if hl
	flight._hl._fn.Skeleton2D.solveSkeleton2dTransformConstraintSkeleton2DtransformConstraint(skeleton, constraint);
#elseif cpp
	flight._cpp._fn.Skeleton2D.solveSkeleton2dTransformConstraintSkeleton2DtransformConstraint(skeleton, constraint);
#elseif (js && flight_esm)
	flight._js._fn.Skeleton2D.solveSkeleton2dTransformConstraintSkeleton2DtransformConstraint(skeleton, constraint);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSkeleton2DdeformLengthExplanation(ptr:Skeleton2DDeformLengthExplanation):Void {
	flight._js._fn.Skeleton2D.freeSkeleton2DdeformLengthExplanation(ptr);
}
#else
extern inline function freeSkeleton2DdeformLengthExplanation(ptr:Skeleton2DDeformLengthExplanation):Void {
#if hl
	flight._hl._fn.Skeleton2D.freeSkeleton2DdeformLengthExplanation(ptr);
#elseif cpp
	flight._cpp._fn.Skeleton2D.freeSkeleton2DdeformLengthExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Skeleton2D.freeSkeleton2DdeformLengthExplanation(ptr);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSkeleton2DanimationTargetHandle(ptr:Skeleton2DAnimationTargetHandle):Void {
	flight._js._fn.Skeleton2D.freeSkeleton2DanimationTargetHandle(ptr);
}
#else
extern inline function freeSkeleton2DanimationTargetHandle(ptr:Skeleton2DAnimationTargetHandle):Void {
#if hl
	flight._hl._fn.Skeleton2D.freeSkeleton2DanimationTargetHandle(ptr);
#elseif cpp
	flight._cpp._fn.Skeleton2D.freeSkeleton2DanimationTargetHandle(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Skeleton2D.freeSkeleton2DanimationTargetHandle(ptr);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSkeleton2DanimationTargetBinderRegistry(ptr:Skeleton2DAnimationTargetBinderRegistry):Void {
	flight._js._fn.Skeleton2D.freeSkeleton2DanimationTargetBinderRegistry(ptr);
}
#else
extern inline function freeSkeleton2DanimationTargetBinderRegistry(ptr:Skeleton2DAnimationTargetBinderRegistry):Void {
#if hl
	flight._hl._fn.Skeleton2D.freeSkeleton2DanimationTargetBinderRegistry(ptr);
#elseif cpp
	flight._cpp._fn.Skeleton2D.freeSkeleton2DanimationTargetBinderRegistry(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Skeleton2D.freeSkeleton2DanimationTargetBinderRegistry(ptr);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSkeleton2DanimationTarget(ptr:Skeleton2DAnimationTarget):Void {
	flight._js._fn.Skeleton2D.freeSkeleton2DanimationTarget(ptr);
}
#else
extern inline function freeSkeleton2DanimationTarget(ptr:Skeleton2DAnimationTarget):Void {
#if hl
	flight._hl._fn.Skeleton2D.freeSkeleton2DanimationTarget(ptr);
#elseif cpp
	flight._cpp._fn.Skeleton2D.freeSkeleton2DanimationTarget(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Skeleton2D.freeSkeleton2DanimationTarget(ptr);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSkeleton2DslotAnimationTarget(ptr:Skeleton2DSlotAnimationTarget):Void {
	flight._js._fn.Skeleton2D.freeSkeleton2DslotAnimationTarget(ptr);
}
#else
extern inline function freeSkeleton2DslotAnimationTarget(ptr:Skeleton2DSlotAnimationTarget):Void {
#if hl
	flight._hl._fn.Skeleton2D.freeSkeleton2DslotAnimationTarget(ptr);
#elseif cpp
	flight._cpp._fn.Skeleton2D.freeSkeleton2DslotAnimationTarget(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Skeleton2D.freeSkeleton2DslotAnimationTarget(ptr);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSkeleton2DanimationTargetBinder(ptr:Skeleton2DAnimationTargetBinder):Void {
	flight._js._fn.Skeleton2D.freeSkeleton2DanimationTargetBinder(ptr);
}
#else
extern inline function freeSkeleton2DanimationTargetBinder(ptr:Skeleton2DAnimationTargetBinder):Void {
#if hl
	flight._hl._fn.Skeleton2D.freeSkeleton2DanimationTargetBinder(ptr);
#elseif cpp
	flight._cpp._fn.Skeleton2D.freeSkeleton2DanimationTargetBinder(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Skeleton2D.freeSkeleton2DanimationTargetBinder(ptr);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSkin2D(ptr:Skin2D):Void {
	flight._js._fn.Skeleton2D.freeSkin2D(ptr);
}
#else
extern inline function freeSkin2D(ptr:Skin2D):Void {
#if hl
	flight._hl._fn.Skeleton2D.freeSkin2D(ptr);
#elseif cpp
	flight._cpp._fn.Skeleton2D.freeSkin2D(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Skeleton2D.freeSkin2D(ptr);
#else
	#error "flight.Skeleton2D: no backend for this target."
#end
}
#end
