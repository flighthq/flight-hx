// Generated SDK archives must survive case-insensitive Windows/macOS filesystems.
export function assertPortablePaths(paths) {
  const seen = new Map();
  for (const filename of paths) {
    const key = filename.replaceAll('\\', '/').toLowerCase();
    if (seen.has(key)) throw new Error(`Case-insensitive filename collision: ${seen.get(key)} and ${filename}`);
    seen.set(key, filename);
  }
}
