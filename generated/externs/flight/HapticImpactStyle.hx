package flight;

abstract HapticImpactStyle(Int) from Int to Int {
	public static inline var Light:HapticImpactStyle = 0;
	public static inline var Medium:HapticImpactStyle = 1;
	public static inline var Heavy:HapticImpactStyle = 2;
	public static inline var Soft:HapticImpactStyle = 3;
	public static inline var Rigid:HapticImpactStyle = 4;
}
