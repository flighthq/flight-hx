package flight._cpp._fn;

extern class Shell {
	@:native("flight_is_shell_url_allowed")
	public static function isShellUrlAllowed(url:cpp.ConstCharStar, policy:flight._cpp.ShellExternalUrlPolicy):Bool;
	@:native("flight_shell_beep")
	public static function shellBeep(hostShellBeep:flight._cpp.HostShellBeepCapability):Void;
	@:native("flight_spawn_shell_process")
	public static function spawnShellProcess(hostShellProcess:flight._cpp.HostShellProcessCapability, command:cpp.ConstCharStar, args:cpp.Star<cpp.Void>, argsLen:Int, options:flight._cpp.ShellProcessOptions):flight._cpp.ShellProcess;
	@:native("flight_free_shell_process")
	public static function freeShellProcess(ptr:flight._cpp.ShellProcess):Void;
}
