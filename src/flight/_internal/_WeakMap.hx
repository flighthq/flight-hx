package flight._internal;

#if js
typedef _WeakMap<K, V> = js.lib.WeakMap<V>;
#else
/**
  Lookup-compatible fallback for targets without weak references. Entries are strongly held, so
  long-lived hosts should clear the map at lifecycle boundaries.
**/
class _WeakMap<K, V> extends _Map<K, V> {
  public function new(?entries:Array<Array<Dynamic>>) {
    super(entries);
  }
}
#end
