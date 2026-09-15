package flight._internal;

#if js
typedef _WeakSet<T> = js.lib.WeakSet;
#else
/** Strong-retention fallback for targets without weak references. */
class _WeakSet<T> extends _Set<T> {
  public function new(?values:Array<T>) {
    super(values);
  }
}
#end
