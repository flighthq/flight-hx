package flight._js._fn;

@:jsRequire("@flighthq/particles-formats")
extern class ParticlesFormats {
	@:native("detectParticleFormat")
	public static function detectParticleFormat(registry:flight._js.ParticleFormatRegistry, text:String):Null<flight._js.ParticleFormatKind>;
	@:native("detectRegisteredParticleFormat")
	public static function detectRegisteredParticleFormat(registry:flight._js.ParticleFormatRegistry, text:String):Null<flight._js.ParticleFormatKind>;
	@:native("getRegisteredParticleFormats")
	public static function getRegisteredParticleFormats(out:Dynamic, registry:flight._js.ParticleFormatRegistry):Void;
	@:native("parseRegisteredParticleFormat")
	public static function parseRegisteredParticleFormat(registry:flight._js.ParticleFormatRegistry, text:String, kind:String, options:Null<flight._js.ParseParticleConfigOptions>):flight._js.ParticleConfigParseResult;
	@:native("unregisterParticleFormat")
	public static function unregisterParticleFormat(registry:flight._js.ParticleFormatRegistry, kind:String):Bool;
	@:native("parseLibgdxParticle")
	public static function parseLibgdxParticle(text:String, options:Null<flight._js.LibgdxParseOptions>):flight._js.ParticleEmitterConfig;
	@:native("parseLibgdxParticleDocument")
	public static function parseLibgdxParticleDocument(text:String, options:Null<flight._js.LibgdxParseOptions>):flight._js.LibgdxParseResult;
	@:native("serializeLibgdxParticle")
	public static function serializeLibgdxParticle(config:flight._js.ParticleEmitterConfig, existing:Null<flight._js.LibgdxParticleDocument>, options:Null<flight._js.LibgdxSerializeOptions>):String;
	@:native("serializeLibgdxParticleDocument")
	public static function serializeLibgdxParticleDocument(config:flight._js.ParticleEmitterConfig, existing:Null<flight._js.LibgdxParticleDocument>, options:Null<flight._js.LibgdxSerializeOptions>):flight._js.ParticleSerializeResult;
	@:native("parseParticleConfig")
	public static function parseParticleConfig(registry:flight._js.ParticleFormatRegistry, text:String, options:Null<flight._js.ParseParticleConfigOptions>):flight._js.ParticleEmitterConfig;
	@:native("parseParticleConfigDocument")
	public static function parseParticleConfigDocument(registry:flight._js.ParticleFormatRegistry, text:String, options:Null<flight._js.ParseParticleConfigOptions>):flight._js.ParticleConfigParseResult;
	@:native("parseParticleDesignerPlist")
	public static function parseParticleDesignerPlist(plistXml:String, options:Null<flight._js.ParticleDesignerParseOptions>):flight._js.ParticleEmitterConfig;
	@:native("parseParticleDesignerPlistDocument")
	public static function parseParticleDesignerPlistDocument(plistXml:String, options:Null<flight._js.ParticleDesignerParseOptions>):flight._js.ParticleDesignerParseResult;
	@:native("serializeParticleDesignerPlist")
	public static function serializeParticleDesignerPlist(config:flight._js.ParticleEmitterConfig, existing:Null<flight._js.ParticleDesignerDocument>, options:Null<flight._js.ParticleDesignerSerializeOptions>):String;
	@:native("serializeParticleDesignerPlistDocument")
	public static function serializeParticleDesignerPlistDocument(config:flight._js.ParticleEmitterConfig, existing:Null<flight._js.ParticleDesignerDocument>, options:Null<flight._js.ParticleDesignerSerializeOptions>):flight._js.ParticleSerializeResult;
	@:native("parsePixiParticle")
	public static function parsePixiParticle(json:String):flight._js.ParticleEmitterConfig;
	@:native("parsePixiParticleDocument")
	public static function parsePixiParticleDocument(json:String):flight._js.PixiParseResult;
	@:native("applyParticleImportOptions")
	public static function applyParticleImportOptions(registry:flight._js.ParticleFormatRegistry, options:flight._js.ParticleImportOptions):Void;
	@:native("registerBuiltInParticleFormats")
	public static function registerBuiltInParticleFormats(registry:flight._js.ParticleFormatRegistry):Void;
	@:native("parseSpineParticle")
	public static function parseSpineParticle(json:String):flight._js.ParticleEmitterConfig;
	@:native("parseSpineParticleDocument")
	public static function parseSpineParticleDocument(json:String):flight._js.SpineParseResult;
	@:native("serializeSpineParticle")
	public static function serializeSpineParticle(config:flight._js.ParticleEmitterConfig, existing:Null<flight._js.SpineParticleDocument>):String;
	@:native("serializeSpineParticleDocument")
	public static function serializeSpineParticleDocument(config:flight._js.ParticleEmitterConfig, existing:Null<flight._js.SpineParticleDocument>):flight._js.ParticleSerializeResult;
	@:native("parseStarlingPex")
	public static function parseStarlingPex(xml:String, options:Null<flight._js.StarlingPexParseOptions>):flight._js.ParticleEmitterConfig;
	@:native("parseStarlingPexDocument")
	public static function parseStarlingPexDocument(xml:String, options:Null<flight._js.StarlingPexParseOptions>):flight._js.StarlingPexParseResult;
	@:native("serializeStarlingPex")
	public static function serializeStarlingPex(config:flight._js.ParticleEmitterConfig, existing:Null<flight._js.StarlingPexDocument>, options:Null<flight._js.StarlingPexSerializeOptions>):String;
	@:native("serializeStarlingPexDocument")
	public static function serializeStarlingPexDocument(config:flight._js.ParticleEmitterConfig, existing:Null<flight._js.StarlingPexDocument>, options:Null<flight._js.StarlingPexSerializeOptions>):flight._js.ParticleSerializeResult;
	@:native("parseUnityParticle")
	public static function parseUnityParticle(json:String, options:Null<flight._js.UnityParseOptions>):flight._js.ParticleEmitterConfig;
	@:native("parseUnityParticleDocument")
	public static function parseUnityParticleDocument(json:String, options:Null<flight._js.UnityParseOptions>):flight._js.UnityParseResult;
	@:native("serializeUnityParticle")
	public static function serializeUnityParticle(config:flight._js.ParticleEmitterConfig, existing:Null<flight._js.UnityParticleDocument>, options:Null<flight._js.UnitySerializeOptions>):String;
	@:native("serializeUnityParticleDocument")
	public static function serializeUnityParticleDocument(config:flight._js.ParticleEmitterConfig, existing:Null<flight._js.UnityParticleDocument>, options:Null<flight._js.UnitySerializeOptions>):flight._js.ParticleSerializeResult;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeParticleFormatKind(ptr:flight._js.ParticleFormatKind):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeParticleConfigParseResult(ptr:flight._js.ParticleConfigParseResult):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeLibgdxParseResult(ptr:flight._js.LibgdxParseResult):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeParticleSerializeResult(ptr:flight._js.ParticleSerializeResult):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeParticleDesignerParseResult(ptr:flight._js.ParticleDesignerParseResult):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePixiParseResult(ptr:flight._js.PixiParseResult):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSpineParseResult(ptr:flight._js.SpineParseResult):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeStarlingPexParseResult(ptr:flight._js.StarlingPexParseResult):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeUnityParseResult(ptr:flight._js.UnityParseResult):Void {}
}
