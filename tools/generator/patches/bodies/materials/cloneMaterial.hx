// cloneMaterial must yield a clone the caller can read CONCRETE subclass fields off (e.g.
// StandardPbrMaterial.baseColor). Under the allocate/initialize model `allocateEntity<Material>()`
// allocates a base Material, which on the nominal class representation has no subclass fixed-field
// layout, so copyMaterialFields writes and later `.baseColor` reads fault on hxcpp (the Horse Stacker
// cloneHierarchy -> toPreviewMaterial -> blended.baseColor null crash). The source already IS its
// concrete class, so allocate the clone as that same class; fall back to a base structural clone when
// the source has no reflectable class (an open/vendor material).
#if flight_struct_typedef
final clone:Material = cast {};
#else
final sourceClass = Type.getClass((source : Dynamic));
final clone:Material = sourceClass == null ? (cast {} : Material) : (cast Type.createEmptyInstance(sourceClass) : Material);
#end
_Runtime.setField(clone, 'kind', source.kind);
copyMaterialFields__material(clone, source, source.kind);
return clone;
