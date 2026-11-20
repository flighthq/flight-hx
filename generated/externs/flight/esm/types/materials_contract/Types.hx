package flight.esm.types.materials_contract;

#if (js && flight_esm)
typedef AnisotropyPbrExtension = { anisotropyMap:Dynamic, anisotropyMapUvSet:flight.esm.types.materials_contract.Types.PbrUvSet, anisotropyRotation:Float, anisotropyStrength:Float, kind:String };

typedef BlendMode = String;

typedef BlinnPhongMaterial = { kind:String, alphaMap:Dynamic, diffuse:Float, diffuseMap:Dynamic, normalMap:Dynamic, normalScale:Float, shininess:Float, specular:Float, specularMap:Dynamic, alphaCutoff:Float, alphaMode:flight.esm.types.materials_contract.Types.MaterialAlphaMode, blendMode:String, doubleSided:Bool, ?name:Null<String> };

typedef ClearcoatPbrExtension = { clearcoat:Float, clearcoatMap:Dynamic, clearcoatMapUvSet:flight.esm.types.materials_contract.Types.PbrUvSet, clearcoatNormalMap:Dynamic, clearcoatNormalMapUvSet:flight.esm.types.materials_contract.Types.PbrUvSet, clearcoatNormalScale:Float, clearcoatRoughness:Float, clearcoatRoughnessMap:Dynamic, clearcoatRoughnessMapUvSet:flight.esm.types.materials_contract.Types.PbrUvSet, kind:String };

typedef CustomShaderMaterial = { kind:String, shaderKey:String, textures:Dynamic, uniforms:Dynamic, alphaCutoff:Float, alphaMode:flight.esm.types.materials_contract.Types.MaterialAlphaMode, blendMode:String, doubleSided:Bool, ?name:Null<String> };

typedef DepthMaterial = { kind:String, far:Float, near:Float, alphaCutoff:Float, alphaMode:flight.esm.types.materials_contract.Types.MaterialAlphaMode, blendMode:String, doubleSided:Bool, ?name:Null<String> };

typedef EmissiveMaterial = { kind:String, emissive:Float, emissiveMap:Dynamic, emissiveStrength:Float, alphaCutoff:Float, alphaMode:flight.esm.types.materials_contract.Types.MaterialAlphaMode, blendMode:String, doubleSided:Bool, ?name:Null<String> };

typedef ExtendedPbrMaterial = { extensions:Array<flight.esm.types.materials_contract.Types.PbrExtension>, kind:String, standard:flight.esm.types.materials_contract.Types.StandardPbrMaterialProperties, alphaCutoff:Float, alphaMode:flight.esm.types.materials_contract.Types.MaterialAlphaMode, blendMode:String, doubleSided:Bool, ?name:Null<String> };

typedef GlassExtendedPbrMaterialOptions = { ?standard:Dynamic, ?transmissionVolume:Dynamic, ?alphaCutoff:Null<Float>, ?alphaMode:Null<String>, ?blendMode:Null<String>, ?doubleSided:Null<Bool> };

typedef IridescencePbrExtension = { iridescence:Float, iridescenceIor:Float, iridescenceMap:Dynamic, iridescenceMapUvSet:flight.esm.types.materials_contract.Types.PbrUvSet, iridescenceThicknessMap:Dynamic, iridescenceThicknessMapUvSet:flight.esm.types.materials_contract.Types.PbrUvSet, iridescenceThicknessMax:Float, iridescenceThicknessMin:Float, kind:String };

typedef LambertMaterial = { kind:String, diffuse:Float, diffuseMap:Dynamic, emissive:Float, emissiveMap:Dynamic, alphaCutoff:Float, alphaMode:flight.esm.types.materials_contract.Types.MaterialAlphaMode, blendMode:String, doubleSided:Bool, ?name:Null<String> };

typedef MatcapMaterial = { kind:String, matcap:Dynamic, tint:Float, alphaCutoff:Float, alphaMode:flight.esm.types.materials_contract.Types.MaterialAlphaMode, blendMode:String, doubleSided:Bool, ?name:Null<String> };

typedef Material = { kind:String, ?name:Null<String> };

typedef Material2D = { kind:String, ?name:Null<String> };

typedef Material3D = { alphaCutoff:Float, alphaMode:flight.esm.types.materials_contract.Types.MaterialAlphaMode, blendMode:String, doubleSided:Bool, kind:String, ?name:Null<String> };

typedef Material3DOptions = { ?alphaCutoff:Null<Float>, ?alphaMode:Null<String>, ?blendMode:Null<String>, ?doubleSided:Null<Bool> };

typedef MaterialAlphaMode = String;

typedef MaterialConversionDropReason = String;

typedef MaterialConversionExplanation = { droppedMaps:Array<String>, reason:Null<String> };

typedef MaterialConversionGuard = ((explanation:flight.esm.types.materials_contract.Types.MaterialConversionExplanation, conversion:String) -> Void);

typedef MaterialData = Dynamic;

typedef MaterialDimensionKey = Dynamic;

typedef MaterialLike = { kind:String, ?name:Null<String> };

typedef NormalMaterial = { kind:String, normalMap:Dynamic, normalScale:Float, alphaCutoff:Float, alphaMode:flight.esm.types.materials_contract.Types.MaterialAlphaMode, blendMode:String, doubleSided:Bool, ?name:Null<String> };

typedef PbrExtension = { kind:String };

typedef PbrUvSet = Float;

typedef PhongMaterial = { kind:String, diffuse:Float, diffuseMap:Dynamic, normalMap:Dynamic, normalScale:Float, shininess:Float, specular:Float, specularMap:Dynamic, alphaCutoff:Float, alphaMode:flight.esm.types.materials_contract.Types.MaterialAlphaMode, blendMode:String, doubleSided:Bool, ?name:Null<String> };

typedef SheenPbrExtension = { kind:String, sheenColor:Float, sheenColorMap:Dynamic, sheenColorMapUvSet:flight.esm.types.materials_contract.Types.PbrUvSet, sheenRoughness:Float, sheenRoughnessMap:Dynamic, sheenRoughnessMapUvSet:flight.esm.types.materials_contract.Types.PbrUvSet };

typedef SpecularGlossinessPbrMaterial = { kind:String, diffuse:Float, diffuseMap:Dynamic, emissive:Float, emissiveMap:Dynamic, emissiveStrength:Float, glossiness:Float, normalMap:Dynamic, normalScale:Float, occlusionMap:Dynamic, occlusionStrength:Float, specular:Float, specularGlossinessMap:Dynamic, alphaCutoff:Float, alphaMode:flight.esm.types.materials_contract.Types.MaterialAlphaMode, blendMode:String, doubleSided:Bool, ?name:Null<String> };

typedef SpecularPbrExtension = { kind:String, specular:Float, specularColor:Float, specularColorMap:Dynamic, specularColorMapUvSet:flight.esm.types.materials_contract.Types.PbrUvSet, specularMap:Dynamic, specularMapUvSet:flight.esm.types.materials_contract.Types.PbrUvSet };

typedef StandardMaterial = { kind:String, ?name:Null<String> };

typedef StandardMaterialKind = flight.esm.types.materials.Types.StandardMaterialKind;

typedef StandardPbrMaterial = { kind:String, alphaCutoff:Float, alphaMode:flight.esm.types.materials_contract.Types.MaterialAlphaMode, blendMode:String, doubleSided:Bool, ?name:Null<String>, alphaMap:Dynamic, baseColor:Float, baseColorMap:Dynamic, emissive:Float, emissiveMap:Dynamic, emissiveStrength:Float, metallic:Float, metallicRoughnessMap:Dynamic, normalMap:Dynamic, normalScale:Float, occlusionMap:Dynamic, occlusionStrength:Float, roughness:Float };

typedef StandardPbrMaterialProperties = { alphaMap:Dynamic, baseColor:Float, baseColorMap:Dynamic, emissive:Float, emissiveMap:Dynamic, emissiveStrength:Float, metallic:Float, metallicRoughnessMap:Dynamic, normalMap:Dynamic, normalScale:Float, occlusionMap:Dynamic, occlusionStrength:Float, roughness:Float };

typedef TintMaterialData = { tint:Float };

typedef ToonMaterial = { kind:String, baseColor:Float, baseColorMap:Dynamic, ramp:Dynamic, steps:Float, alphaCutoff:Float, alphaMode:flight.esm.types.materials_contract.Types.MaterialAlphaMode, blendMode:String, doubleSided:Bool, ?name:Null<String> };

typedef TransmissionVolumePbrExtension = { attenuationColor:Float, attenuationDistance:Float, ior:Float, kind:String, thickness:Float, thicknessMap:Dynamic, thicknessMapUvSet:flight.esm.types.materials_contract.Types.PbrUvSet, transmission:Float, transmissionMap:Dynamic, transmissionMapUvSet:flight.esm.types.materials_contract.Types.PbrUvSet };

typedef UnlitMaterial = { kind:String, baseColor:Float, baseColorMap:Dynamic, alphaCutoff:Float, alphaMode:flight.esm.types.materials_contract.Types.MaterialAlphaMode, blendMode:String, doubleSided:Bool, ?name:Null<String> };

typedef VertexColorMaterial = { kind:String, tint:Float, alphaCutoff:Float, alphaMode:flight.esm.types.materials_contract.Types.MaterialAlphaMode, blendMode:String, doubleSided:Bool, ?name:Null<String> };

typedef WireframeMaterial = { kind:String, color:Float, thickness:Float, alphaCutoff:Float, alphaMode:flight.esm.types.materials_contract.Types.MaterialAlphaMode, blendMode:String, doubleSided:Bool, ?name:Null<String> };

typedef WrappedDiffusePbrExtension = { kind:String, thickness:Float, thicknessMap:Dynamic, thicknessMapUvSet:flight.esm.types.materials_contract.Types.PbrUvSet, wrappedDiffuseColor:Float, wrappedDiffuseMap:Dynamic, wrappedDiffuseMapUvSet:flight.esm.types.materials_contract.Types.PbrUvSet, wrappedDiffuseStrength:Float };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
