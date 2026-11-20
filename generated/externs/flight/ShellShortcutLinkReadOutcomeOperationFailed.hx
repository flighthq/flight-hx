package flight;

#if hl

typedef ShellShortcutLinkReadOutcomeOperationFailed = flight._hl.ShellShortcutLinkReadOutcomeOperationFailed;

#elseif cpp

typedef ShellShortcutLinkReadOutcomeOperationFailed = flight._cpp.ShellShortcutLinkReadOutcomeOperationFailed;

#elseif (js && flight_esm)

typedef ShellShortcutLinkReadOutcomeOperationFailed = flight._js.ShellShortcutLinkReadOutcomeOperationFailed;

#elseif js

#error "flight.ShellShortcutLinkReadOutcomeOperationFailed on js requires flight_esm."

#else

#error "flight.ShellShortcutLinkReadOutcomeOperationFailed: no backend for this target."

#end
