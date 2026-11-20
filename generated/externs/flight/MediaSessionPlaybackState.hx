package flight;

abstract MediaSessionPlaybackState(Int) from Int to Int {
	public static inline var None:MediaSessionPlaybackState = 0;
	public static inline var Paused:MediaSessionPlaybackState = 1;
	public static inline var Playing:MediaSessionPlaybackState = 2;
}
