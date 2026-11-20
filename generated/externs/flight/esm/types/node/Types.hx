package flight.esm.types.node;

#if (js && flight_esm)
typedef AppearanceNode<Fields> = { data:Null<flight.esm.types.node.Types.NodeData>, enabled:Bool, kind:String, name:Null<String>, alpha:Float, visible:Bool };

typedef BlendModeNode<Fields> = { data:Null<flight.esm.types.node.Types.NodeData>, enabled:Bool, kind:String, name:Null<String>, blendMode:Null<String> };

typedef BoundsNode<Fields> = { data:Null<flight.esm.types.node.Types.NodeData>, enabled:Bool, kind:String, name:Null<String> };

typedef BoundsNodeAny = { data:Null<flight.esm.types.node.Types.NodeData>, enabled:Bool, kind:String, name:Null<String> };

typedef ClipNode<Fields> = { data:Null<flight.esm.types.node.Types.NodeData>, enabled:Bool, kind:String, name:Null<String>, clip:Null<flight.esm.types.clip.Types.ClipRegion> };

typedef ColorScaleBiasNode<Fields> = { data:Null<flight.esm.types.node.Types.NodeData>, enabled:Bool, kind:String, name:Null<String>, colorScaleBias:Null<flight.esm.types.adjustments_contract.Types.ColorScaleBias> };

typedef HasAppearance = { alpha:Float, visible:Bool };

typedef HasAppearanceRuntime = { worldAlpha:Null<Float>, worldAlphaUsingAppearanceId:Float, worldAlphaUsingParentAppearanceId:Float, worldAppearanceId:Float, binding:Dynamic, ?uid:Null<String> };

typedef HasBlendMode = { blendMode:Null<String> };

typedef HasBoundsRectangle = Dynamic;

typedef HasBoundsRectangleRuntime<Fields> = { boundsRectangle:Null<flight.esm.types.geometry.Types.Rectangle>, computeLocalBoundsRectangle:((out:flight.esm.types.geometry.Types.Rectangle, source:flight.esm.types.node.Types.BoundsNode<Fields>) -> Void), isLocalBoundsRectangleValid:Null<((source:flight.esm.types.node.Types.BoundsNode<Dynamic>) -> Bool)>, localBoundsRectangle:Null<flight.esm.types.geometry.Types.Rectangle>, worldBoundsRectangle:Null<flight.esm.types.geometry.Types.Rectangle>, binding:Dynamic, ?uid:Null<String> };

typedef HasClip = { clip:Null<flight.esm.types.clip.Types.ClipRegion> };

typedef HasColorScaleBias = { colorScaleBias:Null<flight.esm.types.adjustments_contract.Types.ColorScaleBias> };

typedef HasMaterial = { material:Null<flight.esm.types.materials_contract.Types.Material2D>, materialData:Null<flight.esm.types.materials_contract.Types.MaterialData> };

typedef HasTransform2D = { pivotX:Float, pivotY:Float, rotation:Float, scaleX:Float, scaleY:Float, skewX:Float, skewY:Float, x:Float, y:Float };

typedef HasTransform2DRuntime = { localMatrix:Null<flight.esm.types.geometry.Types.Matrix>, rotationAngle:Float, rotationCosine:Float, rotationSine:Float, worldMatrix:Null<flight.esm.types.geometry.Types.Matrix>, binding:Dynamic, ?uid:Null<String> };

typedef HasTransform3D = { position:flight.esm.types.geometry.Types.Vector3, rotation:flight.esm.types.geometry.Types.Quaternion, scale:flight.esm.types.geometry.Types.Vector3 };

typedef HasTransform3DRuntime = { localMatrix4:Null<flight.esm.types.geometry.Types.Matrix4>, localMatrix4Detached:Bool, worldMatrix4:Null<flight.esm.types.geometry.Types.Matrix4>, binding:Dynamic, ?uid:Null<String> };

typedef MaterialNode<Fields> = { data:Null<flight.esm.types.node.Types.NodeData>, enabled:Bool, kind:String, name:Null<String>, material:Null<flight.esm.types.materials_contract.Types.Material2D>, materialData:Null<flight.esm.types.materials_contract.Types.MaterialData> };

typedef MethodsOf<T> = Dynamic;

typedef Node<Fields> = { data:Null<flight.esm.types.node.Types.NodeData>, enabled:Bool, kind:String, name:Null<String> };

typedef NodeAny = { data:Null<flight.esm.types.node.Types.NodeData>, enabled:Bool, kind:String, name:Null<String> };

typedef NodeData = Dynamic;

typedef NodeDataFactory<D> = (() -> D);

typedef NodeDescendantVisitor<Fields> = ((node:flight.esm.types.node.Types.Node<Fields>) -> Bool);

typedef NodeFields = { data:Null<flight.esm.types.node.Types.NodeData>, enabled:Bool, kind:String, name:Null<String> };

typedef NodeFieldsKey<T> = { toString:(() -> String), valueOf:(() -> Dynamic), description:Null<String> };

typedef NodeOf<Fields> = { data:Null<flight.esm.types.node.Types.NodeData>, enabled:Bool, kind:String, name:Null<String> };

typedef NodeOrderList<Fields> = { entryCount:Float, nodes:Array<flight.esm.types.node.Types.Node<Fields>>, sortKeys:Array<Float> };

typedef NodeOrderListEntryVisitor<Fields> = ((node:flight.esm.types.node.Types.Node<Fields>, sortKey:Float, index:Float) -> Dynamic);

typedef NodeRef = flight.esm.types.node.Types.NodeAny;

typedef NodeRuntime<Fields> = { appearanceId:Float, boundsUsingLocalBoundsId:Float, boundsUsingLocalTransformId:Float, canAddChild:((target:flight.esm.types.node.Types.Node<Fields>, child:flight.esm.types.node.Types.Node<Fields>) -> Bool), children:Null<Array<flight.esm.types.node.Types.NodeOf<Fields>>>, childrenId:Float, ?fields:Null<flight.esm.types.node.Types.NodeFieldsKey<Fields>>, interactionSignals:Dynamic, localBoundsId:Float, localBoundsUsingLocalBoundsId:Float, localContentId:Float, localTransformId:Float, localTransformUsingLocalTransformId:Float, nodeSignals:Null<flight.esm.types.node.Types.NodeSignals>, interactionState:Dynamic, parent:Null<flight.esm.types.node.Types.NodeOf<Fields>>, parentReferenceId:Float, worldBoundsUsingLocalBoundsId:Float, worldBoundsUsingWorldTransformId:Float, worldTransformId:Float, worldTransformRevisionCounter:Float, worldTransformUsingLocalTransformId:Float, worldTransformUsingParentTransformId:Float, binding:Dynamic, ?uid:Null<String>, colorAdjustments:Null<Array<flight.esm.types.adjustments_contract.Types.Adjustment>>, colorAdjustmentsUnsupported:Bool, resolvedColorMatrix:Null<js.lib.Float32Array>, resolvedColorScaleBias:Null<flight.esm.types.adjustments_contract.Types.ColorScaleBias> };

typedef NodeRuntimeFactory<R> = (() -> R);

typedef NodeSignals = { onChildAdded:flight.esm.types.signals.Types.Signal<flight.esm.types.node.Types.NodeAny>, onChildRemoved:flight.esm.types.signals.Types.Signal<flight.esm.types.node.Types.NodeAny>, onChildrenChanged:flight.esm.types.signals.Types.Signal<Void>, onChildrenOrderChanged:flight.esm.types.signals.Types.Signal<Void>, onParentChanged:flight.esm.types.signals.Types.Signal<Void> };

typedef PartialNode<T> = { ?data:Dynamic };

typedef RendererData = Dynamic;

typedef Scene2DFitContext<Fields> = { align:flight.esm.types.layout.Types.ViewportAlign, root:Null<flight.esm.types.node.Types.Node<Fields>>, scaleMode:flight.esm.types.node.Types.ViewportScaleMode };

typedef Spatial2DNode<Fields> = { data:Null<flight.esm.types.node.Types.NodeData>, enabled:Bool, kind:String, name:Null<String>, pivotX:Float, pivotY:Float, rotation:Float, scaleX:Float, scaleY:Float, skewX:Float, skewY:Float, x:Float, y:Float };

typedef Transform2DNode<Fields> = { data:Null<flight.esm.types.node.Types.NodeData>, enabled:Bool, kind:String, name:Null<String>, pivotX:Float, pivotY:Float, rotation:Float, scaleX:Float, scaleY:Float, skewX:Float, skewY:Float, x:Float, y:Float };

typedef Transform3DNode<Fields> = { data:Null<flight.esm.types.node.Types.NodeData>, enabled:Bool, kind:String, name:Null<String>, position:flight.esm.types.geometry.Types.Vector3, rotation:flight.esm.types.geometry.Types.Quaternion, scale:flight.esm.types.geometry.Types.Vector3 };

typedef Viewport = { devicePixelRatio:Float, height:Float, width:Float, x:Float, y:Float };

typedef ViewportLike = { ?devicePixelRatio:Null<Float>, ?height:Null<Float>, ?width:Null<Float>, ?x:Null<Float>, ?y:Null<Float> };

typedef ViewportScaleMode = String;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
