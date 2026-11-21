package flight.esm.types.shape;

#if (js && flight_esm)
typedef CapsStyle = String;

typedef GradientType = String;

typedef InterpolationMethod = String;

typedef JointStyle = String;

typedef LineScaleMode = String;

typedef MorphShape = { data:flight.esm.types.shape.Types.MorphShapeData, enabled:Bool, kind:String, name:Null<String>, alpha:Float, visible:Bool, blendMode:Null<String>, clip:Null<flight.esm.types.clip.Types.ClipRegion>, material:Null<flight.esm.types.materials_contract.Types.Material2D>, materialData:Null<flight.esm.types.materials_contract.Types.MaterialData>, pivotX:Float, pivotY:Float, rotation:Float, scaleX:Float, scaleY:Float, skewX:Float, skewY:Float, x:Float, y:Float };

typedef MorphShapeAnimationTarget = { shape:flight.esm.types.shape.Types.MorphShape };

typedef MorphShapeColorEndpoint = { ?alpha:Null<Float>, color:Float };

typedef MorphShapeColorPaintBinding = { commandIndex:Float, endAlpha:Float, endColor:Float, kind:String, startAlpha:Float, startColor:Float };

typedef MorphShapeData = { morph:flight.esm.types.path_contract.Types.PathMorphRaw, path:flight.esm.types.path_contract.Types.PathRaw, paintBindings:Array<flight.esm.types.shape.Types.MorphShapePaintBinding>, pathBindings:Array<flight.esm.types.shape.Types.MorphShapePathBinding>, progress:Float, commands:Array<flight.esm.types.shape.Types.ShapeCommandToken> };

typedef MorphShapeGradientEndpoint = { alphas:Array<Float>, colors:Array<Float>, ?focalPointRatio:Null<Float>, ?matrix:Null<flight.esm.types.geometry.Types.Matrix>, ratios:Array<Float> };

typedef MorphShapeGradientEndpointExplanation = { endStopCount:Float, reason:flight.esm.types.shape.Types.MorphShapeGradientEndpointReason, startStopCount:Float, supported:Bool };

typedef MorphShapeGradientEndpointReason = String;

typedef MorphShapeGradientPaintBinding = { commandIndex:Float, commandKey:String, endAlphas:Array<Float>, endColors:Array<Float>, endFocalPointRatio:Float, endMatrix:Null<flight.esm.types.geometry.Types.Matrix>, endRatios:Array<Float>, kind:String, startAlphas:Array<Float>, startColors:Array<Float>, startFocalPointRatio:Float, startMatrix:Null<flight.esm.types.geometry.Types.Matrix>, startRatios:Array<Float> };

typedef MorphShapeLineEndpoint = { thickness:Float, ?alpha:Null<Float>, color:Float };

typedef MorphShapeLinePaintBinding = { commandIndex:Float, endAlpha:Float, endColor:Float, endThickness:Float, kind:String, startAlpha:Float, startColor:Float, startThickness:Float };

typedef MorphShapePaintBinding = { commandIndex:Float, kind:String };

typedef MorphShapePathBinding = { morph:flight.esm.types.path_contract.Types.PathMorphRaw, path:flight.esm.types.path_contract.Types.PathRaw };

typedef MorphShapeRuntime = { shapeBoundsCommandRegistryRevision:Float, scene2d:Null<flight.esm.types.scene2d_contract.Types.Scene2D>, appearanceId:Float, boundsUsingLocalBoundsId:Float, boundsUsingLocalTransformId:Float, canAddChild:((target:flight.esm.types.node.Types.Node<flight.esm.types.scene2d_contract.Types.Node2DFields>, child:flight.esm.types.node.Types.Node<flight.esm.types.scene2d_contract.Types.Node2DFields>) -> Bool), children:Null<Array<flight.esm.types.node.Types.NodeOf<flight.esm.types.scene2d_contract.Types.Node2DFields>>>, childrenId:Float, ?fields:Null<flight.esm.types.node.Types.NodeFieldsKey<flight.esm.types.scene2d_contract.Types.Node2DFields>>, interactionSignals:Dynamic, localBoundsId:Float, localBoundsUsingLocalBoundsId:Float, localContentId:Float, localTransformId:Float, localTransformUsingLocalTransformId:Float, nodeSignals:Null<flight.esm.types.node.Types.NodeSignals>, interactionState:Dynamic, parent:Null<flight.esm.types.node.Types.NodeOf<flight.esm.types.scene2d_contract.Types.Node2DFields>>, parentReferenceId:Float, worldBoundsUsingLocalBoundsId:Float, worldBoundsUsingWorldTransformId:Float, worldTransformId:Float, worldTransformRevisionCounter:Float, worldTransformUsingLocalTransformId:Float, worldTransformUsingParentTransformId:Float, binding:Dynamic, ?uid:Null<String>, colorAdjustments:Null<Array<flight.esm.types.adjustments_contract.Types.Adjustment>>, colorAdjustmentsUnsupported:Bool, resolvedColorMatrix:Null<js.lib.Float32Array>, resolvedColorScaleBias:Null<flight.esm.types.adjustments_contract.Types.ColorScaleBias>, localMatrix:Null<flight.esm.types.geometry.Types.Matrix>, rotationAngle:Float, rotationCosine:Float, rotationSine:Float, worldMatrix:Null<flight.esm.types.geometry.Types.Matrix>, boundsRectangle:Null<flight.esm.types.geometry.Types.Rectangle>, computeLocalBoundsRectangle:((out:flight.esm.types.geometry.Types.Rectangle, source:flight.esm.types.node.Types.BoundsNode<flight.esm.types.scene2d_contract.Types.Node2DFields>) -> Void), isLocalBoundsRectangleValid:Null<((source:flight.esm.types.node.Types.BoundsNode<Dynamic>) -> Bool)>, localBoundsRectangle:Null<flight.esm.types.geometry.Types.Rectangle>, worldBoundsRectangle:Null<flight.esm.types.geometry.Types.Rectangle> };

typedef MorphShapeTexturePaintBinding = { commandIndex:Float, commandKey:String, endMatrix:flight.esm.types.geometry.Types.Matrix, kind:String, startMatrix:flight.esm.types.geometry.Types.Matrix };

typedef PathCommand = flight.esm.types.path.Types.PathCommand;

typedef Scale9Mapper = { mapX:((x:Float) -> Float), mapY:((y:Float) -> Float) };

typedef Scale9Shape = { data:flight.esm.types.shape.Types.Scale9ShapeData, enabled:Bool, kind:String, name:Null<String>, alpha:Float, visible:Bool, blendMode:Null<String>, clip:Null<flight.esm.types.clip.Types.ClipRegion>, material:Null<flight.esm.types.materials_contract.Types.Material2D>, materialData:Null<flight.esm.types.materials_contract.Types.MaterialData>, pivotX:Float, pivotY:Float, rotation:Float, scaleX:Float, scaleY:Float, skewX:Float, skewY:Float, x:Float, y:Float };

typedef Scale9ShapeData = { scale9Grid:flight.esm.types.geometry.Types.RectangleLike, commands:Array<flight.esm.types.shape.Types.ShapeCommandToken> };

typedef Scale9ShapeRuntime = { shapeBoundsCommandRegistryRevision:Float, scene2d:Null<flight.esm.types.scene2d_contract.Types.Scene2D>, appearanceId:Float, boundsUsingLocalBoundsId:Float, boundsUsingLocalTransformId:Float, canAddChild:((target:flight.esm.types.node.Types.Node<flight.esm.types.scene2d_contract.Types.Node2DFields>, child:flight.esm.types.node.Types.Node<flight.esm.types.scene2d_contract.Types.Node2DFields>) -> Bool), children:Null<Array<flight.esm.types.node.Types.NodeOf<flight.esm.types.scene2d_contract.Types.Node2DFields>>>, childrenId:Float, ?fields:Null<flight.esm.types.node.Types.NodeFieldsKey<flight.esm.types.scene2d_contract.Types.Node2DFields>>, interactionSignals:Dynamic, localBoundsId:Float, localBoundsUsingLocalBoundsId:Float, localContentId:Float, localTransformId:Float, localTransformUsingLocalTransformId:Float, nodeSignals:Null<flight.esm.types.node.Types.NodeSignals>, interactionState:Dynamic, parent:Null<flight.esm.types.node.Types.NodeOf<flight.esm.types.scene2d_contract.Types.Node2DFields>>, parentReferenceId:Float, worldBoundsUsingLocalBoundsId:Float, worldBoundsUsingWorldTransformId:Float, worldTransformId:Float, worldTransformRevisionCounter:Float, worldTransformUsingLocalTransformId:Float, worldTransformUsingParentTransformId:Float, binding:Dynamic, ?uid:Null<String>, colorAdjustments:Null<Array<flight.esm.types.adjustments_contract.Types.Adjustment>>, colorAdjustmentsUnsupported:Bool, resolvedColorMatrix:Null<js.lib.Float32Array>, resolvedColorScaleBias:Null<flight.esm.types.adjustments_contract.Types.ColorScaleBias>, localMatrix:Null<flight.esm.types.geometry.Types.Matrix>, rotationAngle:Float, rotationCosine:Float, rotationSine:Float, worldMatrix:Null<flight.esm.types.geometry.Types.Matrix>, boundsRectangle:Null<flight.esm.types.geometry.Types.Rectangle>, computeLocalBoundsRectangle:((out:flight.esm.types.geometry.Types.Rectangle, source:flight.esm.types.node.Types.BoundsNode<flight.esm.types.scene2d_contract.Types.Node2DFields>) -> Void), isLocalBoundsRectangleValid:Null<((source:flight.esm.types.node.Types.BoundsNode<Dynamic>) -> Bool)>, localBoundsRectangle:Null<flight.esm.types.geometry.Types.Rectangle>, worldBoundsRectangle:Null<flight.esm.types.geometry.Types.Rectangle> };

typedef Shape = { data:flight.esm.types.shape.Types.ShapeData, enabled:Bool, kind:String, name:Null<String>, alpha:Float, visible:Bool, blendMode:Null<String>, clip:Null<flight.esm.types.clip.Types.ClipRegion>, material:Null<flight.esm.types.materials_contract.Types.Material2D>, materialData:Null<flight.esm.types.materials_contract.Types.MaterialData>, pivotX:Float, pivotY:Float, rotation:Float, scaleX:Float, scaleY:Float, skewX:Float, skewY:Float, x:Float, y:Float };

typedef ShapeBoundsCommand<K> = { key:K, fillBounds:Null<flight.esm.types.shape.Types.ShapeBoundsCommandHandler>, strokeBounds:Null<flight.esm.types.shape.Types.ShapeBoundsCommandHandler> };

typedef ShapeBoundsCommandHandler = ((context:flight.esm.types.shape.Types.ShapeBoundsContext, argumentsCursor:flight.esm.types.shape.Types.ShapeCommandArgumentCursor) -> Void);

typedef ShapeBoundsContext = { closePath:(() -> Void), cubicCurveTo:((controlX1:Float, controlY1:Float, controlX2:Float, controlY2:Float, x:Float, y:Float) -> Void), drawCircle:((centerX:Float, centerY:Float, radius:Float) -> Void), drawEllipse:((centerX:Float, centerY:Float, radiusX:Float, radiusY:Float) -> Void), drawRectangle:((x:Float, y:Float, width:Float, height:Float) -> Void), drawRoundedRectangle:((x:Float, y:Float, width:Float, height:Float, radius:Float) -> Void), expandPoint:((x:Float, y:Float) -> Void), flushPath:(() -> Void), lineTo:((x:Float, y:Float) -> Void), moveTo:((x:Float, y:Float) -> Void), quadraticCurveTo:((controlX:Float, controlY:Float, x:Float, y:Float) -> Void), setStrokeStyle:((width:Float, caps:flight.esm.types.shape.Types.CapsStyle, joints:flight.esm.types.shape.Types.JointStyle, miterLimit:Float) -> Void) };

typedef ShapeBoundsExplanation = { complete:Bool, missingCommandKeys:Array<String>, mode:flight.esm.types.shape.Types.ShapeBoundsMode };

typedef ShapeBoundsGuard = ((source:flight.esm.types.shape.Types.Shape, mode:flight.esm.types.shape.Types.ShapeBoundsMode, missingCommandKey:String) -> Void);

typedef ShapeBoundsMode = String;

typedef ShapeCommandArgumentCursor = { length:Float, getArgument:((relativeIndex:Float) -> Dynamic) };

typedef ShapeCommandKey = String;

typedef ShapeCommandRegistry = { beginTextureFill:Array<Dynamic>, beginFill:Array<Float>, beginGradientFill:Array<Dynamic>, cubicCurveTo:Array<Float>, quadraticCurveTo:Array<Float>, drawCircle:Array<Float>, drawEllipse:Array<Float>, drawPath:Array<Dynamic>, drawRectangle:Array<Float>, drawRoundedRectangle:Array<Float>, drawTriangles:Array<Dynamic>, endFill:Array<Dynamic>, lineTextureStyle:Array<Dynamic>, lineGradientStyle:Array<Dynamic>, lineStyle:Array<Dynamic>, lineTo:Array<Float>, moveTo:Array<Float> };

typedef ShapeCommandToken = Dynamic;

typedef ShapeData = { commands:Array<flight.esm.types.shape.Types.ShapeCommandToken> };

typedef ShapeFillRegion = { path:flight.esm.types.path_contract.Types.PathRaw, color:Float, alpha:Float };

typedef ShapeRuntime = { shapeBoundsCommandRegistryRevision:Float, scene2d:Null<flight.esm.types.scene2d_contract.Types.Scene2D>, appearanceId:Float, boundsUsingLocalBoundsId:Float, boundsUsingLocalTransformId:Float, canAddChild:((target:flight.esm.types.node.Types.Node<flight.esm.types.scene2d_contract.Types.Node2DFields>, child:flight.esm.types.node.Types.Node<flight.esm.types.scene2d_contract.Types.Node2DFields>) -> Bool), children:Null<Array<flight.esm.types.node.Types.NodeOf<flight.esm.types.scene2d_contract.Types.Node2DFields>>>, childrenId:Float, ?fields:Null<flight.esm.types.node.Types.NodeFieldsKey<flight.esm.types.scene2d_contract.Types.Node2DFields>>, interactionSignals:Dynamic, localBoundsId:Float, localBoundsUsingLocalBoundsId:Float, localContentId:Float, localTransformId:Float, localTransformUsingLocalTransformId:Float, nodeSignals:Null<flight.esm.types.node.Types.NodeSignals>, interactionState:Dynamic, parent:Null<flight.esm.types.node.Types.NodeOf<flight.esm.types.scene2d_contract.Types.Node2DFields>>, parentReferenceId:Float, worldBoundsUsingLocalBoundsId:Float, worldBoundsUsingWorldTransformId:Float, worldTransformId:Float, worldTransformRevisionCounter:Float, worldTransformUsingLocalTransformId:Float, worldTransformUsingParentTransformId:Float, binding:Dynamic, ?uid:Null<String>, colorAdjustments:Null<Array<flight.esm.types.adjustments_contract.Types.Adjustment>>, colorAdjustmentsUnsupported:Bool, resolvedColorMatrix:Null<js.lib.Float32Array>, resolvedColorScaleBias:Null<flight.esm.types.adjustments_contract.Types.ColorScaleBias>, localMatrix:Null<flight.esm.types.geometry.Types.Matrix>, rotationAngle:Float, rotationCosine:Float, rotationSine:Float, worldMatrix:Null<flight.esm.types.geometry.Types.Matrix>, boundsRectangle:Null<flight.esm.types.geometry.Types.Rectangle>, computeLocalBoundsRectangle:((out:flight.esm.types.geometry.Types.Rectangle, source:flight.esm.types.node.Types.BoundsNode<flight.esm.types.scene2d_contract.Types.Node2DFields>) -> Void), isLocalBoundsRectangleValid:Null<((source:flight.esm.types.node.Types.BoundsNode<Dynamic>) -> Bool)>, localBoundsRectangle:Null<flight.esm.types.geometry.Types.Rectangle>, worldBoundsRectangle:Null<flight.esm.types.geometry.Types.Rectangle> };

typedef ShapeStrokeRegion = { style:flight.esm.types.path.Types.StrokeStyle, path:flight.esm.types.path_contract.Types.PathRaw, color:Float, alpha:Float };

typedef ShapeTessellationBlocker = String;

typedef ShapeTessellationExplanation = { blockedBy:flight.esm.types.shape.Types.ShapeTessellationBlocker, status:flight.esm.types.shape.Types.ShapeTessellationStatus };

typedef ShapeTessellationStatus = String;

typedef SpreadMethod = String;

typedef TriangleCulling = String;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
