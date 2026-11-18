package flight._cpp._fn;

extern class Spritesheet {
	@:native("flight_create_spritesheet")
	public static function createSpritesheet():flight._cpp.Spritesheet;
	@:native("flight_clone_spritesheet")
	public static function cloneSpritesheet(spritesheet:flight._cpp.Spritesheet):flight._cpp.Spritesheet;
	@:native("flight_get_spritesheet_animation")
	public static function getSpritesheetAnimation(spritesheet:flight._cpp.Spritesheet, label:cpp.ConstCharStar):cpp.Star<cpp.Void>;
	@:native("flight_create_spritesheet_animation")
	public static function createSpritesheetAnimation():cpp.Star<cpp.Void>;
	@:native("flight_create_spritesheet_animation_from_frame_names")
	public static function createSpritesheetAnimationFromFrameNames(spritesheet:flight._cpp.Spritesheet, pattern:flight._cpp.SpritesheetFramePattern, options:flight._cpp.SpritesheetAnimationFrameNameOptions):cpp.Star<cpp.Void>;
	@:native("flight_create_spritesheet_animation_data")
	public static function createSpritesheetAnimationData():flight._cpp.SpritesheetAnimationData;
	@:native("flight_create_spritesheet_data")
	public static function createSpritesheetData():flight._cpp.SpritesheetData;
	@:native("flight_create_spritesheet_frame_data")
	public static function createSpritesheetFrameData():flight._cpp.SpritesheetFrameData;
	@:native("flight_create_spritesheet_frame")
	public static function createSpritesheetFrame():cpp.Star<cpp.Void>;
	@:native("flight_create_spritesheet_from_data")
	public static function createSpritesheetFromData(data:flight._cpp.SpritesheetData, atlas:cpp.Star<cpp.Void>):flight._cpp.Spritesheet;
	@:native("flight_create_spritesheet_from_grid")
	public static function createSpritesheetFromGrid(options:flight._cpp.GridSliceOptions):flight._cpp.Spritesheet;
	@:native("flight_create_spritesheet_player")
	public static function createSpritesheetPlayer():cpp.Star<cpp.Void>;
	@:native("flight_acquire_spritesheet_player")
	public static function acquireSpritesheetPlayer(pool:flight._cpp.SpritesheetPlayerPool):cpp.Star<cpp.Void>;
	@:native("flight_clone_spritesheet_player")
	public static function cloneSpritesheetPlayer(player:flight._cpp.SpritesheetPlayer):cpp.Star<cpp.Void>;
	@:native("flight_dispose_spritesheet_player")
	public static function disposeSpritesheetPlayer(player:flight._cpp.SpritesheetPlayer):Void;
	@:native("flight_get_spritesheet_player_frame")
	public static function getSpritesheetPlayerFrame(player:flight._cpp.SpritesheetPlayer, spritesheet:flight._cpp.Spritesheet):cpp.Star<cpp.Void>;
	@:native("flight_get_spritesheet_player_frame_at")
	public static function getSpritesheetPlayerFrameAt(player:flight._cpp.SpritesheetPlayer, spritesheet:flight._cpp.Spritesheet, frameOffset:Float):cpp.Star<cpp.Void>;
	@:native("flight_pause_spritesheet_player")
	public static function pauseSpritesheetPlayer(player:flight._cpp.SpritesheetPlayer):Void;
	@:native("flight_play_spritesheet_animation")
	public static function playSpritesheetAnimation(player:flight._cpp.SpritesheetPlayer, animation:cpp.Star<cpp.Void>, restart:Int):Void;
	@:native("flight_queue_spritesheet_animation")
	public static function queueSpritesheetAnimation(player:flight._cpp.SpritesheetPlayer, animation:cpp.Star<cpp.Void>):Void;
	@:native("flight_release_spritesheet_player")
	public static function releaseSpritesheetPlayer(pool:flight._cpp.SpritesheetPlayerPool, player:cpp.Star<cpp.Void>):Void;
	@:native("flight_resume_spritesheet_player")
	public static function resumeSpritesheetPlayer(player:flight._cpp.SpritesheetPlayer):Void;
	@:native("flight_seek_spritesheet_player_to_frame")
	public static function seekSpritesheetPlayerToFrame(player:flight._cpp.SpritesheetPlayer, frameIndex:Float):Void;
	@:native("flight_seek_spritesheet_player_to_time")
	public static function seekSpritesheetPlayerToTime(player:flight._cpp.SpritesheetPlayer, time:Float):Void;
	@:native("flight_stop_spritesheet_player")
	public static function stopSpritesheetPlayer(player:flight._cpp.SpritesheetPlayer):Void;
	@:native("flight_update_spritesheet_player")
	public static function updateSpritesheetPlayer(player:flight._cpp.SpritesheetPlayer, deltaTime:Float):Bool;
	@:native("flight_validate_spritesheet")
	public static function validateSpritesheet(out:cpp.Star<cpp.Void>, spritesheet:flight._cpp.Spritesheet):Bool;
	@:native("flight_validate_spritesheet_data")
	public static function validateSpritesheetData(out:cpp.Star<cpp.Void>, data:flight._cpp.SpritesheetData):Bool;
	@:native("flight_free_spritesheet")
	public static function freeSpritesheet(ptr:flight._cpp.Spritesheet):Void;
	@:native("flight_free_spritesheet_animation_data")
	public static function freeSpritesheetAnimationData(ptr:flight._cpp.SpritesheetAnimationData):Void;
	@:native("flight_free_spritesheet_data")
	public static function freeSpritesheetData(ptr:flight._cpp.SpritesheetData):Void;
	@:native("flight_free_spritesheet_frame_data")
	public static function freeSpritesheetFrameData(ptr:flight._cpp.SpritesheetFrameData):Void;
}
