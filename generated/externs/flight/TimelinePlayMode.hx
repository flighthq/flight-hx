package flight;

abstract TimelinePlayMode(Int) from Int to Int {
	public static inline var Loop:TimelinePlayMode = 0;
	public static inline var Once:TimelinePlayMode = 1;
}
