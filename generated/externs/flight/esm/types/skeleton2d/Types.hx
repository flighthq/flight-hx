package flight.esm.types.skeleton2d;

#if (js && flight_esm)
typedef Attachment2D = { kind:String, ?name:Null<String>, raw:Dynamic };

typedef AttachmentSkin2D = { attachments:Array<flight.esm.types.skeleton2d.Types.SkinAttachment2D>, name:String };

typedef Bone2D = { length:Float, ?name:Null<String>, parentIndex:Float, rotation:Float, scaleX:Float, scaleY:Float, shearX:Float, shearY:Float, transformMode:flight.esm.types.skeleton2d.Types.TransformInherit2D, x:Float, y:Float };

typedef BoundingBoxAttachment2D = { kind:String, pointCount:Float, ?skin:Null<flight.esm.types.skeleton2d.Types.Skin2D>, ?vertices:Null<js.lib.Float32Array>, ?name:Null<String>, raw:Dynamic };

typedef ClippingAttachment2D = { endSlotIndex:Float, kind:String, pointCount:Float, ?skin:Null<flight.esm.types.skeleton2d.Types.Skin2D>, ?vertices:Null<js.lib.Float32Array>, ?name:Null<String>, raw:Dynamic };

typedef MeshAttachment2D = { ?skin:Null<flight.esm.types.skeleton2d.Types.Skin2D>, triangles:js.lib.Uint16Array, uvs:js.lib.Float32Array, vertexCount:Float, ?vertices:Null<js.lib.Float32Array>, kind:String, ?name:Null<String>, raw:Dynamic };

typedef PathAttachment2D = { commands:Array<Float>, kind:String, pointCount:Float, ?skin:Null<flight.esm.types.skeleton2d.Types.Skin2D>, ?vertices:Null<js.lib.Float32Array>, winding:flight.esm.types.path.Types.PathWinding, ?name:Null<String>, raw:Dynamic };

typedef PointAttachment2D = { kind:String, rotation:Float, x:Float, y:Float, ?name:Null<String>, raw:Dynamic };

typedef RegionAttachment2D = { height:Float, rotation:Float, scaleX:Float, scaleY:Float, width:Float, x:Float, y:Float, kind:String, ?name:Null<String>, raw:Dynamic };

typedef Skeleton2D = { boneMatrices:js.lib.Float32Array, bones:Array<flight.esm.types.skeleton2d.Types.Bone2D>, inverseBindMatrices:js.lib.Float32Array, ?skins:Null<Array<flight.esm.types.skeleton2d.Types.AttachmentSkin2D>>, ?slots:Null<Array<flight.esm.types.skeleton2d.Types.Slot2D>>, worldMatrices:js.lib.Float32Array, raw:Dynamic };

typedef Skeleton2DAnimationPath = String;

typedef Skeleton2DAnimationTarget = { boneIndex:Float, kind:String, path:flight.esm.types.skeleton2d.Types.Skeleton2DAnimationPath, raw:Dynamic };

typedef Skeleton2DAnimationTargetBinder = ((channel:flight.esm.types.animation.Types.AnimationChannel, setup:flight.esm.types.skeleton2d.Types.Skeleton2D, pose:flight.esm.types.skeleton2d.Types.Skeleton2D, target:Dynamic, time:Float) -> Void);

typedef Skeleton2DAnimationTargetKind = String;

typedef Skeleton2DCoercedInterpolation = { applied:String, stated:String, subject:String };

typedef Skeleton2DCoercedInterpolationGuard = ((report:flight.esm.types.skeleton2d.Types.Skeleton2DCoercedInterpolation) -> Void);

typedef Skeleton2DConstraint = { kind:String, mix:Float, raw:Dynamic };

typedef Skeleton2DConstraintKind = String;

typedef Skeleton2DConstraintSolver = ((skeleton:flight.esm.types.skeleton2d.Types.Skeleton2D, constraint:flight.esm.types.skeleton2d.Types.Skeleton2DConstraint) -> Void);

typedef Skeleton2DDeformAnimationTarget = { attachment:Null<flight.esm.types.skeleton2d.Types.Attachment2D>, kind:String, slotIndex:Float };

typedef Skeleton2DDeformLengthExplanation = { accepted:Bool, addressing:String, addressed:Float, offsets:Float };

typedef Skeleton2DDeformLengthGuard = ((report:flight.esm.types.skeleton2d.Types.Skeleton2DDeformLengthMismatch) -> Void);

typedef Skeleton2DDeformLengthMismatch = { addressed:Float, offsets:Float, subject:String };

typedef Skeleton2DDrawOrderAnimationTarget<Fields> = { kind:String, nodes:Array<Null<flight.esm.types.node.Types.Node<Fields>>>, orderList:flight.esm.types.node.Types.NodeOrderList<Fields>, raw:Dynamic };

typedef Skeleton2DDrawOrderTimeline = { orderings:Array<Float>, times:Array<Float> };

typedef Skeleton2DIkConstraint = { bendPositive:Bool, boneIndices:Array<Float>, compress:Bool, kind:String, stretch:Bool, targetBoneIndex:Float, mix:Float, raw:Dynamic };

typedef Skeleton2DPathConstraint = { boneIndices:Array<Float>, kind:String, mixRotate:Float, mixX:Float, mixY:Float, position:Float, positionMode:flight.esm.types.skeleton2d.Types.Skeleton2DPathPositionMode, rotateMode:flight.esm.types.skeleton2d.Types.Skeleton2DPathRotateMode, spacing:Float, spacingMode:flight.esm.types.skeleton2d.Types.Skeleton2DPathSpacingMode, targetSlotIndex:Float, mix:Float, raw:Dynamic };

typedef Skeleton2DPathPositionMode = String;

typedef Skeleton2DPathRotateMode = String;

typedef Skeleton2DPathSpacingMode = String;

typedef Skeleton2DSlotAnimationPath = String;

typedef Skeleton2DSlotAnimationTarget = { ?attachments:Null<Array<Null<flight.esm.types.skeleton2d.Types.Attachment2D>>>, kind:String, path:flight.esm.types.skeleton2d.Types.Skeleton2DSlotAnimationPath, slotIndex:Float, raw:Dynamic };

typedef Skeleton2DSlotDeform = { attachment:Null<flight.esm.types.skeleton2d.Types.Attachment2D>, offsets:js.lib.Float32Array };

typedef Skeleton2DTransformConstraint = { boneIndices:Array<Float>, kind:String, mixRotate:Float, mixScaleX:Float, mixScaleY:Float, mixShearY:Float, mixX:Float, mixY:Float, offsetRotation:Float, offsetScaleX:Float, offsetScaleY:Float, offsetShearY:Float, offsetX:Float, offsetY:Float, targetBoneIndex:Float, mix:Float, raw:Dynamic };

typedef Skin2D = { influenceCounts:js.lib.Uint16Array, influences:js.lib.Float32Array, raw:Dynamic };

typedef SkinAttachment2D = { attachment:flight.esm.types.skeleton2d.Types.Attachment2D, name:String, slotIndex:Float };

typedef Slot2D = { ?attachment:Null<flight.esm.types.skeleton2d.Types.Attachment2D>, ?deform:Null<flight.esm.types.skeleton2d.Types.Skeleton2DSlotDeform>, boneIndex:Float, ?color:Null<Float>, ?name:Null<String> };

typedef TransformInherit2D = { reflection:Bool, rotation:Bool, scale:Bool, translation:Bool };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
