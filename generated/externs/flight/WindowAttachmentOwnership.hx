package flight;

abstract WindowAttachmentOwnership(Int) from Int to Int {
	public static inline var Host:WindowAttachmentOwnership = 0;
	public static inline var Flight:WindowAttachmentOwnership = 1;
}
