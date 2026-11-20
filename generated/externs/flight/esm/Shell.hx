package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/shell")
extern class Shell {
  public static function isShellUrlAllowed(url:String, policy:flight.esm.types.shell.Types.ShellExternalUrlPolicy):Bool;
  public static function moveShellItemToTrash(hostShellTrash:flight.esm.types.shell.Types.HostShellTrashCapability, path:String):js.lib.Promise<flight.esm.types.shell.Types.ShellTrashOutcome>;
  public static function moveShellItemsToTrash(hostShellTrash:flight.esm.types.shell.Types.HostShellTrashCapability, paths:Array<String>):js.lib.Promise<Array<flight.esm.types.shell.Types.ShellTrashOutcome>>;
  public static function openShellExternalUrl(hostShellExternal:flight.esm.types.shell.Types.HostShellExternalCapability, url:String, policy:flight.esm.types.shell.Types.ShellExternalUrlPolicy):js.lib.Promise<flight.esm.types.shell.Types.ShellExternalOutcome>;
  public static function openShellPath(hostShellPathOpen:flight.esm.types.shell.Types.HostShellPathOpenCapability, path:String):js.lib.Promise<flight.esm.types.shell.Types.ShellPathOpenOutcome>;
  public static function readShellShortcutLink(hostShellShortcutLink:flight.esm.types.shell.Types.HostShellShortcutLinkCapability, shortcutPath:String):js.lib.Promise<flight.esm.types.shell.Types.ShellShortcutLinkReadOutcome>;
  public static function revealShellPath(hostShellPathReveal:flight.esm.types.shell.Types.HostShellPathRevealCapability, path:String):js.lib.Promise<flight.esm.types.shell.Types.ShellPathRevealOutcome>;
  public static function shellBeep(hostShellBeep:flight.esm.types.shell.Types.HostShellBeepCapability):Void;
  public static function spawnShellProcess(hostShellProcess:flight.esm.types.shell.Types.HostShellProcessCapability, command:String, args:Array<String>, ?options:Null<flight.esm.types.shell.Types.ShellProcessOptions>):flight.esm.types.shell.Types.ShellProcess;
  public static function writeShellShortcutLink(hostShellShortcutLink:flight.esm.types.shell.Types.HostShellShortcutLinkCapability, shortcutPath:String, link:flight.esm.types.shell.Types.ShellShortcutLink, operation:flight.esm.types.shell.Types.ShellShortcutWriteOperation):js.lib.Promise<flight.esm.types.shell.Types.ShellShortcutLinkWriteOutcome>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
