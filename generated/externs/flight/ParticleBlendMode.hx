package flight;

abstract ParticleBlendMode(Int) from Int to Int {
	public static inline var Add:ParticleBlendMode = 0;
	public static inline var Multiply:ParticleBlendMode = 1;
	public static inline var Normal:ParticleBlendMode = 2;
	public static inline var Screen:ParticleBlendMode = 3;
}
