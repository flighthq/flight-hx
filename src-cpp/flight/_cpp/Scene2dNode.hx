package flight._cpp;

// Opaque index into a Scene2dApp-owned native graph. No public Int -> handle conversion is
// provided: only the owning backend creates handles.
abstract Scene2dNode(Int) to Int {}
