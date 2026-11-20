package flight.esm.spritesheet;

#if (js && flight_esm)
@:jsRequire("@flighthq/spritesheet/contract")
extern class Contract {
  public static function acquireSpritesheetPlayer():flight.esm.types.spritesheet.Types.SpritesheetPlayer;
  public static function cloneSpritesheet(spritesheet:flight.esm.types.spritesheet.Types.Spritesheet):flight.esm.types.spritesheet.Types.Spritesheet;
  public static function cloneSpritesheetPlayer(player:flight.esm.types.spritesheet.Types.SpritesheetPlayer):flight.esm.types.spritesheet.Types.SpritesheetPlayer;
  public static function createSpritesheet(?obj:Dynamic):flight.esm.types.spritesheet.Types.Spritesheet;
  public static function createSpritesheetAnimation(?obj:Dynamic):flight.esm.types.spritesheet.Types.SpritesheetAnimation;
  public static function createSpritesheetAnimationData(?obj:Dynamic):flight.esm.types.spritesheet.Types.SpritesheetAnimationData;
  public static function createSpritesheetAnimationFromFrameNames(spritesheet:flight.esm.types.spritesheet.Types.Spritesheet, pattern:Dynamic, ?options:Dynamic):Null<flight.esm.types.spritesheet.Types.SpritesheetAnimation>;
  public static function createSpritesheetData(?obj:Dynamic):flight.esm.types.spritesheet.Types.SpritesheetData;
  public static function createSpritesheetFrame(?obj:Dynamic):flight.esm.types.spritesheet.Types.SpritesheetFrame;
  public static function createSpritesheetFrameData(?obj:Dynamic):flight.esm.types.spritesheet.Types.SpritesheetFrameData;
  public static function createSpritesheetFromData(data:flight.esm.types.spritesheet.Types.SpritesheetData, atlas:flight.esm.types.textureatlas_contract.Types.TextureAtlas):flight.esm.types.spritesheet.Types.Spritesheet;
  public static function createSpritesheetFromGrid(options:flight.esm.types.textureatlas_contract.Types.GridSliceOptions):flight.esm.types.spritesheet.Types.Spritesheet;
  public static function createSpritesheetPlayer(?obj:Dynamic):flight.esm.types.spritesheet.Types.SpritesheetPlayer;
  public static function disposeSpritesheetPlayer(player:flight.esm.types.spritesheet.Types.SpritesheetPlayer):Void;
  public static function getSpritesheetAnimation(spritesheet:flight.esm.types.spritesheet.Types.Spritesheet, label:String):Null<flight.esm.types.spritesheet.Types.SpritesheetAnimation>;
  public static function getSpritesheetPlayerFrame(player:flight.esm.types.spritesheet.Types.SpritesheetPlayer, spritesheet:flight.esm.types.spritesheet.Types.Spritesheet):Null<flight.esm.types.spritesheet.Types.SpritesheetFrame>;
  public static function getSpritesheetPlayerFrameAt(player:flight.esm.types.spritesheet.Types.SpritesheetPlayer, spritesheet:flight.esm.types.spritesheet.Types.Spritesheet, frameOffset:Float):Null<flight.esm.types.spritesheet.Types.SpritesheetFrame>;
  public static function initializeSpritesheet(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.spritesheet.Types.Spritesheet>, ?obj:Dynamic):Void;
  public static function initializeSpritesheetAnimation(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.spritesheet.Types.SpritesheetAnimation>, ?obj:Dynamic):Void;
  public static function initializeSpritesheetAnimationData(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.spritesheet.Types.SpritesheetAnimationData>, ?obj:Dynamic):Void;
  public static function initializeSpritesheetData(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.spritesheet.Types.SpritesheetData>, ?obj:Dynamic):Void;
  public static function initializeSpritesheetFrame(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.spritesheet.Types.SpritesheetFrame>, ?obj:Dynamic):Void;
  public static function initializeSpritesheetFrameData(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.spritesheet.Types.SpritesheetFrameData>, ?obj:Dynamic):Void;
  public static function initializeSpritesheetPlayer(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.spritesheet.Types.SpritesheetPlayer>, ?obj:Dynamic):Void;
  public static function pauseSpritesheetPlayer(player:flight.esm.types.spritesheet.Types.SpritesheetPlayer):Void;
  public static function playSpritesheetAnimation(player:flight.esm.types.spritesheet.Types.SpritesheetPlayer, animation:Null<flight.esm.types.spritesheet.Types.SpritesheetAnimation>, ?restart:Bool):Void;
  public static function queueSpritesheetAnimation(player:flight.esm.types.spritesheet.Types.SpritesheetPlayer, animation:flight.esm.types.spritesheet.Types.SpritesheetAnimation):Void;
  public static function releaseSpritesheetPlayer(player:flight.esm.types.spritesheet.Types.SpritesheetPlayer):Void;
  public static function resumeSpritesheetPlayer(player:flight.esm.types.spritesheet.Types.SpritesheetPlayer):Void;
  public static function seekSpritesheetPlayerToFrame(player:flight.esm.types.spritesheet.Types.SpritesheetPlayer, frameIndex:Float):Void;
  public static function seekSpritesheetPlayerToTime(player:flight.esm.types.spritesheet.Types.SpritesheetPlayer, time:Float):Void;
  public static function stopSpritesheetPlayer(player:flight.esm.types.spritesheet.Types.SpritesheetPlayer):Void;
  public static function updateSpritesheetPlayer(player:flight.esm.types.spritesheet.Types.SpritesheetPlayer, deltaTime:Float):Bool;
  public static function validateSpritesheet(spritesheet:flight.esm.types.spritesheet.Types.Spritesheet):Null<Array<flight.esm.types.spritesheet.Types.SpritesheetValidationDiagnostic>>;
  public static function validateSpritesheetData(data:flight.esm.types.spritesheet.Types.SpritesheetData):Null<Array<flight.esm.types.spritesheet.Types.SpritesheetValidationDiagnostic>>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
