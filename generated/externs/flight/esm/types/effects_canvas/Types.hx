package flight.esm.types.effects_canvas;

#if (js && flight_esm)
typedef CanvasEffectContext = flight.esm.types.scene2d_canvas.Types.CanvasEffectContext;

typedef CanvasEffectRunner = flight.esm.types.scene2d_canvas.Types.CanvasEffectRunner;

typedef CanvasEffectSourceMode = String;

typedef CanvasEffectState = { options:flight.esm.types.effects.Types.EffectStateOptions, sceneTarget:Null<flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget>, pool:flight.esm.types.scene2d_canvas.Types.CanvasRenderTargetPool, lutCache:flight.esm.types.adjustments_contract.Types.ColorLutCache };

typedef CanvasRenderTargetPool = flight.esm.types.scene2d_canvas.Types.CanvasRenderTargetPool;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
