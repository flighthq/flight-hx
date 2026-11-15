package flight;

abstract UnityParticleShapeType(Int) from Int to Int {
	public static inline var Sphere:UnityParticleShapeType = 0;
	public static inline var Hemisphere:UnityParticleShapeType = 1;
	public static inline var Cone:UnityParticleShapeType = 2;
	public static inline var Box:UnityParticleShapeType = 3;
	public static inline var Circle:UnityParticleShapeType = 4;
	public static inline var Edge:UnityParticleShapeType = 5;
	public static inline var Rectangle:UnityParticleShapeType = 6;
	public static inline var Donut:UnityParticleShapeType = 7;
}
