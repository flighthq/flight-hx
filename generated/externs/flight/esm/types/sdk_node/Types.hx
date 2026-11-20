package flight.esm.types.sdk_node;

#if (js && flight_esm)
typedef AppearanceNode<Fields> = flight.esm.types.node.Types.AppearanceNode<Fields>;

typedef BlendModeNode<Fields> = flight.esm.types.node.Types.BlendModeNode<Fields>;

typedef BoundsNode<Fields> = flight.esm.types.node.Types.BoundsNode<Fields>;

typedef BoundsNodeAny = flight.esm.types.node.Types.BoundsNodeAny;

typedef ClipNode<Fields> = flight.esm.types.node.Types.ClipNode<Fields>;

typedef ColorScaleBiasNode<Fields> = flight.esm.types.node.Types.ColorScaleBiasNode<Fields>;

typedef HasAppearance = flight.esm.types.node.Types.HasAppearance;

typedef HasAppearanceRuntime = flight.esm.types.node.Types.HasAppearanceRuntime;

typedef HasBlendMode = flight.esm.types.node.Types.HasBlendMode;

typedef HasBoundsRectangle = flight.esm.types.node.Types.HasBoundsRectangle;

typedef HasBoundsRectangleRuntime<Fields> = flight.esm.types.node.Types.HasBoundsRectangleRuntime<Fields>;

typedef HasClip = flight.esm.types.node.Types.HasClip;

typedef HasColorScaleBias = flight.esm.types.node.Types.HasColorScaleBias;

typedef HasMaterial = flight.esm.types.node.Types.HasMaterial;

typedef HasTransform2D = flight.esm.types.node.Types.HasTransform2D;

typedef HasTransform2DRuntime = flight.esm.types.node.Types.HasTransform2DRuntime;

typedef HasTransform3D = flight.esm.types.node.Types.HasTransform3D;

typedef HasTransform3DRuntime = flight.esm.types.node.Types.HasTransform3DRuntime;

typedef MaterialNode<Fields> = flight.esm.types.node.Types.MaterialNode<Fields>;

typedef MethodsOf<T> = flight.esm.types.node.Types.MethodsOf<T>;

typedef Node<Fields> = flight.esm.types.node.Types.Node<Fields>;

typedef NodeAny = flight.esm.types.node.Types.NodeAny;

typedef NodeData = flight.esm.types.node.Types.NodeData;

typedef NodeDataFactory<D> = flight.esm.types.node.Types.NodeDataFactory<D>;

typedef NodeDescendantVisitor<Fields> = flight.esm.types.node.Types.NodeDescendantVisitor<Fields>;

typedef NodeFields = flight.esm.types.node.Types.NodeFields;

typedef NodeFieldsKey<T> = flight.esm.types.node.Types.NodeFieldsKey<T>;

typedef NodeOf<Fields> = flight.esm.types.node.Types.NodeOf<Fields>;

typedef NodeOrderList<Fields> = flight.esm.types.node.Types.NodeOrderList<Fields>;

typedef NodeOrderListEntryVisitor<Fields> = flight.esm.types.node.Types.NodeOrderListEntryVisitor<Fields>;

typedef NodeRef = flight.esm.types.node.Types.NodeRef;

typedef NodeRuntime<Fields> = flight.esm.types.node.Types.NodeRuntime<Fields>;

typedef NodeRuntimeFactory<R> = flight.esm.types.node.Types.NodeRuntimeFactory<R>;

typedef NodeSignals = flight.esm.types.node.Types.NodeSignals;

typedef PartialNode<T> = flight.esm.types.node.Types.PartialNode<T>;

typedef RendererData = flight.esm.types.node.Types.RendererData;

typedef Scene2DFitContext<Fields> = flight.esm.types.node.Types.Scene2DFitContext<Fields>;

typedef Spatial2DNode<Fields> = flight.esm.types.node.Types.Spatial2DNode<Fields>;

typedef Transform2DNode<Fields> = flight.esm.types.node.Types.Transform2DNode<Fields>;

typedef Transform3DNode<Fields> = flight.esm.types.node.Types.Transform3DNode<Fields>;

typedef Viewport = flight.esm.types.node.Types.Viewport;

typedef ViewportLike = flight.esm.types.node.Types.ViewportLike;

typedef ViewportScaleMode = flight.esm.types.node.Types.ViewportScaleMode;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
