package flight.esm.types.command;

#if (js && flight_esm)
typedef AddNodeChildCommand = { child:flight.esm.types.node.Types.NodeAny, index:Float, parent:flight.esm.types.node.Types.NodeAny, kind:String, label:String };

typedef Command = { kind:String, label:String };

typedef CommandBinding = { execute:((command:flight.esm.types.command.Types.Command) -> Void), ?merge:Null<((previous:flight.esm.types.command.Types.Command, next:flight.esm.types.command.Types.Command) -> Null<flight.esm.types.command.Types.Command>)>, undo:((command:flight.esm.types.command.Types.Command) -> Void) };

typedef CommandBindingTable = { forEach:((callbackfn:Dynamic, ?thisArg:Dynamic) -> Void), get:((key:String) -> Null<flight.esm.types.command.Types.CommandBinding>), has:((key:String) -> Bool), size:Float, entries:(() -> Dynamic), keys:(() -> Dynamic), values:(() -> Dynamic) };

typedef CommandDispatchExplanation = { missingKind:Null<String>, resolved:Bool };

typedef CommandHistory = { bindings:flight.esm.types.command.Types.CommandBindingTable, entries:Array<flight.esm.types.command.Types.Command>, index:Float, maxSize:Float, onChange:Null<flight.esm.types.signals.Types.Signal<Void>>, transactionDepth:Float, transactionIndex:Float, transactionLabel:Null<String> };

typedef CommandPropertyEntry = { after:Dynamic, before:Dynamic, property:String, target:flight.esm.types.node.Types.NodeAny };

typedef CompositeCommand = { children:Array<flight.esm.types.command.Types.Command>, kind:String, label:String };

typedef RemoveNodeChildCommand = { child:flight.esm.types.node.Types.NodeAny, index:Float, parent:flight.esm.types.node.Types.NodeAny, kind:String, label:String };

typedef ReorderNodeChildCommand = { child:flight.esm.types.node.Types.NodeAny, fromIndex:Float, parent:flight.esm.types.node.Types.NodeAny, toIndex:Float, kind:String, label:String };

typedef SetNodePropertyCommand = { entries:Array<flight.esm.types.command.Types.CommandPropertyEntry>, mergeWindow:Float, time:Float, kind:String, label:String };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
