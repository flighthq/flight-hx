package flight._cpp;

abstract Spritesheet(cpp.Star<cpp.Void>) {
	static extern inline public function create():flight._cpp.Spritesheet {
		return flight._cpp._fn.Spritesheet.createSpritesheet();
	}
	extern inline public function clone():flight._cpp.Spritesheet {
		return flight._cpp._fn.Spritesheet.cloneSpritesheet(cast this);
	}
	extern inline public function getAnimation(label:cpp.ConstCharStar):cpp.Star<cpp.Void> {
		return flight._cpp._fn.Spritesheet.getSpritesheetAnimation(cast this, label);
	}
	extern inline public function createAnimationFromFrameNames(pattern:flight._cpp.SpritesheetFramePattern, options:flight._cpp.SpritesheetAnimationFrameNameOptions):cpp.Star<cpp.Void> {
		return flight._cpp._fn.Spritesheet.createSpritesheetAnimationFromFrameNames(cast this, pattern, options);
	}
	static extern inline public function createFromData(data:flight._cpp.SpritesheetData, atlas:cpp.Star<cpp.Void>):flight._cpp.Spritesheet {
		return flight._cpp._fn.Spritesheet.createSpritesheetFromData(data, atlas);
	}
	static extern inline public function createFromGrid(options:flight._cpp.GridSliceOptions):flight._cpp.Spritesheet {
		return flight._cpp._fn.Spritesheet.createSpritesheetFromGrid(options);
	}
	extern inline public function getPlayerFrame(player:flight._cpp.SpritesheetPlayer):cpp.Star<cpp.Void> {
		return flight._cpp._fn.Spritesheet.getSpritesheetPlayerFrame(player, cast this);
	}
	extern inline public function getPlayerFrameAt(player:flight._cpp.SpritesheetPlayer, frameOffset:Float):cpp.Star<cpp.Void> {
		return flight._cpp._fn.Spritesheet.getSpritesheetPlayerFrameAt(player, cast this, frameOffset);
	}
	extern inline public function validate(out:cpp.Star<cpp.Void>):Bool {
		return flight._cpp._fn.Spritesheet.validateSpritesheet(out, cast this);
	}
	extern inline public function free():Void {
		flight._cpp._fn.Spritesheet.freeSpritesheet(cast this);
	}
}
