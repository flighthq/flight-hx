package flight.esm.types.scene_document;

#if (js && flight_esm)
typedef FlightDocument = { defaultScene:Float, resources:Array<flight.esm.types.scene_document.Types.FlightDocumentResourceDescriptor>, scenes:Array<flight.esm.types.scene_document.Types.FlightDocumentScene>, version:Float };

typedef FlightDocumentFieldSchema = { ?defaultValue:Dynamic, name:String, required:Bool, validate:flight.esm.types.scene_document.Types.FlightDocumentFieldValidator };

typedef FlightDocumentFieldValidator = ((value:flight.esm.types.scene_document.Types.FlightDocumentValue) -> Bool);

typedef FlightDocumentFields = Dynamic;

typedef FlightDocumentInteractiveState = { ?alpha:Null<Float>, extensions:Array<flight.esm.types.scene_document.Types.FlightDocumentInteractiveStateExtensionDescriptor>, ?scaleX:Null<Float>, ?scaleY:Null<Float>, ?visible:Null<Bool>, ?x:Null<Float>, ?y:Null<Float> };

typedef FlightDocumentInteractiveStateBinding<N> = { interactiveStates:flight.esm.types.scene_document.Types.FlightDocumentInteractiveStates, node:N, transition:Null<flight.esm.types.scene_document.Types.FlightDocumentInteractiveStateTransitionDescriptor> };

typedef FlightDocumentInteractiveStateExtensionDescriptor = { fields:flight.esm.types.scene_document.Types.FlightDocumentFields, kind:String };

typedef FlightDocumentInteractiveStateExtensionSchema = { createExtension:((node:flight.esm.types.node.Types.NodeAny, fieldNames:Array<String>) -> Null<flight.esm.types.scene_document.Types.NodeInteractiveStateExtensionRuntime>), fields:Array<flight.esm.types.scene_document.Types.FlightDocumentFieldSchema>, isSupported:((node:flight.esm.types.node.Types.NodeAny) -> Bool), kind:String };

typedef FlightDocumentInteractiveStateProperty = String;

typedef FlightDocumentInteractiveStateTransitionDescriptor = { fields:flight.esm.types.scene_document.Types.FlightDocumentFields, kind:String };

typedef FlightDocumentInteractiveStateTransitionSchema = { createTransition:((fields:flight.esm.types.scene_document.Types.FlightDocumentFields) -> Null<flight.esm.types.scene_document.Types.NodeInteractiveStateTransition<flight.esm.types.node.Types.NodeAny, String>>), fields:Array<flight.esm.types.scene_document.Types.FlightDocumentFieldSchema>, kind:String };

typedef FlightDocumentInteractiveStateValue = Dynamic;

typedef FlightDocumentInteractiveStates = { disabled:Null<flight.esm.types.scene_document.Types.FlightDocumentInteractiveState>, hover:Null<flight.esm.types.scene_document.Types.FlightDocumentInteractiveState>, pressed:Null<flight.esm.types.scene_document.Types.FlightDocumentInteractiveState> };

typedef FlightDocumentLayoutBinding<N> = { targets:Array<N>, tree:flight.esm.types.scene_document.Types.FlightDocumentLayoutTree };

typedef FlightDocumentLayoutDescriptor = { targets:Array<String>, tree:flight.esm.types.scene_document.Types.FlightDocumentLayoutTree };

typedef FlightDocumentLayoutNode = { containerStyle:Null<flight.esm.types.scene_document.Types.FlightDocumentFields>, itemStyle:Null<flight.esm.types.scene_document.Types.FlightDocumentFields>, kind:String, parentIndex:Float };

typedef FlightDocumentLayoutTree = { nodes:Array<flight.esm.types.scene_document.Types.FlightDocumentLayoutNode> };

typedef FlightDocumentNode = { children:Array<flight.esm.types.scene_document.Types.FlightDocumentNode>, fields:flight.esm.types.scene_document.Types.FlightDocumentFields, ?interactiveStates:Null<flight.esm.types.scene_document.Types.FlightDocumentInteractiveStates>, kind:String, ?transition:Null<flight.esm.types.scene_document.Types.FlightDocumentInteractiveStateTransitionDescriptor> };

typedef FlightDocumentNodeFactory = ((fields:flight.esm.types.scene_document.Types.FlightDocumentFields, resources:Dynamic) -> Null<flight.esm.types.node.Types.NodeAny>);

typedef FlightDocumentNodeFieldWriter = ((out:flight.esm.types.scene_document.Types.FlightDocumentFields, source:flight.esm.types.node.Types.NodeAny, resources:Dynamic) -> Bool);

typedef FlightDocumentNodeSchema = { createNode:flight.esm.types.scene_document.Types.FlightDocumentNodeFactory, fields:Array<flight.esm.types.scene_document.Types.FlightDocumentFieldSchema>, kind:String, writeNodeFields:flight.esm.types.scene_document.Types.FlightDocumentNodeFieldWriter };

typedef FlightDocumentRefusalExplanation = { actual:Null<Float>, column:Null<Float>, kind:Null<String>, limit:Null<Float>, line:Null<Float>, mode:Null<String>, offset:Null<Float>, path:String, reason:flight.esm.types.scene_document.Types.FlightDocumentRefusalReason, resourceKey:Null<String>, tokenKey:Null<String>, version:Null<Float> };

typedef FlightDocumentRefusalReason = String;

typedef FlightDocumentResourceDescriptor = { fields:flight.esm.types.scene_document.Types.FlightDocumentFields, key:String, kind:String };

typedef FlightDocumentResourceLookup = Dynamic;

typedef FlightDocumentResourceResolver = ((key:String, descriptor:flight.esm.types.scene_document.Types.FlightDocumentResourceDescriptor) -> Dynamic);

typedef FlightDocumentResourceResolverRegistry = { resolvers:js.lib.Map<String, flight.esm.types.scene_document.Types.FlightDocumentResourceResolver> };

typedef FlightDocumentResourceSchema = { fields:Array<flight.esm.types.scene_document.Types.FlightDocumentFieldSchema>, kind:String };

typedef FlightDocumentScalar = Dynamic;

typedef FlightDocumentScene = { kind:String, layouts:Array<flight.esm.types.scene_document.Types.FlightDocumentLayoutDescriptor>, scene:flight.esm.types.scene_document.Types.FlightDocumentNode, tokens:Array<flight.esm.types.scene_document.Types.FlightDocumentToken> };

typedef FlightDocumentScene2D = { backgroundColor:Null<Float>, kind:String, layouts:Array<flight.esm.types.scene_document.Types.FlightDocumentLayoutDescriptor>, scene:flight.esm.types.scene_document.Types.FlightDocumentNode, tokens:Array<flight.esm.types.scene_document.Types.FlightDocumentToken> };

typedef FlightDocumentScene2DMaterialization = { interactiveStateBindings:Array<flight.esm.types.scene_document.Types.FlightDocumentInteractiveStateBinding<flight.esm.types.scene2d_contract.Types.Node2D>>, layoutBindings:Array<flight.esm.types.scene_document.Types.FlightDocumentLayoutBinding<flight.esm.types.scene2d_contract.Types.Node2D>>, scene:flight.esm.types.scene2d_contract.Types.Scene2D };

typedef FlightDocumentScene3D = { cameras:Array<flight.esm.types.scene3d_contract.Types.Scene3DDocumentCamera>, kind:String, layouts:Array<flight.esm.types.scene_document.Types.FlightDocumentLayoutDescriptor>, lights:Array<flight.esm.types.scene3d_contract.Types.Scene3DDocumentLight>, scene:flight.esm.types.scene_document.Types.FlightDocumentNode, tokens:Array<flight.esm.types.scene_document.Types.FlightDocumentToken> };

typedef FlightDocumentScene3DMaterialization = { cameras:Array<flight.esm.types.camera.Types.Camera3D>, interactiveStateBindings:Array<flight.esm.types.scene_document.Types.FlightDocumentInteractiveStateBinding<flight.esm.types.scene3d.Types.Node3D>>, layoutBindings:Array<flight.esm.types.scene_document.Types.FlightDocumentLayoutBinding<flight.esm.types.scene3d.Types.Node3D>>, lights:flight.esm.types.lighting_contract.Types.Scene3DLights, scene:flight.esm.types.scene3d_contract.Types.Scene3D };

typedef FlightDocumentSchemaRegistry = { interactiveStateExtensionSchemas:js.lib.Map<String, flight.esm.types.scene_document.Types.FlightDocumentInteractiveStateExtensionSchema>, interactiveStateTransitionSchemas:js.lib.Map<String, flight.esm.types.scene_document.Types.FlightDocumentInteractiveStateTransitionSchema>, nodeSchemas:js.lib.Map<String, flight.esm.types.scene_document.Types.FlightDocumentNodeSchema>, resourceSchemas:js.lib.Map<String, flight.esm.types.scene_document.Types.FlightDocumentResourceSchema>, shapeCommandSchemas:js.lib.Map<String, flight.esm.types.shape_formats_contract.Types.ShapeCommandSchema<String>> };

typedef FlightDocumentText = String;

typedef FlightDocumentToken = { key:String, kind:String, values:flight.esm.types.scene_document.Types.FlightDocumentTokenValues };

typedef FlightDocumentTokenValues = Dynamic;

typedef FlightDocumentValue = Dynamic;

typedef NodeInteractiveStateExtensionRuntime = { apply:((fields:flight.esm.types.scene_document.Types.FlightDocumentFields, transition:Null<flight.esm.types.scene_document.Types.NodeInteractiveStateTransition<Dynamic, Dynamic>>) -> Bool), capture:((out:flight.esm.types.scene_document.Types.FlightDocumentFields) -> Bool), dispose:(() -> Void) };

typedef NodeInteractiveStateTransition<N, P> = { run:((request:flight.esm.types.scene_document.Types.NodeInteractiveStateTransitionRequest<N, P>) -> Void) };

typedef NodeInteractiveStateTransitionRequest<N, P> = { apply:((?value:Dynamic) -> Void), from:flight.esm.types.scene_document.Types.NodeInteractiveStateTransitionValue, property:P, target:N, value:flight.esm.types.scene_document.Types.NodeInteractiveStateTransitionValue };

typedef NodeInteractiveStateTransitionValue = Dynamic;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
