package flight.esm.types.sdk_render;

#if (js && flight_esm)
typedef EffectPadding = flight.esm.types.render.Types.EffectPadding;

typedef EffectPaddingResolver = flight.esm.types.render.Types.EffectPaddingResolver;

typedef RenderCacheKind = flight.esm.types.render.Types.RenderCacheKind;

typedef RenderView<State, Target> = flight.esm.types.render.Types.RenderView<State, Target>;

typedef RenderViewResize<State, Target> = flight.esm.types.render.Types.RenderViewResize<State, Target>;

typedef RenderViewTargetOptions = flight.esm.types.render.Types.RenderViewTargetOptions;

typedef SpriteRenderer = flight.esm.types.render.Types.SpriteRenderer;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
