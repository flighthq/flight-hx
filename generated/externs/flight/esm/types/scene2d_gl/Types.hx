package flight.esm.types.scene2d_gl;

#if (js && flight_esm)
typedef GlColorAdjustmentResources = flight.esm.types.render_gl.Types.GlColorAdjustmentResources;

typedef GlParticleResources = flight.esm.types.render_gl.Types.GlParticleResources;

typedef GlQuadBatchResources = flight.esm.types.render_gl.Types.GlQuadBatchResources;

typedef GlRichTextOverlay = ((context:js.html.CanvasRenderingContext2D, source:flight.esm.types.text.Types.RichText, result:flight.esm.types.textlayout.Types.TextLayoutResult, fieldW:Float, fieldH:Float, text:String) -> Void);

typedef GlShapeMesh = flight.esm.types.render_gl.Types.GlShapeMesh;

typedef GlShapeMeshBinding = flight.esm.types.render_gl.Types.GlShapeMeshBinding;

typedef GlShapeMeshResources = flight.esm.types.render_gl.Types.GlShapeMeshResources;

typedef GlShapeRendererData = { image:Null<flight.esm.types.image_contract.Types.ImageResource>, lastContentId:Float, lastH:Float, lastPixelRatio:Float, lastW:Float, meshVersion:Float, meshes:Null<Array<flight.esm.types.render_gl.Types.GlShapeMesh>>, surface:Null<flight.esm.types.surface.Types.CanvasSurface> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
