package flight;

abstract TimeZoneNameStyle(Int) from Int to Int {
	public static inline var Short:TimeZoneNameStyle = 0;
	public static inline var Long:TimeZoneNameStyle = 1;
	public static inline var ShortOffset:TimeZoneNameStyle = 2;
	public static inline var LongOffset:TimeZoneNameStyle = 3;
	public static inline var ShortGeneric:TimeZoneNameStyle = 4;
	public static inline var LongGeneric:TimeZoneNameStyle = 5;
}
