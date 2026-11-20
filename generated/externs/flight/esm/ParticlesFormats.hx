package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/particles-formats")
extern class ParticlesFormats {
  public static final LibgdxParticleFormatKind:String;
  public static final PARTICLES_REQUIREMENT_KEY_NAMESPACE:String;
  public static final ParticleDesignerFormatKind:String;
  public static final PixiParticleFormatKind:String;
  public static final SpineParticleFormatKind:String;
  public static final StarlingPexFormatKind:String;
  public static final UnityParticleFormatKind:String;
  public static function applyParticleImportOptions(options:flight.esm.types.particles_formats.Types.ParticleImportOptions):Void;
  public static function detectParticleFormat(text:String):Dynamic;
  public static function detectRegisteredParticleFormat(text:String):Null<String>;
  public static function getParticleFormatCodec(kind:flight.esm.types.particles_formats.Types.ParticleFormatKind):Null<flight.esm.types.particles_formats.Types.ParticleFormatCodec>;
  public static function getRegisteredParticleFormats():Array<String>;
  public static final libgdxParticleFormat:flight.esm.types.particles_formats.Types.ParticleFormatDescriptor;
  public static function parseLibgdxParticle(text:String, ?options:Null<flight.esm.types.particles_formats.Types.LibgdxParseOptions>):flight.esm.types.particles.Types.ParticleEmitterConfig;
  public static function parseLibgdxParticleDocument(text:String, ?options:Null<flight.esm.types.particles_formats.Types.LibgdxParseOptions>):flight.esm.types.particles_formats.Types.LibgdxParseResult;
  public static function parseParticleConfig(text:String, ?options:Null<flight.esm.types.particles_formats.Types.ParseParticleConfigOptions>):flight.esm.types.particles.Types.ParticleEmitterConfig;
  public static function parseParticleConfigDocument(text:String, ?options:Null<flight.esm.types.particles_formats.Types.ParseParticleConfigOptions>):flight.esm.types.particles_formats.Types.ParticleConfigParseResult;
  public static function parseParticleDesignerPlist(plistXml:String, ?options:Null<flight.esm.types.particles_formats.Types.ParticleDesignerParseOptions>):flight.esm.types.particles.Types.ParticleEmitterConfig;
  public static function parseParticleDesignerPlistDocument(plistXml:String, ?options:Null<flight.esm.types.particles_formats.Types.ParticleDesignerParseOptions>):flight.esm.types.particles_formats.Types.ParticleDesignerParseResult;
  public static function parsePixiParticle(json:String):flight.esm.types.particles.Types.ParticleEmitterConfig;
  public static function parsePixiParticleDocument(json:String):flight.esm.types.particles_formats.Types.PixiParseResult;
  public static function parseRegisteredParticleFormat(text:String, kind:String, ?options:Null<flight.esm.types.particles_formats.Types.ParseParticleConfigOptions>):flight.esm.types.particles_formats.Types.ParticleConfigParseResult;
  public static function parseSpineParticle(json:String):flight.esm.types.particles.Types.ParticleEmitterConfig;
  public static function parseSpineParticleDocument(json:String):flight.esm.types.particles_formats.Types.SpineParseResult;
  public static function parseStarlingPex(xml:String, ?options:Null<flight.esm.types.particles_formats.Types.StarlingPexParseOptions>):flight.esm.types.particles.Types.ParticleEmitterConfig;
  public static function parseStarlingPexDocument(xml:String, ?options:Null<flight.esm.types.particles_formats.Types.StarlingPexParseOptions>):flight.esm.types.particles_formats.Types.StarlingPexParseResult;
  public static function parseUnityParticle(json:String, ?options:Null<flight.esm.types.particles_formats.Types.UnityParseOptions>):flight.esm.types.particles.Types.ParticleEmitterConfig;
  public static function parseUnityParticleDocument(json:String, ?options:Null<flight.esm.types.particles_formats.Types.UnityParseOptions>):flight.esm.types.particles_formats.Types.UnityParseResult;
  public static final particleAllFormats:Array<flight.esm.types.particles_formats.Types.ParticleFormatDescriptor>;
  public static final particleDesignerParticleFormat:flight.esm.types.particles_formats.Types.ParticleFormatDescriptor;
  public static final pixiParticleFormat:flight.esm.types.particles_formats.Types.ParticleFormatDescriptor;
  public static function registerBuiltInParticleFormats():Void;
  public static function registerParticleFormat(kind:flight.esm.types.particles_formats.Types.ParticleFormatKind, codec:flight.esm.types.particles_formats.Types.ParticleFormatCodec):Void;
  public static function serializeLibgdxParticle(config:flight.esm.types.particles.Types.ParticleEmitterConfig, ?existing:Dynamic, ?options:Null<flight.esm.types.particles_formats.Types.LibgdxSerializeOptions>):String;
  public static function serializeLibgdxParticleDocument(config:flight.esm.types.particles.Types.ParticleEmitterConfig, ?existing:Dynamic, ?options:Null<flight.esm.types.particles_formats.Types.LibgdxSerializeOptions>):flight.esm.types.particles_formats.Types.ParticleSerializeResult;
  public static function serializeParticleDesignerPlist(config:flight.esm.types.particles.Types.ParticleEmitterConfig, ?existing:Dynamic, ?options:Null<flight.esm.types.particles_formats.Types.ParticleDesignerSerializeOptions>):String;
  public static function serializeParticleDesignerPlistDocument(config:flight.esm.types.particles.Types.ParticleEmitterConfig, ?existing:Dynamic, ?options:Null<flight.esm.types.particles_formats.Types.ParticleDesignerSerializeOptions>):flight.esm.types.particles_formats.Types.ParticleSerializeResult;
  public static function serializeSpineParticle(config:flight.esm.types.particles.Types.ParticleEmitterConfig, ?existing:Dynamic):String;
  public static function serializeSpineParticleDocument(config:flight.esm.types.particles.Types.ParticleEmitterConfig, ?existing:Dynamic):flight.esm.types.particles_formats.Types.ParticleSerializeResult;
  public static function serializeStarlingPex(config:flight.esm.types.particles.Types.ParticleEmitterConfig, ?existing:Dynamic, ?options:Null<flight.esm.types.particles_formats.Types.StarlingPexSerializeOptions>):String;
  public static function serializeStarlingPexDocument(config:flight.esm.types.particles.Types.ParticleEmitterConfig, ?existing:Dynamic, ?options:Null<flight.esm.types.particles_formats.Types.StarlingPexSerializeOptions>):flight.esm.types.particles_formats.Types.ParticleSerializeResult;
  public static function serializeUnityParticle(config:flight.esm.types.particles.Types.ParticleEmitterConfig, ?existing:Dynamic, ?options:Null<flight.esm.types.particles_formats.Types.UnitySerializeOptions>):String;
  public static function serializeUnityParticleDocument(config:flight.esm.types.particles.Types.ParticleEmitterConfig, ?existing:Dynamic, ?options:Null<flight.esm.types.particles_formats.Types.UnitySerializeOptions>):flight.esm.types.particles_formats.Types.ParticleSerializeResult;
  public static final spineParticleFormat:flight.esm.types.particles_formats.Types.ParticleFormatDescriptor;
  public static final starlingPexParticleFormat:flight.esm.types.particles_formats.Types.ParticleFormatDescriptor;
  public static final unityParticleFormat:flight.esm.types.particles_formats.Types.ParticleFormatDescriptor;
  public static function unregisterParticleFormat(kind:flight.esm.types.particles_formats.Types.ParticleFormatKind):Bool;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
