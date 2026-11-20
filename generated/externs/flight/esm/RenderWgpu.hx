package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/render-wgpu")
extern class RenderWgpu {
  public static final WgpuBufferUsage:Dynamic;
  public static final WgpuColorWrite:Dynamic;
  public static final WgpuMapMode:Dynamic;
  public static final WgpuShaderStage:Dynamic;
  public static final WgpuTextureUsage:Dynamic;
  public static function acquireWgpuRenderTexture(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, pool:flight.esm.types.render_wgpu_contract.Types.WgpuRenderTexturePool, descriptor:flight.esm.types.render_contract.Types.RenderTargetDescriptor):flight.esm.types.render_contract.Types.RenderTexture;
  public static function beginWgpuFrame(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function beginWgpuRenderPass(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, target:flight.esm.types.render_wgpu_contract.Types.WgpuRenderTarget, ?clear:Null<flight.esm.types.render_contract.Types.RenderTargetClear>):flight.esm.types.render_wgpu_contract.Types.WgpuRenderPass;
  public static function buildWgpuRenderRegistries(options:flight.esm.types.render_wgpu_contract.Types.WgpuRenderStateOptions):flight.esm.types.render_wgpu_contract.Types.WgpuRenderRegistries;
  public static function createBitmapFromWgpuScreenRenderTarget(target:flight.esm.types.render_wgpu_contract.Types.WgpuScreenRenderTarget, ?timeoutMs:Float):js.lib.Promise<flight.esm.types.bitmap.Types.Bitmap>;
  public static function createExternalWgpuTexture(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, handle:flight.esm.types.render_wgpu_contract.Types.WgpuTexture, options:flight.esm.types.render_contract.Types.CreateExternalTextureOptions):flight.esm.types.texture_contract.Types.Texture;
  public static function createWgpuAcquisition(hostWgpu:flight.esm.types.render_wgpu_contract.Types.HostWgpuCapability, surface:flight.esm.types.surface.Types.Surface, ?options:flight.esm.types.render_wgpu_contract.Types.WgpuHostAcquisitionOptions):js.lib.Promise<Null<flight.esm.types.render_wgpu_contract.Types.WgpuHostAcquisition>>;
  public static function createWgpuDeviceState(device:flight.esm.types.render_wgpu_contract.Types.WgpuDevice):flight.esm.types.render_wgpu_contract.Types.WgpuDeviceState;
  @:overload(function(deviceState:flight.esm.types.render_wgpu_contract.Types.WgpuDeviceState, ?options:Null<flight.esm.types.render_wgpu_contract.Types.WgpuRenderStateOptions>):flight.esm.types.render_wgpu_contract.Types.WgpuRenderState {})
  public static function createWgpuOffscreenRenderState(source:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):flight.esm.types.render_wgpu_contract.Types.WgpuOffscreenRenderStateResult;
  public static function createWgpuRenderState(device:flight.esm.types.render_wgpu_contract.Types.WgpuDevice, ?options:flight.esm.types.render_wgpu_contract.Types.WgpuRenderStateOptions):flight.esm.types.render_wgpu_contract.Types.WgpuRenderState;
  public static function createWgpuRenderTexturePool():flight.esm.types.render_wgpu_contract.Types.WgpuRenderTexturePool;
  public static function createWgpuScreenRenderTarget(wgpuHost:flight.esm.types.render_wgpu_contract.Types.HostWgpuCapability, device:flight.esm.types.render_wgpu_contract.Types.WgpuDevice, drawable:flight.esm.types.surface.Types.Surface, ?options:flight.esm.types.render_wgpu_contract.Types.WgpuScreenRenderTargetOptions):flight.esm.types.render_wgpu_contract.Types.WgpuScreenRenderTarget;
  public static function createWgpuTextureRenderTarget(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, width:Float, height:Float, ?format:flight.esm.types.render_wgpu_contract.Types.WgpuTextureFormat, ?colorSpace:flight.esm.types.render_contract.Types.RenderTargetColorSpace, ?sampleCount:Float):flight.esm.types.render_wgpu_contract.Types.WgpuTextureRenderTarget;
  public static function destroyWgpuRenderState(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function destroyWgpuRenderTexture(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, renderTexture:flight.esm.types.render_contract.Types.RenderTexture):Void;
  public static function destroyWgpuRenderTexturePool(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, pool:flight.esm.types.render_wgpu_contract.Types.WgpuRenderTexturePool):Void;
  public static function destroyWgpuScreenRenderTarget(target:flight.esm.types.render_wgpu_contract.Types.WgpuScreenRenderTarget):Void;
  public static function destroyWgpuTextureRenderTarget(target:flight.esm.types.render_wgpu_contract.Types.WgpuTextureRenderTarget):Void;
  public static function disposeExternalWgpuTexture(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, texture:flight.esm.types.texture_contract.Types.Texture):Bool;
  public static function disposeWgpuDeviceSignals(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function enableWgpuBlendModeSupport(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function enableWgpuDeviceSignals(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):flight.esm.types.render_wgpu_contract.Types.WgpuDeviceSignals;
  public static function enableWgpuScreenRenderTargetAntialias(target:flight.esm.types.render_wgpu_contract.Types.WgpuScreenRenderTarget):Void;
  public static function enableWgpuScreenRenderTargetCapture(target:flight.esm.types.render_wgpu_contract.Types.WgpuScreenRenderTarget):Void;
  public static function enableWgpuTextureResolverGuards(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, logState:Null<flight.esm.types.log.Types.LogState>):Void;
  public static function endWgpuRenderPass(pass:flight.esm.types.render_wgpu_contract.Types.WgpuRenderPass):Void;
  public static function explainWgpuRenderTexture(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, renderTexture:flight.esm.types.render_contract.Types.RenderTexture):flight.esm.types.render_wgpu_contract.Types.WgpuRenderTextureExplanation;
  public static function explainWgpuTextureResolution(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, texture:flight.esm.types.texture_contract.Types.TextureLike):flight.esm.types.texture_contract.Types.TextureResolutionExplanation;
  public static function explainWgpuUniformEndianness():flight.esm.types.render_wgpu_contract.Types.WgpuUniformEndiannessExplanation;
  public static function getWgpuDeviceLoss(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Null<flight.esm.types.render_wgpu_contract.Types.WgpuDeviceLostInfo>;
  public static function getWgpuQuadMaterialRenderer(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, kind:String):Null<flight.esm.types.render_wgpu_contract.Types.WgpuQuadMaterialRenderer>;
  public static function isWgpuDeviceLost(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Bool;
  public static function isWgpuRenderTextureReady(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, renderTexture:flight.esm.types.render_contract.Types.RenderTexture):Bool;
  public static function registerStandardWgpuTextureResolvers(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuBitmapTextureResolver(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuCompressedImageTextureResolver(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuCompressedTextureDecoder(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, decode:Null<flight.esm.types.render_wgpu_compressed_texture_decoder_contract.Types.WgpuCompressedTextureDecoder>):Void;
  public static function registerWgpuCompressedTextureUpload(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, enabled:Bool):Void;
  public static function registerWgpuImageTextureResolver(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuMipmapGeneration(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuQuadMaterialRenderer(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, kind:String, renderer:flight.esm.types.render_wgpu_contract.Types.WgpuQuadMaterialRenderer):Void;
  public static function registerWgpuRenderTextureResolver(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuTextureResolver(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, sourceKind:String, resolver:Null<flight.esm.types.render_wgpu_contract.Types.WgpuTextureResolver>):Void;
  public static function releaseWgpuAcquisition(hostWgpu:flight.esm.types.render_wgpu_contract.Types.HostWgpuCapability, acquisition:flight.esm.types.render_wgpu_contract.Types.WgpuHostAcquisition):Void;
  public static function releaseWgpuRenderTexture(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, pool:flight.esm.types.render_wgpu_contract.Types.WgpuRenderTexturePool, renderTexture:flight.esm.types.render_contract.Types.RenderTexture):Void;
  public static function renderIntoWgpuRenderTexture(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, renderTexture:flight.esm.types.render_contract.Types.RenderTexture, callback_:((pass:flight.esm.types.render_wgpu_contract.Types.WgpuRenderPass) -> Void), clear:flight.esm.types.render_contract.Types.RenderTargetClear):Void;
  public static function resolveWgpuQuadMaterialRenderer(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, material:Null<flight.esm.types.materials_contract.Types.Material>):Null<flight.esm.types.render_wgpu_contract.Types.WgpuQuadMaterialRenderer>;
  public static function resolveWgpuTexture(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, texture:flight.esm.types.texture_contract.Types.TextureLike, ?premultiply:Bool, ?workingColorSpace:flight.esm.types.render_contract.Types.RenderTargetColorSpace):Null<flight.esm.types.render_wgpu_contract.Types.WgpuTextureEntry>;
  public static final standardWgpuTextureResolvers:js.lib.Map<String, Dynamic>;
  public static function submitWgpuFrame(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function withWgpuFrameBorrow<T>(ownerState:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, borrowerState:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, callback_:(() -> T)):T;
  public static function withWgpuRenderTextures<T>(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, pool:flight.esm.types.render_wgpu_contract.Types.WgpuRenderTexturePool, descriptors:Array<flight.esm.types.render_contract.Types.RenderTargetDescriptor>, callback_:((textures:Array<flight.esm.types.render_contract.Types.RenderTexture>) -> T)):T;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
