package flight;

abstract WgpuHostAcquisitionOwnership(Int) from Int to Int {
	public static inline var Caller:WgpuHostAcquisitionOwnership = 0;
	public static inline var Flight:WgpuHostAcquisitionOwnership = 1;
}
