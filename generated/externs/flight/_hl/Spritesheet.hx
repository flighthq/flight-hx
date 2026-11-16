package flight._hl;

abstract Spritesheet(hl.Bytes) {
	static inline public function create():flight._hl.Spritesheet {
		return flight._hl._fn.Spritesheet.createSpritesheet();
	}
	inline public function clone():flight._hl.Spritesheet {
		return flight._hl._fn.Spritesheet.cloneSpritesheet(cast this);
	}
	inline public function getAnimation(label:hl.Bytes):hl.Bytes {
		return flight._hl._fn.Spritesheet.getSpritesheetAnimation(cast this, label);
	}
	inline public function createAnimationFromFrameNames(pattern:flight._hl.SpritesheetFramePattern, options:flight._hl.SpritesheetAnimationFrameNameOptions):hl.Bytes {
		return flight._hl._fn.Spritesheet.createSpritesheetAnimationFromFrameNames(cast this, pattern, options);
	}
	static inline public function createFromData(data:flight._hl.SpritesheetData, atlas:hl.Bytes):flight._hl.Spritesheet {
		return flight._hl._fn.Spritesheet.createSpritesheetFromData(data, atlas);
	}
	static inline public function createFromGrid(options:flight._hl.GridSliceOptions):flight._hl.Spritesheet {
		return flight._hl._fn.Spritesheet.createSpritesheetFromGrid(options);
	}
	inline public function getPlayerFrame(player:flight._hl.SpritesheetPlayer):hl.Bytes {
		return flight._hl._fn.Spritesheet.getSpritesheetPlayerFrame(player, cast this);
	}
	inline public function getPlayerFrameAt(player:flight._hl.SpritesheetPlayer, frameOffset:Float):hl.Bytes {
		return flight._hl._fn.Spritesheet.getSpritesheetPlayerFrameAt(player, cast this, frameOffset);
	}
	inline public function validate(out:hl.Bytes):Bool {
		return flight._hl._fn.Spritesheet.validateSpritesheet(out, cast this);
	}
	inline public function free():Void {
		flight._hl._fn.Spritesheet.freeSpritesheet(cast this);
	}
}
