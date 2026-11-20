package flight.esm.types.sdk_effects_canvas;

#if (js && flight_esm)
typedef CanvasEffectContext = flight.esm.types.scene2d_canvas.Types.CanvasEffectContext;

typedef CanvasEffectRunner = flight.esm.types.scene2d_canvas.Types.CanvasEffectRunner;

typedef CanvasEffectSourceMode = flight.esm.types.effects_canvas.Types.CanvasEffectSourceMode;

typedef CanvasEffectState = flight.esm.types.effects_canvas.Types.CanvasEffectState;

typedef CanvasRenderTargetPool = flight.esm.types.scene2d_canvas.Types.CanvasRenderTargetPool;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
