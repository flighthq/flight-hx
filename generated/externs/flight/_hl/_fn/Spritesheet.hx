package flight._hl._fn;

extern class Spritesheet {
	@:hlNative("flight", "flight_create_spritesheet")
	public static function createSpritesheet():flight._hl.Spritesheet;
	@:hlNative("flight", "flight_clone_spritesheet")
	public static function cloneSpritesheet(spritesheet:flight._hl.Spritesheet):flight._hl.Spritesheet;
	@:hlNative("flight", "flight_get_spritesheet_animation")
	public static function getSpritesheetAnimation(spritesheet:flight._hl.Spritesheet, label:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_create_spritesheet_animation")
	public static function createSpritesheetAnimation():hl.Bytes;
	@:hlNative("flight", "flight_create_spritesheet_animation_from_frame_names")
	public static function createSpritesheetAnimationFromFrameNames(spritesheet:flight._hl.Spritesheet, pattern:flight._hl.SpritesheetFramePattern, options:flight._hl.SpritesheetAnimationFrameNameOptions):hl.Bytes;
	@:hlNative("flight", "flight_create_spritesheet_animation_data")
	public static function createSpritesheetAnimationData():flight._hl.SpritesheetAnimationData;
	@:hlNative("flight", "flight_create_spritesheet_data")
	public static function createSpritesheetData():flight._hl.SpritesheetData;
	@:hlNative("flight", "flight_create_spritesheet_frame_data")
	public static function createSpritesheetFrameData():flight._hl.SpritesheetFrameData;
	@:hlNative("flight", "flight_create_spritesheet_frame")
	public static function createSpritesheetFrame():hl.Bytes;
	@:hlNative("flight", "flight_create_spritesheet_from_data")
	public static function createSpritesheetFromData(data:flight._hl.SpritesheetData, atlas:hl.Bytes):flight._hl.Spritesheet;
	@:hlNative("flight", "flight_create_spritesheet_from_grid")
	public static function createSpritesheetFromGrid(options:flight._hl.GridSliceOptions):flight._hl.Spritesheet;
	@:hlNative("flight", "flight_create_spritesheet_player")
	public static function createSpritesheetPlayer():hl.Bytes;
	@:hlNative("flight", "flight_acquire_spritesheet_player")
	public static function acquireSpritesheetPlayer(pool:flight._hl.SpritesheetPlayerPool):hl.Bytes;
	@:hlNative("flight", "flight_clone_spritesheet_player")
	public static function cloneSpritesheetPlayer(player:flight._hl.SpritesheetPlayer):hl.Bytes;
	@:hlNative("flight", "flight_dispose_spritesheet_player")
	public static function disposeSpritesheetPlayer(player:flight._hl.SpritesheetPlayer):Void;
	@:hlNative("flight", "flight_get_spritesheet_player_frame")
	public static function getSpritesheetPlayerFrame(player:flight._hl.SpritesheetPlayer, spritesheet:flight._hl.Spritesheet):hl.Bytes;
	@:hlNative("flight", "flight_get_spritesheet_player_frame_at")
	public static function getSpritesheetPlayerFrameAt(player:flight._hl.SpritesheetPlayer, spritesheet:flight._hl.Spritesheet, frameOffset:Float):hl.Bytes;
	@:hlNative("flight", "flight_pause_spritesheet_player")
	public static function pauseSpritesheetPlayer(player:flight._hl.SpritesheetPlayer):Void;
	@:hlNative("flight", "flight_play_spritesheet_animation")
	public static function playSpritesheetAnimation(player:flight._hl.SpritesheetPlayer, animation:hl.Bytes, restart:Int):Void;
	@:hlNative("flight", "flight_queue_spritesheet_animation")
	public static function queueSpritesheetAnimation(player:flight._hl.SpritesheetPlayer, animation:hl.Bytes):Void;
	@:hlNative("flight", "flight_release_spritesheet_player")
	public static function releaseSpritesheetPlayer(pool:flight._hl.SpritesheetPlayerPool, player:hl.Bytes):Void;
	@:hlNative("flight", "flight_resume_spritesheet_player")
	public static function resumeSpritesheetPlayer(player:flight._hl.SpritesheetPlayer):Void;
	@:hlNative("flight", "flight_seek_spritesheet_player_to_frame")
	public static function seekSpritesheetPlayerToFrame(player:flight._hl.SpritesheetPlayer, frameIndex:Float):Void;
	@:hlNative("flight", "flight_seek_spritesheet_player_to_time")
	public static function seekSpritesheetPlayerToTime(player:flight._hl.SpritesheetPlayer, time:Float):Void;
	@:hlNative("flight", "flight_stop_spritesheet_player")
	public static function stopSpritesheetPlayer(player:flight._hl.SpritesheetPlayer):Void;
	@:hlNative("flight", "flight_update_spritesheet_player")
	public static function updateSpritesheetPlayer(player:flight._hl.SpritesheetPlayer, deltaTime:Float):Bool;
	@:hlNative("flight", "flight_validate_spritesheet")
	public static function validateSpritesheet(out:hl.Bytes, spritesheet:flight._hl.Spritesheet):Bool;
	@:hlNative("flight", "flight_validate_spritesheet_data")
	public static function validateSpritesheetData(out:hl.Bytes, data:flight._hl.SpritesheetData):Bool;
	@:hlNative("flight", "flight_free_spritesheet")
	public static function freeSpritesheet(ptr:flight._hl.Spritesheet):Void;
	@:hlNative("flight", "flight_free_spritesheet_animation_ref")
	public static function freeSpritesheetAnimationRef(ptr:flight._hl.SpritesheetAnimation):Void;
	@:hlNative("flight", "flight_free_spritesheet_animation_data")
	public static function freeSpritesheetAnimationData(ptr:flight._hl.SpritesheetAnimationData):Void;
	@:hlNative("flight", "flight_free_spritesheet_data")
	public static function freeSpritesheetData(ptr:flight._hl.SpritesheetData):Void;
	@:hlNative("flight", "flight_free_spritesheet_frame_data")
	public static function freeSpritesheetFrameData(ptr:flight._hl.SpritesheetFrameData):Void;
	@:hlNative("flight", "flight_free_spritesheet_frame_ref")
	public static function freeSpritesheetFrameRef(ptr:flight._hl.SpritesheetFrame):Void;
	@:hlNative("flight", "flight_free_spritesheet_player_ref")
	public static function freeSpritesheetPlayerRef(ptr:flight._hl.SpritesheetPlayer):Void;
}
