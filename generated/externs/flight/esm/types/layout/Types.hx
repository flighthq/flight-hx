package flight.esm.types.layout;

#if (js && flight_esm)
typedef AnchorLayoutItemStyle = { ?align:Null<String>, ?bottom:Null<Float>, ?height:Null<Float>, ?left:Null<Float>, ?right:Null<Float>, ?top:Null<Float>, ?width:Null<Float> };

typedef FlexLayoutAlign = String;

typedef FlexLayoutContainerStyle = { ?align:Null<String>, ?direction:Null<String>, ?gap:Null<Float>, ?justify:Null<String>, ?paddingBottom:Null<Float>, ?paddingLeft:Null<Float>, ?paddingRight:Null<Float>, ?paddingTop:Null<Float>, ?wrap:Null<String> };

typedef FlexLayoutDirection = String;

typedef FlexLayoutItemStyle = { ?alignSelf:Null<String>, ?basis:Dynamic, ?grow:Null<Float>, ?shrink:Null<Float> };

typedef FlexLayoutJustify = String;

typedef FlexLayoutWrap = String;

typedef GridLayoutContainerStyle = { ?columnGap:Null<Float>, columns:Array<flight.esm.types.layout.Types.GridLayoutTrack>, ?paddingBottom:Null<Float>, ?paddingLeft:Null<Float>, ?paddingRight:Null<Float>, ?paddingTop:Null<Float>, ?rowGap:Null<Float>, rows:Array<flight.esm.types.layout.Types.GridLayoutTrack> };

typedef GridLayoutItemStyle = { ?column:Null<Float>, ?columnSpan:Null<Float>, ?row:Null<Float>, ?rowSpan:Null<Float> };

typedef GridLayoutTrack = { kind:String };

typedef LayoutNode<ContainerStyle, ItemStyle> = { containerStyle:Null<ContainerStyle>, itemStyle:Null<ItemStyle>, kind:String, parentIndex:Float };

typedef LayoutResolutionExplanation = { actualLength:Float, kind:flight.esm.types.layout.Types.LayoutResolutionFailureKind, nodeIndex:Float, parentIndex:Float, requiredLength:Float, resolverKind:Null<String> };

typedef LayoutResolutionFailureKind = String;

typedef LayoutResolutionGuard = ((explanation:flight.esm.types.layout.Types.LayoutResolutionExplanation) -> Void);

typedef LayoutResolver = ((out:js.lib.Float32Array, tree:flight.esm.types.layout.Types.LayoutTree, intrinsicSizes:Dynamic, parentIndex:Float, childIndex:Float) -> Null<String>);

typedef LayoutState = { guard:Null<flight.esm.types.layout.Types.LayoutResolutionGuard>, lastFailureActualLength:Float, lastFailureKind:Null<String>, lastFailureNodeIndex:Float, lastFailureParentIndex:Float, lastFailureRequiredLength:Float, lastFailureResolverKind:Null<String>, resolvers:js.lib.Map<String, flight.esm.types.layout.Types.LayoutResolver> };

typedef LayoutTree = { nodes:Array<flight.esm.types.layout.Types.LayoutNode<Dynamic, Dynamic>> };

typedef ViewportAlign = String;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
