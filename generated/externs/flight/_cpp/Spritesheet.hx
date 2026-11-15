package flight._cpp;

abstract Spritesheet(cpp.Star<cpp.Void>) {
	static inline public function create():flight._cpp.Spritesheet {
		return flight._cpp._fn.Spritesheet.createSpritesheet();
	}
	inline public function clone():flight._cpp.Spritesheet {
		return flight._cpp._fn.Spritesheet.cloneSpritesheet(cast this);
	}
	inline public function getAnimation(label:cpp.ConstCharStar):cpp.Star<cpp.Void> {
		return flight._cpp._fn.Spritesheet.getSpritesheetAnimation(cast this, label);
	}
	inline public function createAnimationFromFrameNames(pattern:flight._cpp.SpritesheetFramePattern, options:flight._cpp.SpritesheetAnimationFrameNameOptions):cpp.Star<cpp.Void> {
		return flight._cpp._fn.Spritesheet.createSpritesheetAnimationFromFrameNames(cast this, pattern, options);
	}
	static inline public function createFromData(data:flight._cpp.SpritesheetData, atlas:cpp.Star<cpp.Void>):flight._cpp.Spritesheet {
		return flight._cpp._fn.Spritesheet.createSpritesheetFromData(data, atlas);
	}
	static inline public function createFromGrid(options:flight._cpp.GridSliceOptions):flight._cpp.Spritesheet {
		return flight._cpp._fn.Spritesheet.createSpritesheetFromGrid(options);
	}
	inline public function getPlayerFrame(player:flight._cpp.SpritesheetPlayer):cpp.Star<cpp.Void> {
		return flight._cpp._fn.Spritesheet.getSpritesheetPlayerFrame(player, cast this);
	}
	inline public function getPlayerFrameAt(player:flight._cpp.SpritesheetPlayer, frameOffset:Float):cpp.Star<cpp.Void> {
		return flight._cpp._fn.Spritesheet.getSpritesheetPlayerFrameAt(player, cast this, frameOffset);
	}
	inline public function validate(out:cpp.Star<cpp.Void>):Bool {
		return flight._cpp._fn.Spritesheet.validateSpritesheet(out, cast this);
	}
	inline public function free():Void {
		flight._cpp._fn.Spritesheet.freeSpritesheet(cast this);
	}
}
