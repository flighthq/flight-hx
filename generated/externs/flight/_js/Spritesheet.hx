package flight._js;

abstract Spritesheet(Dynamic) {
	static inline public function create():flight._js.Spritesheet {
		return flight._js._fn.Spritesheet.createSpritesheet();
	}
	inline public function clone():flight._js.Spritesheet {
		return flight._js._fn.Spritesheet.cloneSpritesheet(cast this);
	}
	inline public function getAnimation(label:String):Dynamic {
		return flight._js._fn.Spritesheet.getSpritesheetAnimation(cast this, label);
	}
	inline public function createAnimationFromFrameNames(pattern:flight._js.SpritesheetFramePattern, options:flight._js.SpritesheetAnimationFrameNameOptions):Dynamic {
		return flight._js._fn.Spritesheet.createSpritesheetAnimationFromFrameNames(cast this, pattern, options);
	}
	static inline public function createFromData(data:flight._js.SpritesheetData, atlas:Dynamic):flight._js.Spritesheet {
		return flight._js._fn.Spritesheet.createSpritesheetFromData(data, atlas);
	}
	static inline public function createFromGrid(options:flight._js.GridSliceOptions):flight._js.Spritesheet {
		return flight._js._fn.Spritesheet.createSpritesheetFromGrid(options);
	}
	inline public function getPlayerFrame(player:flight._js.SpritesheetPlayer):Dynamic {
		return flight._js._fn.Spritesheet.getSpritesheetPlayerFrame(player, cast this);
	}
	inline public function getPlayerFrameAt(player:flight._js.SpritesheetPlayer, frameOffset:Float):Dynamic {
		return flight._js._fn.Spritesheet.getSpritesheetPlayerFrameAt(player, cast this, frameOffset);
	}
	inline public function validate(out:Dynamic):Bool {
		return flight._js._fn.Spritesheet.validateSpritesheet(out, cast this);
	}
	inline public function free():Void {
		flight._js._fn.Spritesheet.freeSpritesheet(cast this);
	}
}
