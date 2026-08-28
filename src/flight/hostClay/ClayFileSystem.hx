// Maintained host adapter: Flight filesystem backend for the Clay host.
// Clay counterpart of flight.hostLime.LimeFileSystem. SKELETON: the operation
// set is the fill-in — sys.io.File/FileSystem on native (Clay targets hxcpp),
// mirroring LimeFileSystem's read/write/atomic-write/symlink surface. Left as a
// typed stub so the seam is installable and Flight-side type-correct.
package flight.hostClay;

#if clay
import flight.types.FileSystemBackend;

class ClayFileSystem {
  /** Allocation entry point, Flight-style: `createClayFileSystemBackend()`. */
  public static function createClayFileSystemBackend():FileSystemBackend {
    // TODO(hostClay): implement read/write/atomic-write/symlink over sys.io on
    // native (the same surface LimeFileSystem provides); return the sentinel
    // shape upstream expects for unsupported operations off-native.
    return cast {};
  }
}
#end
