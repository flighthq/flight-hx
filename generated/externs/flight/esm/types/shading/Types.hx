package flight.esm.types.shading;

#if (js && flight_esm)
typedef AnimatedNormalModifier = { kind:String, slot:String, map:Dynamic, scroll:flight.esm.types.geometry.Types.Vector2Like, ?strength:Null<Float>, ?secondaryMap:Dynamic, ?secondaryScroll:Null<flight.esm.types.geometry.Types.Vector2Like> };

typedef AnimatedNormalModifierOptions = { map:Dynamic, scroll:flight.esm.types.geometry.Types.Vector2Like, ?strength:Null<Float>, ?secondaryMap:Dynamic, ?secondaryScroll:Null<flight.esm.types.geometry.Types.Vector2Like> };

typedef DissolveModifier = { kind:String, slot:String, threshold:Float, edgeColor:Float, ?edgeWidth:Null<Float>, ?map:Dynamic, ?scale:Null<Float> };

typedef DissolveModifierOptions = { threshold:Float, ?edgeColor:Null<Float>, ?edgeWidth:Null<Float>, ?map:Dynamic, ?scale:Null<Float> };

typedef EmissiveModifier = { kind:String, slot:String, color:Float, strength:Float, ?mask:Dynamic, ?facing:Null<String>, ?facingSoftness:Null<Float> };

typedef EmissiveModifierFacing = String;

typedef EmissiveModifierOptions = { color:Float, ?strength:Null<Float>, ?mask:Dynamic, ?facing:Null<String>, ?facingSoftness:Null<Float> };

typedef EnvReflectModifier = { kind:String, slot:String, tint:Float, ?intensity:Null<Float>, ?fresnelBias:Null<Float>, ?roughness:Null<Float> };

typedef EnvReflectModifierOptions = { ?tint:Null<Float>, ?intensity:Null<Float>, ?fresnelBias:Null<Float>, ?roughness:Null<Float> };

typedef FogModifier = { kind:String, slot:String, color:Float, ?mode:Null<String>, ?near:Null<Float>, ?far:Null<Float>, ?density:Null<Float> };

typedef FogModifierMode = String;

typedef FogModifierOptions = { color:Float, ?mode:Null<String>, ?near:Null<Float>, ?far:Null<Float>, ?density:Null<Float> };

typedef Modifier = { kind:String, slot:String };

typedef ModifierDefinition = { kind:String, slot:String, ?getDefineSignature:Null<((modifier:flight.esm.types.shading.Types.Modifier) -> String)> };

typedef ModifierKind = String;

typedef ModifierRegistry = { definitions:js.lib.Map<String, flight.esm.types.shading.Types.ModifierDefinition> };

typedef ModifierSlot = String;

typedef RimModifier = { kind:String, slot:String, color:Float, ?power:Null<Float>, ?intensity:Null<Float>, ?bias:Null<Float> };

typedef RimModifierOptions = { color:Float, ?power:Null<Float>, ?intensity:Null<Float>, ?bias:Null<Float> };

typedef ShadedMaterial = { kind:String, diffuse:Float, diffuseMap:Dynamic, modifiers:Array<flight.esm.types.shading.Types.Modifier>, normalMap:Dynamic, normalScale:Float, shininess:Float, specular:Float, specularMap:Dynamic, alphaCutoff:Float, alphaMode:flight.esm.types.materials_contract.Types.MaterialAlphaMode, blendMode:String, doubleSided:Bool, ?name:Null<String> };

typedef ShadedMaterialOptions = { ?diffuse:Null<Float>, ?diffuseMap:Dynamic, ?modifiers:Null<Array<flight.esm.types.shading.Types.Modifier>>, ?normalMap:Dynamic, ?normalScale:Null<Float>, ?shininess:Null<Float>, ?specular:Null<Float>, ?specularMap:Dynamic, ?alphaCutoff:Null<Float>, ?alphaMode:Null<String>, ?blendMode:Null<String>, ?doubleSided:Null<Bool> };

typedef ToonModifier = { kind:String, slot:String, steps:Float, ?smoothness:Null<Float> };

typedef ToonModifierOptions = { steps:Float, ?smoothness:Null<Float> };

typedef VertexDisplaceModifier = { kind:String, slot:String, source:flight.esm.types.shading.Types.VertexDisplaceModifierSource, amplitude:Float, ?axis:Null<flight.esm.types.geometry.Types.Vector3Like>, ?map:Dynamic, ?frequency:Null<Float>, ?speed:Null<Float>, ?direction:Null<flight.esm.types.geometry.Types.Vector3Like> };

typedef VertexDisplaceModifierOptions = { source:flight.esm.types.shading.Types.VertexDisplaceModifierSource, amplitude:Float, ?axis:Null<flight.esm.types.geometry.Types.Vector3Like>, ?map:Dynamic, ?frequency:Null<Float>, ?speed:Null<Float>, ?direction:Null<flight.esm.types.geometry.Types.Vector3Like> };

typedef VertexDisplaceModifierSource = String;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
