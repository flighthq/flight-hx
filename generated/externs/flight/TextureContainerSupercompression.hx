package flight;

abstract TextureContainerSupercompression(Int) from Int to Int {
	public static inline var None:TextureContainerSupercompression = 0;
	public static inline var BasisLz:TextureContainerSupercompression = 1;
	public static inline var Zstd:TextureContainerSupercompression = 2;
	public static inline var Zlib:TextureContainerSupercompression = 3;
}
