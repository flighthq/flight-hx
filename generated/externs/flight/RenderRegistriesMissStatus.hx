package flight;

abstract RenderRegistriesMissStatus(Int) from Int to Int {
	public static inline var Complete:RenderRegistriesMissStatus = 0;
	public static inline var MissesRecorded:RenderRegistriesMissStatus = 1;
}
