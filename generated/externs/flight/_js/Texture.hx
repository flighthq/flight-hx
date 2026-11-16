package flight._js;

abstract Texture(Dynamic) {
	static inline public function create(opts:flight._js.CreateTextureOptions):flight._js.Texture {
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
	inline public function getTextureSource():Dynamic {
		return flight._js._fn.Texture.getTextureSourceTexture(cast this);
	}
	inline public function getTextureSourceKind():Dynamic {
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
	inline public function advanceVideoTexture(hostVideo:flight._js.HostVideoCapability):Int {
		return flight._js._fn.Video.advanceVideoTextureTexture(hostVideo, cast this);
	}
	inline public function cloneVideoTexture():flight._js.Texture {
		return flight._js._fn.Video.cloneVideoTextureTexture(cast this);
	}
	inline public function copyVideoTextureTexture(source:flight._js.Texture):Void {
		flight._js._fn.Video.copyVideoTextureTextureTexture(cast this, source);
	}
	inline public function getVideoTextureHeight(hostVideo:flight._js.HostVideoCapability):Float {
		return flight._js._fn.Video.getVideoTextureHeightTexture(hostVideo, cast this);
	}
	inline public function getVideoTextureInverseUvMatrix(out:flight._js.Matrix3):Void {
		flight._js._fn.Video.getVideoTextureInverseUvMatrixTexture(out, cast this);
	}
	inline public function getVideoTextureUvMatrix(out:flight._js.Matrix3):Void {
		flight._js._fn.Video.getVideoTextureUvMatrixTexture(out, cast this);
	}
	inline public function getVideoTextureWidth(hostVideo:flight._js.HostVideoCapability):Float {
		return flight._js._fn.Video.getVideoTextureWidthTexture(hostVideo, cast this);
	}
	inline public function isVideoTextureFrameReady(hostVideo:flight._js.HostVideoCapability):Bool {
		return flight._js._fn.Video.isVideoTextureFrameReadyTexture(hostVideo, cast this);
	}
	inline public function resetVideoTextureFrame():Void {
		flight._js._fn.Video.resetVideoTextureFrameTexture(cast this);
	}
	inline public function setVideoTextureSource(hostVideo:flight._js.HostVideoCapability, source:flight._js.VideoResource):Void {
		flight._js._fn.Video.setVideoTextureSourceTexture(hostVideo, cast this, source);
	}
}
