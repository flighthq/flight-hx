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

inline function createCubeTexture():CubeTexture {
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
inline function cloneCubeTexture(source:CubeTexture):CubeTexture {
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
inline function copyCubeTexture(out:CubeTexture, source:CubeTexture):Void {
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
inline function equalsCubeTexture(a:CubeTexture, b:CubeTexture):Bool {
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
inline function getCubeTextureFaceSize(cube:CubeTexture):Int {
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
inline function isCubeTextureComplete(cube:CubeTexture):Bool {
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
inline function createAnisotropicSampler(level:Float):Sampler {
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
inline function createClampLinearSampler():Sampler {
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
inline function createPixelArtSampler():Sampler {
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
inline function createSampler():Sampler {
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
inline function createTilingSampler():Sampler {
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
inline function cloneSampler(source:Sampler):Sampler {
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
inline function copySampler(out:Sampler, source:Sampler):Void {
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
inline function equalsSampler(a:Sampler, b:Sampler):Bool {
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
inline function createTexture(opts:CreateTextureOptions):Int {
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
inline function createTexture2d():Texture2D {
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
inline function cloneTextureTexture(source:Texture):Int {
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
inline function copyTextureTextureTexture(out:Texture, source:Texture):Void {
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
inline function getTextureHeightTexture(texture:Texture):Int {
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
inline function getTextureInverseUvMatrixTexture(out:Matrix3, texture:Texture):Void {
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
inline function getTextureSourceTexture(texture:Texture):TextureSourceRef {
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
inline function getTextureSourceKindTexture(texture:Texture):TextureSourceKind {
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
inline function getTextureUvMatrixTexture(out:Matrix3, texture:Texture):Void {
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
inline function getTextureViewSizeTexture(out:Vector2, texture:Texture):Void {
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
inline function getTextureWidthTexture(texture:Texture):Int {
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
inline function hasTextureSourceTexture(texture:Texture):Bool {
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
inline function hasTextureUvTransformTexture(texture:Texture):Bool {
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
inline function isTextureReadyTexture(texture:Texture):Bool {
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
inline function resetTextureUvTransformTexture(texture:Texture):Void {
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
inline function setTextureFlipTexture(texture:Texture, flipX:Bool, flipY:Bool):Void {
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
inline function setTextureUvFromPixelRectTexture(texture:Texture, x:Float, y:Float, width:Float, height:Float):Void {
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
inline function setTextureUvOffsetTexture(texture:Texture, x:Float, y:Float):Void {
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
inline function setTextureUvRotationTexture(texture:Texture, radians:Float):Void {
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
inline function setTextureUvScaleTexture(texture:Texture, x:Float, y:Float):Void {
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
inline function transformTextureUvTexture(out:Vector2, texture:Texture, u:Float, v:Float):Void {
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
inline function getTextureSampleColorSpace(source:flight.TextureColorSpace, working:flight.RenderTargetColorSpace):flight.TextureColorSpace {
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
inline function shouldDecodeTextureOnSample(source:flight.TextureColorSpace, working:flight.RenderTargetColorSpace):Bool {
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
inline function shouldPremultiplyTextureOnUpload(source:flight.TextureColorSpace, working:flight.RenderTargetColorSpace):Bool {
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
inline function invalidateVoxelGrid(voxelGrid:VoxelGrid):Void {
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
inline function freeCubeTexture(ptr:CubeTexture):Void {
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
inline function freeSampler(ptr:Sampler):Void {
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
inline function freeTexture2D(ptr:Texture2D):Void {
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
inline function freeTextureSourceRef(ptr:TextureSourceRef):Void {
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
inline function freeTextureSourceKind(ptr:TextureSourceKind):Void {
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
