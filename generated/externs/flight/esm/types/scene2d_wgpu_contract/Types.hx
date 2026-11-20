package flight.esm.types.scene2d_wgpu_contract;

#if (js && flight_esm)
typedef WgpuColorAdjustmentMaterialFeature = flight.esm.types.render_wgpu_contract.Types.WgpuColorAdjustmentMaterialFeature;

typedef WgpuColorAdjustmentMaterialFeatureGuard = flight.esm.types.render_wgpu_contract.Types.WgpuColorAdjustmentMaterialFeatureGuard;

typedef WgpuRenderStats = { drawCallCount:Float, instanceCount:Float, batchFlushCount:Float, textureUploadCount:Float };

typedef WgpuRichTextOverlay = ((context:js.html.CanvasRenderingContext2D, source:flight.esm.types.text.Types.RichText, result:flight.esm.types.textlayout.Types.TextLayoutResult, fieldW:Float, fieldH:Float, text:String) -> Void);

typedef WgpuShapeMesh = flight.esm.types.render_wgpu_contract.Types.WgpuShapeMesh;

typedef WgpuShapeRendererData = { image:Null<flight.esm.types.image_contract.Types.ImageResource>, lastContentId:Float, lastH:Float, lastPixelRatio:Float, lastW:Float, meshBuffers:flight.esm.types.render_wgpu_contract.Types.WgpuShapeMeshBuffers, meshVersion:Float, meshes:Null<Array<flight.esm.types.render_wgpu_contract.Types.WgpuShapeMesh>>, surface:Null<flight.esm.types.surface.Types.CanvasSurface> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
