package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/textureatlas")
extern class Textureatlas {
  public static final TextureAtlasRotation:flight.esm.types.textureatlas.Types.TextureAtlasRotation;
  public static function addTextureAtlasRegion(target:flight.esm.types.textureatlas_contract.Types.TextureAtlas, x:Float, y:Float, width:Float, height:Float, ?pivotX:Null<Float>, ?pivotY:Null<Float>, ?name:Null<String>):Void;
  public static function addTextureAtlasRegionCorners(target:flight.esm.types.textureatlas_contract.Types.TextureAtlas, ax:Float, ay:Float, bx:Float, by:Float, ?pivotX:Null<Float>, ?pivotY:Null<Float>, ?name:Null<String>):Void;
  public static function addTextureAtlasRegionRectangle(target:flight.esm.types.textureatlas_contract.Types.TextureAtlas, rect:flight.esm.types.geometry.Types.RectangleLike, ?pivot:Null<flight.esm.types.geometry.Types.Vector2Like>, ?name:Null<String>):Void;
  public static function addTextureAtlasRegionVector2(target:flight.esm.types.textureatlas_contract.Types.TextureAtlas, a:flight.esm.types.geometry.Types.Vector2Like, b:flight.esm.types.geometry.Types.Vector2Like, ?pivot:Null<flight.esm.types.geometry.Types.Vector2Like>, ?name:Null<String>):Void;
  public static function areTextureAtlasGuardsEnabled():Bool;
  public static function buildTextureAtlasRegionIndex(atlas:flight.esm.types.textureatlas_contract.Types.TextureAtlas):js.lib.Map<String, flight.esm.types.textureatlas_contract.Types.TextureAtlasRegion>;
  public static function clearTextureAtlasRegions(target:flight.esm.types.textureatlas_contract.Types.TextureAtlas):Void;
  public static function createTextureAtlas(?obj:Dynamic):flight.esm.types.textureatlas_contract.Types.TextureAtlas;
  public static function createTextureAtlasFromGrid(options:flight.esm.types.textureatlas_contract.Types.GridSliceOptions, ?texture:Null<flight.esm.types.texture_contract.Types.Texture2D>):flight.esm.types.textureatlas_contract.Types.TextureAtlas;
  public static function createTextureAtlasFromImageResource(resource:flight.esm.types.image_contract.Types.ImageResource):flight.esm.types.textureatlas_contract.Types.TextureAtlas;
  public static function createTextureAtlasRegion(?obj:Dynamic):flight.esm.types.textureatlas_contract.Types.TextureAtlasRegion;
  public static function disableTextureAtlasGuards():Void;
  public static function disposeTextureAtlas(atlas:flight.esm.types.textureatlas_contract.Types.TextureAtlas):Void;
  public static function enableTextureAtlasGuards(logState:flight.esm.types.log.Types.LogState, clock:(() -> Float)):Void;
  public static function explainTextureAtlasRegionTexture(atlas:flight.esm.types.textureatlas_contract.Types.TextureAtlas, regionId:Float):flight.esm.types.textureatlas_contract.Types.TextureAtlasRegionTextureExplanation;
  public static function getTextureAtlasByteSize(atlas:flight.esm.types.textureatlas_contract.Types.TextureAtlas):Float;
  public static function getTextureAtlasRegionById(atlas:flight.esm.types.textureatlas_contract.Types.TextureAtlas, id:Float):Null<flight.esm.types.textureatlas_contract.Types.TextureAtlasRegion>;
  public static function getTextureAtlasRegionByName(atlas:flight.esm.types.textureatlas_contract.Types.TextureAtlas, name:String):Null<flight.esm.types.textureatlas_contract.Types.TextureAtlasRegion>;
  public static function getTextureAtlasRegionByOrdinal(atlas:flight.esm.types.textureatlas_contract.Types.TextureAtlas, prefix:String, ordinal:Float):Null<flight.esm.types.textureatlas_contract.Types.TextureAtlasRegion>;
  public static function getTextureAtlasRegionCount(atlas:flight.esm.types.textureatlas_contract.Types.TextureAtlas):Float;
  public static function getTextureAtlasRegionFrame(region:flight.esm.types.textureatlas_contract.Types.TextureAtlasRegion, out:flight.esm.types.geometry.Types.RectangleLike):Void;
  public static function getTextureAtlasRegionOrdinal(region:flight.esm.types.textureatlas_contract.Types.TextureAtlasRegion):Float;
  public static function getTextureAtlasRegionSequence(atlas:flight.esm.types.textureatlas_contract.Types.TextureAtlas, prefix:String, out:Array<flight.esm.types.textureatlas_contract.Types.TextureAtlasRegion>):Void;
  public static function getTextureAtlasRegionTexture(atlas:flight.esm.types.textureatlas_contract.Types.TextureAtlas, regionId:Float):Null<flight.esm.types.texture_contract.Types.Texture2D>;
  public static function getTextureAtlasRegionUv(region:flight.esm.types.textureatlas_contract.Types.TextureAtlasRegion, imageWidth:Float, imageHeight:Float, out:flight.esm.types.geometry.Types.RectangleLike):Void;
  public static function getTextureAtlasRegionUvQuad(region:flight.esm.types.textureatlas_contract.Types.TextureAtlasRegion, imageWidth:Float, imageHeight:Float, out:Array<Float>):Void;
  public static function hasTextureAtlasRegion(atlas:flight.esm.types.textureatlas_contract.Types.TextureAtlas, name:String):Bool;
  public static function loadTextureAtlasFromBase64(hostImage:flight.esm.types.image_contract.Types.HostImageCapability, base64:String, mimeType:String, ?signal:Null<js.html.AbortSignal>):js.lib.Promise<flight.esm.types.textureatlas_contract.Types.TextureAtlas>;
  public static function loadTextureAtlasFromBlob(hostImage:flight.esm.types.image_contract.Types.HostImageCapability, blob:js.html.Blob, ?signal:Null<js.html.AbortSignal>):js.lib.Promise<flight.esm.types.textureatlas_contract.Types.TextureAtlas>;
  public static function loadTextureAtlasFromBytes(hostImage:flight.esm.types.image_contract.Types.HostImageCapability, bytes:js.lib.Uint8Array, ?mimeType:Null<String>, ?signal:Null<js.html.AbortSignal>):js.lib.Promise<flight.esm.types.textureatlas_contract.Types.TextureAtlas>;
  public static function loadTextureAtlasFromUrl(hostImage:flight.esm.types.image_contract.Types.HostImageCapability, url:String, ?crossOrigin:Null<String>, ?signal:Null<js.html.AbortSignal>):js.lib.Promise<flight.esm.types.textureatlas_contract.Types.TextureAtlas>;
  public static function removeTextureAtlasRegion(target:flight.esm.types.textureatlas_contract.Types.TextureAtlas, id:Float):Bool;
  public static function setTextureAtlasRegion(out:flight.esm.types.textureatlas_contract.Types.TextureAtlasRegion, source:Dynamic):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
