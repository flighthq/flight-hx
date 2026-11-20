package flight.esm.types.sdk_command;

#if (js && flight_esm)
typedef AddNodeChildCommand = flight.esm.types.command.Types.AddNodeChildCommand;

typedef Command = flight.esm.types.command.Types.Command;

typedef CommandBinding = flight.esm.types.command.Types.CommandBinding;

typedef CommandBindingTable = flight.esm.types.command.Types.CommandBindingTable;

typedef CommandDispatchExplanation = flight.esm.types.command.Types.CommandDispatchExplanation;

typedef CommandHistory = flight.esm.types.command.Types.CommandHistory;

typedef CommandPropertyEntry = flight.esm.types.command.Types.CommandPropertyEntry;

typedef CompositeCommand = flight.esm.types.command.Types.CompositeCommand;

typedef RemoveNodeChildCommand = flight.esm.types.command.Types.RemoveNodeChildCommand;

typedef ReorderNodeChildCommand = flight.esm.types.command.Types.ReorderNodeChildCommand;

typedef SetNodePropertyCommand = flight.esm.types.command.Types.SetNodePropertyCommand;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
