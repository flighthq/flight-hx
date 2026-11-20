# Flight producer patches

`manifest.json` lists the active patch stack for Flight `c52653a12e10251ab93970f71a6bc0c4dcbe21fa`. The prepare step
applies the patches in order to an isolated checkout. The extern and native
artifact manifests record their hashes.

- `0015-workspace-lock.patch` updates Flight's Cargo lock for the new workspace
  host crates so source preparation works with Cargo's locked mode.
- `0016-esm-host-seams.patch` emits typed app, browser surface, browser input,
  Electron, Tauri, and Capacitor bindings for existing public TypeScript APIs.
- `0017-binding-carriers-and-fields.patch` restores owned byte readers,
  command-history signals, public fields on re-exported types, string fields,
  and inherited ESM node properties. It uses native accessors for Ref-backed
  fields on HashLink and corrects ESM export names and font construction.
  Native node handles and owned byte results use Flight's upstream API.
- `0018-typescript-esm-externs.patch` generates `flight.esm` facades and types
  from the SDK's TypeScript package export maps with TypeScript 5.9.3.

Native desktop and headless host-provider FFI remains TODO.
