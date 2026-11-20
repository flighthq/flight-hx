package flight.esm.types.scene3d_formats_contract;

#if (js && flight_esm)
typedef Awd2Block = { blockId:Float, blockType:Float, dataEnd:Float, dataStart:Float, geometryWide:Bool, matrixWide:Bool, source:js.lib.Uint8Array, view:js.lib.DataView };

typedef Awd2BlockDispatch = { forEach:((callbackfn:Dynamic, ?thisArg:Dynamic) -> Void), get:((key:Float) -> Null<flight.esm.types.scene3d_formats_contract.Types.Awd2BlockHandler>), has:((key:Float) -> Bool), size:Float, entries:(() -> Dynamic), keys:(() -> Dynamic), values:(() -> Dynamic) };

typedef Awd2BlockHandler = { blockTypes:Array<Float>, ?buildPhase:Null<Float>, ?deferred:Null<Bool>, parse:((state:flight.esm.types.scene3d_formats_contract.Types.Awd2ParseState, block:flight.esm.types.scene3d_formats_contract.Types.Awd2Block) -> Void), ?build:Null<((state:flight.esm.types.scene3d_formats_contract.Types.Awd2ParseState) -> Void)> };

typedef Awd2Header = { bodyLength:Float, compression:Float, flags:Float, versionMajor:Float, versionMinor:Float };

typedef Awd2ParseOptions = { blocks:Array<flight.esm.types.scene3d_formats_contract.Types.Awd2BlockHandler>, ?deflate:Null<flight.esm.types.compression.Types.HostDecompressDeflateCapability>, ?lzma:Null<flight.esm.types.compression.Types.HostDecompressLzmaCapability> };

typedef Awd2ParseState = { cameras:js.lib.Map<Float, flight.esm.types.scene3d_formats_contract.Types.Awd2ParsedCamera>, containers:js.lib.Map<Float, flight.esm.types.scene3d_formats_contract.Types.Awd2ParsedContainer>, diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>, document:flight.esm.types.scene3d_contract.Types.Scene3DDocument, geometries:js.lib.Map<Float, Array<flight.esm.types.scene3d_formats_contract.Types.Awd2ParsedGeometry>>, lightPickers:js.lib.Map<Float, flight.esm.types.scene3d_formats_contract.Types.Awd2ParsedLightPicker>, lights:js.lib.Map<Float, flight.esm.types.scene3d_formats_contract.Types.Awd2ParsedLight>, materials:js.lib.Map<Float, flight.esm.types.scene3d_formats_contract.Types.Awd2ParsedMaterial>, meshInstances:js.lib.Map<Float, flight.esm.types.scene3d_formats_contract.Types.Awd2ParsedMeshInstance>, nodeIndexForBlock:js.lib.Map<Float, Float>, resolveMaterial:Null<((materialId:Float) -> Float)>, skeletonAnimations:js.lib.Map<Float, flight.esm.types.scene3d_formats_contract.Types.Awd2ParsedSkeletonAnimation>, skeletonJointNodeIndices:Array<Float>, skeletonPoses:js.lib.Map<Float, flight.esm.types.scene3d_formats_contract.Types.Awd2ParsedSkeletonPose>, skeletons:js.lib.Map<Float, flight.esm.types.scene3d_formats_contract.Types.Awd2ParsedSkeleton>, skinIndex:Null<Float>, source:js.lib.Uint8Array, textures:js.lib.Map<Float, flight.esm.types.scene3d_formats_contract.Types.Awd2ParsedTexture>, view:js.lib.DataView };

typedef Awd2ParsedCamera = { bottom:Float, fov:Float, left:Float, name:String, parentId:Float, projectionType:Float, right:Float, top:Float, transform:js.lib.Float64Array };

typedef Awd2ParsedContainer = { name:String, parentId:Float, transform:js.lib.Float64Array };

typedef Awd2ParsedGeometry = { geometry:flight.esm.types.meshgeometry.Types.MeshGeometry, skinned:Bool };

typedef Awd2ParsedJoint = { name:String, parentIndex:Float, transform:js.lib.Float64Array };

typedef Awd2ParsedLight = { ambient:Float, ambientRgb:Float, castsShadow:Bool, diffuse:Float, directionX:Float, directionY:Float, directionZ:Float, fallOff:Float, hasRadius:Bool, lightType:Float, name:String, parentId:Float, radius:Float, rgb:Float, specular:Float, transform:js.lib.Float64Array };

typedef Awd2ParsedLightPicker = { lightIds:Array<Float>, name:String };

typedef Awd2ParsedMaterial = { alpha:Null<Float>, color:Null<Float>, diffuseTextureId:Float, gloss:Null<Float>, name:String, normalTextureId:Float, numMethods:Float, specularColor:Null<Float>, specularStrength:Null<Float>, specularTextureId:Float };

typedef Awd2ParsedMeshInstance = { geometryId:Float, materialIds:Array<Float>, name:String, parentId:Float, transform:js.lib.Float64Array };

typedef Awd2ParsedSkeleton = { joints:Array<flight.esm.types.scene3d_formats_contract.Types.Awd2ParsedJoint>, name:String };

typedef Awd2ParsedSkeletonAnimation = { name:String, poses:Array<Dynamic> };

typedef Awd2ParsedSkeletonPose = { jointTransforms:Array<Null<js.lib.Float64Array>>, name:String };

typedef Awd2ParsedTexture = { bytes:Null<js.lib.Uint8Array>, mimeType:Null<String>, name:String, url:Null<String> };

typedef ColladaBuildContext = { deferredCameras:Array<flight.esm.types.scene3d_formats_contract.Types.ColladaDeferredCameraBinding>, deferredControllers:Array<flight.esm.types.scene3d_formats_contract.Types.ColladaDeferredControllerBinding>, deferredLights:Array<flight.esm.types.scene3d_formats_contract.Types.ColladaDeferredLightBinding>, nodeIdMap:js.lib.Map<String, Float>, parse:flight.esm.types.scene3d_formats_contract.Types.ColladaParseContext, rootNodeIndices:Array<Float> };

typedef ColladaCameraDefinition = Dynamic;

typedef ColladaDecodedAnimationChannel = { target:String, times:Array<Float>, values:Array<Float>, interpolation:Array<String>, inTangents:Array<Float>, outTangents:Array<Float> };

typedef ColladaDecodedMorph = { controllerId:String, baseGeometry:String, method:String, targets:Array<String>, weights:Array<Float> };

typedef ColladaDecodedSkin = { bindShapeMatrix:Array<Float>, controllerId:String, geometryRef:String, influences:Array<Array<Dynamic>>, inverseBindMatrices:Array<Array<Float>>, jointNames:Array<String>, jointSids:Array<String> };

typedef ColladaDeferredCameraBinding = { cameraId:String, nodeIndex:Float };

typedef ColladaDeferredControllerBinding = { controllerId:String, materialOverrides:js.lib.Map<String, Float>, nodeIndex:Float, skeletonRoot:Null<String> };

typedef ColladaDeferredLightBinding = { nodeIndex:Float, url:String };

typedef ColladaElementDecoder = { ?build:Null<((context:flight.esm.types.scene3d_formats_contract.Types.ColladaBuildContext) -> Void)>, ?buildPhase:Null<Float>, elements:Array<String>, features:Array<String>, decode:((context:flight.esm.types.scene3d_formats_contract.Types.ColladaParseContext) -> Void) };

typedef ColladaImportOptions = { ?baseUrl:Null<String>, ?decoders:Null<Array<flight.esm.types.scene3d_formats_contract.Types.ColladaElementDecoder>> };

typedef ColladaLightDefinition = { color:Float, decay:Float, innerConeDegrees:Float, intensity:Float, kind:flight.esm.types.scene3d_formats_contract.Types.ColladaLightKind, ?name:Null<String>, outerConeDegrees:Float, spotBlend:Float };

typedef ColladaLightKind = String;

typedef ColladaOrthographicCameraDefinition = { far:Float, halfHeight:Float, halfWidth:Float, kind:String, ?name:Null<String>, near:Float };

typedef ColladaParseContext = { animationChannels:Array<flight.esm.types.scene3d_formats_contract.Types.ColladaDecodedAnimationChannel>, baseUrl:Null<String>, cameraDefinitions:js.lib.Map<String, Dynamic>, diagnostics:Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>, document:flight.esm.types.scene3d_contract.Types.Scene3DDocument, geometryIdToMeshIndex:js.lib.Map<String, Float>, geometryPositions:js.lib.Map<String, Array<Float>>, geometryPrimitiveSymbols:js.lib.Map<String, Array<String>>, lightDefinitions:js.lib.Map<String, Null<flight.esm.types.scene3d_formats_contract.Types.ColladaLightDefinition>>, materialIndices:js.lib.Map<String, Float>, morphs:js.lib.Map<String, flight.esm.types.scene3d_formats_contract.Types.ColladaDecodedMorph>, root:flight.esm.types.xml.Types.XmlElement, skins:js.lib.Map<String, flight.esm.types.scene3d_formats_contract.Types.ColladaDecodedSkin> };

typedef ColladaParseResult = { document:flight.esm.types.scene3d_contract.Types.Scene3DDocument, diagnostics:Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>, upAxis:flight.esm.types.scene3d_formats_contract.Types.ColladaUpAxis, rootTransform:Array<Float> };

typedef ColladaPerspectiveCameraDefinition = { aspect:Float, far:Float, fovY:Float, kind:String, ?name:Null<String>, near:Float };

typedef ColladaUpAxis = String;

typedef GltfAccessor = { ?bufferView:Null<Float>, ?byteOffset:Null<Float>, componentType:flight.esm.types.scene3d_formats_contract.Types.GltfComponentType, count:Float, ?normalized:Null<Bool>, type:String, ?sparse:Null<flight.esm.types.scene3d_formats_contract.Types.GltfAccessorSparse> };

typedef GltfAccessorData = { count:Float, data:Dynamic, fault:Null<flight.esm.types.scene3d_formats_contract.Types.GltfAccessorFault> };

typedef GltfAccessorFault = { detail:Dynamic, kind:String };

typedef GltfAccessorSparse = { count:Float, indices:Dynamic, values:Dynamic };

typedef GltfAnimation = { ?name:Null<String>, channels:Array<flight.esm.types.scene3d_formats_contract.Types.GltfAnimationChannel>, samplers:Array<flight.esm.types.scene3d_formats_contract.Types.GltfAnimationSampler> };

typedef GltfAnimationChannel = { sampler:Float, target:Dynamic };

typedef GltfAnimationSampler = { input:Float, output:Float, ?interpolation:Null<String> };

typedef GltfBuffer = { byteLength:Float, ?uri:Null<String> };

typedef GltfBufferView = { buffer:Float, byteLength:Float, ?byteOffset:Null<Float>, ?byteStride:Null<Float> };

typedef GltfCamera = { ?name:Null<String>, ?orthographic:Dynamic, ?perspective:Dynamic, type:String };

typedef GltfComponentType = Float;

typedef GltfCoreFeatureContext = { buildNodeTransform:((node:Float) -> flight.esm.types.geometry.Types.Transform3D), document:flight.esm.types.scene3d_contract.Types.Scene3DDocument, meshIndices:Array<Array<Float>>, nodeIndices:Array<Float>, primitiveNodeIndices:Array<Array<Float>>, readAccessor:((accessor:Float, ?expectedType:Null<String>) -> flight.esm.types.scene3d_formats_contract.Types.GltfAccessorData), reportAccessorFault:((severity:flight.esm.types.importdiagnostics_contract.Types.ImportDiagnosticSeverity, fault:flight.esm.types.scene3d_formats_contract.Types.GltfAccessorFault) -> Void), reportDiagnostic:((severity:flight.esm.types.importdiagnostics_contract.Types.ImportDiagnosticSeverity, kind:String, ?detail:Dynamic, ?discriminator:Null<String>) -> Void), source:flight.esm.types.scene3d_formats_contract.Types.GltfDocument };

typedef GltfCoreFeatureHandler = { apply:((context:flight.esm.types.scene3d_formats_contract.Types.GltfCoreFeatureContext) -> Void), kind:String };

typedef GltfDocument = { ?asset:Dynamic, ?cameras:Null<Array<flight.esm.types.scene3d_formats_contract.Types.GltfCamera>>, ?scene:Null<Float>, ?scenes:Null<Array<flight.esm.types.scene3d_formats_contract.Types.GltfScene3D>>, ?nodes:Null<Array<flight.esm.types.scene3d_formats_contract.Types.GltfNode>>, ?meshes:Null<Array<flight.esm.types.scene3d_formats_contract.Types.GltfMesh>>, ?materials:Null<Array<flight.esm.types.scene3d_formats_contract.Types.GltfMaterial>>, ?textures:Null<Array<flight.esm.types.scene3d_formats_contract.Types.GltfTexture>>, ?samplers:Null<Array<flight.esm.types.scene3d_formats_contract.Types.GltfSampler>>, ?images:Null<Array<flight.esm.types.scene3d_formats_contract.Types.GltfImage>>, ?animations:Null<Array<flight.esm.types.scene3d_formats_contract.Types.GltfAnimation>>, ?accessors:Null<Array<flight.esm.types.scene3d_formats_contract.Types.GltfAccessor>>, ?bufferViews:Null<Array<flight.esm.types.scene3d_formats_contract.Types.GltfBufferView>>, ?buffers:Null<Array<flight.esm.types.scene3d_formats_contract.Types.GltfBuffer>>, ?skins:Null<Array<flight.esm.types.scene3d_formats_contract.Types.GltfSkin>>, ?extensionsUsed:Null<Array<String>>, ?extensionsRequired:Null<Array<String>>, ?extensions:Null<flight.esm.types.scene3d_formats_contract.Types.GltfDocumentExtensions> };

typedef GltfDocumentExtensions = { ?KHR_lights_punctual:Dynamic };

typedef GltfDracoDecoder = ((bytes:js.lib.Uint8Array, attributeIds:Dynamic) -> Null<flight.esm.types.scene3d_formats_contract.Types.GltfDracoMesh>);

typedef GltfDracoMesh = { attributes:Dynamic, indices:Null<js.lib.Uint32Array>, vertexCount:Float };

typedef GltfDracoMeshCompression = { attributes:Dynamic, bufferView:Float };

typedef GltfExtensionContext = { buildNodeTransform:((node:Float) -> flight.esm.types.geometry.Types.Transform3D), ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>, document:flight.esm.types.scene3d_contract.Types.Scene3DDocument, nodeIndices:Array<Float>, resolveTexture:((info:Null<flight.esm.types.scene3d_formats_contract.Types.GltfTextureInfo>, colorSpace:flight.esm.types.texture_contract.Types.TextureColorSpace) -> Dynamic), source:flight.esm.types.scene3d_formats_contract.Types.GltfDocument };

typedef GltfExtensionHandler = { apply:((context:flight.esm.types.scene3d_formats_contract.Types.GltfExtensionContext) -> Void), kind:String };

typedef GltfImage = { ?uri:Null<String>, ?mimeType:Null<String>, ?bufferView:Null<Float> };

typedef GltfImportOptions = { ?basePath:Null<String>, ?extensionHandlers:Null<Array<flight.esm.types.scene3d_formats_contract.Types.GltfExtensionHandler>>, ?externalBuffers:Dynamic };

typedef GltfMaterial = { ?name:Null<String>, ?pbrMetallicRoughness:Null<flight.esm.types.scene3d_formats_contract.Types.GltfPbrMetallicRoughness>, ?normalTexture:Null<flight.esm.types.scene3d_formats_contract.Types.GltfNormalTextureInfo>, ?occlusionTexture:Null<flight.esm.types.scene3d_formats_contract.Types.GltfOcclusionTextureInfo>, ?emissiveTexture:Null<flight.esm.types.scene3d_formats_contract.Types.GltfTextureInfo>, ?emissiveFactor:Null<Array<Float>>, ?alphaMode:Null<String>, ?alphaCutoff:Null<Float>, ?doubleSided:Null<Bool>, ?extensions:Dynamic };

typedef GltfMaterialsAnisotropy = { ?anisotropyRotation:Null<Float>, ?anisotropyStrength:Null<Float>, ?anisotropyTexture:Null<flight.esm.types.scene3d_formats_contract.Types.GltfTextureInfo> };

typedef GltfMaterialsClearcoat = { ?clearcoatFactor:Null<Float>, ?clearcoatNormalTexture:Null<flight.esm.types.scene3d_formats_contract.Types.GltfNormalTextureInfo>, ?clearcoatRoughnessFactor:Null<Float>, ?clearcoatRoughnessTexture:Null<flight.esm.types.scene3d_formats_contract.Types.GltfTextureInfo>, ?clearcoatTexture:Null<flight.esm.types.scene3d_formats_contract.Types.GltfTextureInfo> };

typedef GltfMaterialsEmissiveStrength = { ?emissiveStrength:Null<Float> };

typedef GltfMaterialsIor = { ?ior:Null<Float> };

typedef GltfMaterialsIridescence = { ?iridescenceFactor:Null<Float>, ?iridescenceIor:Null<Float>, ?iridescenceTexture:Null<flight.esm.types.scene3d_formats_contract.Types.GltfTextureInfo>, ?iridescenceThicknessMaximum:Null<Float>, ?iridescenceThicknessMinimum:Null<Float>, ?iridescenceThicknessTexture:Null<flight.esm.types.scene3d_formats_contract.Types.GltfTextureInfo> };

typedef GltfMaterialsPbrSpecularGlossiness = { ?diffuseFactor:Null<Array<Float>>, ?diffuseTexture:Null<flight.esm.types.scene3d_formats_contract.Types.GltfTextureInfo>, ?glossinessFactor:Null<Float>, ?specularFactor:Null<Array<Float>>, ?specularGlossinessTexture:Null<flight.esm.types.scene3d_formats_contract.Types.GltfTextureInfo> };

typedef GltfMaterialsSheen = { ?sheenColorFactor:Null<Array<Float>>, ?sheenColorTexture:Null<flight.esm.types.scene3d_formats_contract.Types.GltfTextureInfo>, ?sheenRoughnessFactor:Null<Float>, ?sheenRoughnessTexture:Null<flight.esm.types.scene3d_formats_contract.Types.GltfTextureInfo> };

typedef GltfMaterialsSpecular = { ?specularColorFactor:Null<Array<Float>>, ?specularColorTexture:Null<flight.esm.types.scene3d_formats_contract.Types.GltfTextureInfo>, ?specularFactor:Null<Float>, ?specularTexture:Null<flight.esm.types.scene3d_formats_contract.Types.GltfTextureInfo> };

typedef GltfMaterialsTransmission = { ?transmissionFactor:Null<Float>, ?transmissionTexture:Null<flight.esm.types.scene3d_formats_contract.Types.GltfTextureInfo> };

typedef GltfMaterialsVolume = { ?attenuationColor:Null<Array<Float>>, ?attenuationDistance:Null<Float>, ?thicknessFactor:Null<Float>, ?thicknessTexture:Null<flight.esm.types.scene3d_formats_contract.Types.GltfTextureInfo> };

typedef GltfMesh = { ?name:Null<String>, primitives:Array<flight.esm.types.scene3d_formats_contract.Types.GltfPrimitive>, ?weights:Null<Array<Float>> };

typedef GltfMorphTarget = { ?NORMAL:Null<Float>, ?POSITION:Null<Float>, ?TANGENT:Null<Float> };

typedef GltfNode = { ?camera:Null<Float>, ?name:Null<String>, ?children:Null<Array<Float>>, ?mesh:Null<Float>, ?skin:Null<Float>, ?matrix:Null<Array<Float>>, ?translation:Null<Array<Float>>, ?rotation:Null<Array<Float>>, ?scale:Null<Array<Float>>, ?extensions:Dynamic };

typedef GltfNormalTextureInfo = { ?scale:Null<Float>, index:Float, ?texCoord:Null<Float>, ?extensions:Dynamic };

typedef GltfOcclusionTextureInfo = { ?strength:Null<Float>, index:Float, ?texCoord:Null<Float>, ?extensions:Dynamic };

typedef GltfPbrMetallicRoughness = { ?baseColorFactor:Null<Array<Float>>, ?baseColorTexture:Null<flight.esm.types.scene3d_formats_contract.Types.GltfTextureInfo>, ?metallicFactor:Null<Float>, ?roughnessFactor:Null<Float>, ?metallicRoughnessTexture:Null<flight.esm.types.scene3d_formats_contract.Types.GltfTextureInfo> };

typedef GltfPrimitive = { attributes:Dynamic, ?indices:Null<Float>, ?material:Null<Float>, ?mode:Null<Float>, ?extensions:Dynamic, ?targets:Null<Array<flight.esm.types.scene3d_formats_contract.Types.GltfMorphTarget>> };

typedef GltfPunctualLight = { ?color:Null<Array<Float>>, ?intensity:Null<Float>, ?name:Null<String>, ?range:Null<Float>, ?spot:Dynamic, type:String };

typedef GltfSampler = { ?magFilter:Null<Float>, ?minFilter:Null<Float>, ?wrapS:Null<Float>, ?wrapT:Null<Float> };

typedef GltfScene3D = { ?name:Null<String>, ?nodes:Null<Array<Float>> };

typedef GltfSkin = { ?name:Null<String>, ?inverseBindMatrices:Null<Float>, joints:Array<Float>, ?skeleton:Null<Float> };

typedef GltfTexture = { ?extensions:Dynamic, ?sampler:Null<Float>, ?source:Null<Float> };

typedef GltfTextureInfo = { index:Float, ?texCoord:Null<Float>, ?extensions:Dynamic };

typedef GltfTextureTransform = { ?offset:Null<Array<Float>>, ?rotation:Null<Float>, ?scale:Null<Array<Float>>, ?texCoord:Null<Float> };

typedef Md2Frame = { name:String, normals:js.lib.Float32Array, positions:js.lib.Float32Array };

typedef Md2ImportOptions = { ?sectionHandlers:Null<Array<flight.esm.types.scene3d_formats_contract.Types.Md2SectionHandler>> };

typedef Md2ParseContext = { bytes:js.lib.Uint8Array, diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>, document:flight.esm.types.scene3d_contract.Types.Scene3DDocument, frames:Array<flight.esm.types.scene3d_formats_contract.Types.Md2Frame>, meshMaterials:Array<Float>, morph:Null<flight.esm.types.meshgeometry.Types.MeshMorph>, numSkins:Float, offSkins:Float };

typedef Md2SectionHandler = { feature:String, collect:((context:flight.esm.types.scene3d_formats_contract.Types.Md2ParseContext) -> Void) };

typedef Md5DropTally = { count:Float, detail:Dynamic, kind:String, severity:flight.esm.types.importdiagnostics_contract.Types.ImportDiagnosticSeverity };

typedef Md5ImportOptions = { ?sectionHandlers:Null<Array<flight.esm.types.scene3d_formats_contract.Types.Md5SectionHandler>> };

typedef Md5Joint = { name:String, orientationW:Float, orientationX:Float, orientationY:Float, orientationZ:Float, parentIndex:Float, positionX:Float, positionY:Float, positionZ:Float };

typedef Md5Mesh = { indices:Array<Float>, shader:String, vertices:Array<flight.esm.types.scene3d_formats_contract.Types.Md5Vertex>, weights:Array<flight.esm.types.scene3d_formats_contract.Types.Md5Weight> };

typedef Md5MeshSection = { materials:Array<Float>, shader:String };

typedef Md5ParseContext = { diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>, document:flight.esm.types.scene3d_contract.Types.Scene3DDocument, drops:Null<js.lib.Map<String, flight.esm.types.scene3d_formats_contract.Types.Md5DropTally>>, joints:Array<flight.esm.types.scene3d_formats_contract.Types.Md5Joint>, mesh:Null<flight.esm.types.scene3d_formats_contract.Types.Md5MeshSection>, skin:Null<Float> };

typedef Md5SectionHandler = { feature:String, collect:((context:flight.esm.types.scene3d_formats_contract.Types.Md5ParseContext) -> Void) };

typedef Md5Vertex = { countWeights:Float, startWeight:Float, u:Float, v:Float };

typedef Md5Weight = { bias:Float, jointIndex:Float, positionX:Float, positionY:Float, positionZ:Float };

typedef ObjImportOptions = { ?materialHandlers:Null<Array<flight.esm.types.scene3d_formats_contract.Types.ObjMaterialHandler>> };

typedef ObjMaterial = { ambient:Array<Float>, anisotropy:Null<Float>, anisotropyRotation:Null<Float>, clearcoat:Null<Float>, clearcoatRoughness:Null<Float>, diffuse:Array<Float>, dissolve:Float, emissive:Null<Array<Float>>, illumination:Float, mapAmbient:Null<String>, mapBump:Null<String>, mapDiffuse:Null<String>, mapDissolve:Null<String>, mapEmissive:Null<String>, mapMetallic:Null<String>, mapNormal:Null<String>, mapRoughness:Null<String>, mapSpecular:Null<String>, metallic:Null<Float>, name:String, roughness:Null<Float>, sheen:Null<Float>, specular:Array<Float>, specularExponent:Float };

typedef ObjMaterialHandler = { feature:String, matches:((material:flight.esm.types.scene3d_formats_contract.Types.ObjMaterial) -> Bool), resolve:((material:flight.esm.types.scene3d_formats_contract.Types.ObjMaterial, document:flight.esm.types.scene3d_contract.Types.Scene3DDocument, diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>) -> flight.esm.types.materials_contract.Types.MaterialLike) };

typedef ObjMaterialLibrary = { materials:js.lib.Map<String, flight.esm.types.scene3d_formats_contract.Types.ObjMaterial> };

typedef SkinInfluence = { jointIndex:Float, weight:Float };

typedef StlFeatures = { triangleCount:Float, variant:flight.esm.types.scene3d_formats_contract.Types.StlVariant };

typedef StlImportOptions = { ?normals:Null<String> };

typedef StlNormalPolicy = String;

typedef StlVariant = String;

typedef ThreeDsCamera = { far:Null<Float>, focalLength:Float, name:String, near:Null<Float>, position:Array<Float>, roll:Float, target:Array<Float> };

typedef ThreeDsChunkDispatch = { forEach:((callbackfn:Dynamic, ?thisArg:Dynamic) -> Void), get:((key:Float) -> Null<flight.esm.types.scene3d_formats_contract.Types.ThreeDsChunkHandler>), has:((key:Float) -> Bool), size:Float, entries:(() -> Dynamic), keys:(() -> Dynamic), values:(() -> Dynamic) };

typedef ThreeDsChunkHandler = { chunkIds:Array<Float>, ?build:Null<((state:flight.esm.types.scene3d_formats_contract.Types.ThreeDsParseState) -> Void)>, collect:((state:flight.esm.types.scene3d_formats_contract.Types.ThreeDsParseState, view:js.lib.DataView, offset:Float, end:Float, name:String) -> Void) };

typedef ThreeDsDropTally = { count:Float, detail:Dynamic, kind:String, severity:flight.esm.types.importdiagnostics_contract.Types.ImportDiagnosticSeverity };

typedef ThreeDsImportOptions = { ?handlers:Null<Array<flight.esm.types.scene3d_formats_contract.Types.ThreeDsChunkHandler>> };

typedef ThreeDsLight = { color:Array<Float>, enabled:Bool, falloff:Float, hotspot:Float, innerRange:Null<Float>, multiplier:Float, name:String, outerRange:Null<Float>, position:Array<Float>, target:Null<Array<Float>> };

typedef ThreeDsMaterial = { ambient:Array<Float>, bumpFilename:Null<String>, diffuse:Array<Float>, name:String, opacity:Float, opacityFilename:Null<String>, shininess:Null<Float>, specular:Array<Float>, textureFilename:Null<String> };

typedef ThreeDsMaterialGroup = { faces:js.lib.Uint16Array, name:String };

typedef ThreeDsMesh = { faces:js.lib.Uint16Array, localMatrix:Null<js.lib.Float32Array>, materialGroups:Array<flight.esm.types.scene3d_formats_contract.Types.ThreeDsMaterialGroup>, name:String, smoothingGroups:Null<js.lib.Uint32Array>, uvs:Null<js.lib.Float32Array>, vertices:js.lib.Float32Array };

typedef ThreeDsParseState = { cameras:Array<flight.esm.types.scene3d_formats_contract.Types.ThreeDsCamera>, diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>, drops:Null<js.lib.Map<String, flight.esm.types.scene3d_formats_contract.Types.ThreeDsDropTally>>, document:flight.esm.types.scene3d_contract.Types.Scene3DDocument, lights:Array<flight.esm.types.scene3d_formats_contract.Types.ThreeDsLight>, materials:js.lib.Map<String, flight.esm.types.scene3d_formats_contract.Types.ThreeDsMaterial>, meshes:Array<flight.esm.types.scene3d_formats_contract.Types.ThreeDsMesh>, pivots:js.lib.Map<String, Array<Float>> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
