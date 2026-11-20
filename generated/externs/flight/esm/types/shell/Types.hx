package flight.esm.types.shell;

#if (js && flight_esm)
typedef HostShellBeepCapability = { beep:(() -> Void) };

typedef HostShellCapabilities = { ?beep:Null<flight.esm.types.shell.Types.HostShellBeepCapability>, ?external:Null<flight.esm.types.shell.Types.HostShellExternalCapability>, ?pathOpen:Null<flight.esm.types.shell.Types.HostShellPathOpenCapability>, ?pathReveal:Null<flight.esm.types.shell.Types.HostShellPathRevealCapability>, ?process:Null<flight.esm.types.shell.Types.HostShellProcessCapability>, ?shortcutLink:Null<flight.esm.types.shell.Types.HostShellShortcutLinkCapability>, ?trash:Null<flight.esm.types.shell.Types.HostShellTrashCapability> };

typedef HostShellExternalCapability = { open:((url:String) -> js.lib.Promise<flight.esm.types.shell.Types.ShellExternalOutcome>) };

typedef HostShellPathOpenCapability = { open:((path:String) -> js.lib.Promise<flight.esm.types.shell.Types.ShellPathOpenOutcome>) };

typedef HostShellPathRevealCapability = { reveal:((path:String) -> js.lib.Promise<flight.esm.types.shell.Types.ShellPathRevealOutcome>) };

typedef HostShellProcessCapability = { spawn:((command:String, args:Array<String>, ?options:Null<flight.esm.types.shell.Types.ShellProcessOptions>) -> flight.esm.types.shell.Types.ShellProcess) };

typedef HostShellShortcutLinkCapability = { read:((shortcutPath:String) -> js.lib.Promise<flight.esm.types.shell.Types.ShellShortcutLinkReadOutcome>), write:((shortcutPath:String, link:flight.esm.types.shell.Types.ShellShortcutLink, operation:flight.esm.types.shell.Types.ShellShortcutWriteOperation) -> js.lib.Promise<flight.esm.types.shell.Types.ShellShortcutLinkWriteOutcome>) };

typedef HostShellTrashCapability = { moveToTrash:((path:String) -> js.lib.Promise<flight.esm.types.shell.Types.ShellTrashOutcome>) };

typedef ShellExternalOutcome = { reason:flight.esm.types.shell.Types.ShellExternalReason };

typedef ShellExternalReason = String;

typedef ShellExternalUrlPolicy = { allowedSchemes:Array<String> };

typedef ShellPathOpenOutcome = Dynamic;

typedef ShellPathRevealOutcome = { reason:String };

typedef ShellProcess = { exit:js.lib.Promise<flight.esm.types.shell.Types.ShellProcessExitStatus>, stderr:Dynamic, stdin:Dynamic, stdout:Dynamic, terminate:(() -> Void) };

typedef ShellProcessExitStatus = { code:Null<Float>, signal:Null<String> };

typedef ShellProcessOptions = { ?cwd:Null<String>, ?environment:Dynamic };

typedef ShellShortcutLink = { target:String, ?appUserModelId:Null<String>, ?args:Null<String>, ?description:Null<String>, ?icon:Null<String>, ?iconIndex:Null<Float>, ?workingDirectory:Null<String> };

typedef ShellShortcutLinkReadOutcome = Dynamic;

typedef ShellShortcutLinkWriteOutcome = { reason:String };

typedef ShellShortcutWriteOperation = String;

typedef ShellTrashOutcome = { reason:String };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
