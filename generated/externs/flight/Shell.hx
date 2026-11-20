package flight;

#if (js && flight_esm)
extern inline function isShellUrlAllowed(url:String, policy:ShellExternalUrlPolicy):Bool {
	return flight._js._fn.Shell.isShellUrlAllowed(url, policy);
}
#else
extern inline function isShellUrlAllowed(url:String, policy:ShellExternalUrlPolicy):Bool {
#if hl
	return flight._hl._fn.Shell.isShellUrlAllowed(cast url, policy);
#elseif cpp
	return flight._cpp._fn.Shell.isShellUrlAllowed(cast url, policy);
#elseif (js && flight_esm)
	return flight._js._fn.Shell.isShellUrlAllowed(url, policy);
#else
	#error "flight.Shell: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function shellBeep(hostShellBeep:HostShellBeepCapability):Void {
	flight._js._fn.Shell.shellBeep(hostShellBeep);
}
#else
extern inline function shellBeep(hostShellBeep:HostShellBeepCapability):Void {
#if hl
	flight._hl._fn.Shell.shellBeep(hostShellBeep);
#elseif cpp
	flight._cpp._fn.Shell.shellBeep(hostShellBeep);
#elseif (js && flight_esm)
	flight._js._fn.Shell.shellBeep(hostShellBeep);
#else
	#error "flight.Shell: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function spawnShellProcess(hostShellProcess:HostShellProcessCapability, command:String, args:Dynamic, options:Null<ShellProcessOptions>):ShellProcess {
	return flight._js._fn.Shell.spawnShellProcess(hostShellProcess, command, args, options);
}
#else
extern inline function spawnShellProcess(hostShellProcess:HostShellProcessCapability, command:String, args:Dynamic, argsLen:Int, options:ShellProcessOptions):ShellProcess {
#if hl
	return flight._hl._fn.Shell.spawnShellProcess(hostShellProcess, cast command, args, argsLen, options);
#elseif cpp
	return flight._cpp._fn.Shell.spawnShellProcess(hostShellProcess, cast command, args, argsLen, options);
#elseif (js && flight_esm)
	return flight._js._fn.Shell.spawnShellProcess(hostShellProcess, command, args, argsLen, options);
#else
	#error "flight.Shell: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeShellProcess(ptr:ShellProcess):Void {
	flight._js._fn.Shell.freeShellProcess(ptr);
}
#else
extern inline function freeShellProcess(ptr:ShellProcess):Void {
#if hl
	flight._hl._fn.Shell.freeShellProcess(ptr);
#elseif cpp
	flight._cpp._fn.Shell.freeShellProcess(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Shell.freeShellProcess(ptr);
#else
	#error "flight.Shell: no backend for this target."
#end
}
#end
