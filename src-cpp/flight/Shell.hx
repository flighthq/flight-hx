// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

extern inline function isShellUrlAllowed(url:String, policy:flight.ShellExternalUrlPolicy):Bool {
  return flight._cpp._attempt.Attempt_Shell_isShellUrlAllowed.isShellUrlAllowed(url, policy);
}

extern inline function moveShellItemToTrash(hostShellTrash:flight.HostShellTrashCapability, path:String):flight._internal._Promise<flight.ShellTrashOutcome> {
  return flight._cpp._attempt.Attempt_Shell_moveShellItemToTrash.moveShellItemToTrash(hostShellTrash, path);
}

extern inline function moveShellItemsToTrash(hostShellTrash:flight.HostShellTrashCapability, paths:Array<String>):flight._internal._Promise<Array<flight.ShellTrashOutcome>> {
  return flight._cpp._attempt.Attempt_Shell_moveShellItemsToTrash.moveShellItemsToTrash(hostShellTrash, paths);
}

extern inline function openShellExternalUrl(hostShellExternal:flight.HostShellExternalCapability, url:String, policy:flight.ShellExternalUrlPolicy):flight._internal._Promise<flight.ShellExternalOutcome> {
  return flight._cpp._attempt.Attempt_Shell_openShellExternalUrl.openShellExternalUrl(hostShellExternal, url, policy);
}

extern inline function openShellPath(hostShellPathOpen:flight.HostShellPathOpenCapability, path:String):flight._internal._Promise<flight.ShellPathOpenOutcome> {
  return flight._cpp._attempt.Attempt_Shell_openShellPath.openShellPath(hostShellPathOpen, path);
}

extern inline function readShellShortcutLink(hostShellShortcutLink:flight.HostShellShortcutLinkCapability, shortcutPath:String):flight._internal._Promise<flight.ShellShortcutLinkReadOutcome> {
  return flight._cpp._attempt.Attempt_Shell_readShellShortcutLink.readShellShortcutLink(hostShellShortcutLink, shortcutPath);
}

extern inline function revealShellPath(hostShellPathReveal:flight.HostShellPathRevealCapability, path:String):flight._internal._Promise<flight.ShellPathRevealOutcome> {
  return flight._cpp._attempt.Attempt_Shell_revealShellPath.revealShellPath(hostShellPathReveal, path);
}

extern inline function shellBeep(hostShellBeep:flight.HostShellBeepCapability):Void {
  flight._cpp._attempt.Attempt_Shell_shellBeep.shellBeep(hostShellBeep);
}

extern inline function spawnShellProcess(hostShellProcess:flight.HostShellProcessCapability, command:String, args:Array<String>, ?options:flight.ShellProcessOptions):flight.ShellProcess {
  return flight._cpp._attempt.Attempt_Shell_spawnShellProcess.spawnShellProcess(hostShellProcess, command, args, options);
}

extern inline function writeShellShortcutLink(hostShellShortcutLink:flight.HostShellShortcutLinkCapability, shortcutPath:String, link:flight.ShellShortcutLink, operation:flight.ShellShortcutWriteOperation):flight._internal._Promise<flight.ShellShortcutLinkWriteOutcome> {
  return flight._cpp._attempt.Attempt_Shell_writeShellShortcutLink.writeShellShortcutLink(hostShellShortcutLink, shortcutPath, link, operation);
}
