package flight;

abstract TimelineFrameEntryCause(Int) from Int to Int {
	public static inline var Advance:TimelineFrameEntryCause = 0;
	public static inline var Seek:TimelineFrameEntryCause = 1;
}
