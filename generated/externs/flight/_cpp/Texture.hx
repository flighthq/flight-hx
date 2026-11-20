package flight._cpp;

abstract Texture(cpp.Star<cpp.Void>) {
	extern inline public function freeRef():Void {
		flight._cpp._fn.Image.freeTextureRef(cast this);
	}
	static extern inline public function create(opts:flight._cpp.CreateTextureOptions):flight._cpp.Texture {
		return flight._cpp._fn.Texture.createTexture(opts);
	}
	extern inline public function cloneTexture():flight._cpp.Texture {
		return flight._cpp._fn.Texture.cloneTextureTexture(cast this);
	}
	extern inline public function copyTextureTexture(source:flight._cpp.Texture):Void {
		flight._cpp._fn.Texture.copyTextureTextureTexture(cast this, source);
	}
	extern inline public function getTextureHeight():Int {
		return flight._cpp._fn.Texture.getTextureHeightTexture(cast this);
	}
	extern inline public function getTextureInverseUvMatrix(out:flight._cpp.Matrix3):Void {
		flight._cpp._fn.Texture.getTextureInverseUvMatrixTexture(out, cast this);
	}
	extern inline public function getTextureSource():flight._cpp.TextureSourceRef {
		return flight._cpp._fn.Texture.getTextureSourceTexture(cast this);
	}
	extern inline public function getTextureSourceKind():flight._cpp.TextureSourceKind {
		return flight._cpp._fn.Texture.getTextureSourceKindTexture(cast this);
	}
	extern inline public function getTextureUvMatrix(out:flight._cpp.Matrix3):Void {
		flight._cpp._fn.Texture.getTextureUvMatrixTexture(out, cast this);
	}
	extern inline public function getTextureViewSize(out:flight._cpp.Vector2):Void {
		flight._cpp._fn.Texture.getTextureViewSizeTexture(out, cast this);
	}
	extern inline public function getTextureWidth():Int {
		return flight._cpp._fn.Texture.getTextureWidthTexture(cast this);
	}
	extern inline public function hasTextureSource():Bool {
		return flight._cpp._fn.Texture.hasTextureSourceTexture(cast this);
	}
	extern inline public function hasTextureUvTransform():Bool {
		return flight._cpp._fn.Texture.hasTextureUvTransformTexture(cast this);
	}
	extern inline public function isTextureReady():Bool {
		return flight._cpp._fn.Texture.isTextureReadyTexture(cast this);
	}
	extern inline public function resetTextureUvTransform():Void {
		flight._cpp._fn.Texture.resetTextureUvTransformTexture(cast this);
	}
	extern inline public function setTextureFlip(flipX:Bool, flipY:Bool):Void {
		flight._cpp._fn.Texture.setTextureFlipTexture(cast this, flipX, flipY);
	}
	extern inline public function setTextureUvFromPixelRect(x:Float, y:Float, width:Float, height:Float):Void {
		flight._cpp._fn.Texture.setTextureUvFromPixelRectTexture(cast this, x, y, width, height);
	}
	extern inline public function setTextureUvOffset(x:Single, y:Single):Void {
		flight._cpp._fn.Texture.setTextureUvOffsetTexture(cast this, x, y);
	}
	extern inline public function setTextureUvRotation(radians:Float):Void {
		flight._cpp._fn.Texture.setTextureUvRotationTexture(cast this, radians);
	}
	extern inline public function setTextureUvScale(x:Single, y:Single):Void {
		flight._cpp._fn.Texture.setTextureUvScaleTexture(cast this, x, y);
	}
	extern inline public function transformTextureUv(out:flight._cpp.Vector2, u:Single, v:Single):Void {
		flight._cpp._fn.Texture.transformTextureUvTexture(out, cast this, u, v);
	}
	extern inline public function free():Void {
		flight._cpp._fn.Texture.freeTexture(cast this);
	}
}
