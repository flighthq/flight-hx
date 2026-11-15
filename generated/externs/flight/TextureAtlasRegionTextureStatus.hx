package flight;

abstract TextureAtlasRegionTextureStatus(Int) from Int to Int {
	public static inline var MissingRegion:TextureAtlasRegionTextureStatus = 0;
	public static inline var MissingTexture:TextureAtlasRegionTextureStatus = 1;
	public static inline var Ready:TextureAtlasRegionTextureStatus = 2;
	public static inline var RotatedPage:TextureAtlasRegionTextureStatus = 3;
}
