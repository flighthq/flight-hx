package flight.esm.types.scene3d;

#if (js && flight_esm)
typedef Billboard = { geometry:flight.esm.types.meshgeometry.Types.MeshGeometry, materials:Array<Null<flight.esm.types.materials_contract.Types.Material3D>>, mode:flight.esm.types.scene3d.Types.BillboardMode, data:Null<flight.esm.types.node.Types.NodeData>, enabled:Bool, kind:String, name:Null<String>, alpha:Float, visible:Bool, position:flight.esm.types.geometry.Types.Vector3, rotation:flight.esm.types.geometry.Types.Quaternion, scale:flight.esm.types.geometry.Types.Vector3 };

typedef BillboardMode = String;

typedef BillboardRuntime = flight.esm.types.scene3d.Types.Node3DRuntime;

typedef MeshDeformer = String;

typedef Node3D = { data:Null<flight.esm.types.node.Types.NodeData>, enabled:Bool, kind:String, name:Null<String>, alpha:Float, visible:Bool, position:flight.esm.types.geometry.Types.Vector3, rotation:flight.esm.types.geometry.Types.Quaternion, scale:flight.esm.types.geometry.Types.Vector3 };

typedef Node3DFields = { alpha:Float, visible:Bool, position:flight.esm.types.geometry.Types.Vector3, rotation:flight.esm.types.geometry.Types.Quaternion, scale:flight.esm.types.geometry.Types.Vector3 };

typedef Node3DRuntime = { appearanceId:Float, boundsUsingLocalBoundsId:Float, boundsUsingLocalTransformId:Float, canAddChild:((target:flight.esm.types.node.Types.Node<flight.esm.types.scene3d.Types.Node3DFields>, child:flight.esm.types.node.Types.Node<flight.esm.types.scene3d.Types.Node3DFields>) -> Bool), children:Null<Array<flight.esm.types.node.Types.NodeOf<flight.esm.types.scene3d.Types.Node3DFields>>>, childrenId:Float, ?fields:Null<flight.esm.types.node.Types.NodeFieldsKey<flight.esm.types.scene3d.Types.Node3DFields>>, interactionSignals:Dynamic, localBoundsId:Float, localBoundsUsingLocalBoundsId:Float, localContentId:Float, localTransformId:Float, localTransformUsingLocalTransformId:Float, nodeSignals:Null<flight.esm.types.node.Types.NodeSignals>, interactionState:Dynamic, parent:Null<flight.esm.types.node.Types.NodeOf<flight.esm.types.scene3d.Types.Node3DFields>>, parentReferenceId:Float, worldBoundsUsingLocalBoundsId:Float, worldBoundsUsingWorldTransformId:Float, worldTransformId:Float, worldTransformRevisionCounter:Float, worldTransformUsingLocalTransformId:Float, worldTransformUsingParentTransformId:Float, binding:Dynamic, ?uid:Null<String>, colorAdjustments:Null<Array<flight.esm.types.adjustments_contract.Types.Adjustment>>, colorAdjustmentsUnsupported:Bool, resolvedColorMatrix:Null<js.lib.Float32Array>, resolvedColorScaleBias:Null<flight.esm.types.adjustments_contract.Types.ColorScaleBias>, worldAlpha:Null<Float>, worldAlphaUsingAppearanceId:Float, worldAlphaUsingParentAppearanceId:Float, worldAppearanceId:Float, localMatrix4:Null<flight.esm.types.geometry.Types.Matrix4>, localMatrix4Detached:Bool, worldMatrix4:Null<flight.esm.types.geometry.Types.Matrix4> };

typedef Scene3DAnimationPath = String;

typedef Scene3DAnimationTarget = { node:flight.esm.types.scene3d.Types.Node3D, path:flight.esm.types.scene3d.Types.Scene3DAnimationPath };

typedef Scene3DKindUsage = { materialKinds:Array<String>, modifierKinds:Array<String>, nodeKinds:Array<String>, resourceMimeTypes:Array<String>, textureSourceKinds:Array<String> };

typedef Skeleton3D = { inverseBindMatrices:js.lib.Float32Array, jointMatrices:js.lib.Float32Array, normalMatrices:js.lib.Float32Array, joints:Array<flight.esm.types.scene3d.Types.Node3D>, ?names:Null<Array<String>> };

typedef Skin = { skeleton:flight.esm.types.scene3d.Types.Skeleton3D, ?skeletonRoot:Null<flight.esm.types.scene3d.Types.Node3D> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
