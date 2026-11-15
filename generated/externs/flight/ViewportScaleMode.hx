package flight;

abstract ViewportScaleMode(Int) from Int to Int {
	public static inline var ExactFit:ViewportScaleMode = 0;
	public static inline var NoBorder:ViewportScaleMode = 1;
	public static inline var NoScale:ViewportScaleMode = 2;
	public static inline var ShowAll:ViewportScaleMode = 3;
}
