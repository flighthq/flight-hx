package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/render-gl")
extern class RenderGl {
  public static function acquireGlRenderTexture(state:flight.esm.types.render_gl.Types.GlRenderState, pool:flight.esm.types.render_gl.Types.GlRenderTexturePool, descriptor:flight.esm.types.render_contract.Types.RenderTargetDescriptor):flight.esm.types.render_contract.Types.RenderTexture;
  public static function attachWindowRenderContext(hostGl:flight.esm.types.render_gl.Types.HostGlCapability, win:flight.esm.types.app.Types.AppWindow, surface:flight.esm.types.surface.Types.Surface):Void;
  public static function beginGlCubeRenderFace(state:flight.esm.types.render_gl.Types.GlRenderState, target:flight.esm.types.render_gl.Types.GlCubeRenderTarget, face:Float):flight.esm.types.render_gl.Types.GlRenderPass;
  public static function beginGlRenderPass(state:flight.esm.types.render_gl.Types.GlRenderState, target:flight.esm.types.render_gl.Types.GlRenderTarget, ?clear:Null<flight.esm.types.render_contract.Types.RenderTargetClear>, ?viewport:Null<flight.esm.types.node.Types.Viewport>):flight.esm.types.render_gl.Types.GlRenderPass;
  public static function buildGlRenderRegistries(options:flight.esm.types.render_gl.Types.GlRenderStateOptions):flight.esm.types.render_gl.Types.GlRenderRegistries;
  public static function clearGlRenderTarget(target:flight.esm.types.render_gl.Types.GlRenderTarget, clear:flight.esm.types.render_contract.Types.RenderTargetClear):Void;
  public static function clearGlRenderTargetAttachments(target:flight.esm.types.render_gl.Types.GlRenderTarget, clear:flight.esm.types.render_contract.Types.RenderTargetClear):Void;
  public static function clearGlRenderTexture(state:flight.esm.types.render_gl.Types.GlRenderState, renderTexture:flight.esm.types.render_contract.Types.RenderTexture):Void;
  public static function createExternalGlTexture(state:flight.esm.types.render_gl.Types.GlRenderState, handle:Dynamic, options:flight.esm.types.render_contract.Types.CreateExternalTextureOptions):flight.esm.types.texture_contract.Types.Texture;
  public static function createGlCubeRenderTarget(state:flight.esm.types.render_gl.Types.GlRenderState, size:Float, ?options:Null<flight.esm.types.render_gl.Types.GlCubeRenderTargetOptions>):flight.esm.types.render_gl.Types.GlCubeRenderTarget;
  public static function createGlRenderState(gl:flight.esm.types.render_gl.Types.GlContext, ?options:flight.esm.types.render_gl.Types.GlRenderStateOptions):flight.esm.types.render_gl.Types.GlRenderState;
  public static function createGlRenderTexturePool():flight.esm.types.render_gl.Types.GlRenderTexturePool;
  public static function createGlRenderViewResources(context:flight.esm.types.render_gl.Types.GlContext, width:Float, height:Float, devicePixelRatio:Float, ?options:flight.esm.types.render_gl.Types.GlRenderStateOptions, ?target:flight.esm.types.render.Types.RenderViewTargetOptions):flight.esm.types.render_gl.Types.GlRenderViewResources;
  public static function createGlScreenRenderTarget(gl:flight.esm.types.render_gl.Types.GlContext):flight.esm.types.render_gl.Types.GlScreenRenderTarget;
  @:overload(function(state:flight.esm.types.render_gl.Types.GlRenderState, descriptor:flight.esm.types.render_contract.Types.RenderTargetDescriptor, formatPolicy:String):flight.esm.types.render_gl.Types.GlTextureRenderTarget {})
  @:overload(function(state:flight.esm.types.render_gl.Types.GlRenderState, descriptor:flight.esm.types.render_contract.Types.RenderTargetDescriptor, formatPolicy:String):Null<flight.esm.types.render_gl.Types.GlTextureRenderTarget> {})
  @:overload(function(state:flight.esm.types.render_gl.Types.GlRenderState, descriptor:flight.esm.types.render_contract.Types.RenderTargetDescriptor, formatPolicy:flight.esm.types.render_contract.Types.RenderTargetFormatPolicy):Null<flight.esm.types.render_gl.Types.GlTextureRenderTarget> {})
  public static function createGlTextureRenderTarget(state:flight.esm.types.render_gl.Types.GlRenderState, descriptor:flight.esm.types.render_contract.Types.RenderTargetDescriptor):flight.esm.types.render_gl.Types.GlTextureRenderTarget;
  public static function destroyGlCubeRenderTarget(target:flight.esm.types.render_gl.Types.GlCubeRenderTarget):Void;
  public static function destroyGlRenderState(state:flight.esm.types.render_gl.Types.GlRenderState):Void;
  public static function destroyGlRenderTexture(state:flight.esm.types.render_gl.Types.GlRenderState, renderTexture:flight.esm.types.render_contract.Types.RenderTexture):Void;
  public static function destroyGlRenderTexturePool(state:flight.esm.types.render_gl.Types.GlRenderState, pool:flight.esm.types.render_gl.Types.GlRenderTexturePool):Void;
  public static function destroyGlRenderViewResources(resources:flight.esm.types.render_gl.Types.GlRenderViewResources):Void;
  public static function destroyGlTextureRenderTarget(target:flight.esm.types.render_gl.Types.GlTextureRenderTarget):Void;
  public static function detachWindowRenderContext(win:flight.esm.types.app.Types.AppWindow):Void;
  public static function disposeExternalGlTexture(state:flight.esm.types.render_gl.Types.GlRenderState, texture:flight.esm.types.texture_contract.Types.Texture):Bool;
  public static function enableGlBlendModeSupport(state:flight.esm.types.render_gl.Types.GlRenderState):Void;
  public static function enableGlRenderStateGuards(state:flight.esm.types.render_gl.Types.GlRenderState, logState:Null<flight.esm.types.log.Types.LogState>):Void;
  public static function enableGlRenderTextureGuards(state:flight.esm.types.render_gl.Types.GlRenderState, logState:Null<flight.esm.types.log.Types.LogState>):Void;
  public static function enableGlTextureResolverGuards(state:flight.esm.types.render_gl.Types.GlRenderState, logState:Null<flight.esm.types.log.Types.LogState>):Void;
  public static function endGlCubeRenderFace(pass:flight.esm.types.render_gl.Types.GlRenderPass):Void;
  public static function endGlRenderPass(pass:flight.esm.types.render_gl.Types.GlRenderPass):Void;
  public static function explainGlRenderTexture(state:flight.esm.types.render_gl.Types.GlRenderState, renderTexture:flight.esm.types.render_contract.Types.RenderTexture):flight.esm.types.render_gl.Types.GlRenderTextureExplanation;
  public static function explainGlTextureRenderTarget(target:flight.esm.types.render_gl.Types.GlTextureRenderTarget):flight.esm.types.render_contract.Types.RenderTargetExplanation;
  public static function explainGlTextureResolution(state:flight.esm.types.render_gl.Types.GlRenderState, texture:flight.esm.types.texture_contract.Types.TextureLike):flight.esm.types.texture_contract.Types.TextureResolutionExplanation;
  public static function getGlCurrentRenderPass(state:flight.esm.types.render_gl.Types.GlRenderState):Null<flight.esm.types.render_gl.Types.GlRenderPass>;
  public static function getGlQuadMaterialRenderer(state:flight.esm.types.render_gl.Types.GlRenderState, kind:String):Null<flight.esm.types.render_gl.Types.GlQuadMaterialRenderer>;
  public static function isGlRenderTargetFormatSupported(state:flight.esm.types.render_gl.Types.GlRenderState, format:flight.esm.types.render_contract.Types.RenderTargetFormat):Bool;
  public static function popGlRenderState(state:flight.esm.types.render_gl.Types.GlRenderState):Void;
  public static function presentGlRenderTarget(state:flight.esm.types.render_gl.Types.GlRenderState, target:flight.esm.types.render_gl.Types.GlTextureRenderTarget, ?dest:Null<flight.esm.types.render_gl.Types.GlRenderTarget>):Void;
  public static function pushGlRenderState(state:flight.esm.types.render_gl.Types.GlRenderState):Void;
  public static function registerGlBitmapTextureResolver(state:flight.esm.types.render_gl.Types.GlRenderState):Void;
  public static function registerGlCompressedImageTextureResolver(state:flight.esm.types.render_gl.Types.GlRenderState):Void;
  public static function registerGlCompressedTextureDecoder(state:flight.esm.types.render_gl.Types.GlRenderState, decode:Null<flight.esm.types.render_gl.Types.GlCompressedTextureDecoder>):Void;
  public static function registerGlCompressedTextureUpload(state:flight.esm.types.render_gl.Types.GlRenderState, ?uploader:Dynamic):Void;
  public static function registerGlImageTextureResolver(state:flight.esm.types.render_gl.Types.GlRenderState):Void;
  public static function registerGlQuadMaterialRenderer(state:flight.esm.types.render_gl.Types.GlRenderState, kind:String, renderer:flight.esm.types.render_gl.Types.GlQuadMaterialRenderer):Void;
  public static function registerGlRenderTextureResolver(state:flight.esm.types.render_gl.Types.GlRenderState):Void;
  public static function registerGlTextureResolver(state:flight.esm.types.render_gl.Types.GlRenderState, sourceKind:String, resolver:Null<flight.esm.types.render_gl.Types.GlTextureResolver>):Void;
  public static function registerStandardGlTextureResolvers(state:flight.esm.types.render_gl.Types.GlRenderState):Void;
  public static function releaseGlRenderTexture(state:flight.esm.types.render_gl.Types.GlRenderState, pool:flight.esm.types.render_gl.Types.GlRenderTexturePool, renderTexture:flight.esm.types.render_contract.Types.RenderTexture):Void;
  public static function renderIntoGlRenderTexture(state:flight.esm.types.render_gl.Types.GlRenderState, renderTexture:flight.esm.types.render_contract.Types.RenderTexture, callback_:((pass:flight.esm.types.render_gl.Types.GlRenderPass) -> Void), clear:flight.esm.types.render_contract.Types.RenderTargetClear):Void;
  public static function resizeGlRenderViewResources(resources:flight.esm.types.render_gl.Types.GlRenderViewResources, width:Float, height:Float):Void;
  public static function resolveGlQuadMaterialRenderer(state:flight.esm.types.render_gl.Types.GlRenderState, material:Null<flight.esm.types.materials_contract.Types.Material>):Null<flight.esm.types.render_gl.Types.GlQuadMaterialRenderer>;
  public static function resolveGlTexture(state:flight.esm.types.render_gl.Types.GlRenderState, texture:flight.esm.types.texture_contract.Types.TextureLike, ?premultiply:Bool, ?workingColorSpace:flight.esm.types.render_contract.Types.RenderTargetColorSpace):Dynamic;
  public static final standardGlBlendRealizations:js.lib.Map<String, flight.esm.types.render_gl.Types.GlBlendRealization>;
  public static final standardGlTextureResolvers:js.lib.Map<String, Dynamic>;
  public static function withGlRenderState<T>(state:flight.esm.types.render_gl.Types.GlRenderState, callback_:(() -> T)):T;
  public static function withGlRenderTextures<T>(state:flight.esm.types.render_gl.Types.GlRenderState, pool:flight.esm.types.render_gl.Types.GlRenderTexturePool, descriptors:Array<flight.esm.types.render_contract.Types.RenderTargetDescriptor>, callback_:((textures:Array<flight.esm.types.render_contract.Types.RenderTexture>) -> T)):T;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
