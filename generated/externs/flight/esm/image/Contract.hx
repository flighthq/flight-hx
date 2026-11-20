package flight.esm.image;

#if (js && flight_esm)
@:jsRequire("@flighthq/image/contract")
extern class Contract {
  public static final ImageResourceFailureKind:Dynamic;
  public static final ImageResourceReferenceKind:Dynamic;
  public static function cloneImageResource(resource:flight.esm.types.image_contract.Types.ImageResource):flight.esm.types.image_contract.Types.ImageResource;
  public static function createCompressedImageResource(compressed:flight.esm.types.image_contract.Types.CompressedImageData):flight.esm.types.image_contract.Types.CompressedImageResource;
  public static function createEmbeddedImageResourceReference(bytes:js.lib.Uint8Array, ?mimeType:Null<String>, ?alphaType:flight.esm.types.texture_contract.Types.AlphaType):flight.esm.types.image.Types.EmbeddedImageResourceReference;
  public static function createExternalImageResourceReference(uri:String, ?basePath:Null<String>):flight.esm.types.image.Types.ExternalImageResourceReference;
  public static function createImageResource(image:Dynamic):flight.esm.types.image_contract.Types.ImageResource;
  public static function createImageResourceFailure(cause:Dynamic):flight.esm.types.image.Types.ImageResourceFailure;
  public static function createImageResourceFromBitmap(hostImage:flight.esm.types.image_contract.Types.HostImageCapability, bitmap:flight.esm.types.bitmap.Types.Bitmap):Null<flight.esm.types.image_contract.Types.ImageResource>;
  public static function explainImageResourceReferenceResolution(ref:flight.esm.types.image.Types.ImageResourceReference):flight.esm.types.image.Types.ImageResourceReferenceResolutionExplanation;
  public static function getHostImageSourceDimensions(source:Dynamic, out:flight.esm.types.image_contract.Types.HostImageDimensions):Bool;
  public static function hasHostImageDimensionResolver():Bool;
  public static function initializeCompressedImageResource(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.image_contract.Types.CompressedImageResource>, compressed:flight.esm.types.image_contract.Types.CompressedImageData):Void;
  public static function initializeEmbeddedImageResourceReference(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.image.Types.EmbeddedImageResourceReference>, bytes:js.lib.Uint8Array, ?mimeType:Null<String>, ?alphaType:flight.esm.types.texture_contract.Types.AlphaType):Void;
  public static function initializeExternalImageResourceReference(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.image.Types.ExternalImageResourceReference>, uri:String, ?basePath:Null<String>):Void;
  public static function invalidateImageResource(resource:flight.esm.types.image_contract.Types.ImageResource):Void;
  public static function isImageResourceEmpty(resource:flight.esm.types.image_contract.Types.ImageResource):Bool;
  public static function isImageUrlSameOrigin(url:String):Bool;
  public static function loadImageResourceFromBase64(hostImage:flight.esm.types.image_contract.Types.HostImageCapability, base64:String, mimeType:String, ?signal:Null<js.html.AbortSignal>):js.lib.Promise<flight.esm.types.image_contract.Types.ImageResource>;
  public static function loadImageResourceFromBlob(hostImage:flight.esm.types.image_contract.Types.HostImageCapability, blob:js.html.Blob, ?signal:Null<js.html.AbortSignal>):js.lib.Promise<flight.esm.types.image_contract.Types.ImageResource>;
  public static function loadImageResourceFromBytes(hostImage:flight.esm.types.image_contract.Types.HostImageCapability, bytes:js.lib.Uint8Array, ?mimeType:Null<String>, ?signal:Null<js.html.AbortSignal>):js.lib.Promise<flight.esm.types.image_contract.Types.ImageResource>;
  public static function loadImageResourceFromUrl(hostImage:flight.esm.types.image_contract.Types.HostImageCapability, url:String, ?crossOrigin:Null<String>, ?signal:Null<js.html.AbortSignal>):js.lib.Promise<flight.esm.types.image_contract.Types.ImageResource>;
  public static function registerHostImageDimensionResolver(resolver:flight.esm.types.image_contract.Types.HostImageDimensionResolver):Void;
  public static function registerImageBitmapCompositionResolver(resolver:Null<flight.esm.types.image_contract.Types.ImageBitmapCompositionResolver>):Void;
  public static function registerTestImageDimensionResolver():Void;
  public static function resetFailedImageResourceReference(ref:flight.esm.types.image.Types.ImageResourceReference):Bool;
  public static function resolveImageResourceReference(imageDecode:flight.esm.types.image_codec_contract.Types.HostImageDecodeCapabilities, ref:flight.esm.types.image.Types.ImageResourceReference, fetch:flight.esm.types.image.Types.ImageResourceFetch, signal:js.html.AbortSignal, ?fallbackDecode:Null<flight.esm.types.image_codec_contract.Types.ImageDecodeFallback>):js.lib.Promise<Null<flight.esm.types.texture_contract.Types.TextureSource>>;
  public static function testImageDimensionResolver(source:Dynamic, out:flight.esm.types.image_contract.Types.HostImageDimensions):Bool;
  public static function unregisterHostImageDimensionResolver():Void;
  public static function unregisterTestImageDimensionResolver():Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
