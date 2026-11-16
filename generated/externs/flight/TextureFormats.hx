package flight;

#if (js && flight_esm)
extern inline function detectTextureContainer(bytes:Dynamic):Null<Dynamic> {
	return flight._js._fn.TextureFormats.detectTextureContainer(bytes);
}
#else
extern inline function detectTextureContainer(bytes:Dynamic, bytesLen:Int):Int {
#if hl
	return flight._hl._fn.TextureFormats.detectTextureContainer(bytes, bytesLen);
#elseif cpp
	return flight._cpp._fn.TextureFormats.detectTextureContainer(bytes, bytesLen);
#elseif (js && flight_esm)
	return flight._js._fn.TextureFormats.detectTextureContainer(bytes, bytesLen);
#else
	#error "flight.TextureFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function explainTextureContainerParse(bytes:Dynamic):Null<TextureContainerParseExplanation> {
	return flight._js._fn.TextureFormats.explainTextureContainerParse(bytes);
}
#else
extern inline function explainTextureContainerParse(bytes:Dynamic, bytesLen:Int):TextureContainerParseExplanation {
#if hl
	return flight._hl._fn.TextureFormats.explainTextureContainerParse(bytes, bytesLen);
#elseif cpp
	return flight._cpp._fn.TextureFormats.explainTextureContainerParse(bytes, bytesLen);
#elseif (js && flight_esm)
	return flight._js._fn.TextureFormats.explainTextureContainerParse(bytes, bytesLen);
#else
	#error "flight.TextureFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAtfParseFailureReason(bytes:Dynamic):Null<Dynamic> {
	return flight._js._fn.TextureFormats.getAtfParseFailureReason(bytes);
}
#else
extern inline function getAtfParseFailureReason(bytes:Dynamic, bytesLen:Int):Int {
#if hl
	return flight._hl._fn.TextureFormats.getAtfParseFailureReason(bytes, bytesLen);
#elseif cpp
	return flight._cpp._fn.TextureFormats.getAtfParseFailureReason(bytes, bytesLen);
#elseif (js && flight_esm)
	return flight._js._fn.TextureFormats.getAtfParseFailureReason(bytes, bytesLen);
#else
	#error "flight.TextureFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseAtf(bytes:Dynamic):Null<Dynamic> {
	return flight._js._fn.TextureFormats.parseAtf(bytes);
}
#else
extern inline function parseAtf(bytes:Dynamic, bytesLen:Int):Dynamic {
#if hl
	return flight._hl._fn.TextureFormats.parseAtf(bytes, bytesLen);
#elseif cpp
	return flight._cpp._fn.TextureFormats.parseAtf(bytes, bytesLen);
#elseif (js && flight_esm)
	return flight._js._fn.TextureFormats.parseAtf(bytes, bytesLen);
#else
	#error "flight.TextureFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getBasisParseFailureReason(bytes:Dynamic):Null<Dynamic> {
	return flight._js._fn.TextureFormats.getBasisParseFailureReason(bytes);
}
#else
extern inline function getBasisParseFailureReason(bytes:Dynamic, bytesLen:Int):Int {
#if hl
	return flight._hl._fn.TextureFormats.getBasisParseFailureReason(bytes, bytesLen);
#elseif cpp
	return flight._cpp._fn.TextureFormats.getBasisParseFailureReason(bytes, bytesLen);
#elseif (js && flight_esm)
	return flight._js._fn.TextureFormats.getBasisParseFailureReason(bytes, bytesLen);
#else
	#error "flight.TextureFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseBasis(bytes:Dynamic):Null<TextureContainer> {
	return flight._js._fn.TextureFormats.parseBasis(bytes);
}
#else
extern inline function parseBasis(bytes:Dynamic, bytesLen:Int):TextureContainer {
#if hl
	return flight._hl._fn.TextureFormats.parseBasis(bytes, bytesLen);
#elseif cpp
	return flight._cpp._fn.TextureFormats.parseBasis(bytes, bytesLen);
#elseif (js && flight_esm)
	return flight._js._fn.TextureFormats.parseBasis(bytes, bytesLen);
#else
	#error "flight.TextureFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getDdsParseFailureReason(bytes:Dynamic):Null<Dynamic> {
	return flight._js._fn.TextureFormats.getDdsParseFailureReason(bytes);
}
#else
extern inline function getDdsParseFailureReason(bytes:Dynamic, bytesLen:Int):Int {
#if hl
	return flight._hl._fn.TextureFormats.getDdsParseFailureReason(bytes, bytesLen);
#elseif cpp
	return flight._cpp._fn.TextureFormats.getDdsParseFailureReason(bytes, bytesLen);
#elseif (js && flight_esm)
	return flight._js._fn.TextureFormats.getDdsParseFailureReason(bytes, bytesLen);
#else
	#error "flight.TextureFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseDds(bytes:Dynamic):Null<TextureContainer> {
	return flight._js._fn.TextureFormats.parseDds(bytes);
}
#else
extern inline function parseDds(bytes:Dynamic, bytesLen:Int):TextureContainer {
#if hl
	return flight._hl._fn.TextureFormats.parseDds(bytes, bytesLen);
#elseif cpp
	return flight._cpp._fn.TextureFormats.parseDds(bytes, bytesLen);
#elseif (js && flight_esm)
	return flight._js._fn.TextureFormats.parseDds(bytes, bytesLen);
#else
	#error "flight.TextureFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getKtx2ParseFailureReason(bytes:Dynamic):Null<Dynamic> {
	return flight._js._fn.TextureFormats.getKtx2ParseFailureReason(bytes);
}
#else
extern inline function getKtx2ParseFailureReason(bytes:Dynamic, bytesLen:Int):Int {
#if hl
	return flight._hl._fn.TextureFormats.getKtx2ParseFailureReason(bytes, bytesLen);
#elseif cpp
	return flight._cpp._fn.TextureFormats.getKtx2ParseFailureReason(bytes, bytesLen);
#elseif (js && flight_esm)
	return flight._js._fn.TextureFormats.getKtx2ParseFailureReason(bytes, bytesLen);
#else
	#error "flight.TextureFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseKtx2(bytes:Dynamic):Null<TextureContainer> {
	return flight._js._fn.TextureFormats.parseKtx2(bytes);
}
#else
extern inline function parseKtx2(bytes:Dynamic, bytesLen:Int):TextureContainer {
#if hl
	return flight._hl._fn.TextureFormats.parseKtx2(bytes, bytesLen);
#elseif cpp
	return flight._cpp._fn.TextureFormats.parseKtx2(bytes, bytesLen);
#elseif (js && flight_esm)
	return flight._js._fn.TextureFormats.parseKtx2(bytes, bytesLen);
#else
	#error "flight.TextureFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeTextureContainerLevels(format:Dynamic, baseWidth:Int, baseHeight:Int, mipLevels:Int, layers:Int, faces:Int, startOffset:Int):Null<TextureContainerLevels> {
	return flight._js._fn.TextureFormats.computeTextureContainerLevels(format, baseWidth, baseHeight, mipLevels, layers, faces, startOffset);
}
#else
extern inline function computeTextureContainerLevels(format:flight.TextureContainerFormat, baseWidth:Int, baseHeight:Int, mipLevels:Int, layers:Int, faces:Int, startOffset:Int):TextureContainerLevels {
#if hl
	return flight._hl._fn.TextureFormats.computeTextureContainerLevels(format, baseWidth, baseHeight, mipLevels, layers, faces, startOffset);
#elseif cpp
	return flight._cpp._fn.TextureFormats.computeTextureContainerLevels(format, baseWidth, baseHeight, mipLevels, layers, faces, startOffset);
#elseif (js && flight_esm)
	return flight._js._fn.TextureFormats.computeTextureContainerLevels(format, baseWidth, baseHeight, mipLevels, layers, faces, startOffset);
#else
	#error "flight.TextureFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextureContainerLevelByteLength(format:Dynamic, width:Int, height:Int):Float {
	return flight._js._fn.TextureFormats.getTextureContainerLevelByteLength(format, width, height);
}
#else
extern inline function getTextureContainerLevelByteLength(format:flight.TextureContainerFormat, width:Int, height:Int):haxe.Int64 {
#if hl
	return flight._hl._fn.TextureFormats.getTextureContainerLevelByteLength(format, width, height);
#elseif cpp
	return flight._cpp._fn.TextureFormats.getTextureContainerLevelByteLength(format, width, height);
#elseif (js && flight_esm)
	return flight._js._fn.TextureFormats.getTextureContainerLevelByteLength(format, width, height);
#else
	#error "flight.TextureFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTextureContainerParseExplanation(ptr:TextureContainerParseExplanation):Void {
	flight._js._fn.TextureFormats.freeTextureContainerParseExplanation(ptr);
}
#else
extern inline function freeTextureContainerParseExplanation(ptr:TextureContainerParseExplanation):Void {
#if hl
	flight._hl._fn.TextureFormats.freeTextureContainerParseExplanation(ptr);
#elseif cpp
	flight._cpp._fn.TextureFormats.freeTextureContainerParseExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.TextureFormats.freeTextureContainerParseExplanation(ptr);
#else
	#error "flight.TextureFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTextureContainer(ptr:TextureContainer):Void {
	flight._js._fn.TextureFormats.freeTextureContainer(ptr);
}
#else
extern inline function freeTextureContainer(ptr:TextureContainer):Void {
#if hl
	flight._hl._fn.TextureFormats.freeTextureContainer(ptr);
#elseif cpp
	flight._cpp._fn.TextureFormats.freeTextureContainer(ptr);
#elseif (js && flight_esm)
	flight._js._fn.TextureFormats.freeTextureContainer(ptr);
#else
	#error "flight.TextureFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTextureContainerLevels(ptr:TextureContainerLevels):Void {
	flight._js._fn.TextureFormats.freeTextureContainerLevels(ptr);
}
#else
extern inline function freeTextureContainerLevels(ptr:TextureContainerLevels):Void {
#if hl
	flight._hl._fn.TextureFormats.freeTextureContainerLevels(ptr);
#elseif cpp
	flight._cpp._fn.TextureFormats.freeTextureContainerLevels(ptr);
#elseif (js && flight_esm)
	flight._js._fn.TextureFormats.freeTextureContainerLevels(ptr);
#else
	#error "flight.TextureFormats: no backend for this target."
#end
}
#end
