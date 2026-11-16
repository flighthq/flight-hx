package flight;

#if (js && flight_esm)
extern inline function readAbcFile(source:Dynamic):Null<AbcFile> {
	return flight._js._fn.Abc.readAbcFile(source);
}
#else
extern inline function readAbcFile(source:Dynamic, sourceLen:Int):AbcFile {
#if hl
	return flight._hl._fn.Abc.readAbcFile(source, sourceLen);
#elseif cpp
	return flight._cpp._fn.Abc.readAbcFile(source, sourceLen);
#elseif (js && flight_esm)
	return flight._js._fn.Abc.readAbcFile(source, sourceLen);
#else
	#error "flight.Abc: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function readAbcInstructions(code:Dynamic):Null<Dynamic> {
	return flight._js._fn.Abc.readAbcInstructions(code);
}
#else
extern inline function readAbcInstructions(code:Dynamic, codeLen:Int):Dynamic {
#if hl
	return flight._hl._fn.Abc.readAbcInstructions(code, codeLen);
#elseif cpp
	return flight._cpp._fn.Abc.readAbcInstructions(code, codeLen);
#elseif (js && flight_esm)
	return flight._js._fn.Abc.readAbcInstructions(code, codeLen);
#else
	#error "flight.Abc: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeAbcFile(ptr:AbcFile):Void {
	flight._js._fn.Abc.freeAbcFile(ptr);
}
#else
extern inline function freeAbcFile(ptr:AbcFile):Void {
#if hl
	flight._hl._fn.Abc.freeAbcFile(ptr);
#elseif cpp
	flight._cpp._fn.Abc.freeAbcFile(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Abc.freeAbcFile(ptr);
#else
	#error "flight.Abc: no backend for this target."
#end
}
#end
