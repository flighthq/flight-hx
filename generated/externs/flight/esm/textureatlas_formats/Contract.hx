package flight.esm.textureatlas_formats;

#if (js && flight_esm)
@:jsRequire("@flighthq/textureatlas-formats/contract")
extern class Contract {
  public static final TextureAtlasFormatKindAseprite:String;
  public static final TextureAtlasFormatKindCocosPlist:String;
  public static final TextureAtlasFormatKindLibgdxAtlas:String;
  public static final TextureAtlasFormatKindStarling:String;
  public static final TextureAtlasFormatKindTexturePacker:String;
  public static function applyTextureAtlasImportOptions(options:flight.esm.types.textureatlas_formats.Types.TextureAtlasImportOptions):Void;
  public static final asepriteTextureAtlasFormat:flight.esm.types.textureatlas_formats.Types.TextureAtlasFormatDescriptor;
  public static function detectTextureAtlasFormat(content:String):Null<String>;
  public static function getTextureAtlasFormat(kind:String):Null<flight.esm.types.textureatlas_formats.Types.TextureAtlasFormatEntry>;
  public static function getTextureAtlasFormatKinds():Array<String>;
  public static final libgdxAtlasTextureAtlasFormat:flight.esm.types.textureatlas_formats.Types.TextureAtlasFormatDescriptor;
  public static function parseTextureAtlas(content:String, atlas:flight.esm.types.textureatlas_contract.Types.TextureAtlas, ?formatKind:Null<String>, ?options:Null<flight.esm.types.textureatlas_formats.Types.TexturePackerAtlasParseOptions>):Null<flight.esm.types.textureatlas_contract.Types.TextureAtlas>;
  public static function parseTextureAtlasAsepriteDocument(doc:flight.esm.types.textureatlas_formats.Types.TextureAtlasAsepriteDocument, atlas:flight.esm.types.textureatlas_contract.Types.TextureAtlas):Void;
  public static function parseTextureAtlasAsepriteJson(json:String, atlas:flight.esm.types.textureatlas_contract.Types.TextureAtlas):Void;
  public static function parseTextureAtlasLibgdxAtlas(text:String, atlas:flight.esm.types.textureatlas_contract.Types.TextureAtlas):Void;
  public static function parseTextureAtlasStarlingXml(xml:String, atlas:flight.esm.types.textureatlas_contract.Types.TextureAtlas):Void;
  public static function parseTexturePackerAtlasDocument(doc:flight.esm.types.textureatlas_formats.Types.TexturePackerAtlasDocument, atlas:flight.esm.types.textureatlas_contract.Types.TextureAtlas, ?options:Null<flight.esm.types.textureatlas_formats.Types.TexturePackerAtlasParseOptions>):Void;
  public static function parseTexturePackerAtlasJson(json:String, atlas:flight.esm.types.textureatlas_contract.Types.TextureAtlas, ?options:Null<flight.esm.types.textureatlas_formats.Types.TexturePackerAtlasParseOptions>):Void;
  public static function readTextureAtlasScale(scale:Dynamic):Float;
  public static function registerTextureAtlasFormat(kind:String, entry:flight.esm.types.textureatlas_formats.Types.TextureAtlasFormatEntry):Void;
  public static function resetTextureAtlasPageMeta(atlas:flight.esm.types.textureatlas_contract.Types.TextureAtlas):Void;
  public static final starlingTextureAtlasFormat:flight.esm.types.textureatlas_formats.Types.TextureAtlasFormatDescriptor;
  public static final textureAtlasAllFormats:Array<flight.esm.types.textureatlas_formats.Types.TextureAtlasFormatDescriptor>;
  public static final texturePackerTextureAtlasFormat:flight.esm.types.textureatlas_formats.Types.TextureAtlasFormatDescriptor;
  public static function unregisterTextureAtlasFormat(kind:String):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
