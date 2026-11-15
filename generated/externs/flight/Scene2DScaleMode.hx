package flight;

abstract Scene2DScaleMode(Int) from Int to Int {
	public static inline var ExactFit:Scene2DScaleMode = 0;
	public static inline var NoBorder:Scene2DScaleMode = 1;
	public static inline var NoScale:Scene2DScaleMode = 2;
	public static inline var ShowAll:Scene2DScaleMode = 3;
}
