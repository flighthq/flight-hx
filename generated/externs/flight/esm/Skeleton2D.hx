package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/skeleton2d")
extern class Skeleton2D {
  public static final BoundingBoxAttachment2DKind:String;
  public static final ClippingAttachment2DKind:String;
  public static final MeshAttachment2DKind:String;
  public static final PathAttachment2DKind:String;
  public static final PointAttachment2DKind:String;
  public static final RegionAttachment2DKind:String;
  public static final SKELETON_2D_MATRIX_STRIDE:Float;
  public static final Skeleton2DAnimationPath:Dynamic;
  public static final Skeleton2DAnimationTargetKind:Dynamic;
  public static final Skeleton2DConstraintKind:Dynamic;
  public static final Skeleton2DPathPositionMode:Dynamic;
  public static final Skeleton2DPathRotateMode:Dynamic;
  public static final Skeleton2DPathSpacingMode:Dynamic;
  public static final Skeleton2DSlotAnimationPath:Dynamic;
  public static final TransformMode2D:Dynamic;
  public static function applyAnimationClipToSkeleton2D(clip:flight.esm.types.animation.Types.AnimationClip, setup:flight.esm.types.skeleton2d.Types.Skeleton2D, pose:flight.esm.types.skeleton2d.Types.Skeleton2D, time:Float):Void;
  public static function cloneSkeleton2D(skeleton:flight.esm.types.skeleton2d.Types.Skeleton2D):flight.esm.types.skeleton2d.Types.Skeleton2D;
  public static function computeSkeleton2DBoneMatrices(skeleton:flight.esm.types.skeleton2d.Types.Skeleton2D):Void;
  public static function computeSkeleton2DBoneWorldTransform(skeleton:flight.esm.types.skeleton2d.Types.Skeleton2D, boneIndex:Float):Void;
  public static function computeSkeleton2DBoundingBoxAttachmentVertices(out:js.lib.Float32Array, attachment:flight.esm.types.skeleton2d.Types.BoundingBoxAttachment2D, skeleton:flight.esm.types.skeleton2d.Types.Skeleton2D, boneIndex:Float, ?deform:Null<js.lib.Float32Array>):Void;
  public static function computeSkeleton2DClippingAttachmentVertices(out:js.lib.Float32Array, attachment:flight.esm.types.skeleton2d.Types.ClippingAttachment2D, skeleton:flight.esm.types.skeleton2d.Types.Skeleton2D, boneIndex:Float, ?deform:Null<js.lib.Float32Array>):Void;
  public static function computeSkeleton2DPointAttachmentPosition(out:flight.esm.types.geometry.Types.Vector2Like, attachment:flight.esm.types.skeleton2d.Types.PointAttachment2D, skeleton:flight.esm.types.skeleton2d.Types.Skeleton2D, boneIndex:Float):Void;
  public static function computeSkeleton2DPointAttachmentRotation(attachment:flight.esm.types.skeleton2d.Types.PointAttachment2D, skeleton:flight.esm.types.skeleton2d.Types.Skeleton2D, boneIndex:Float):Float;
  public static function computeSkeleton2DRegionAttachmentVertices(out:js.lib.Float32Array, attachment:flight.esm.types.skeleton2d.Types.RegionAttachment2D, skeleton:flight.esm.types.skeleton2d.Types.Skeleton2D, boneIndex:Float):Void;
  public static function computeSkeleton2DWorldTransforms(skeleton:flight.esm.types.skeleton2d.Types.Skeleton2D):Void;
  public static function createSkeleton2D(bones:Array<flight.esm.types.skeleton2d.Types.Bone2D>, ?slots:Null<Array<flight.esm.types.skeleton2d.Types.Slot2D>>):flight.esm.types.skeleton2d.Types.Skeleton2D;
  public static function createSkeleton2DBoneAnimationTarget(boneIndex:Float, path:flight.esm.types.skeleton2d.Types.Skeleton2DAnimationPath):flight.esm.types.skeleton2d.Types.Skeleton2DAnimationTarget;
  public static function createSkeleton2DDrawOrderAnimationTarget<Fields>(nodes:Array<Null<flight.esm.types.node.Types.Node<Fields>>>, orderList:flight.esm.types.node.Types.NodeOrderList<Fields>):flight.esm.types.skeleton2d.Types.Skeleton2DDrawOrderAnimationTarget<Fields>;
  public static function createSkeleton2DDrawOrderChannel<Fields>(timeline:flight.esm.types.skeleton2d.Types.Skeleton2DDrawOrderTimeline, nodes:Array<Null<flight.esm.types.node.Types.Node<Fields>>>, orderList:flight.esm.types.node.Types.NodeOrderList<Fields>):Null<flight.esm.types.animation.Types.AnimationChannel>;
  public static function createSkeleton2DSlotAnimationTarget(slotIndex:Float, path:flight.esm.types.skeleton2d.Types.Skeleton2DSlotAnimationPath, ?attachments:Null<Array<Null<flight.esm.types.skeleton2d.Types.Attachment2D>>>):flight.esm.types.skeleton2d.Types.Skeleton2DSlotAnimationTarget;
  public static function createSkin2D(influenceCounts:js.lib.Uint16Array, influences:js.lib.Float32Array):flight.esm.types.skeleton2d.Types.Skin2D;
  public static function deformSkeleton2DMeshAttachment(out:js.lib.Float32Array, attachment:flight.esm.types.skeleton2d.Types.MeshAttachment2D, skeleton:flight.esm.types.skeleton2d.Types.Skeleton2D, boneIndex:Float, ?deform:Null<js.lib.Float32Array>):Void;
  public static function deformSkeleton2DPathAttachment(out:flight.esm.types.path_contract.Types.PathRaw, attachment:flight.esm.types.skeleton2d.Types.PathAttachment2D, skeleton:flight.esm.types.skeleton2d.Types.Skeleton2D, boneIndex:Float, ?deform:Null<js.lib.Float32Array>):Void;
  public static function disableSkeleton2DGuards():Void;
  public static function disposeSkeleton2D(skeleton:flight.esm.types.skeleton2d.Types.Skeleton2D):Void;
  public static function enableSkeleton2DGuards(logState:flight.esm.types.log.Types.LogState, nowMs:Float):Void;
  public static function equalsSkeleton2D(a:flight.esm.types.skeleton2d.Types.Skeleton2D, b:flight.esm.types.skeleton2d.Types.Skeleton2D):Bool;
  public static function explainSkeleton2DChannelInterpolation(channel:flight.esm.types.animation.Types.AnimationChannel, subject:String):Null<flight.esm.types.skeleton2d.Types.Skeleton2DCoercedInterpolation>;
  public static function explainSkeleton2DDeformLength(skin:Null<flight.esm.types.skeleton2d.Types.Skin2D>, vertices:Null<js.lib.Float32Array>, deform:Null<js.lib.Float32Array>):flight.esm.types.skeleton2d.Types.Skeleton2DDeformLengthExplanation;
  public static function findSkeleton2DStepKeyframe(times:Dynamic, time:Float):Float;
  public static function getSkeleton2DAnimationTargetBinder(kind:String):Null<flight.esm.types.skeleton2d.Types.Skeleton2DAnimationTargetBinder>;
  public static function getSkeleton2DAnimationTargetBinderKinds():Array<String>;
  public static function getSkeleton2DBoneIndexByName(skeleton:flight.esm.types.skeleton2d.Types.Skeleton2D, name:String):Float;
  public static function getSkeleton2DBoneWorldMatrix(out:flight.esm.types.geometry.Types.MatrixLike, skeleton:flight.esm.types.skeleton2d.Types.Skeleton2D, boneIndex:Float):Bool;
  public static function getSkeleton2DClippingAttachmentSlotRange(attachment:flight.esm.types.skeleton2d.Types.ClippingAttachment2D, slotIndex:Float, slotCount:Float):Dynamic;
  public static function getSkeleton2DConstraintSolver(kind:String):Null<flight.esm.types.skeleton2d.Types.Skeleton2DConstraintSolver>;
  public static function getSkeleton2DSkin(skeleton:flight.esm.types.skeleton2d.Types.Skeleton2D, name:String):Null<flight.esm.types.skeleton2d.Types.AttachmentSkin2D>;
  public static function getSkeleton2DSlotDeformOffsets(slot:flight.esm.types.skeleton2d.Types.Slot2D):Null<js.lib.Float32Array>;
  public static function isSkeleton2DSteppedChannelSubject(subject:String):Bool;
  public static function registerSkeleton2DAnimationTargetBinder(kind:String, bind:flight.esm.types.skeleton2d.Types.Skeleton2DAnimationTargetBinder):Void;
  public static function registerSkeleton2DConstraintSolver(kind:String, solve:flight.esm.types.skeleton2d.Types.Skeleton2DConstraintSolver):Void;
  public static function registerSkeleton2DDeformAnimationTarget():Void;
  public static function registerSkeleton2DDrawOrderAnimationBinder():Void;
  public static function registerSkeleton2DIkConstraintSolver():Void;
  public static function registerSkeleton2DPathConstraintSolver():Void;
  public static function registerSkeleton2DTransformConstraintSolver():Void;
  public static function resetSkeleton2DToSetup(setup:flight.esm.types.skeleton2d.Types.Skeleton2D, pose:flight.esm.types.skeleton2d.Types.Skeleton2D):Void;
  public static function setSkeleton2DBindPose(skeleton:flight.esm.types.skeleton2d.Types.Skeleton2D):Void;
  public static function setSkeleton2DSkin(skeleton:flight.esm.types.skeleton2d.Types.Skeleton2D, skin:flight.esm.types.skeleton2d.Types.AttachmentSkin2D):Void;
  public static function setSkeleton2DSlotDeform(slot:flight.esm.types.skeleton2d.Types.Slot2D, attachment:Null<flight.esm.types.skeleton2d.Types.Attachment2D>, offsets:Null<js.lib.Float32Array>):Null<flight.esm.types.skeleton2d.Types.Skeleton2DSlotDeform>;
  public static function skinSkeleton2DAttachmentPoints(out:Dynamic, skin:Null<flight.esm.types.skeleton2d.Types.Skin2D>, vertices:Null<js.lib.Float32Array>, skeleton:flight.esm.types.skeleton2d.Types.Skeleton2D, boneIndex:Float, deform:Null<js.lib.Float32Array>, subject:String):Void;
  public static function solveSkeleton2DConstraints(skeleton:flight.esm.types.skeleton2d.Types.Skeleton2D, constraints:Array<flight.esm.types.skeleton2d.Types.Skeleton2DConstraint>):Void;
  public static function solveSkeleton2DIkConstraint(skeleton:flight.esm.types.skeleton2d.Types.Skeleton2D, constraint:flight.esm.types.skeleton2d.Types.Skeleton2DConstraint):Void;
  public static function solveSkeleton2DPathConstraint(skeleton:flight.esm.types.skeleton2d.Types.Skeleton2D, constraint:flight.esm.types.skeleton2d.Types.Skeleton2DConstraint):Void;
  public static function solveSkeleton2DTransformConstraint(skeleton:flight.esm.types.skeleton2d.Types.Skeleton2D, constraint:flight.esm.types.skeleton2d.Types.Skeleton2DConstraint):Void;
  public static function unregisterSkeleton2DAnimationTargetBinder(kind:String):Void;
  public static function unregisterSkeleton2DConstraintSolver(kind:String):Void;
  public static function unregisterSkeleton2DDrawOrderAnimationBinder():Void;
  public static function validateSkeleton2D(skeleton:flight.esm.types.skeleton2d.Types.Skeleton2D):Null<String>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
