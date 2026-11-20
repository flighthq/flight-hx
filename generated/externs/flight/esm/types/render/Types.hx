package flight.esm.types.render;

#if (js && flight_esm)
typedef EffectPadding = { bottom:Float, left:Float, right:Float, top:Float };

typedef EffectPaddingResolver = ((effect:Dynamic) -> flight.esm.types.render.Types.EffectPadding);

typedef RenderCacheKind = String;

typedef RenderView<State, Target> = { renderState:State, renderTarget:Target, viewport:flight.esm.types.node.Types.Viewport };

typedef RenderViewResize<State, Target> = ((renderState:State, renderTarget:Target, width:Float, height:Float) -> Void);

typedef RenderViewTargetOptions = { ?format:Null<String>, ?colorAttachments:Null<Float>, ?colorFormats:Null<Array<flight.esm.types.render_contract.Types.RenderTargetFormat>>, ?sampleCount:Null<Float>, ?depth:Null<String>, ?colorSpace:Null<String> };

typedef SpriteRenderer = { createData:((state:flight.esm.types.render_contract.Types.RenderState, source:flight.esm.types.scene2d_contract.Types.Sprite) -> Null<flight.esm.types.node.Types.RendererData>), submit:((state:flight.esm.types.render_contract.Types.RenderState, node:flight.esm.types.render_contract.Types.RenderProxy2D) -> Void), ?format:Null<Float>, ?destroyData:Null<((state:flight.esm.types.render_contract.Types.RenderState, data:flight.esm.types.node.Types.RendererData) -> Void)>, ?isDirty:Null<((state:flight.esm.types.render_contract.Types.RenderState, source:flight.esm.types.node.Types.NodeAny, data:Null<flight.esm.types.node.Types.RendererData>) -> Bool)> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
