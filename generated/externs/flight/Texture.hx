package flight;

#if hl

typedef Texture = flight._hl.Texture;

#elseif cpp

typedef Texture = flight._cpp.Texture;

#elseif (js && flight_esm)

typedef Texture = flight._js.Texture;

#elseif js

#error "flight.Texture on js requires flight_esm."

#else

#error "flight.Texture: no backend for this target."

#end

#if (js && flight_esm)
extern inline function createCubeTexture():CubeTexture {
	return flight._js._fn.Texture.createCubeTexture();
}
#else
extern inline function createCubeTexture():CubeTexture {
#if hl
	return flight._hl._fn.Texture.createCubeTexture();
#elseif cpp
	return flight._cpp._fn.Texture.createCubeTexture();
#elseif (js && flight_esm)
	return flight._js._fn.Texture.createCubeTexture();
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function cloneCubeTexture(source:CubeTexture):CubeTexture {
	return flight._js._fn.Texture.cloneCubeTexture(source);
}
#else
extern inline function cloneCubeTexture(source:CubeTexture):CubeTexture {
#if hl
	return flight._hl._fn.Texture.cloneCubeTexture(source);
#elseif cpp
	return flight._cpp._fn.Texture.cloneCubeTexture(source);
#elseif (js && flight_esm)
	return flight._js._fn.Texture.cloneCubeTexture(source);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function copyCubeTexture(out:CubeTexture, source:CubeTexture):Void {
	flight._js._fn.Texture.copyCubeTexture(out, source);
}
#else
extern inline function copyCubeTexture(out:CubeTexture, source:CubeTexture):Void {
#if hl
	flight._hl._fn.Texture.copyCubeTexture(out, source);
#elseif cpp
	flight._cpp._fn.Texture.copyCubeTexture(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Texture.copyCubeTexture(out, source);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function equalsCubeTexture(a:Null<CubeTexture>, b:Null<CubeTexture>):Bool {
	return flight._js._fn.Texture.equalsCubeTexture(a, b);
}
#else
extern inline function equalsCubeTexture(a:CubeTexture, b:CubeTexture):Bool {
#if hl
	return flight._hl._fn.Texture.equalsCubeTexture(a, b);
#elseif cpp
	return flight._cpp._fn.Texture.equalsCubeTexture(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Texture.equalsCubeTexture(a, b);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getCubeTextureFaceSize(cube:CubeTexture):Int {
	return flight._js._fn.Texture.getCubeTextureFaceSize(cube);
}
#else
extern inline function getCubeTextureFaceSize(cube:CubeTexture):Int {
#if hl
	return flight._hl._fn.Texture.getCubeTextureFaceSize(cube);
#elseif cpp
	return flight._cpp._fn.Texture.getCubeTextureFaceSize(cube);
#elseif (js && flight_esm)
	return flight._js._fn.Texture.getCubeTextureFaceSize(cube);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isCubeTextureComplete(cube:CubeTexture):Bool {
	return flight._js._fn.Texture.isCubeTextureComplete(cube);
}
#else
extern inline function isCubeTextureComplete(cube:CubeTexture):Bool {
#if hl
	return flight._hl._fn.Texture.isCubeTextureComplete(cube);
#elseif cpp
	return flight._cpp._fn.Texture.isCubeTextureComplete(cube);
#elseif (js && flight_esm)
	return flight._js._fn.Texture.isCubeTextureComplete(cube);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createAnisotropicSampler(level:Float):Sampler {
	return flight._js._fn.Texture.createAnisotropicSampler(level);
}
#else
extern inline function createAnisotropicSampler(level:Float):Sampler {
#if hl
	return flight._hl._fn.Texture.createAnisotropicSampler(level);
#elseif cpp
	return flight._cpp._fn.Texture.createAnisotropicSampler(level);
#elseif (js && flight_esm)
	return flight._js._fn.Texture.createAnisotropicSampler(level);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createClampLinearSampler():Sampler {
	return flight._js._fn.Texture.createClampLinearSampler();
}
#else
extern inline function createClampLinearSampler():Sampler {
#if hl
	return flight._hl._fn.Texture.createClampLinearSampler();
#elseif cpp
	return flight._cpp._fn.Texture.createClampLinearSampler();
#elseif (js && flight_esm)
	return flight._js._fn.Texture.createClampLinearSampler();
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPixelArtSampler():Sampler {
	return flight._js._fn.Texture.createPixelArtSampler();
}
#else
extern inline function createPixelArtSampler():Sampler {
#if hl
	return flight._hl._fn.Texture.createPixelArtSampler();
#elseif cpp
	return flight._cpp._fn.Texture.createPixelArtSampler();
#elseif (js && flight_esm)
	return flight._js._fn.Texture.createPixelArtSampler();
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSampler():Sampler {
	return flight._js._fn.Texture.createSampler();
}
#else
extern inline function createSampler():Sampler {
#if hl
	return flight._hl._fn.Texture.createSampler();
#elseif cpp
	return flight._cpp._fn.Texture.createSampler();
#elseif (js && flight_esm)
	return flight._js._fn.Texture.createSampler();
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createTilingSampler():Sampler {
	return flight._js._fn.Texture.createTilingSampler();
}
#else
extern inline function createTilingSampler():Sampler {
#if hl
	return flight._hl._fn.Texture.createTilingSampler();
#elseif cpp
	return flight._cpp._fn.Texture.createTilingSampler();
#elseif (js && flight_esm)
	return flight._js._fn.Texture.createTilingSampler();
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function cloneSampler(source:Sampler):Sampler {
	return flight._js._fn.Texture.cloneSampler(source);
}
#else
extern inline function cloneSampler(source:Sampler):Sampler {
#if hl
	return flight._hl._fn.Texture.cloneSampler(source);
#elseif cpp
	return flight._cpp._fn.Texture.cloneSampler(source);
#elseif (js && flight_esm)
	return flight._js._fn.Texture.cloneSampler(source);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function copySampler(out:Sampler, source:Sampler):Void {
	flight._js._fn.Texture.copySampler(out, source);
}
#else
extern inline function copySampler(out:Sampler, source:Sampler):Void {
#if hl
	flight._hl._fn.Texture.copySampler(out, source);
#elseif cpp
	flight._cpp._fn.Texture.copySampler(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Texture.copySampler(out, source);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function equalsSampler(a:Null<Sampler>, b:Null<Sampler>):Bool {
	return flight._js._fn.Texture.equalsSampler(a, b);
}
#else
extern inline function equalsSampler(a:Sampler, b:Sampler):Bool {
#if hl
	return flight._hl._fn.Texture.equalsSampler(a, b);
#elseif cpp
	return flight._cpp._fn.Texture.equalsSampler(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Texture.equalsSampler(a, b);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createTexture(opts:Null<CreateTextureOptions>):Texture {
	return flight._js._fn.Texture.createTexture(opts);
}
#else
extern inline function createTexture(opts:CreateTextureOptions):Texture {
#if hl
	return flight._hl._fn.Texture.createTexture(opts);
#elseif cpp
	return flight._cpp._fn.Texture.createTexture(opts);
#elseif (js && flight_esm)
	return flight._js._fn.Texture.createTexture(opts);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createTexture2d():Texture2D {
	return flight._js._fn.Texture.createTexture2d();
}
#else
extern inline function createTexture2d():Texture2D {
#if hl
	return flight._hl._fn.Texture.createTexture2d();
#elseif cpp
	return flight._cpp._fn.Texture.createTexture2d();
#elseif (js && flight_esm)
	return flight._js._fn.Texture.createTexture2d();
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function cloneTextureTexture(source:Texture):Texture {
	return flight._js._fn.Texture.cloneTextureTexture(source);
}
#else
extern inline function cloneTextureTexture(source:Texture):Texture {
#if hl
	return flight._hl._fn.Texture.cloneTextureTexture(source);
#elseif cpp
	return flight._cpp._fn.Texture.cloneTextureTexture(source);
#elseif (js && flight_esm)
	return flight._js._fn.Texture.cloneTextureTexture(source);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function copyTextureTextureTexture(out:Texture, source:Texture):Void {
	flight._js._fn.Texture.copyTextureTextureTexture(out, source);
}
#else
extern inline function copyTextureTextureTexture(out:Texture, source:Texture):Void {
#if hl
	flight._hl._fn.Texture.copyTextureTextureTexture(out, source);
#elseif cpp
	flight._cpp._fn.Texture.copyTextureTextureTexture(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Texture.copyTextureTextureTexture(out, source);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextureHeightTexture(texture:Texture):Int {
	return flight._js._fn.Texture.getTextureHeightTexture(texture);
}
#else
extern inline function getTextureHeightTexture(texture:Texture):Int {
#if hl
	return flight._hl._fn.Texture.getTextureHeightTexture(texture);
#elseif cpp
	return flight._cpp._fn.Texture.getTextureHeightTexture(texture);
#elseif (js && flight_esm)
	return flight._js._fn.Texture.getTextureHeightTexture(texture);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextureInverseUvMatrixTexture(out:Matrix3, texture:Texture):Void {
	flight._js._fn.Texture.getTextureInverseUvMatrixTexture(out, texture);
}
#else
extern inline function getTextureInverseUvMatrixTexture(out:Matrix3, texture:Texture):Void {
#if hl
	flight._hl._fn.Texture.getTextureInverseUvMatrixTexture(out, texture);
#elseif cpp
	flight._cpp._fn.Texture.getTextureInverseUvMatrixTexture(out, texture);
#elseif (js && flight_esm)
	flight._js._fn.Texture.getTextureInverseUvMatrixTexture(out, texture);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextureSourceTexture(texture:Texture):Null<TextureSourceRef> {
	return flight._js._fn.Texture.getTextureSourceTexture(texture);
}
#else
extern inline function getTextureSourceTexture(texture:Texture):TextureSourceRef {
#if hl
	return flight._hl._fn.Texture.getTextureSourceTexture(texture);
#elseif cpp
	return flight._cpp._fn.Texture.getTextureSourceTexture(texture);
#elseif (js && flight_esm)
	return flight._js._fn.Texture.getTextureSourceTexture(texture);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextureSourceKindTexture(texture:Texture):Null<TextureSourceKind> {
	return flight._js._fn.Texture.getTextureSourceKindTexture(texture);
}
#else
extern inline function getTextureSourceKindTexture(texture:Texture):TextureSourceKind {
#if hl
	return flight._hl._fn.Texture.getTextureSourceKindTexture(texture);
#elseif cpp
	return flight._cpp._fn.Texture.getTextureSourceKindTexture(texture);
#elseif (js && flight_esm)
	return flight._js._fn.Texture.getTextureSourceKindTexture(texture);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextureUvMatrixTexture(out:Matrix3, texture:Texture):Void {
	flight._js._fn.Texture.getTextureUvMatrixTexture(out, texture);
}
#else
extern inline function getTextureUvMatrixTexture(out:Matrix3, texture:Texture):Void {
#if hl
	flight._hl._fn.Texture.getTextureUvMatrixTexture(out, texture);
#elseif cpp
	flight._cpp._fn.Texture.getTextureUvMatrixTexture(out, texture);
#elseif (js && flight_esm)
	flight._js._fn.Texture.getTextureUvMatrixTexture(out, texture);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextureViewSizeTexture(out:Vector2, texture:Texture):Void {
	flight._js._fn.Texture.getTextureViewSizeTexture(out, texture);
}
#else
extern inline function getTextureViewSizeTexture(out:Vector2, texture:Texture):Void {
#if hl
	flight._hl._fn.Texture.getTextureViewSizeTexture(out, texture);
#elseif cpp
	flight._cpp._fn.Texture.getTextureViewSizeTexture(out, texture);
#elseif (js && flight_esm)
	flight._js._fn.Texture.getTextureViewSizeTexture(out, texture);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextureWidthTexture(texture:Texture):Int {
	return flight._js._fn.Texture.getTextureWidthTexture(texture);
}
#else
extern inline function getTextureWidthTexture(texture:Texture):Int {
#if hl
	return flight._hl._fn.Texture.getTextureWidthTexture(texture);
#elseif cpp
	return flight._cpp._fn.Texture.getTextureWidthTexture(texture);
#elseif (js && flight_esm)
	return flight._js._fn.Texture.getTextureWidthTexture(texture);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hasTextureSourceTexture(texture:Texture):Bool {
	return flight._js._fn.Texture.hasTextureSourceTexture(texture);
}
#else
extern inline function hasTextureSourceTexture(texture:Texture):Bool {
#if hl
	return flight._hl._fn.Texture.hasTextureSourceTexture(texture);
#elseif cpp
	return flight._cpp._fn.Texture.hasTextureSourceTexture(texture);
#elseif (js && flight_esm)
	return flight._js._fn.Texture.hasTextureSourceTexture(texture);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hasTextureUvTransformTexture(texture:Texture):Bool {
	return flight._js._fn.Texture.hasTextureUvTransformTexture(texture);
}
#else
extern inline function hasTextureUvTransformTexture(texture:Texture):Bool {
#if hl
	return flight._hl._fn.Texture.hasTextureUvTransformTexture(texture);
#elseif cpp
	return flight._cpp._fn.Texture.hasTextureUvTransformTexture(texture);
#elseif (js && flight_esm)
	return flight._js._fn.Texture.hasTextureUvTransformTexture(texture);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isTextureReadyTexture(texture:Texture):Bool {
	return flight._js._fn.Texture.isTextureReadyTexture(texture);
}
#else
extern inline function isTextureReadyTexture(texture:Texture):Bool {
#if hl
	return flight._hl._fn.Texture.isTextureReadyTexture(texture);
#elseif cpp
	return flight._cpp._fn.Texture.isTextureReadyTexture(texture);
#elseif (js && flight_esm)
	return flight._js._fn.Texture.isTextureReadyTexture(texture);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function resetTextureUvTransformTexture(texture:Texture):Void {
	flight._js._fn.Texture.resetTextureUvTransformTexture(texture);
}
#else
extern inline function resetTextureUvTransformTexture(texture:Texture):Void {
#if hl
	flight._hl._fn.Texture.resetTextureUvTransformTexture(texture);
#elseif cpp
	flight._cpp._fn.Texture.resetTextureUvTransformTexture(texture);
#elseif (js && flight_esm)
	flight._js._fn.Texture.resetTextureUvTransformTexture(texture);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setTextureFlipTexture(texture:Texture, flipX:Bool, flipY:Bool):Void {
	flight._js._fn.Texture.setTextureFlipTexture(texture, flipX, flipY);
}
#else
extern inline function setTextureFlipTexture(texture:Texture, flipX:Bool, flipY:Bool):Void {
#if hl
	flight._hl._fn.Texture.setTextureFlipTexture(texture, flipX, flipY);
#elseif cpp
	flight._cpp._fn.Texture.setTextureFlipTexture(texture, flipX, flipY);
#elseif (js && flight_esm)
	flight._js._fn.Texture.setTextureFlipTexture(texture, flipX, flipY);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setTextureUvFromPixelRectTexture(texture:Texture, x:Float, y:Float, width:Float, height:Float):Void {
	flight._js._fn.Texture.setTextureUvFromPixelRectTexture(texture, x, y, width, height);
}
#else
extern inline function setTextureUvFromPixelRectTexture(texture:Texture, x:Float, y:Float, width:Float, height:Float):Void {
#if hl
	flight._hl._fn.Texture.setTextureUvFromPixelRectTexture(texture, x, y, width, height);
#elseif cpp
	flight._cpp._fn.Texture.setTextureUvFromPixelRectTexture(texture, x, y, width, height);
#elseif (js && flight_esm)
	flight._js._fn.Texture.setTextureUvFromPixelRectTexture(texture, x, y, width, height);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setTextureUvOffsetTexture(texture:Texture, x:Float, y:Float):Void {
	flight._js._fn.Texture.setTextureUvOffsetTexture(texture, x, y);
}
#else
extern inline function setTextureUvOffsetTexture(texture:Texture, x:Float, y:Float):Void {
#if hl
	flight._hl._fn.Texture.setTextureUvOffsetTexture(texture, x, y);
#elseif cpp
	flight._cpp._fn.Texture.setTextureUvOffsetTexture(texture, x, y);
#elseif (js && flight_esm)
	flight._js._fn.Texture.setTextureUvOffsetTexture(texture, x, y);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setTextureUvRotationTexture(texture:Texture, radians:Float):Void {
	flight._js._fn.Texture.setTextureUvRotationTexture(texture, radians);
}
#else
extern inline function setTextureUvRotationTexture(texture:Texture, radians:Float):Void {
#if hl
	flight._hl._fn.Texture.setTextureUvRotationTexture(texture, radians);
#elseif cpp
	flight._cpp._fn.Texture.setTextureUvRotationTexture(texture, radians);
#elseif (js && flight_esm)
	flight._js._fn.Texture.setTextureUvRotationTexture(texture, radians);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setTextureUvScaleTexture(texture:Texture, x:Float, y:Float):Void {
	flight._js._fn.Texture.setTextureUvScaleTexture(texture, x, y);
}
#else
extern inline function setTextureUvScaleTexture(texture:Texture, x:Float, y:Float):Void {
#if hl
	flight._hl._fn.Texture.setTextureUvScaleTexture(texture, x, y);
#elseif cpp
	flight._cpp._fn.Texture.setTextureUvScaleTexture(texture, x, y);
#elseif (js && flight_esm)
	flight._js._fn.Texture.setTextureUvScaleTexture(texture, x, y);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function transformTextureUvTexture(out:Vector2, texture:Texture, u:Float, v:Float):Void {
	flight._js._fn.Texture.transformTextureUvTexture(out, texture, u, v);
}
#else
extern inline function transformTextureUvTexture(out:Vector2, texture:Texture, u:Float, v:Float):Void {
#if hl
	flight._hl._fn.Texture.transformTextureUvTexture(out, texture, u, v);
#elseif cpp
	flight._cpp._fn.Texture.transformTextureUvTexture(out, texture, u, v);
#elseif (js && flight_esm)
	flight._js._fn.Texture.transformTextureUvTexture(out, texture, u, v);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextureSampleColorSpace(source:Dynamic, working:Dynamic):Dynamic {
	return flight._js._fn.Texture.getTextureSampleColorSpace(source, working);
}
#else
extern inline function getTextureSampleColorSpace(source:flight.TextureColorSpace, working:flight.RenderTargetColorSpace):flight.TextureColorSpace {
#if hl
	return flight._hl._fn.Texture.getTextureSampleColorSpace(source, working);
#elseif cpp
	return flight._cpp._fn.Texture.getTextureSampleColorSpace(source, working);
#elseif (js && flight_esm)
	return flight._js._fn.Texture.getTextureSampleColorSpace(source, working);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function shouldDecodeTextureOnSample(source:Dynamic, working:Dynamic):Bool {
	return flight._js._fn.Texture.shouldDecodeTextureOnSample(source, working);
}
#else
extern inline function shouldDecodeTextureOnSample(source:flight.TextureColorSpace, working:flight.RenderTargetColorSpace):Bool {
#if hl
	return flight._hl._fn.Texture.shouldDecodeTextureOnSample(source, working);
#elseif cpp
	return flight._cpp._fn.Texture.shouldDecodeTextureOnSample(source, working);
#elseif (js && flight_esm)
	return flight._js._fn.Texture.shouldDecodeTextureOnSample(source, working);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function shouldPremultiplyTextureOnUpload(source:Dynamic, working:Dynamic):Bool {
	return flight._js._fn.Texture.shouldPremultiplyTextureOnUpload(source, working);
}
#else
extern inline function shouldPremultiplyTextureOnUpload(source:flight.TextureColorSpace, working:flight.RenderTargetColorSpace):Bool {
#if hl
	return flight._hl._fn.Texture.shouldPremultiplyTextureOnUpload(source, working);
#elseif cpp
	return flight._cpp._fn.Texture.shouldPremultiplyTextureOnUpload(source, working);
#elseif (js && flight_esm)
	return flight._js._fn.Texture.shouldPremultiplyTextureOnUpload(source, working);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function invalidateVoxelGrid(voxelGrid:VoxelGrid):Void {
	flight._js._fn.Texture.invalidateVoxelGrid(voxelGrid);
}
#else
extern inline function invalidateVoxelGrid(voxelGrid:VoxelGrid):Void {
#if hl
	flight._hl._fn.Texture.invalidateVoxelGrid(voxelGrid);
#elseif cpp
	flight._cpp._fn.Texture.invalidateVoxelGrid(voxelGrid);
#elseif (js && flight_esm)
	flight._js._fn.Texture.invalidateVoxelGrid(voxelGrid);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeCubeTexture(ptr:CubeTexture):Void {
	flight._js._fn.Texture.freeCubeTexture(ptr);
}
#else
extern inline function freeCubeTexture(ptr:CubeTexture):Void {
#if hl
	flight._hl._fn.Texture.freeCubeTexture(ptr);
#elseif cpp
	flight._cpp._fn.Texture.freeCubeTexture(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Texture.freeCubeTexture(ptr);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSampler(ptr:Sampler):Void {
	flight._js._fn.Texture.freeSampler(ptr);
}
#else
extern inline function freeSampler(ptr:Sampler):Void {
#if hl
	flight._hl._fn.Texture.freeSampler(ptr);
#elseif cpp
	flight._cpp._fn.Texture.freeSampler(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Texture.freeSampler(ptr);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTexture(ptr:Texture):Void {
	flight._js._fn.Texture.freeTexture(ptr);
}
#else
extern inline function freeTexture(ptr:Texture):Void {
#if hl
	flight._hl._fn.Texture.freeTexture(ptr);
#elseif cpp
	flight._cpp._fn.Texture.freeTexture(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Texture.freeTexture(ptr);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTexture2D(ptr:Texture2D):Void {
	flight._js._fn.Texture.freeTexture2D(ptr);
}
#else
extern inline function freeTexture2D(ptr:Texture2D):Void {
#if hl
	flight._hl._fn.Texture.freeTexture2D(ptr);
#elseif cpp
	flight._cpp._fn.Texture.freeTexture2D(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Texture.freeTexture2D(ptr);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTextureSourceRef(ptr:TextureSourceRef):Void {
	flight._js._fn.Texture.freeTextureSourceRef(ptr);
}
#else
extern inline function freeTextureSourceRef(ptr:TextureSourceRef):Void {
#if hl
	flight._hl._fn.Texture.freeTextureSourceRef(ptr);
#elseif cpp
	flight._cpp._fn.Texture.freeTextureSourceRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Texture.freeTextureSourceRef(ptr);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTextureSourceKind(ptr:TextureSourceKind):Void {
	flight._js._fn.Texture.freeTextureSourceKind(ptr);
}
#else
extern inline function freeTextureSourceKind(ptr:TextureSourceKind):Void {
#if hl
	flight._hl._fn.Texture.freeTextureSourceKind(ptr);
#elseif cpp
	flight._cpp._fn.Texture.freeTextureSourceKind(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Texture.freeTextureSourceKind(ptr);
#else
	#error "flight.Texture: no backend for this target."
#end
}
#end
