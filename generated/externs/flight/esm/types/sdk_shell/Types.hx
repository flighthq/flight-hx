package flight.esm.types.sdk_shell;

#if (js && flight_esm)
typedef HostShellBeepCapability = flight.esm.types.shell.Types.HostShellBeepCapability;

typedef HostShellCapabilities = flight.esm.types.shell.Types.HostShellCapabilities;

typedef HostShellExternalCapability = flight.esm.types.shell.Types.HostShellExternalCapability;

typedef HostShellPathOpenCapability = flight.esm.types.shell.Types.HostShellPathOpenCapability;

typedef HostShellPathRevealCapability = flight.esm.types.shell.Types.HostShellPathRevealCapability;

typedef HostShellProcessCapability = flight.esm.types.shell.Types.HostShellProcessCapability;

typedef HostShellShortcutLinkCapability = flight.esm.types.shell.Types.HostShellShortcutLinkCapability;

typedef HostShellTrashCapability = flight.esm.types.shell.Types.HostShellTrashCapability;

typedef ShellExternalOutcome = flight.esm.types.shell.Types.ShellExternalOutcome;

typedef ShellExternalReason = flight.esm.types.shell.Types.ShellExternalReason;

typedef ShellExternalUrlPolicy = flight.esm.types.shell.Types.ShellExternalUrlPolicy;

typedef ShellPathOpenOutcome = flight.esm.types.shell.Types.ShellPathOpenOutcome;

typedef ShellPathRevealOutcome = flight.esm.types.shell.Types.ShellPathRevealOutcome;

typedef ShellProcess = flight.esm.types.shell.Types.ShellProcess;

typedef ShellProcessExitStatus = flight.esm.types.shell.Types.ShellProcessExitStatus;

typedef ShellProcessOptions = flight.esm.types.shell.Types.ShellProcessOptions;

typedef ShellShortcutLink = flight.esm.types.shell.Types.ShellShortcutLink;

typedef ShellShortcutLinkReadOutcome = flight.esm.types.shell.Types.ShellShortcutLinkReadOutcome;

typedef ShellShortcutLinkWriteOutcome = flight.esm.types.shell.Types.ShellShortcutLinkWriteOutcome;

typedef ShellShortcutWriteOperation = flight.esm.types.shell.Types.ShellShortcutWriteOperation;

typedef ShellTrashOutcome = flight.esm.types.shell.Types.ShellTrashOutcome;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
