import path from 'node:path';
import { resolveDependency } from '../../scripts/dependencyLock.mjs';
import { prepareFlight } from '../flight-source.mjs';
import { run } from '../externs/generate.mjs';
const root = path.resolve(import.meta.dirname, '../..');
const source = prepareFlight(root, resolveDependency(root, 'flight').directory, run);
process.stdout.write(run('cargo', ['test', '-p', 'flight-bindgen', '--bin', 'flight-bindgen', '--locked', '--offline'], source));
process.stdout.write(run('cargo', ['test', '-p', 'flight-ffi', '--lib', '--locked', '--offline'], source));
