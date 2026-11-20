package flight;

abstract MediaSessionAction(Int) from Int to Int {
	public static inline var Play:MediaSessionAction = 0;
	public static inline var Pause:MediaSessionAction = 1;
	public static inline var Stop:MediaSessionAction = 2;
	public static inline var SeekBackward:MediaSessionAction = 3;
	public static inline var SeekForward:MediaSessionAction = 4;
	public static inline var SeekTo:MediaSessionAction = 5;
	public static inline var PreviousTrack:MediaSessionAction = 6;
	public static inline var NextTrack:MediaSessionAction = 7;
	public static inline var SkipAd:MediaSessionAction = 8;
}
