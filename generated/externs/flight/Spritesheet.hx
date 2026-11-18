package flight;

#if hl

typedef Spritesheet = flight._hl.Spritesheet;

#elseif cpp

typedef Spritesheet = flight._cpp.Spritesheet;

#elseif (js && flight_esm)

typedef Spritesheet = flight._js.Spritesheet;

#elseif js

#error "flight.Spritesheet on js requires flight_esm."

#else

#error "flight.Spritesheet: no backend for this target."

#end

#if (js && flight_esm)
extern inline function createSpritesheet():Spritesheet {
	return flight._js._fn.Spritesheet.createSpritesheet();
}
#else
extern inline function createSpritesheet():Spritesheet {
#if hl
	return flight._hl._fn.Spritesheet.createSpritesheet();
#elseif cpp
	return flight._cpp._fn.Spritesheet.createSpritesheet();
#elseif (js && flight_esm)
	return flight._js._fn.Spritesheet.createSpritesheet();
#else
	#error "flight.Spritesheet: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function cloneSpritesheet(spritesheet:Spritesheet):Spritesheet {
	return flight._js._fn.Spritesheet.cloneSpritesheet(spritesheet);
}
#else
extern inline function cloneSpritesheet(spritesheet:Spritesheet):Spritesheet {
#if hl
	return flight._hl._fn.Spritesheet.cloneSpritesheet(spritesheet);
#elseif cpp
	return flight._cpp._fn.Spritesheet.cloneSpritesheet(spritesheet);
#elseif (js && flight_esm)
	return flight._js._fn.Spritesheet.cloneSpritesheet(spritesheet);
#else
	#error "flight.Spritesheet: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getSpritesheetAnimation(spritesheet:Spritesheet, label:String):Null<Dynamic> {
	return flight._js._fn.Spritesheet.getSpritesheetAnimation(spritesheet, label);
}
#else
extern inline function getSpritesheetAnimation(spritesheet:Spritesheet, label:String):Dynamic {
#if hl
	return flight._hl._fn.Spritesheet.getSpritesheetAnimation(spritesheet, cast label);
#elseif cpp
	return flight._cpp._fn.Spritesheet.getSpritesheetAnimation(spritesheet, cast label);
#elseif (js && flight_esm)
	return flight._js._fn.Spritesheet.getSpritesheetAnimation(spritesheet, label);
#else
	#error "flight.Spritesheet: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSpritesheetAnimation():Dynamic {
	return flight._js._fn.Spritesheet.createSpritesheetAnimation();
}
#else
extern inline function createSpritesheetAnimation():Dynamic {
#if hl
	return flight._hl._fn.Spritesheet.createSpritesheetAnimation();
#elseif cpp
	return flight._cpp._fn.Spritesheet.createSpritesheetAnimation();
#elseif (js && flight_esm)
	return flight._js._fn.Spritesheet.createSpritesheetAnimation();
#else
	#error "flight.Spritesheet: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSpritesheetAnimationFromFrameNames(spritesheet:Spritesheet, pattern:SpritesheetFramePattern, options:Null<SpritesheetAnimationFrameNameOptions>):Null<Dynamic> {
	return flight._js._fn.Spritesheet.createSpritesheetAnimationFromFrameNames(spritesheet, pattern, options);
}
#else
extern inline function createSpritesheetAnimationFromFrameNames(spritesheet:Spritesheet, pattern:SpritesheetFramePattern, options:SpritesheetAnimationFrameNameOptions):Dynamic {
#if hl
	return flight._hl._fn.Spritesheet.createSpritesheetAnimationFromFrameNames(spritesheet, pattern, options);
#elseif cpp
	return flight._cpp._fn.Spritesheet.createSpritesheetAnimationFromFrameNames(spritesheet, pattern, options);
#elseif (js && flight_esm)
	return flight._js._fn.Spritesheet.createSpritesheetAnimationFromFrameNames(spritesheet, pattern, options);
#else
	#error "flight.Spritesheet: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSpritesheetAnimationData():SpritesheetAnimationData {
	return flight._js._fn.Spritesheet.createSpritesheetAnimationData();
}
#else
extern inline function createSpritesheetAnimationData():SpritesheetAnimationData {
#if hl
	return flight._hl._fn.Spritesheet.createSpritesheetAnimationData();
#elseif cpp
	return flight._cpp._fn.Spritesheet.createSpritesheetAnimationData();
#elseif (js && flight_esm)
	return flight._js._fn.Spritesheet.createSpritesheetAnimationData();
#else
	#error "flight.Spritesheet: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSpritesheetData():SpritesheetData {
	return flight._js._fn.Spritesheet.createSpritesheetData();
}
#else
extern inline function createSpritesheetData():SpritesheetData {
#if hl
	return flight._hl._fn.Spritesheet.createSpritesheetData();
#elseif cpp
	return flight._cpp._fn.Spritesheet.createSpritesheetData();
#elseif (js && flight_esm)
	return flight._js._fn.Spritesheet.createSpritesheetData();
#else
	#error "flight.Spritesheet: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSpritesheetFrameData():SpritesheetFrameData {
	return flight._js._fn.Spritesheet.createSpritesheetFrameData();
}
#else
extern inline function createSpritesheetFrameData():SpritesheetFrameData {
#if hl
	return flight._hl._fn.Spritesheet.createSpritesheetFrameData();
#elseif cpp
	return flight._cpp._fn.Spritesheet.createSpritesheetFrameData();
#elseif (js && flight_esm)
	return flight._js._fn.Spritesheet.createSpritesheetFrameData();
#else
	#error "flight.Spritesheet: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSpritesheetFrame():Dynamic {
	return flight._js._fn.Spritesheet.createSpritesheetFrame();
}
#else
extern inline function createSpritesheetFrame():Dynamic {
#if hl
	return flight._hl._fn.Spritesheet.createSpritesheetFrame();
#elseif cpp
	return flight._cpp._fn.Spritesheet.createSpritesheetFrame();
#elseif (js && flight_esm)
	return flight._js._fn.Spritesheet.createSpritesheetFrame();
#else
	#error "flight.Spritesheet: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSpritesheetFromData(data:SpritesheetData, atlas:Dynamic):Spritesheet {
	return flight._js._fn.Spritesheet.createSpritesheetFromData(data, atlas);
}
#else
extern inline function createSpritesheetFromData(data:SpritesheetData, atlas:Dynamic):Spritesheet {
#if hl
	return flight._hl._fn.Spritesheet.createSpritesheetFromData(data, atlas);
#elseif cpp
	return flight._cpp._fn.Spritesheet.createSpritesheetFromData(data, atlas);
#elseif (js && flight_esm)
	return flight._js._fn.Spritesheet.createSpritesheetFromData(data, atlas);
#else
	#error "flight.Spritesheet: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSpritesheetFromGrid(options:GridSliceOptions):Spritesheet {
	return flight._js._fn.Spritesheet.createSpritesheetFromGrid(options);
}
#else
extern inline function createSpritesheetFromGrid(options:GridSliceOptions):Spritesheet {
#if hl
	return flight._hl._fn.Spritesheet.createSpritesheetFromGrid(options);
#elseif cpp
	return flight._cpp._fn.Spritesheet.createSpritesheetFromGrid(options);
#elseif (js && flight_esm)
	return flight._js._fn.Spritesheet.createSpritesheetFromGrid(options);
#else
	#error "flight.Spritesheet: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSpritesheetPlayer():Dynamic {
	return flight._js._fn.Spritesheet.createSpritesheetPlayer();
}
#else
extern inline function createSpritesheetPlayer():Dynamic {
#if hl
	return flight._hl._fn.Spritesheet.createSpritesheetPlayer();
#elseif cpp
	return flight._cpp._fn.Spritesheet.createSpritesheetPlayer();
#elseif (js && flight_esm)
	return flight._js._fn.Spritesheet.createSpritesheetPlayer();
#else
	#error "flight.Spritesheet: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function acquireSpritesheetPlayer(pool:SpritesheetPlayerPool):Dynamic {
	return flight._js._fn.Spritesheet.acquireSpritesheetPlayer(pool);
}
#else
extern inline function acquireSpritesheetPlayer(pool:SpritesheetPlayerPool):Dynamic {
#if hl
	return flight._hl._fn.Spritesheet.acquireSpritesheetPlayer(pool);
#elseif cpp
	return flight._cpp._fn.Spritesheet.acquireSpritesheetPlayer(pool);
#elseif (js && flight_esm)
	return flight._js._fn.Spritesheet.acquireSpritesheetPlayer(pool);
#else
	#error "flight.Spritesheet: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function cloneSpritesheetPlayer(player:SpritesheetPlayer):Dynamic {
	return flight._js._fn.Spritesheet.cloneSpritesheetPlayer(player);
}
#else
extern inline function cloneSpritesheetPlayer(player:SpritesheetPlayer):Dynamic {
#if hl
	return flight._hl._fn.Spritesheet.cloneSpritesheetPlayer(player);
#elseif cpp
	return flight._cpp._fn.Spritesheet.cloneSpritesheetPlayer(player);
#elseif (js && flight_esm)
	return flight._js._fn.Spritesheet.cloneSpritesheetPlayer(player);
#else
	#error "flight.Spritesheet: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disposeSpritesheetPlayer(player:SpritesheetPlayer):Void {
	flight._js._fn.Spritesheet.disposeSpritesheetPlayer(player);
}
#else
extern inline function disposeSpritesheetPlayer(player:SpritesheetPlayer):Void {
#if hl
	flight._hl._fn.Spritesheet.disposeSpritesheetPlayer(player);
#elseif cpp
	flight._cpp._fn.Spritesheet.disposeSpritesheetPlayer(player);
#elseif (js && flight_esm)
	flight._js._fn.Spritesheet.disposeSpritesheetPlayer(player);
#else
	#error "flight.Spritesheet: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getSpritesheetPlayerFrame(player:SpritesheetPlayer, spritesheet:Spritesheet):Null<Dynamic> {
	return flight._js._fn.Spritesheet.getSpritesheetPlayerFrame(player, spritesheet);
}
#else
extern inline function getSpritesheetPlayerFrame(player:SpritesheetPlayer, spritesheet:Spritesheet):Dynamic {
#if hl
	return flight._hl._fn.Spritesheet.getSpritesheetPlayerFrame(player, spritesheet);
#elseif cpp
	return flight._cpp._fn.Spritesheet.getSpritesheetPlayerFrame(player, spritesheet);
#elseif (js && flight_esm)
	return flight._js._fn.Spritesheet.getSpritesheetPlayerFrame(player, spritesheet);
#else
	#error "flight.Spritesheet: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getSpritesheetPlayerFrameAt(player:SpritesheetPlayer, spritesheet:Spritesheet, frameOffset:Float):Null<Dynamic> {
	return flight._js._fn.Spritesheet.getSpritesheetPlayerFrameAt(player, spritesheet, frameOffset);
}
#else
extern inline function getSpritesheetPlayerFrameAt(player:SpritesheetPlayer, spritesheet:Spritesheet, frameOffset:Float):Dynamic {
#if hl
	return flight._hl._fn.Spritesheet.getSpritesheetPlayerFrameAt(player, spritesheet, frameOffset);
#elseif cpp
	return flight._cpp._fn.Spritesheet.getSpritesheetPlayerFrameAt(player, spritesheet, frameOffset);
#elseif (js && flight_esm)
	return flight._js._fn.Spritesheet.getSpritesheetPlayerFrameAt(player, spritesheet, frameOffset);
#else
	#error "flight.Spritesheet: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function pauseSpritesheetPlayer(player:SpritesheetPlayer):Void {
	flight._js._fn.Spritesheet.pauseSpritesheetPlayer(player);
}
#else
extern inline function pauseSpritesheetPlayer(player:SpritesheetPlayer):Void {
#if hl
	flight._hl._fn.Spritesheet.pauseSpritesheetPlayer(player);
#elseif cpp
	flight._cpp._fn.Spritesheet.pauseSpritesheetPlayer(player);
#elseif (js && flight_esm)
	flight._js._fn.Spritesheet.pauseSpritesheetPlayer(player);
#else
	#error "flight.Spritesheet: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function playSpritesheetAnimation(player:SpritesheetPlayer, animation:Null<Dynamic>, restart:Null<Bool>):Void {
	flight._js._fn.Spritesheet.playSpritesheetAnimation(player, animation, restart);
}
#else
extern inline function playSpritesheetAnimation(player:SpritesheetPlayer, animation:Dynamic, restart:Int):Void {
#if hl
	flight._hl._fn.Spritesheet.playSpritesheetAnimation(player, animation, restart);
#elseif cpp
	flight._cpp._fn.Spritesheet.playSpritesheetAnimation(player, animation, restart);
#elseif (js && flight_esm)
	flight._js._fn.Spritesheet.playSpritesheetAnimation(player, animation, restart);
#else
	#error "flight.Spritesheet: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function queueSpritesheetAnimation(player:SpritesheetPlayer, animation:Dynamic):Void {
	flight._js._fn.Spritesheet.queueSpritesheetAnimation(player, animation);
}
#else
extern inline function queueSpritesheetAnimation(player:SpritesheetPlayer, animation:Dynamic):Void {
#if hl
	flight._hl._fn.Spritesheet.queueSpritesheetAnimation(player, animation);
#elseif cpp
	flight._cpp._fn.Spritesheet.queueSpritesheetAnimation(player, animation);
#elseif (js && flight_esm)
	flight._js._fn.Spritesheet.queueSpritesheetAnimation(player, animation);
#else
	#error "flight.Spritesheet: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function releaseSpritesheetPlayer(pool:SpritesheetPlayerPool, player:Dynamic):Void {
	flight._js._fn.Spritesheet.releaseSpritesheetPlayer(pool, player);
}
#else
extern inline function releaseSpritesheetPlayer(pool:SpritesheetPlayerPool, player:Dynamic):Void {
#if hl
	flight._hl._fn.Spritesheet.releaseSpritesheetPlayer(pool, player);
#elseif cpp
	flight._cpp._fn.Spritesheet.releaseSpritesheetPlayer(pool, player);
#elseif (js && flight_esm)
	flight._js._fn.Spritesheet.releaseSpritesheetPlayer(pool, player);
#else
	#error "flight.Spritesheet: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function resumeSpritesheetPlayer(player:SpritesheetPlayer):Void {
	flight._js._fn.Spritesheet.resumeSpritesheetPlayer(player);
}
#else
extern inline function resumeSpritesheetPlayer(player:SpritesheetPlayer):Void {
#if hl
	flight._hl._fn.Spritesheet.resumeSpritesheetPlayer(player);
#elseif cpp
	flight._cpp._fn.Spritesheet.resumeSpritesheetPlayer(player);
#elseif (js && flight_esm)
	flight._js._fn.Spritesheet.resumeSpritesheetPlayer(player);
#else
	#error "flight.Spritesheet: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function seekSpritesheetPlayerToFrame(player:SpritesheetPlayer, frameIndex:Float):Void {
	flight._js._fn.Spritesheet.seekSpritesheetPlayerToFrame(player, frameIndex);
}
#else
extern inline function seekSpritesheetPlayerToFrame(player:SpritesheetPlayer, frameIndex:Float):Void {
#if hl
	flight._hl._fn.Spritesheet.seekSpritesheetPlayerToFrame(player, frameIndex);
#elseif cpp
	flight._cpp._fn.Spritesheet.seekSpritesheetPlayerToFrame(player, frameIndex);
#elseif (js && flight_esm)
	flight._js._fn.Spritesheet.seekSpritesheetPlayerToFrame(player, frameIndex);
#else
	#error "flight.Spritesheet: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function seekSpritesheetPlayerToTime(player:SpritesheetPlayer, time:Float):Void {
	flight._js._fn.Spritesheet.seekSpritesheetPlayerToTime(player, time);
}
#else
extern inline function seekSpritesheetPlayerToTime(player:SpritesheetPlayer, time:Float):Void {
#if hl
	flight._hl._fn.Spritesheet.seekSpritesheetPlayerToTime(player, time);
#elseif cpp
	flight._cpp._fn.Spritesheet.seekSpritesheetPlayerToTime(player, time);
#elseif (js && flight_esm)
	flight._js._fn.Spritesheet.seekSpritesheetPlayerToTime(player, time);
#else
	#error "flight.Spritesheet: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function stopSpritesheetPlayer(player:SpritesheetPlayer):Void {
	flight._js._fn.Spritesheet.stopSpritesheetPlayer(player);
}
#else
extern inline function stopSpritesheetPlayer(player:SpritesheetPlayer):Void {
#if hl
	flight._hl._fn.Spritesheet.stopSpritesheetPlayer(player);
#elseif cpp
	flight._cpp._fn.Spritesheet.stopSpritesheetPlayer(player);
#elseif (js && flight_esm)
	flight._js._fn.Spritesheet.stopSpritesheetPlayer(player);
#else
	#error "flight.Spritesheet: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function updateSpritesheetPlayer(player:SpritesheetPlayer, deltaTime:Float):Bool {
	return flight._js._fn.Spritesheet.updateSpritesheetPlayer(player, deltaTime);
}
#else
extern inline function updateSpritesheetPlayer(player:SpritesheetPlayer, deltaTime:Float):Bool {
#if hl
	return flight._hl._fn.Spritesheet.updateSpritesheetPlayer(player, deltaTime);
#elseif cpp
	return flight._cpp._fn.Spritesheet.updateSpritesheetPlayer(player, deltaTime);
#elseif (js && flight_esm)
	return flight._js._fn.Spritesheet.updateSpritesheetPlayer(player, deltaTime);
#else
	#error "flight.Spritesheet: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function validateSpritesheet(out:Dynamic, spritesheet:Spritesheet):Bool {
	return flight._js._fn.Spritesheet.validateSpritesheet(out, spritesheet);
}
#else
extern inline function validateSpritesheet(out:Dynamic, spritesheet:Spritesheet):Bool {
#if hl
	return flight._hl._fn.Spritesheet.validateSpritesheet(out, spritesheet);
#elseif cpp
	return flight._cpp._fn.Spritesheet.validateSpritesheet(out, spritesheet);
#elseif (js && flight_esm)
	return flight._js._fn.Spritesheet.validateSpritesheet(out, spritesheet);
#else
	#error "flight.Spritesheet: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function validateSpritesheetData(out:Dynamic, data:SpritesheetData):Bool {
	return flight._js._fn.Spritesheet.validateSpritesheetData(out, data);
}
#else
extern inline function validateSpritesheetData(out:Dynamic, data:SpritesheetData):Bool {
#if hl
	return flight._hl._fn.Spritesheet.validateSpritesheetData(out, data);
#elseif cpp
	return flight._cpp._fn.Spritesheet.validateSpritesheetData(out, data);
#elseif (js && flight_esm)
	return flight._js._fn.Spritesheet.validateSpritesheetData(out, data);
#else
	#error "flight.Spritesheet: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSpritesheet(ptr:Spritesheet):Void {
	flight._js._fn.Spritesheet.freeSpritesheet(ptr);
}
#else
extern inline function freeSpritesheet(ptr:Spritesheet):Void {
#if hl
	flight._hl._fn.Spritesheet.freeSpritesheet(ptr);
#elseif cpp
	flight._cpp._fn.Spritesheet.freeSpritesheet(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Spritesheet.freeSpritesheet(ptr);
#else
	#error "flight.Spritesheet: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSpritesheetAnimationData(ptr:SpritesheetAnimationData):Void {
	flight._js._fn.Spritesheet.freeSpritesheetAnimationData(ptr);
}
#else
extern inline function freeSpritesheetAnimationData(ptr:SpritesheetAnimationData):Void {
#if hl
	flight._hl._fn.Spritesheet.freeSpritesheetAnimationData(ptr);
#elseif cpp
	flight._cpp._fn.Spritesheet.freeSpritesheetAnimationData(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Spritesheet.freeSpritesheetAnimationData(ptr);
#else
	#error "flight.Spritesheet: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSpritesheetData(ptr:SpritesheetData):Void {
	flight._js._fn.Spritesheet.freeSpritesheetData(ptr);
}
#else
extern inline function freeSpritesheetData(ptr:SpritesheetData):Void {
#if hl
	flight._hl._fn.Spritesheet.freeSpritesheetData(ptr);
#elseif cpp
	flight._cpp._fn.Spritesheet.freeSpritesheetData(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Spritesheet.freeSpritesheetData(ptr);
#else
	#error "flight.Spritesheet: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSpritesheetFrameData(ptr:SpritesheetFrameData):Void {
	flight._js._fn.Spritesheet.freeSpritesheetFrameData(ptr);
}
#else
extern inline function freeSpritesheetFrameData(ptr:SpritesheetFrameData):Void {
#if hl
	flight._hl._fn.Spritesheet.freeSpritesheetFrameData(ptr);
#elseif cpp
	flight._cpp._fn.Spritesheet.freeSpritesheetFrameData(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Spritesheet.freeSpritesheetFrameData(ptr);
#else
	#error "flight.Spritesheet: no backend for this target."
#end
}
#end
