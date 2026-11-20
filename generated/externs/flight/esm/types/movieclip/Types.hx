package flight.esm.types.movieclip;

#if (js && flight_esm)
typedef MovieClip = { data:flight.esm.types.movieclip.Types.MovieClipData, enabled:Bool, kind:String, name:Null<String>, alpha:Float, visible:Bool, blendMode:Null<String>, clip:Null<flight.esm.types.clip.Types.ClipRegion>, material:Null<flight.esm.types.materials_contract.Types.Material2D>, materialData:Null<flight.esm.types.materials_contract.Types.MaterialData>, pivotX:Float, pivotY:Float, rotation:Float, scaleX:Float, scaleY:Float, skewX:Float, skewY:Float, x:Float, y:Float };

typedef MovieClipData = { timeline:Null<flight.esm.types.timeline.Types.Timeline> };

typedef MovieClipRuntime = { movieClipSignals:Null<flight.esm.types.timeline.Types.TimelineSignals>, scene2d:Null<flight.esm.types.scene2d_contract.Types.Scene2D>, appearanceId:Float, boundsUsingLocalBoundsId:Float, boundsUsingLocalTransformId:Float, canAddChild:((target:flight.esm.types.node.Types.Node<flight.esm.types.scene2d_contract.Types.Node2DFields>, child:flight.esm.types.node.Types.Node<flight.esm.types.scene2d_contract.Types.Node2DFields>) -> Bool), children:Null<Array<flight.esm.types.node.Types.NodeOf<flight.esm.types.scene2d_contract.Types.Node2DFields>>>, childrenId:Float, ?fields:Null<flight.esm.types.node.Types.NodeFieldsKey<flight.esm.types.scene2d_contract.Types.Node2DFields>>, interactionSignals:Dynamic, localBoundsId:Float, localBoundsUsingLocalBoundsId:Float, localContentId:Float, localTransformId:Float, localTransformUsingLocalTransformId:Float, nodeSignals:Null<flight.esm.types.node.Types.NodeSignals>, interactionState:Dynamic, parent:Null<flight.esm.types.node.Types.NodeOf<flight.esm.types.scene2d_contract.Types.Node2DFields>>, parentReferenceId:Float, worldBoundsUsingLocalBoundsId:Float, worldBoundsUsingWorldTransformId:Float, worldTransformId:Float, worldTransformRevisionCounter:Float, worldTransformUsingLocalTransformId:Float, worldTransformUsingParentTransformId:Float, binding:Dynamic, ?uid:Null<String>, colorAdjustments:Null<Array<flight.esm.types.adjustments_contract.Types.Adjustment>>, colorAdjustmentsUnsupported:Bool, resolvedColorMatrix:Null<js.lib.Float32Array>, resolvedColorScaleBias:Null<flight.esm.types.adjustments_contract.Types.ColorScaleBias>, localMatrix:Null<flight.esm.types.geometry.Types.Matrix>, rotationAngle:Float, rotationCosine:Float, rotationSine:Float, worldMatrix:Null<flight.esm.types.geometry.Types.Matrix>, boundsRectangle:Null<flight.esm.types.geometry.Types.Rectangle>, computeLocalBoundsRectangle:((out:flight.esm.types.geometry.Types.Rectangle, source:flight.esm.types.node.Types.BoundsNode<flight.esm.types.scene2d_contract.Types.Node2DFields>) -> Void), isLocalBoundsRectangleValid:Null<((source:flight.esm.types.node.Types.BoundsNode<Dynamic>) -> Bool)>, localBoundsRectangle:Null<flight.esm.types.geometry.Types.Rectangle>, worldBoundsRectangle:Null<flight.esm.types.geometry.Types.Rectangle> };

typedef MovieClipSignals = flight.esm.types.timeline.Types.TimelineSignals;

typedef SpritesheetTimelineSourceExplanation = { directionMaterialized:Bool, unsupportedFields:Array<flight.esm.types.movieclip.Types.SpritesheetTimelineSourceUnsupportedField> };

typedef SpritesheetTimelineSourceGuard = ((animation:flight.esm.types.spritesheet.Types.SpritesheetAnimation, explanation:flight.esm.types.movieclip.Types.SpritesheetTimelineSourceExplanation) -> Void);

typedef SpritesheetTimelineSourceUnsupportedField = String;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
