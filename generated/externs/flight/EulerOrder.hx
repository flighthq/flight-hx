package flight;

abstract EulerOrder(Int) from Int to Int {
	public static inline var XYZ:EulerOrder = 0;
	public static inline var XZY:EulerOrder = 1;
	public static inline var YXZ:EulerOrder = 2;
	public static inline var YZX:EulerOrder = 3;
	public static inline var ZXY:EulerOrder = 4;
	public static inline var ZYX:EulerOrder = 5;
}
