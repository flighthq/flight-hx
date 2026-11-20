package flight.esm.types.meshgeometry;

#if (js && flight_esm)
typedef InstancedMesh = { geometry:flight.esm.types.meshgeometry.Types.MeshGeometry, instanceColors:Null<js.lib.Uint32Array>, instanceCount:Float, instanceMatrices:Array<flight.esm.types.geometry.Types.Matrix4>, materials:Array<Null<flight.esm.types.materials_contract.Types.Material3D>>, version:Float, data:Null<flight.esm.types.node.Types.NodeData>, enabled:Bool, kind:String, name:Null<String>, alpha:Float, visible:Bool, position:flight.esm.types.geometry.Types.Vector3, rotation:flight.esm.types.geometry.Types.Quaternion, scale:flight.esm.types.geometry.Types.Vector3 };

typedef InstancedMeshCullRuntime = { ?instanceLocalBounds:Null<flight.esm.types.geometry.Types.Aabb>, ?instanceLocalBoundsVersion:Null<Float> };

typedef InstancedMeshInstanceRemoved = { index:Float, swapSource:Float };

typedef InstancedMeshRuntime = { appearanceId:Float, boundsUsingLocalBoundsId:Float, boundsUsingLocalTransformId:Float, canAddChild:((target:flight.esm.types.node.Types.Node<flight.esm.types.scene3d.Types.Node3DFields>, child:flight.esm.types.node.Types.Node<flight.esm.types.scene3d.Types.Node3DFields>) -> Bool), children:Null<Array<flight.esm.types.node.Types.NodeOf<flight.esm.types.scene3d.Types.Node3DFields>>>, childrenId:Float, ?fields:Null<flight.esm.types.node.Types.NodeFieldsKey<flight.esm.types.scene3d.Types.Node3DFields>>, interactionSignals:Dynamic, localBoundsId:Float, localBoundsUsingLocalBoundsId:Float, localContentId:Float, localTransformId:Float, localTransformUsingLocalTransformId:Float, nodeSignals:Null<flight.esm.types.node.Types.NodeSignals>, interactionState:Dynamic, parent:Null<flight.esm.types.node.Types.NodeOf<flight.esm.types.scene3d.Types.Node3DFields>>, parentReferenceId:Float, worldBoundsUsingLocalBoundsId:Float, worldBoundsUsingWorldTransformId:Float, worldTransformId:Float, worldTransformRevisionCounter:Float, worldTransformUsingLocalTransformId:Float, worldTransformUsingParentTransformId:Float, binding:Dynamic, ?uid:Null<String>, colorAdjustments:Null<Array<flight.esm.types.adjustments_contract.Types.Adjustment>>, colorAdjustmentsUnsupported:Bool, resolvedColorMatrix:Null<js.lib.Float32Array>, resolvedColorScaleBias:Null<flight.esm.types.adjustments_contract.Types.ColorScaleBias>, worldAlpha:Null<Float>, worldAlphaUsingAppearanceId:Float, worldAlphaUsingParentAppearanceId:Float, worldAppearanceId:Float, localMatrix4:Null<flight.esm.types.geometry.Types.Matrix4>, localMatrix4Detached:Bool, worldMatrix4:Null<flight.esm.types.geometry.Types.Matrix4>, ?instanceLocalBounds:Null<flight.esm.types.geometry.Types.Aabb>, ?instanceLocalBoundsVersion:Null<Float>, ?instancedMeshSignals:Null<flight.esm.types.meshgeometry.Types.InstancedMeshSignals> };

typedef InstancedMeshSignals = { onCleared:flight.esm.types.signals.Types.Signal<Void>, onInstanceAppended:flight.esm.types.signals.Types.Signal<Float>, onInstanceRemoved:flight.esm.types.signals.Types.Signal<flight.esm.types.meshgeometry.Types.InstancedMeshInstanceRemoved> };

typedef InstancedMeshSignalsRuntime = { ?instancedMeshSignals:Null<flight.esm.types.meshgeometry.Types.InstancedMeshSignals> };

typedef Mesh = { geometry:flight.esm.types.meshgeometry.Types.MeshGeometry, materials:Array<Null<flight.esm.types.materials_contract.Types.Material3D>>, ?morph:Null<flight.esm.types.meshgeometry.Types.MeshMorph>, ?skin:Null<flight.esm.types.scene3d.Types.Skin>, data:Null<flight.esm.types.node.Types.NodeData>, enabled:Bool, kind:String, name:Null<String>, alpha:Float, visible:Bool, position:flight.esm.types.geometry.Types.Vector3, rotation:flight.esm.types.geometry.Types.Quaternion, scale:flight.esm.types.geometry.Types.Vector3 };

typedef MeshDeformRuntime = { ?deformedLocalBounds:Null<flight.esm.types.geometry.Types.Aabb> };

typedef MeshGeometry = { bounds:Null<flight.esm.types.geometry.Types.Aabb>, indices:Dynamic, layout:flight.esm.types.meshgeometry.Types.VertexAttributeLayout, subsets:Array<flight.esm.types.meshgeometry.Types.MeshSubset>, topology:flight.esm.types.meshgeometry.Types.PrimitiveTopology, version:Float, vertices:js.lib.Float32Array };

typedef MeshGeometryFromAttributesOptions = { ?indices:Dynamic, ?normals:Null<Array<Float>>, positions:Array<Float>, ?uvs:Null<Array<Float>> };

typedef MeshGeometryGlData = { __meshGeometryGlData:Dynamic };

typedef MeshGeometryOptions = { ?indices:Dynamic, layout:flight.esm.types.meshgeometry.Types.VertexAttributeLayout, ?subsets:Null<Array<flight.esm.types.meshgeometry.Types.MeshSubset>>, ?topology:Null<String>, vertices:js.lib.Float32Array };

typedef MeshGeometryRuntime = { attributeDataView:Dynamic, boundsVersion:Float, morphBindPose:Null<flight.esm.types.meshgeometry.Types.MeshMorphBindPose>, morphBlendedWeights:Null<js.lib.Float32Array>, skinBindPose:Null<flight.esm.types.meshgeometry.Types.MeshSkinBindPose>, webglData:Null<flight.esm.types.meshgeometry.Types.MeshGeometryGlData>, webgpuData:Null<flight.esm.types.meshgeometry.Types.MeshGeometryWgpuData>, binding:Dynamic, ?uid:Null<String> };

typedef MeshGeometryUvSetExplanation = { availableUvSets:Array<flight.esm.types.materials_contract.Types.PbrUvSet>, requestedUvSets:Array<flight.esm.types.materials_contract.Types.PbrUvSet>, samplesAtOrigin:Bool, unservedUvSets:Array<flight.esm.types.materials_contract.Types.PbrUvSet> };

typedef MeshGeometryWgpuData = { __meshGeometryWgpuData:Dynamic };

typedef MeshMorph = { targets:Array<flight.esm.types.meshgeometry.Types.MorphTarget>, weights:js.lib.Float32Array };

typedef MeshMorphBindPose = { blendedNormals:Null<js.lib.Float32Array>, blendedPositions:js.lib.Float32Array, blendedTangents:Null<js.lib.Float32Array>, normals:Null<js.lib.Float32Array>, positions:js.lib.Float32Array, tangents:Null<js.lib.Float32Array> };

typedef MeshRuntime = { appearanceId:Float, boundsUsingLocalBoundsId:Float, boundsUsingLocalTransformId:Float, canAddChild:((target:flight.esm.types.node.Types.Node<flight.esm.types.scene3d.Types.Node3DFields>, child:flight.esm.types.node.Types.Node<flight.esm.types.scene3d.Types.Node3DFields>) -> Bool), children:Null<Array<flight.esm.types.node.Types.NodeOf<flight.esm.types.scene3d.Types.Node3DFields>>>, childrenId:Float, ?fields:Null<flight.esm.types.node.Types.NodeFieldsKey<flight.esm.types.scene3d.Types.Node3DFields>>, interactionSignals:Dynamic, localBoundsId:Float, localBoundsUsingLocalBoundsId:Float, localContentId:Float, localTransformId:Float, localTransformUsingLocalTransformId:Float, nodeSignals:Null<flight.esm.types.node.Types.NodeSignals>, interactionState:Dynamic, parent:Null<flight.esm.types.node.Types.NodeOf<flight.esm.types.scene3d.Types.Node3DFields>>, parentReferenceId:Float, worldBoundsUsingLocalBoundsId:Float, worldBoundsUsingWorldTransformId:Float, worldTransformId:Float, worldTransformRevisionCounter:Float, worldTransformUsingLocalTransformId:Float, worldTransformUsingParentTransformId:Float, binding:Dynamic, ?uid:Null<String>, colorAdjustments:Null<Array<flight.esm.types.adjustments_contract.Types.Adjustment>>, colorAdjustmentsUnsupported:Bool, resolvedColorMatrix:Null<js.lib.Float32Array>, resolvedColorScaleBias:Null<flight.esm.types.adjustments_contract.Types.ColorScaleBias>, worldAlpha:Null<Float>, worldAlphaUsingAppearanceId:Float, worldAlphaUsingParentAppearanceId:Float, worldAppearanceId:Float, localMatrix4:Null<flight.esm.types.geometry.Types.Matrix4>, localMatrix4Detached:Bool, worldMatrix4:Null<flight.esm.types.geometry.Types.Matrix4>, ?deformedLocalBounds:Null<flight.esm.types.geometry.Types.Aabb> };

typedef MeshSkinBindPose = { joints:js.lib.Float32Array, lastSkinVersion:Float, normals:js.lib.Float32Array, positions:js.lib.Float32Array, skinnedNormals:js.lib.Float32Array, skinnedPositions:js.lib.Float32Array, skinnedTangents:js.lib.Float32Array, tangents:js.lib.Float32Array, weights:js.lib.Float32Array };

typedef MeshSubset = { indexCount:Float, indexOffset:Float };

typedef MeshTriangleVertexIndices = { i0:Float, i1:Float, i2:Float };

typedef MorphTarget = { normalDeltas:Null<js.lib.Float32Array>, positionDeltas:js.lib.Float32Array, tangentDeltas:Null<js.lib.Float32Array> };

typedef PrimitiveTopology = String;

typedef VertexAttribute = { byteOffset:Float, format:flight.esm.types.meshgeometry.Types.VertexFormat, semantic:flight.esm.types.meshgeometry.Types.VertexSemantic };

typedef VertexAttributeLayout = { attributes:Array<flight.esm.types.meshgeometry.Types.VertexAttribute>, stride:Float };

typedef VertexFormat = String;

typedef VertexSemantic = String;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
