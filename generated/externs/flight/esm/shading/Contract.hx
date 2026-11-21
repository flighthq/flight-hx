package flight.esm.shading;

#if (js && flight_esm)
@:jsRequire("@flighthq/shading/contract")
extern class Contract {
  public static final AnimatedNormalModifierKind:String;
  public static final DissolveModifierKind:String;
  public static final EmissiveModifierFacing:{ AwayFromLight:String, Ignore:String, TowardLight:String };
  public static final EmissiveModifierKind:String;
  public static final EnvReflectModifierKind:String;
  public static final FogModifierKind:String;
  public static final FogModifierMode:{ Exponential:String, Exponential2:String, Linear:String };
  public static final ModifierSlot:{ Diffuse:String, Effect:String, Emissive:String, Normal:String, Specular:String, Vertex:String };
  public static final RimModifierKind:String;
  public static final ShadedMaterialKind:String;
  public static final ToonModifierKind:String;
  public static final VertexDisplaceModifierKind:String;
  public static final VertexDisplaceModifierSource:{ HeightMap:String, Sine:String };
  public static final animatedNormalModifierDefinition:flight.esm.types.shading.Types.ModifierDefinition;
  public static function createAnimatedNormalModifier(options:flight.esm.types.shading.Types.AnimatedNormalModifierOptions):flight.esm.types.shading.Types.AnimatedNormalModifier;
  public static function createDissolveModifier(options:flight.esm.types.shading.Types.DissolveModifierOptions):flight.esm.types.shading.Types.DissolveModifier;
  public static function createEmissiveModifier(options:flight.esm.types.shading.Types.EmissiveModifierOptions):flight.esm.types.shading.Types.EmissiveModifier;
  public static function createEnvReflectModifier(?options:Null<flight.esm.types.shading.Types.EnvReflectModifierOptions>):flight.esm.types.shading.Types.EnvReflectModifier;
  public static function createFogModifier(options:flight.esm.types.shading.Types.FogModifierOptions):flight.esm.types.shading.Types.FogModifier;
  public static function createModifierRegistry():flight.esm.types.shading.Types.ModifierRegistry;
  public static function createRimModifier(options:flight.esm.types.shading.Types.RimModifierOptions):flight.esm.types.shading.Types.RimModifier;
  public static function createShadedMaterial(?options:Null<flight.esm.types.shading.Types.ShadedMaterialOptions>):flight.esm.types.shading.Types.ShadedMaterial;
  public static function createToonModifier(options:flight.esm.types.shading.Types.ToonModifierOptions):flight.esm.types.shading.Types.ToonModifier;
  public static function createVertexDisplaceModifier(options:flight.esm.types.shading.Types.VertexDisplaceModifierOptions):flight.esm.types.shading.Types.VertexDisplaceModifier;
  public static final dissolveModifierDefinition:flight.esm.types.shading.Types.ModifierDefinition;
  public static final emissiveModifierDefinition:flight.esm.types.shading.Types.ModifierDefinition;
  public static final envReflectModifierDefinition:flight.esm.types.shading.Types.ModifierDefinition;
  public static final fogModifierDefinition:flight.esm.types.shading.Types.ModifierDefinition;
  public static function getModifierDefineKey(stack:Array<flight.esm.types.shading.Types.Modifier>, ?registry:Null<flight.esm.types.shading.Types.ModifierRegistry>):String;
  public static function getUnregisteredModifierKinds(registry:flight.esm.types.shading.Types.ModifierRegistry, stack:Array<flight.esm.types.shading.Types.Modifier>):Array<String>;
  public static function initializeAnimatedNormalModifier(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.shading.Types.AnimatedNormalModifier>, options:flight.esm.types.shading.Types.AnimatedNormalModifierOptions):Void;
  public static function initializeDissolveModifier(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.shading.Types.DissolveModifier>, options:flight.esm.types.shading.Types.DissolveModifierOptions):Void;
  public static function initializeEmissiveModifier(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.shading.Types.EmissiveModifier>, options:flight.esm.types.shading.Types.EmissiveModifierOptions):Void;
  public static function initializeEnvReflectModifier(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.shading.Types.EnvReflectModifier>, ?options:Null<flight.esm.types.shading.Types.EnvReflectModifierOptions>):Void;
  public static function initializeFogModifier(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.shading.Types.FogModifier>, options:flight.esm.types.shading.Types.FogModifierOptions):Void;
  public static function initializeModifier<T>(out:flight.esm.types.entity_contract.Types.EntityConstruction<T>, kind:String, slot:String):Void;
  public static function initializeRimModifier(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.shading.Types.RimModifier>, options:flight.esm.types.shading.Types.RimModifierOptions):Void;
  public static function initializeShadedMaterial(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.shading.Types.ShadedMaterial>, options:flight.esm.types.shading.Types.ShadedMaterialOptions):Void;
  public static function initializeToonModifier(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.shading.Types.ToonModifier>, options:flight.esm.types.shading.Types.ToonModifierOptions):Void;
  public static function initializeVertexDisplaceModifier(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.shading.Types.VertexDisplaceModifier>, options:flight.esm.types.shading.Types.VertexDisplaceModifierOptions):Void;
  public static function isBuiltInModifierSlot(value:String):Bool;
  public static function isModifierStackValid(registry:flight.esm.types.shading.Types.ModifierRegistry, stack:Array<flight.esm.types.shading.Types.Modifier>):Bool;
  public static function orderModifierStack(stack:Array<flight.esm.types.shading.Types.Modifier>):Array<flight.esm.types.shading.Types.Modifier>;
  public static function registerBuiltInModifiers(registry:flight.esm.types.shading.Types.ModifierRegistry):Void;
  public static function registerModifier(registry:flight.esm.types.shading.Types.ModifierRegistry, definition:flight.esm.types.shading.Types.ModifierDefinition):Void;
  public static function resolveModifier(registry:flight.esm.types.shading.Types.ModifierRegistry, kind:String):Null<flight.esm.types.shading.Types.ModifierDefinition>;
  public static final rimModifierDefinition:flight.esm.types.shading.Types.ModifierDefinition;
  public static final toonModifierDefinition:flight.esm.types.shading.Types.ModifierDefinition;
  public static final vertexDisplaceModifierDefinition:flight.esm.types.shading.Types.ModifierDefinition;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
