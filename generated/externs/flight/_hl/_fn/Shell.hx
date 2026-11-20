package flight._hl._fn;

extern class Shell {
	@:hlNative("flight", "flight_is_shell_url_allowed")
	public static function isShellUrlAllowed(url:hl.Bytes, policy:flight._hl.ShellExternalUrlPolicy):Bool;
	@:hlNative("flight", "flight_shell_beep")
	public static function shellBeep(hostShellBeep:flight._hl.HostShellBeepCapability):Void;
	@:hlNative("flight", "flight_spawn_shell_process")
	public static function spawnShellProcess(hostShellProcess:flight._hl.HostShellProcessCapability, command:hl.Bytes, args:hl.Bytes, argsLen:Int, options:flight._hl.ShellProcessOptions):flight._hl.ShellProcess;
	@:hlNative("flight", "flight_free_shell_process")
	public static function freeShellProcess(ptr:flight._hl.ShellProcess):Void;
}
