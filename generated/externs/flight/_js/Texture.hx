package flight._js;

abstract Texture(Dynamic) {
	static inline public function create(opts:Null<flight._js.CreateTextureOptions>):flight._js.Texture {
		return flight._js._fn.Texture.createTexture(opts);
	}
	inline public function cloneTexture():flight._js.Texture {
		return flight._js._fn.Texture.cloneTextureTexture(cast this);
	}
	inline public function copyTextureTexture(source:flight._js.Texture):Void {
		flight._js._fn.Texture.copyTextureTextureTexture(cast this, source);
	}
	inline public function getTextureHeight():Int {
		return flight._js._fn.Texture.getTextureHeightTexture(cast this);
	}
	inline public function getTextureInverseUvMatrix(out:flight._js.Matrix3):Void {
		flight._js._fn.Texture.getTextureInverseUvMatrixTexture(out, cast this);
	}
	inline public function getTextureSource():Null<flight._js.TextureSourceRef> {
		return flight._js._fn.Texture.getTextureSourceTexture(cast this);
	}
	inline public function getTextureSourceKind():Null<flight._js.TextureSourceKind> {
		return flight._js._fn.Texture.getTextureSourceKindTexture(cast this);
	}
	inline public function getTextureUvMatrix(out:flight._js.Matrix3):Void {
		flight._js._fn.Texture.getTextureUvMatrixTexture(out, cast this);
	}
	inline public function getTextureViewSize(out:flight._js.Vector2):Void {
		flight._js._fn.Texture.getTextureViewSizeTexture(out, cast this);
	}
	inline public function getTextureWidth():Int {
		return flight._js._fn.Texture.getTextureWidthTexture(cast this);
	}
	inline public function hasTextureSource():Bool {
		return flight._js._fn.Texture.hasTextureSourceTexture(cast this);
	}
	inline public function hasTextureUvTransform():Bool {
		return flight._js._fn.Texture.hasTextureUvTransformTexture(cast this);
	}
	inline public function isTextureReady():Bool {
		return flight._js._fn.Texture.isTextureReadyTexture(cast this);
	}
	inline public function resetTextureUvTransform():Void {
		flight._js._fn.Texture.resetTextureUvTransformTexture(cast this);
	}
	inline public function setTextureFlip(flipX:Bool, flipY:Bool):Void {
		flight._js._fn.Texture.setTextureFlipTexture(cast this, flipX, flipY);
	}
	inline public function setTextureUvFromPixelRect(x:Float, y:Float, width:Float, height:Float):Void {
		flight._js._fn.Texture.setTextureUvFromPixelRectTexture(cast this, x, y, width, height);
	}
	inline public function setTextureUvOffset(x:Float, y:Float):Void {
		flight._js._fn.Texture.setTextureUvOffsetTexture(cast this, x, y);
	}
	inline public function setTextureUvRotation(radians:Float):Void {
		flight._js._fn.Texture.setTextureUvRotationTexture(cast this, radians);
	}
	inline public function setTextureUvScale(x:Float, y:Float):Void {
		flight._js._fn.Texture.setTextureUvScaleTexture(cast this, x, y);
	}
	inline public function transformTextureUv(out:flight._js.Vector2, u:Float, v:Float):Void {
		flight._js._fn.Texture.transformTextureUvTexture(out, cast this, u, v);
	}
	inline public function free():Void {
		flight._js._fn.Texture.freeTexture(cast this);
	}
}
