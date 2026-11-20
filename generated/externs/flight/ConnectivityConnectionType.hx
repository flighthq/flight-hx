package flight;

abstract ConnectivityConnectionType(Int) from Int to Int {
	public static inline var Wifi:ConnectivityConnectionType = 0;
	public static inline var Cellular:ConnectivityConnectionType = 1;
	public static inline var Ethernet:ConnectivityConnectionType = 2;
	public static inline var Bluetooth:ConnectivityConnectionType = 3;
	public static inline var Vpn:ConnectivityConnectionType = 4;
	public static inline var Wimax:ConnectivityConnectionType = 5;
	public static inline var Other:ConnectivityConnectionType = 6;
	public static inline var None:ConnectivityConnectionType = 7;
	public static inline var Unknown:ConnectivityConnectionType = 8;
}
