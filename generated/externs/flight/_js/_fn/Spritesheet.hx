package flight._js._fn;

@:jsRequire("@flighthq/spritesheet")
extern class Spritesheet {
	@:native("createSpritesheet")
	public static function createSpritesheet():flight._js.Spritesheet;
	@:native("cloneSpritesheet")
	public static function cloneSpritesheet(spritesheet:flight._js.Spritesheet):flight._js.Spritesheet;
	@:native("getSpritesheetAnimation")
	public static function getSpritesheetAnimation(spritesheet:flight._js.Spritesheet, label:String):Null<Dynamic>;
	@:native("createSpritesheetAnimation")
	public static function createSpritesheetAnimation():Dynamic;
	@:native("createSpritesheetAnimationFromFrameNames")
	public static function createSpritesheetAnimationFromFrameNames(spritesheet:flight._js.Spritesheet, pattern:flight._js.SpritesheetFramePattern, options:Null<flight._js.SpritesheetAnimationFrameNameOptions>):Null<Dynamic>;
	@:native("createSpritesheetAnimationData")
	public static function createSpritesheetAnimationData():flight._js.SpritesheetAnimationData;
	@:native("createSpritesheetData")
	public static function createSpritesheetData():flight._js.SpritesheetData;
	@:native("createSpritesheetFrameData")
	public static function createSpritesheetFrameData():flight._js.SpritesheetFrameData;
	@:native("createSpritesheetFrame")
	public static function createSpritesheetFrame():Dynamic;
	@:native("createSpritesheetFromData")
	public static function createSpritesheetFromData(data:flight._js.SpritesheetData, atlas:Dynamic):flight._js.Spritesheet;
	@:native("createSpritesheetFromGrid")
	public static function createSpritesheetFromGrid(options:flight._js.GridSliceOptions):flight._js.Spritesheet;
	@:native("createSpritesheetPlayer")
	public static function createSpritesheetPlayer():Dynamic;
	@:native("acquireSpritesheetPlayer")
	public static function acquireSpritesheetPlayer(pool:flight._js.SpritesheetPlayerPool):Dynamic;
	@:native("cloneSpritesheetPlayer")
	public static function cloneSpritesheetPlayer(player:flight._js.SpritesheetPlayer):Dynamic;
	@:native("disposeSpritesheetPlayer")
	public static function disposeSpritesheetPlayer(player:flight._js.SpritesheetPlayer):Void;
	@:native("getSpritesheetPlayerFrame")
	public static function getSpritesheetPlayerFrame(player:flight._js.SpritesheetPlayer, spritesheet:flight._js.Spritesheet):Null<Dynamic>;
	@:native("getSpritesheetPlayerFrameAt")
	public static function getSpritesheetPlayerFrameAt(player:flight._js.SpritesheetPlayer, spritesheet:flight._js.Spritesheet, frameOffset:Float):Null<Dynamic>;
	@:native("pauseSpritesheetPlayer")
	public static function pauseSpritesheetPlayer(player:flight._js.SpritesheetPlayer):Void;
	@:native("playSpritesheetAnimation")
	public static function playSpritesheetAnimation(player:flight._js.SpritesheetPlayer, animation:Null<Dynamic>, restart:Null<Bool>):Void;
	@:native("queueSpritesheetAnimation")
	public static function queueSpritesheetAnimation(player:flight._js.SpritesheetPlayer, animation:Dynamic):Void;
	@:native("releaseSpritesheetPlayer")
	public static function releaseSpritesheetPlayer(pool:flight._js.SpritesheetPlayerPool, player:Dynamic):Void;
	@:native("resumeSpritesheetPlayer")
	public static function resumeSpritesheetPlayer(player:flight._js.SpritesheetPlayer):Void;
	@:native("seekSpritesheetPlayerToFrame")
	public static function seekSpritesheetPlayerToFrame(player:flight._js.SpritesheetPlayer, frameIndex:Float):Void;
	@:native("seekSpritesheetPlayerToTime")
	public static function seekSpritesheetPlayerToTime(player:flight._js.SpritesheetPlayer, time:Float):Void;
	@:native("stopSpritesheetPlayer")
	public static function stopSpritesheetPlayer(player:flight._js.SpritesheetPlayer):Void;
	@:native("updateSpritesheetPlayer")
	public static function updateSpritesheetPlayer(player:flight._js.SpritesheetPlayer, deltaTime:Float):Bool;
	@:native("validateSpritesheet")
	public static function validateSpritesheet(out:Dynamic, spritesheet:flight._js.Spritesheet):Bool;
	@:native("validateSpritesheetData")
	public static function validateSpritesheetData(out:Dynamic, data:flight._js.SpritesheetData):Bool;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSpritesheet(ptr:flight._js.Spritesheet):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSpritesheetAnimationRef(ptr:flight._js.SpritesheetAnimation):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSpritesheetAnimationData(ptr:flight._js.SpritesheetAnimationData):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSpritesheetData(ptr:flight._js.SpritesheetData):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSpritesheetFrameData(ptr:flight._js.SpritesheetFrameData):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSpritesheetFrameRef(ptr:flight._js.SpritesheetFrame):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSpritesheetPlayerRef(ptr:flight._js.SpritesheetPlayer):Void {}
}
