package flight;

abstract TextureAtlasFrameTagDirection(Int) from Int to Int {
	public static inline var Forward:TextureAtlasFrameTagDirection = 0;
	public static inline var PingPong:TextureAtlasFrameTagDirection = 1;
	public static inline var PingPongReverse:TextureAtlasFrameTagDirection = 2;
	public static inline var Reverse:TextureAtlasFrameTagDirection = 3;
}
