// cloneMaterial must yield a clone the caller can read CONCRETE subclass fields off (e.g.
// StandardPbrMaterial.baseColor). On the structural typedef representation a base createEntity({ kind })
// plus a dynamic field copy suffices. On the nominal class representation that base entity has no
// subclass fixed-field layout, so a later `.baseColor` read faults on hxcpp (the Horse Stacker null
// crash: cloneHierarchy -> toPreviewMaterial -> blended.baseColor). A runtime-kind clone cannot be
// closed to a concrete class statically, but the source already IS its concrete class, so allocate the
// clone as that same class. Fall back to the base path when the source has no reflectable class (an
// open/vendor material built directly through createEntity), which carries no concrete field layout.
#if flight_struct_typedef
final clone:Material = cast createEntity({ kind: source.kind });
#else
final sourceClass = Type.getClass((source : Dynamic));
final clone:Material = sourceClass == null
  ? cast createEntity({ kind: source.kind })
  : cast createEntity((cast Type.createEmptyInstance(sourceClass) : Material));
#end
copyMaterialFields__material(clone, source, source.kind);
return clone;
