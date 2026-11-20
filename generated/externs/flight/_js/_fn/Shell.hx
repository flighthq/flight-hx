package flight._js._fn;

@:jsRequire("@flighthq/shell")
extern class Shell {
	@:native("isShellUrlAllowed")
	public static function isShellUrlAllowed(url:String, policy:flight._js.ShellExternalUrlPolicy):Bool;
	@:native("shellBeep")
	public static function shellBeep(hostShellBeep:flight._js.HostShellBeepCapability):Void;
	@:native("spawnShellProcess")
	public static function spawnShellProcess(hostShellProcess:flight._js.HostShellProcessCapability, command:String, args:Dynamic, options:Null<flight._js.ShellProcessOptions>):flight._js.ShellProcess;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeShellProcess(ptr:flight._js.ShellProcess):Void {}
}
