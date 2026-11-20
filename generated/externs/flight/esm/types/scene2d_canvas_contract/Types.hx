package flight.esm.types.scene2d_canvas_contract;

#if (js && flight_esm)
typedef CanvasEffectContext = flight.esm.types.scene2d_canvas.Types.CanvasEffectContext;

typedef CanvasEffectRunner = flight.esm.types.scene2d_canvas.Types.CanvasEffectRunner;

typedef CanvasMaterialState = flight.esm.types.scene2d_canvas.Types.CanvasMaterialState;

typedef CanvasQuadMaterialRenderer = flight.esm.types.scene2d_canvas.Types.CanvasQuadMaterialRenderer;

typedef CanvasRenderOptions = flight.esm.types.scene2d_canvas.Types.CanvasRenderOptions;

typedef CanvasRenderPass = flight.esm.types.scene2d_canvas.Types.CanvasRenderPass;

typedef CanvasRenderPassViewport = flight.esm.types.scene2d_canvas.Types.CanvasRenderPassViewport;

typedef CanvasRenderRegistries = flight.esm.types.scene2d_canvas.Types.CanvasRenderRegistries;

typedef CanvasRenderState = flight.esm.types.scene2d_canvas.Types.CanvasRenderState;

typedef CanvasRenderStateOptions = flight.esm.types.scene2d_canvas.Types.CanvasRenderStateOptions;

typedef CanvasRenderStateRuntime = flight.esm.types.scene2d_canvas.Types.CanvasRenderStateRuntime;

typedef CanvasRenderTarget = flight.esm.types.scene2d_canvas.Types.CanvasRenderTarget;

typedef CanvasRenderTargetPool = flight.esm.types.scene2d_canvas.Types.CanvasRenderTargetPool;

typedef CanvasRenderTargetSurfaceOwnership = flight.esm.types.scene2d_canvas.Types.CanvasRenderTargetSurfaceOwnership;

typedef CanvasRenderTextureEntry = flight.esm.types.scene2d_canvas.Types.CanvasRenderTextureEntry;

typedef CanvasRenderTextureExplanation = flight.esm.types.scene2d_canvas.Types.CanvasRenderTextureExplanation;

typedef CanvasRenderTexturePool = flight.esm.types.scene2d_canvas.Types.CanvasRenderTexturePool;

typedef CanvasRenderTextureStatus = flight.esm.types.scene2d_canvas.Types.CanvasRenderTextureStatus;

typedef CanvasSavedBlendMode = flight.esm.types.scene2d_canvas.Types.CanvasSavedBlendMode;

typedef CanvasSavedPassState = flight.esm.types.scene2d_canvas.Types.CanvasSavedPassState;

typedef CanvasScreenRenderTarget = flight.esm.types.scene2d_canvas.Types.CanvasScreenRenderTarget;

typedef CanvasShapeCommand<K> = { draw:flight.esm.types.scene2d_canvas_contract.Types.CanvasShapeHandler, key:K, fillBounds:Null<flight.esm.types.shape.Types.ShapeBoundsCommandHandler>, strokeBounds:Null<flight.esm.types.shape.Types.ShapeBoundsCommandHandler> };

typedef CanvasShapeDrawState = { canvasTextureResolvers:flight.esm.types.scene2d_canvas.Types.CanvasTextureResolvers, allowSmoothing:Bool, hasFill:Bool, fillStyle:Dynamic, fillMatrix:Null<flight.esm.types.geometry.Types.Matrix>, fillMatrixInverse:Null<flight.esm.types.geometry.Types.Matrix>, hasStroke:Bool, lineScaleMode:flight.esm.types.shape.Types.LineScaleMode, strokeStyle:Dynamic, strokeWidth:Float, currentX:Float, currentY:Float, hasPendingPath:Bool, hasCurrentPoint:Bool, subpathStartX:Float, subpathStartY:Float, windingRule:String, bitmapSrc:Dynamic, bitmapW:Float, bitmapH:Float, flush:(() -> Void) };

typedef CanvasShapeHandler = ((ctx:js.html.CanvasRenderingContext2D, state:flight.esm.types.scene2d_canvas_contract.Types.CanvasShapeDrawState, buf:Array<Dynamic>, i:Float) -> Void);

typedef CanvasTextureRenderTarget = flight.esm.types.scene2d_canvas.Types.CanvasTextureRenderTarget;

typedef CanvasTextureResolver = flight.esm.types.scene2d_canvas.Types.CanvasTextureResolver;

typedef CanvasTextureResolvers = flight.esm.types.scene2d_canvas.Types.CanvasTextureResolvers;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
