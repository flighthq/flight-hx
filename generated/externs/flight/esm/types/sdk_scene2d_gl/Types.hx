package flight.esm.types.sdk_scene2d_gl;

#if (js && flight_esm)
typedef GlColorAdjustmentResources = flight.esm.types.render_gl.Types.GlColorAdjustmentResources;

typedef GlParticleResources = flight.esm.types.render_gl.Types.GlParticleResources;

typedef GlQuadBatchResources = flight.esm.types.render_gl.Types.GlQuadBatchResources;

typedef GlRichTextOverlay = flight.esm.types.scene2d_gl.Types.GlRichTextOverlay;

typedef GlShapeMesh = flight.esm.types.render_gl.Types.GlShapeMesh;

typedef GlShapeMeshBinding = flight.esm.types.render_gl.Types.GlShapeMeshBinding;

typedef GlShapeMeshResources = flight.esm.types.render_gl.Types.GlShapeMeshResources;

typedef GlShapeRendererData = flight.esm.types.scene2d_gl.Types.GlShapeRendererData;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
