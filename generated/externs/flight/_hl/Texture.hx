package flight._hl;

abstract Texture(hl.Bytes) {
	inline public function cloneTexture():Int {
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
	inline public function getTextureSource():Dynamic {
		return flight._hl._fn.Texture.getTextureSourceTexture(cast this);
	}
	inline public function getTextureSourceKind():Dynamic {
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
	inline public function advanceVideoTexture(hostVideo:flight._hl.HostVideoCapability):Int {
		return flight._hl._fn.Video.advanceVideoTextureTexture(hostVideo, cast this);
	}
	inline public function cloneVideoTexture():Int {
		return flight._hl._fn.Video.cloneVideoTextureTexture(cast this);
	}
	inline public function copyVideoTextureTexture(source:flight._hl.Texture):Void {
		flight._hl._fn.Video.copyVideoTextureTextureTexture(cast this, source);
	}
	inline public function getVideoTextureHeight(hostVideo:flight._hl.HostVideoCapability):Single {
		return flight._hl._fn.Video.getVideoTextureHeightTexture(hostVideo, cast this);
	}
	inline public function getVideoTextureInverseUvMatrix(out:flight._hl.Matrix3):Void {
		flight._hl._fn.Video.getVideoTextureInverseUvMatrixTexture(out, cast this);
	}
	inline public function getVideoTextureUvMatrix(out:flight._hl.Matrix3):Void {
		flight._hl._fn.Video.getVideoTextureUvMatrixTexture(out, cast this);
	}
	inline public function getVideoTextureWidth(hostVideo:flight._hl.HostVideoCapability):Single {
		return flight._hl._fn.Video.getVideoTextureWidthTexture(hostVideo, cast this);
	}
	inline public function isVideoTextureFrameReady(hostVideo:flight._hl.HostVideoCapability):Bool {
		return flight._hl._fn.Video.isVideoTextureFrameReadyTexture(hostVideo, cast this);
	}
	inline public function resetVideoTextureFrame():Void {
		flight._hl._fn.Video.resetVideoTextureFrameTexture(cast this);
	}
	inline public function setVideoTextureSource(hostVideo:flight._hl.HostVideoCapability, source:flight._hl.VideoResource):Void {
		flight._hl._fn.Video.setVideoTextureSourceTexture(hostVideo, cast this, source);
	}
}
