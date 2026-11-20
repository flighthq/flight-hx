package flight.esm.render_gl;

#if (js && flight_esm)
@:jsRequire("@flighthq/render-gl/contract")
extern class Contract {
  public static final LINEAR_TO_SRGB_FRAGMENT_SRC:String;
  public static function acquireGlRenderPassHandle(gl:flight.esm.types.render_gl.Types.GlContext, state:flight.esm.types.render_gl.Types.GlRenderState, target:flight.esm.types.render_gl.Types.GlRenderTarget):flight.esm.types.render_gl.Types.GlRenderPass;
  public static function acquireGlRenderTexture(state:flight.esm.types.render_gl.Types.GlRenderState, pool:flight.esm.types.render_gl.Types.GlRenderTexturePool, descriptor:flight.esm.types.render_contract.Types.RenderTargetDescriptor):flight.esm.types.render_contract.Types.RenderTexture;
  @:overload(function(state:flight.esm.types.render_gl.Types.GlRenderState, pool:flight.esm.types.render_gl.Types.GlTextureRenderTargetPool, descriptor:flight.esm.types.render_contract.Types.RenderTargetDescriptor, formatPolicy:String):flight.esm.types.render_gl.Types.GlTextureRenderTarget {})
  @:overload(function(state:flight.esm.types.render_gl.Types.GlRenderState, pool:flight.esm.types.render_gl.Types.GlTextureRenderTargetPool, descriptor:flight.esm.types.render_contract.Types.RenderTargetDescriptor, formatPolicy:String):Null<flight.esm.types.render_gl.Types.GlTextureRenderTarget> {})
  @:overload(function(state:flight.esm.types.render_gl.Types.GlRenderState, pool:flight.esm.types.render_gl.Types.GlTextureRenderTargetPool, descriptor:flight.esm.types.render_contract.Types.RenderTargetDescriptor, formatPolicy:flight.esm.types.render_contract.Types.RenderTargetFormatPolicy):Null<flight.esm.types.render_gl.Types.GlTextureRenderTarget> {})
  public static function acquireGlTextureRenderTarget(state:flight.esm.types.render_gl.Types.GlRenderState, pool:flight.esm.types.render_gl.Types.GlTextureRenderTargetPool, descriptor:flight.esm.types.render_contract.Types.RenderTargetDescriptor):flight.esm.types.render_gl.Types.GlTextureRenderTarget;
  public static function applyGlBlendMode(state:flight.esm.types.render_gl.Types.GlRenderState, blendMode:Null<String>):Void;
  public static function applyGlSamplerState(state:flight.esm.types.render_gl.Types.GlRenderState, runtime:flight.esm.types.render_gl.Types.GlRenderStateRuntime, texture:Dynamic, sampler:Null<flight.esm.types.texture_contract.Types.SamplerLike>, ?smoothingOverride:Null<Bool>):Void;
  public static function areGlRenderStateGuardsEnabled(state:flight.esm.types.render_gl.Types.GlRenderState):Bool;
  public static function areGlRenderTextureGuardsEnabled(state:flight.esm.types.render_gl.Types.GlRenderState):Bool;
  public static function areGlTextureResolverGuardsEnabled(state:flight.esm.types.render_gl.Types.GlRenderState):Bool;
  public static function attachWindowRenderContext(hostGl:flight.esm.types.render_gl.Types.HostGlCapability, win:flight.esm.types.app.Types.AppWindow, surface:flight.esm.types.surface.Types.Surface):Void;
  public static function beginGlCubeRenderFace(state:flight.esm.types.render_gl.Types.GlRenderState, target:flight.esm.types.render_gl.Types.GlCubeRenderTarget, face:Float):flight.esm.types.render_gl.Types.GlRenderPass;
  public static function beginGlRenderPass(state:flight.esm.types.render_gl.Types.GlRenderState, target:flight.esm.types.render_gl.Types.GlRenderTarget, ?clear:Null<flight.esm.types.render_contract.Types.RenderTargetClear>, ?viewport:Null<flight.esm.types.node.Types.Viewport>):flight.esm.types.render_gl.Types.GlRenderPass;
  public static function bindGlBitmapTexture(state:flight.esm.types.render_gl.Types.GlRenderState, bitmap:flight.esm.types.bitmap.Types.Bitmap, ?sampler:Null<flight.esm.types.texture_contract.Types.SamplerLike>, ?smoothingOverride:Null<Bool>, ?premultiply:Bool, ?colorSpace:flight.esm.types.texture_contract.Types.TextureColorSpace):Dynamic;
  public static function bindGlCompressedImageTexture(state:flight.esm.types.render_gl.Types.GlRenderState, image:flight.esm.types.image_contract.Types.CompressedImageResource, ?sampler:Null<flight.esm.types.texture_contract.Types.SamplerLike>, ?smoothingOverride:Null<Bool>, ?colorSpace:flight.esm.types.texture_contract.Types.TextureColorSpace):Dynamic;
  public static function bindGlImageResourceTexture(state:flight.esm.types.render_gl.Types.GlRenderState, image:flight.esm.types.image_contract.Types.ImageResource, ?sampler:Null<flight.esm.types.texture_contract.Types.SamplerLike>, ?smoothingOverride:Null<Bool>, ?premultiply:Bool, ?colorSpace:flight.esm.types.texture_contract.Types.TextureColorSpace):Dynamic;
  public static function bindGlRenderTexture(state:flight.esm.types.render_gl.Types.GlRenderState, renderTexture:flight.esm.types.render_contract.Types.RenderTexture, ?sampler:Null<flight.esm.types.texture_contract.Types.SamplerLike>):Dynamic;
  public static function bindGlTexture(state:flight.esm.types.render_gl.Types.GlRenderState, imageSource:Dynamic, ?sampler:Null<flight.esm.types.texture_contract.Types.SamplerLike>):Dynamic;
  public static function bindGlTextureRealization(state:flight.esm.types.render_gl.Types.GlRenderState, realization:Null<flight.esm.types.render_gl.Types.GlTextureRealization>):Dynamic;
  public static function bindGlVideoTexture(state:flight.esm.types.render_gl.Types.GlRenderState, texture:flight.esm.types.texture_contract.Types.TextureLike, ?sampler:Null<flight.esm.types.texture_contract.Types.SamplerLike>):Dynamic;
  public static function buildGlRenderRegistries(options:flight.esm.types.render_gl.Types.GlRenderStateOptions):flight.esm.types.render_gl.Types.GlRenderRegistries;
  public static function clearGlRenderTarget(target:flight.esm.types.render_gl.Types.GlRenderTarget, clear:flight.esm.types.render_contract.Types.RenderTargetClear):Void;
  public static function clearGlRenderTargetAttachments(target:flight.esm.types.render_gl.Types.GlRenderTarget, clear:flight.esm.types.render_contract.Types.RenderTargetClear):Void;
  public static function clearGlRenderTexture(state:flight.esm.types.render_gl.Types.GlRenderState, renderTexture:flight.esm.types.render_contract.Types.RenderTexture):Void;
  public static function compileDefaultGlProgram(gl:flight.esm.types.render_gl.Types.GlContext):flight.esm.types.render_gl.Types.GlShaderLocations;
  public static function compileGlBitmapProgram(gl:flight.esm.types.render_gl.Types.GlContext, ?fragmentSrc:String):flight.esm.types.render_gl.Types.GlShaderLocations;
  public static function compileGlFullscreenProgram(gl:flight.esm.types.render_gl.Types.GlContext, fragmentSource:String):flight.esm.types.render_gl.Types.GlFullscreenProgram;
  public static function compileGlShader(gl:flight.esm.types.render_gl.Types.GlContext, type:Float, source:String, ?label:String):Dynamic;
  public static function createDefaultGlBitmapShader(shaderLoc:flight.esm.types.render_gl.Types.GlShaderLocations, matrixArray:js.lib.Float32Array):flight.esm.types.render_gl.Types.GlBitmapShader;
  public static function createExternalGlTexture(state:flight.esm.types.render_gl.Types.GlRenderState, handle:Dynamic, options:flight.esm.types.render_contract.Types.CreateExternalTextureOptions):flight.esm.types.texture_contract.Types.Texture;
  public static function createGlBitmapShader(gl:flight.esm.types.render_gl.Types.GlContext, fragmentSrc:String, ?onBind:Null<((gl:flight.esm.types.render_gl.Types.GlContext, locations:flight.esm.types.render_gl.Types.GlShaderLocations, renderProxy:flight.esm.types.render_contract.Types.RenderProxy2D) -> Void)>):flight.esm.types.render_gl.Types.GlBitmapShader;
  public static function createGlContextState(gl:flight.esm.types.render_gl.Types.GlContext):flight.esm.types.render_gl.Types.GlContextState;
  public static function createGlCubeRenderTarget(state:flight.esm.types.render_gl.Types.GlRenderState, size:Float, ?options:Null<flight.esm.types.render_gl.Types.GlCubeRenderTargetOptions>):flight.esm.types.render_gl.Types.GlCubeRenderTarget;
  public static function createGlProgram(gl:flight.esm.types.render_gl.Types.GlContext, vertexSource:String, fragmentSource:String, ?label:String):Dynamic;
  public static function createGlRenderState(gl:flight.esm.types.render_gl.Types.GlContext, ?options:flight.esm.types.render_gl.Types.GlRenderStateOptions):flight.esm.types.render_gl.Types.GlRenderState;
  public static function createGlRenderStateRuntime(contextState:flight.esm.types.render_gl.Types.GlContextState, options:flight.esm.types.render_gl.Types.GlRenderStateOptions):flight.esm.types.render_gl.Types.GlRenderStateRuntime;
  public static function createGlRenderTexturePool():flight.esm.types.render_gl.Types.GlRenderTexturePool;
  public static function createGlRenderViewResources(context:flight.esm.types.render_gl.Types.GlContext, width:Float, height:Float, devicePixelRatio:Float, ?options:flight.esm.types.render_gl.Types.GlRenderStateOptions, ?target:flight.esm.types.render.Types.RenderViewTargetOptions):flight.esm.types.render_gl.Types.GlRenderViewResources;
  public static function createGlScreenRenderTarget(gl:flight.esm.types.render_gl.Types.GlContext):flight.esm.types.render_gl.Types.GlScreenRenderTarget;
  public static function createGlSkinPaletteTexture(gl:flight.esm.types.render_gl.Types.GlContext):flight.esm.types.render_gl.Types.GlSkinPaletteTexture;
  public static function createGlTexture(state:flight.esm.types.render_gl.Types.GlRenderState):Dynamic;
  @:overload(function(state:flight.esm.types.render_gl.Types.GlRenderState, descriptor:flight.esm.types.render_contract.Types.RenderTargetDescriptor, formatPolicy:String):flight.esm.types.render_gl.Types.GlTextureRenderTarget {})
  @:overload(function(state:flight.esm.types.render_gl.Types.GlRenderState, descriptor:flight.esm.types.render_contract.Types.RenderTargetDescriptor, formatPolicy:String):Null<flight.esm.types.render_gl.Types.GlTextureRenderTarget> {})
  @:overload(function(state:flight.esm.types.render_gl.Types.GlRenderState, descriptor:flight.esm.types.render_contract.Types.RenderTargetDescriptor, formatPolicy:flight.esm.types.render_contract.Types.RenderTargetFormatPolicy):Null<flight.esm.types.render_gl.Types.GlTextureRenderTarget> {})
  public static function createGlTextureRenderTarget(state:flight.esm.types.render_gl.Types.GlRenderState, descriptor:flight.esm.types.render_contract.Types.RenderTargetDescriptor):flight.esm.types.render_gl.Types.GlTextureRenderTarget;
  public static function createGlTextureRenderTargetPool():flight.esm.types.render_gl.Types.GlTextureRenderTargetPool;
  public static function declareGlRenderTargetColorSpace(state:flight.esm.types.render_gl.Types.GlRenderState, colorSpace:flight.esm.types.render_contract.Types.RenderTargetColorSpace):Bool;
  public static function destroyGlCubeRenderTarget(target:flight.esm.types.render_gl.Types.GlCubeRenderTarget):Void;
  public static function destroyGlRenderState(state:flight.esm.types.render_gl.Types.GlRenderState):Void;
  public static function destroyGlRenderTexture(state:flight.esm.types.render_gl.Types.GlRenderState, renderTexture:flight.esm.types.render_contract.Types.RenderTexture):Void;
  public static function destroyGlRenderTexturePool(state:flight.esm.types.render_gl.Types.GlRenderState, pool:flight.esm.types.render_gl.Types.GlRenderTexturePool):Void;
  public static function destroyGlRenderViewResources(resources:flight.esm.types.render_gl.Types.GlRenderViewResources):Void;
  public static function destroyGlSkinPaletteTexture(gl:flight.esm.types.render_gl.Types.GlContext, palette:flight.esm.types.render_gl.Types.GlSkinPaletteTexture):Void;
  public static function destroyGlTextureRenderTarget(target:flight.esm.types.render_gl.Types.GlTextureRenderTarget):Void;
  public static function destroyGlTextureRenderTargetPool(pool:flight.esm.types.render_gl.Types.GlTextureRenderTargetPool):Void;
  public static function detachWindowRenderContext(win:flight.esm.types.app.Types.AppWindow):Void;
  public static function detectGlCompressedTextureSupport(gl:flight.esm.types.render_gl.Types.GlContext):flight.esm.types.render_gl.Types.GlCompressedTextureSupport;
  public static function disposeExternalGlTexture(state:flight.esm.types.render_gl.Types.GlRenderState, texture:flight.esm.types.texture_contract.Types.Texture):Bool;
  public static function drawGlFullscreenPass(state:flight.esm.types.render_gl.Types.GlRenderState, program:flight.esm.types.render_gl.Types.GlFullscreenProgram, inputs:Array<Dynamic>, dest:Null<flight.esm.types.render_gl.Types.GlRenderTarget>, setUniforms:((gl:flight.esm.types.render_gl.Types.GlContext, program:flight.esm.types.render_gl.Types.GlFullscreenProgram) -> Void)):Void;
  public static function drawGlLinearToSrgbPass(state:flight.esm.types.render_gl.Types.GlRenderState, source:flight.esm.types.render_gl.Types.GlTextureRenderTarget, dest:Null<flight.esm.types.render_gl.Types.GlRenderTarget>):Void;
  public static function drawGlQuad(state:flight.esm.types.render_gl.Types.GlRenderState, x0:Float, y0:Float, x1:Float, y1:Float, u0:Float, v0:Float, u1:Float, v1:Float):Void;
  public static function drawGlTextureRenderTargetResult(pass:flight.esm.types.render_gl.Types.GlRenderPass, renderProxy:flight.esm.types.render_contract.Types.RenderProxy2D, target:flight.esm.types.render_gl.Types.GlTextureRenderTarget, transform:flight.esm.types.geometry.Types.Matrix):Void;
  public static function enableGlBlendModeSupport(state:flight.esm.types.render_gl.Types.GlRenderState):Void;
  public static function enableGlRenderStateGuards(state:flight.esm.types.render_gl.Types.GlRenderState, logState:Null<flight.esm.types.log.Types.LogState>):Void;
  public static function enableGlRenderTextureGuards(state:flight.esm.types.render_gl.Types.GlRenderState, logState:Null<flight.esm.types.log.Types.LogState>):Void;
  public static function enableGlTextureResolverGuards(state:flight.esm.types.render_gl.Types.GlRenderState, logState:Null<flight.esm.types.log.Types.LogState>):Void;
  public static function endGlCubeRenderFace(pass:flight.esm.types.render_gl.Types.GlRenderPass):Void;
  public static function endGlRenderPass(pass:flight.esm.types.render_gl.Types.GlRenderPass):Void;
  public static function ensureDefaultGlBitmapShader(state:flight.esm.types.render_gl.Types.GlRenderState):flight.esm.types.render_gl.Types.GlBitmapShader;
  public static function explainGlRenderTexture(state:flight.esm.types.render_gl.Types.GlRenderState, renderTexture:flight.esm.types.render_contract.Types.RenderTexture):flight.esm.types.render_gl.Types.GlRenderTextureExplanation;
  public static function explainGlTextureRenderTarget(target:flight.esm.types.render_gl.Types.GlTextureRenderTarget):flight.esm.types.render_contract.Types.RenderTargetExplanation;
  public static function explainGlTextureResolution(state:flight.esm.types.render_gl.Types.GlRenderState, texture:flight.esm.types.texture_contract.Types.TextureLike):flight.esm.types.texture_contract.Types.TextureResolutionExplanation;
  public static function fillGlRect(pass:flight.esm.types.render_gl.Types.GlRenderPass, color:Float, ?rect:Null<flight.esm.types.geometry.Types.RectangleLike>):Void;
  public static function getGlColorAdjustmentMaterialFeature(state:flight.esm.types.render_gl.Types.GlRenderState):Null<flight.esm.types.render_gl.Types.GlColorAdjustmentMaterialFeature>;
  public static function getGlColorAdjustmentMaterialFeatureGuard(state:flight.esm.types.render_gl.Types.GlRenderState):Null<flight.esm.types.render_gl.Types.GlColorAdjustmentMaterialFeatureGuard>;
  public static function getGlCompressedTextureFormat(gl:flight.esm.types.render_gl.Types.GlContext, format:flight.esm.types.texture_formats.Types.TextureContainerFormat):Float;
  public static function getGlContextRuntime(contextState:flight.esm.types.render_gl.Types.GlContextState):flight.esm.types.render_gl.Types.GlContextRuntime;
  public static function getGlCurrentRenderPass(state:flight.esm.types.render_gl.Types.GlRenderState):Null<flight.esm.types.render_gl.Types.GlRenderPass>;
  public static function getGlMaterialShader(state:flight.esm.types.render_gl.Types.GlRenderState, kind:String):Null<flight.esm.types.render_gl.Types.GlBitmapShader>;
  public static function getGlQuadMaterialRenderer(state:flight.esm.types.render_gl.Types.GlRenderState, kind:String):Null<flight.esm.types.render_gl.Types.GlQuadMaterialRenderer>;
  public static function getGlRenderStateRuntime(state:flight.esm.types.render_gl.Types.GlRenderState):flight.esm.types.render_gl.Types.GlRenderStateRuntime;
  public static function getGlRenderTextureColorSpace(state:flight.esm.types.render_gl.Types.GlRenderState, renderTexture:flight.esm.types.render_contract.Types.RenderTexture):flight.esm.types.texture_contract.Types.TextureColorSpace;
  public static function getGlRenderTextureTarget(state:flight.esm.types.render_gl.Types.GlRenderState, renderTexture:flight.esm.types.render_contract.Types.RenderTexture):Null<flight.esm.types.render_gl.Types.GlTextureRenderTarget>;
  public static function getGlShader(renderProxy:flight.esm.types.render_contract.Types.RenderProxy2D):Null<flight.esm.types.render_gl.Types.GlBitmapShader>;
  public static function hasGlCompressedTextureFormat(support:flight.esm.types.render_gl.Types.GlCompressedTextureSupport, format:flight.esm.types.texture_formats.Types.TextureContainerFormat):Bool;
  public static function initializeDefaultGlBitmapShader(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.render_gl.Types.GlBitmapShader>, shaderLoc:flight.esm.types.render_gl.Types.GlShaderLocations, matrixArray:js.lib.Float32Array):Void;
  public static function initializeExternalGlTextureSource(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.render_contract.Types.ExternalTexture>, options:flight.esm.types.render_contract.Types.CreateExternalTextureOptions):Void;
  public static function initializeGlBitmapShader(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.render_gl.Types.GlBitmapShader>, gl:flight.esm.types.render_gl.Types.GlContext, fragmentSrc:String, ?onBind:Null<((gl:flight.esm.types.render_gl.Types.GlContext, locations:flight.esm.types.render_gl.Types.GlShaderLocations, renderProxy:flight.esm.types.render_contract.Types.RenderProxy2D) -> Void)>):Void;
  public static function initializeGlContextState(state:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.render_gl.Types.GlContextState>, gl:flight.esm.types.render_gl.Types.GlContext):Void;
  public static function initializeGlCubeRenderTarget(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.render_gl.Types.GlCubeRenderTarget>, gl:flight.esm.types.render_gl.Types.GlContext, size:Float, framebuffer:Dynamic, texture:Dynamic, depthStencilRenderbuffer:Dynamic):Void;
  public static function initializeGlRenderTexturePool(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.render_gl.Types.GlRenderTexturePool>):Void;
  public static function initializeGlSkinPaletteTexture(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.render_gl.Types.GlSkinPaletteTexture>, gl:flight.esm.types.render_gl.Types.GlContext):Void;
  public static function initializeGlTextureRenderTarget(target:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.render_gl.Types.GlTextureRenderTarget>, requested:flight.esm.types.render_contract.Types.ResolvedRenderTargetDescriptor, storage:Dynamic, texture:Dynamic):Void;
  public static function initializeGlTextureRenderTargetPool(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.render_gl.Types.GlTextureRenderTargetPool>):Void;
  public static function invalidateGlRenderStateCache(state:flight.esm.types.render_gl.Types.GlRenderState):Void;
  public static function invalidateGlRenderTexture(state:flight.esm.types.render_gl.Types.GlRenderState, renderTexture:flight.esm.types.render_contract.Types.RenderTexture, ?status:String):Void;
  public static function isBlendModeSupported(state:flight.esm.types.render_gl.Types.GlRenderState, blendMode:String):Bool;
  public static function isGlRenderTargetFormatSupported(state:flight.esm.types.render_gl.Types.GlRenderState, format:flight.esm.types.render_contract.Types.RenderTargetFormat):Bool;
  public static function isGlRenderTextureReady(state:flight.esm.types.render_gl.Types.GlRenderState, renderTexture:flight.esm.types.render_contract.Types.RenderTexture):Bool;
  public static function linkGlProgram(gl:flight.esm.types.render_gl.Types.GlContext, program:Dynamic, ?label:String):Void;
  public static function popGlRenderState(state:flight.esm.types.render_gl.Types.GlRenderState):Void;
  public static function presentGlRenderTarget(state:flight.esm.types.render_gl.Types.GlRenderState, target:flight.esm.types.render_gl.Types.GlTextureRenderTarget, ?dest:Null<flight.esm.types.render_gl.Types.GlRenderTarget>):Void;
  public static function pushGlRenderState(state:flight.esm.types.render_gl.Types.GlRenderState):Void;
  public static function readGlRenderTargetPixels(state:flight.esm.types.render_gl.Types.GlRenderState, target:flight.esm.types.render_gl.Types.GlTextureRenderTarget, x:Float, y:Float, width:Float, height:Float, out:Dynamic):Bool;
  public static function registerDefaultGlBlendModes(state:flight.esm.types.render_gl.Types.GlRenderState):Void;
  public static function registerGlBitmapShader(state:flight.esm.types.render_gl.Types.GlRenderState, shader:flight.esm.types.render_gl.Types.GlBitmapShader):Void;
  public static function registerGlBitmapTextureResolver(state:flight.esm.types.render_gl.Types.GlRenderState):Void;
  public static function registerGlBlendMode(state:flight.esm.types.render_gl.Types.GlRenderState, blendMode:String, realization:flight.esm.types.render_gl.Types.GlBlendRealization):Void;
  public static function registerGlCompressedImageTextureResolver(state:flight.esm.types.render_gl.Types.GlRenderState):Void;
  public static function registerGlCompressedTextureDecoder(state:flight.esm.types.render_gl.Types.GlRenderState, decode:Null<flight.esm.types.render_gl.Types.GlCompressedTextureDecoder>):Void;
  public static function registerGlCompressedTextureUpload(state:flight.esm.types.render_gl.Types.GlRenderState, ?uploader:Dynamic):Void;
  public static function registerGlContextTeardown(contextState:flight.esm.types.render_gl.Types.GlContextState, teardown:((gl:flight.esm.types.render_gl.Types.GlContext) -> Void)):Void;
  public static function registerGlImageTextureResolver(state:flight.esm.types.render_gl.Types.GlRenderState):Void;
  public static function registerGlMaterialShader(state:flight.esm.types.render_gl.Types.GlRenderState, kind:String, shader:flight.esm.types.render_gl.Types.GlBitmapShader):Void;
  public static function registerGlQuadMaterialRenderer(state:flight.esm.types.render_gl.Types.GlRenderState, kind:String, renderer:flight.esm.types.render_gl.Types.GlQuadMaterialRenderer):Void;
  public static function registerGlRenderStateTeardown(state:flight.esm.types.render_gl.Types.GlRenderState, teardown:((state:flight.esm.types.render_gl.Types.GlRenderState) -> Void)):Void;
  public static function registerGlRenderTextureResolver(state:flight.esm.types.render_gl.Types.GlRenderState):Void;
  public static function registerGlTextureResolver(state:flight.esm.types.render_gl.Types.GlRenderState, sourceKind:String, resolver:Null<flight.esm.types.render_gl.Types.GlTextureResolver>):Void;
  public static function registerStandardGlTextureResolvers(state:flight.esm.types.render_gl.Types.GlRenderState):Void;
  public static function releaseGlRenderPassHandle(gl:flight.esm.types.render_gl.Types.GlContext, handle:flight.esm.types.render_gl.Types.GlRenderPass):Void;
  public static function releaseGlRenderTexture(state:flight.esm.types.render_gl.Types.GlRenderState, pool:flight.esm.types.render_gl.Types.GlRenderTexturePool, renderTexture:flight.esm.types.render_contract.Types.RenderTexture):Void;
  public static function releaseGlTextureRenderTarget(pool:flight.esm.types.render_gl.Types.GlTextureRenderTargetPool, target:flight.esm.types.render_gl.Types.GlTextureRenderTarget):Void;
  public static function renderIntoGlRenderTexture(state:flight.esm.types.render_gl.Types.GlRenderState, renderTexture:flight.esm.types.render_contract.Types.RenderTexture, callback_:((pass:flight.esm.types.render_gl.Types.GlRenderPass) -> Void), clear:flight.esm.types.render_contract.Types.RenderTargetClear):Void;
  public static function resizeGlRenderViewResources(resources:flight.esm.types.render_gl.Types.GlRenderViewResources, width:Float, height:Float):Void;
  public static function resizeGlTextureRenderTarget(state:flight.esm.types.render_gl.Types.GlRenderState, target:flight.esm.types.render_gl.Types.GlTextureRenderTarget, width:Float, height:Float):Void;
  public static function resolveGlQuadMaterialRenderer(state:flight.esm.types.render_gl.Types.GlRenderState, material:Null<flight.esm.types.materials_contract.Types.Material>):Null<flight.esm.types.render_gl.Types.GlQuadMaterialRenderer>;
  @:overload(function(state:flight.esm.types.render_gl.Types.GlRenderState, descriptor:flight.esm.types.render_contract.Types.RenderTargetDescriptor, formatPolicy:String):flight.esm.types.render_contract.Types.RenderTargetAxes {})
  @:overload(function(state:flight.esm.types.render_gl.Types.GlRenderState, descriptor:flight.esm.types.render_contract.Types.RenderTargetDescriptor, formatPolicy:String):Null<flight.esm.types.render_contract.Types.RenderTargetAxes> {})
  @:overload(function(state:flight.esm.types.render_gl.Types.GlRenderState, descriptor:flight.esm.types.render_contract.Types.RenderTargetDescriptor, formatPolicy:flight.esm.types.render_contract.Types.RenderTargetFormatPolicy):Null<flight.esm.types.render_contract.Types.RenderTargetAxes> {})
  public static function resolveGlRenderTargetAxes(state:flight.esm.types.render_gl.Types.GlRenderState, descriptor:flight.esm.types.render_contract.Types.RenderTargetDescriptor):flight.esm.types.render_contract.Types.RenderTargetAxes;
  public static function resolveGlShader(state:flight.esm.types.render_gl.Types.GlRenderState, renderProxy:flight.esm.types.render_contract.Types.RenderProxy2D):flight.esm.types.render_gl.Types.GlBitmapShader;
  public static function resolveGlTexture(state:flight.esm.types.render_gl.Types.GlRenderState, texture:flight.esm.types.texture_contract.Types.TextureLike, ?premultiply:Bool, ?workingColorSpace:flight.esm.types.render_contract.Types.RenderTargetColorSpace):Dynamic;
  public static function resolveGlTextureRenderTarget(state:flight.esm.types.render_gl.Types.GlRenderState, target:flight.esm.types.render_gl.Types.GlTextureRenderTarget):Void;
  public static function setGlAttributes(gl:flight.esm.types.render_gl.Types.GlContext, loc:flight.esm.types.render_gl.Types.GlShaderLocations):Void;
  public static function setGlBaseUniforms(gl:flight.esm.types.render_gl.Types.GlContext, loc:flight.esm.types.render_gl.Types.GlShaderLocations, renderProxy:flight.esm.types.render_contract.Types.RenderProxy):Void;
  public static function setGlMatrixFromTransform(gl:flight.esm.types.render_gl.Types.GlContext, loc:flight.esm.types.render_gl.Types.GlShaderLocations, m:js.lib.Float32Array, t:Dynamic, viewportWidth:Float, viewportHeight:Float):Void;
  public static function setGlMatrixFromValues(gl:flight.esm.types.render_gl.Types.GlContext, loc:flight.esm.types.render_gl.Types.GlShaderLocations, m:js.lib.Float32Array, a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float, viewportWidth:Float, viewportHeight:Float):Void;
  public static function setGlQuadMatrixFromOffset(state:flight.esm.types.render_gl.Types.GlRenderState, a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float, dx:Float, dy:Float):Void;
  public static function setGlRenderTextureGuard(state:flight.esm.types.render_gl.Types.GlRenderState, guard:Null<flight.esm.types.render_gl.Types.GlRenderTextureGuard>):Void;
  public static function setGlShader(state:flight.esm.types.render_gl.Types.GlRenderState, node:flight.esm.types.scene2d_contract.Types.Node2D, shader:Null<flight.esm.types.render_gl.Types.GlBitmapShader>):Void;
  public static final standardGlBlendRealizations:js.lib.Map<String, flight.esm.types.render_gl.Types.GlBlendRealization>;
  public static final standardGlTextureResolvers:js.lib.Map<String, Dynamic>;
  public static function updateGlTexture(state:flight.esm.types.render_gl.Types.GlRenderState, texture:Dynamic, canvas:js.html.CanvasElement):Void;
  public static function uploadGlCompressedTextureContainer(gl:flight.esm.types.render_gl.Types.GlContext, container:flight.esm.types.texture_formats.Types.TextureContainer, payload:js.lib.Uint8Array, ?decode:Null<flight.esm.types.render_gl.Types.GlCompressedTextureDecoder>, ?colorSpace:Null<String>):Bool;
  public static function uploadGlSkinPaletteTexture(gl:flight.esm.types.render_gl.Types.GlContext, palette:flight.esm.types.render_gl.Types.GlSkinPaletteTexture, jointMatrices:js.lib.Float32Array, jointCount:Float, ?texelsPerJoint:Float):Void;
  public static function uploadGlTextureData(gl:flight.esm.types.render_gl.Types.GlContext, target:Float, width:Float, height:Float, data:js.lib.Uint8Array, ?internalFormat:Float):Void;
  public static function uploadGlTextureElement(gl:flight.esm.types.render_gl.Types.GlContext, target:Float, source:Dynamic, ?internalFormat:Float):Void;
  public static function uploadGlTextureImageResource(gl:flight.esm.types.render_gl.Types.GlContext, target:Float, image:flight.esm.types.image_contract.Types.ImageResource, ?internalFormat:Float):Void;
  public static function uploadGlTextureVideoFrame(gl:flight.esm.types.render_gl.Types.GlContext, image:flight.esm.types.image_contract.Types.ImageResource, uploadedVersion:Float, ?internalFormat:Float):Float;
  public static function useGlProgram(state:flight.esm.types.render_gl.Types.GlRenderState, ?shader:Null<flight.esm.types.render_gl.Types.GlBitmapShader>):Void;
  public static function withGlRenderState<T>(state:flight.esm.types.render_gl.Types.GlRenderState, callback_:(() -> T)):T;
  public static function withGlRenderTextures<T>(state:flight.esm.types.render_gl.Types.GlRenderState, pool:flight.esm.types.render_gl.Types.GlRenderTexturePool, descriptors:Array<flight.esm.types.render_contract.Types.RenderTargetDescriptor>, callback_:((textures:Array<flight.esm.types.render_contract.Types.RenderTexture>) -> T)):T;
  public static function writeGlRenderTextureTarget<T>(state:flight.esm.types.render_gl.Types.GlRenderState, renderTexture:flight.esm.types.render_contract.Types.RenderTexture, callback_:((target:flight.esm.types.render_gl.Types.GlTextureRenderTarget) -> T)):T;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
