package flight._js._fn;

@:jsRequire("flight")
extern class Spritesheet {
	@:native("flight_create_spritesheet")
	public static function createSpritesheet():flight._js.Spritesheet;
	@:native("flight_clone_spritesheet")
	public static function cloneSpritesheet(spritesheet:flight._js.Spritesheet):flight._js.Spritesheet;
	@:native("flight_get_spritesheet_animation")
	public static function getSpritesheetAnimation(spritesheet:flight._js.Spritesheet, label:String):Dynamic;
	@:native("flight_create_spritesheet_animation")
	public static function createSpritesheetAnimation():Dynamic;
	@:native("flight_create_spritesheet_animation_from_frame_names")
	public static function createSpritesheetAnimationFromFrameNames(spritesheet:flight._js.Spritesheet, pattern:flight._js.SpritesheetFramePattern, options:flight._js.SpritesheetAnimationFrameNameOptions):Dynamic;
	@:native("flight_get_spritesheet_animation_direction_string")
	public static function getSpritesheetAnimationDirectionString(value:Int):String;
	@:native("flight_parse_spritesheet_animation_direction")
	public static function parseSpritesheetAnimationDirection(value:String):Int;
	@:native("flight_create_spritesheet_animation_data")
	public static function createSpritesheetAnimationData():flight._js.SpritesheetAnimationData;
	@:native("flight_create_spritesheet_data")
	public static function createSpritesheetData():flight._js.SpritesheetData;
	@:native("flight_create_spritesheet_frame_data")
	public static function createSpritesheetFrameData():flight._js.SpritesheetFrameData;
	@:native("flight_create_spritesheet_frame")
	public static function createSpritesheetFrame():Dynamic;
	@:native("flight_create_spritesheet_from_data")
	public static function createSpritesheetFromData(data:flight._js.SpritesheetData, atlas:Dynamic):flight._js.Spritesheet;
	@:native("flight_create_spritesheet_from_grid")
	public static function createSpritesheetFromGrid(options:flight._js.GridSliceOptions):flight._js.Spritesheet;
	@:native("flight_create_spritesheet_player")
	public static function createSpritesheetPlayer():Dynamic;
	@:native("flight_acquire_spritesheet_player")
	public static function acquireSpritesheetPlayer(pool:flight._js.SpritesheetPlayerPool):Dynamic;
	@:native("flight_clone_spritesheet_player")
	public static function cloneSpritesheetPlayer(player:flight._js.SpritesheetPlayer):Dynamic;
	@:native("flight_dispose_spritesheet_player")
	public static function disposeSpritesheetPlayer(player:flight._js.SpritesheetPlayer):Void;
	@:native("flight_get_spritesheet_player_frame")
	public static function getSpritesheetPlayerFrame(player:flight._js.SpritesheetPlayer, spritesheet:flight._js.Spritesheet):Dynamic;
	@:native("flight_get_spritesheet_player_frame_at")
	public static function getSpritesheetPlayerFrameAt(player:flight._js.SpritesheetPlayer, spritesheet:flight._js.Spritesheet, frameOffset:Float):Dynamic;
	@:native("flight_pause_spritesheet_player")
	public static function pauseSpritesheetPlayer(player:flight._js.SpritesheetPlayer):Void;
	@:native("flight_play_spritesheet_animation")
	public static function playSpritesheetAnimation(player:flight._js.SpritesheetPlayer, animation:Dynamic, restart:Int):Void;
	@:native("flight_queue_spritesheet_animation")
	public static function queueSpritesheetAnimation(player:flight._js.SpritesheetPlayer, animation:Dynamic):Void;
	@:native("flight_release_spritesheet_player")
	public static function releaseSpritesheetPlayer(pool:flight._js.SpritesheetPlayerPool, player:Dynamic):Void;
	@:native("flight_resume_spritesheet_player")
	public static function resumeSpritesheetPlayer(player:flight._js.SpritesheetPlayer):Void;
	@:native("flight_seek_spritesheet_player_to_frame")
	public static function seekSpritesheetPlayerToFrame(player:flight._js.SpritesheetPlayer, frameIndex:Float):Void;
	@:native("flight_seek_spritesheet_player_to_time")
	public static function seekSpritesheetPlayerToTime(player:flight._js.SpritesheetPlayer, time:Float):Void;
	@:native("flight_stop_spritesheet_player")
	public static function stopSpritesheetPlayer(player:flight._js.SpritesheetPlayer):Void;
	@:native("flight_update_spritesheet_player")
	public static function updateSpritesheetPlayer(player:flight._js.SpritesheetPlayer, deltaTime:Float):Bool;
	@:native("flight_get_spritesheet_validation_severity_string")
	public static function getSpritesheetValidationSeverityString(value:Int):String;
	@:native("flight_parse_spritesheet_parse_diagnostic_severity")
	public static function parseSpritesheetParseDiagnosticSeverity(value:String):Int;
	@:native("flight_parse_spritesheet_validation_severity")
	public static function parseSpritesheetValidationSeverity(value:String):Int;
	@:native("flight_validate_spritesheet")
	public static function validateSpritesheet(out:Dynamic, spritesheet:flight._js.Spritesheet):Bool;
	@:native("flight_validate_spritesheet_data")
	public static function validateSpritesheetData(out:Dynamic, data:flight._js.SpritesheetData):Bool;
	@:native("flight_free_spritesheet")
	public static function freeSpritesheet(ptr:flight._js.Spritesheet):Void;
	@:native("flight_free_spritesheet_animation_data")
	public static function freeSpritesheetAnimationData(ptr:flight._js.SpritesheetAnimationData):Void;
	@:native("flight_free_spritesheet_data")
	public static function freeSpritesheetData(ptr:flight._js.SpritesheetData):Void;
	@:native("flight_free_spritesheet_frame_data")
	public static function freeSpritesheetFrameData(ptr:flight._js.SpritesheetFrameData):Void;
}
