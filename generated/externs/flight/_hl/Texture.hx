package flight._hl;

abstract Texture(hl.Bytes) {
	static inline public function create(opts:flight._hl.CreateTextureOptions):flight._hl.Texture {
		return flight._hl._fn.Texture.createTexture(opts);
	}
	inline public function cloneTexture():flight._hl.Texture {
		return flight._hl._fn.Texture.cloneTextureTexture(cast this);
	}
	inline public function copyTextureTexture(source:flight._hl.Texture):Void {
		flight._hl._fn.Texture.copyTextureTextureTexture(cast this, source);
	}
	inline public function getTextureHeight():Int {
		return flight._hl._fn.Texture.getTextureHeightTexture(cast this);
	}
	inline public function getTextureInverseUvMatrix(out:flight._hl.Matrix3):Void {
		flight._hl._fn.Texture.getTextureInverseUvMatrixTexture(out, cast this);
	}
	inline public function getTextureSource():flight._hl.TextureSourceRef {
		return flight._hl._fn.Texture.getTextureSourceTexture(cast this);
	}
	inline public function getTextureSourceKind():flight._hl.TextureSourceKind {
		return flight._hl._fn.Texture.getTextureSourceKindTexture(cast this);
	}
	inline public function getTextureUvMatrix(out:flight._hl.Matrix3):Void {
		flight._hl._fn.Texture.getTextureUvMatrixTexture(out, cast this);
	}
	inline public function getTextureViewSize(out:flight._hl.Vector2):Void {
		flight._hl._fn.Texture.getTextureViewSizeTexture(out, cast this);
	}
	inline public function getTextureWidth():Int {
		return flight._hl._fn.Texture.getTextureWidthTexture(cast this);
	}
	inline public function hasTextureSource():Bool {
		return flight._hl._fn.Texture.hasTextureSourceTexture(cast this);
	}
	inline public function hasTextureUvTransform():Bool {
		return flight._hl._fn.Texture.hasTextureUvTransformTexture(cast this);
	}
	inline public function isTextureReady():Bool {
		return flight._hl._fn.Texture.isTextureReadyTexture(cast this);
	}
	inline public function resetTextureUvTransform():Void {
		flight._hl._fn.Texture.resetTextureUvTransformTexture(cast this);
	}
	inline public function setTextureFlip(flipX:Bool, flipY:Bool):Void {
		flight._hl._fn.Texture.setTextureFlipTexture(cast this, flipX, flipY);
	}
	inline public function setTextureUvFromPixelRect(x:Single, y:Single, width:Single, height:Single):Void {
		flight._hl._fn.Texture.setTextureUvFromPixelRectTexture(cast this, x, y, width, height);
	}
	inline public function setTextureUvOffset(x:Single, y:Single):Void {
		flight._hl._fn.Texture.setTextureUvOffsetTexture(cast this, x, y);
	}
	inline public function setTextureUvRotation(radians:Single):Void {
		flight._hl._fn.Texture.setTextureUvRotationTexture(cast this, radians);
	}
	inline public function setTextureUvScale(x:Single, y:Single):Void {
		flight._hl._fn.Texture.setTextureUvScaleTexture(cast this, x, y);
	}
	inline public function transformTextureUv(out:flight._hl.Vector2, u:Single, v:Single):Void {
		flight._hl._fn.Texture.transformTextureUvTexture(out, cast this, u, v);
	}
	inline public function free():Void {
		flight._hl._fn.Texture.freeTexture(cast this);
	}
}
