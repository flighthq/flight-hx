package flight.esm.types.sdk_layout;

#if (js && flight_esm)
typedef AnchorLayoutItemStyle = flight.esm.types.layout.Types.AnchorLayoutItemStyle;

typedef FlexLayoutAlign = flight.esm.types.layout.Types.FlexLayoutAlign;

typedef FlexLayoutContainerStyle = flight.esm.types.layout.Types.FlexLayoutContainerStyle;

typedef FlexLayoutDirection = flight.esm.types.layout.Types.FlexLayoutDirection;

typedef FlexLayoutItemStyle = flight.esm.types.layout.Types.FlexLayoutItemStyle;

typedef FlexLayoutJustify = flight.esm.types.layout.Types.FlexLayoutJustify;

typedef FlexLayoutWrap = flight.esm.types.layout.Types.FlexLayoutWrap;

typedef GridLayoutContainerStyle = flight.esm.types.layout.Types.GridLayoutContainerStyle;

typedef GridLayoutItemStyle = flight.esm.types.layout.Types.GridLayoutItemStyle;

typedef GridLayoutTrack = flight.esm.types.layout.Types.GridLayoutTrack;

typedef LayoutNode<ContainerStyle, ItemStyle> = flight.esm.types.layout.Types.LayoutNode<ContainerStyle, ItemStyle>;

typedef LayoutResolutionExplanation = flight.esm.types.layout.Types.LayoutResolutionExplanation;

typedef LayoutResolutionFailureKind = flight.esm.types.layout.Types.LayoutResolutionFailureKind;

typedef LayoutResolutionGuard = flight.esm.types.layout.Types.LayoutResolutionGuard;

typedef LayoutResolver = flight.esm.types.layout.Types.LayoutResolver;

typedef LayoutState = flight.esm.types.layout.Types.LayoutState;

typedef LayoutTree = flight.esm.types.layout.Types.LayoutTree;

typedef ViewportAlign = flight.esm.types.layout.Types.ViewportAlign;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
