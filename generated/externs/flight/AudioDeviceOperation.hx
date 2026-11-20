package flight;

abstract AudioDeviceOperation(Int) from Int to Int {
	public static inline var CreateBuffer:AudioDeviceOperation = 0;
	public static inline var CreateDevice:AudioDeviceOperation = 1;
	public static inline var CreateSource:AudioDeviceOperation = 2;
	public static inline var DestroyBuffer:AudioDeviceOperation = 3;
	public static inline var DestroyDevice:AudioDeviceOperation = 4;
	public static inline var DestroySource:AudioDeviceOperation = 5;
	public static inline var FadeSourceGain:AudioDeviceOperation = 6;
	public static inline var GetDeviceTime:AudioDeviceOperation = 7;
	public static inline var OnSourceEnded:AudioDeviceOperation = 8;
	public static inline var ResumeDevice:AudioDeviceOperation = 9;
	public static inline var SetSourceGain:AudioDeviceOperation = 10;
	public static inline var SetSourcePan:AudioDeviceOperation = 11;
	public static inline var SetSourcePlaybackRate:AudioDeviceOperation = 12;
	public static inline var StartSource:AudioDeviceOperation = 13;
	public static inline var StopSource:AudioDeviceOperation = 14;
}
