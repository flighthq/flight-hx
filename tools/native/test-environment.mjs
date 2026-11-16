import { existsSync } from 'node:fs';
import path from 'node:path';
export function testEnvironment(root) {
  const environment = { ...process.env };
  const neko = process.env.FLIGHT_NEKO_ROOT ?? path.join(root, '.artifacts/neko');
  const haxe = path.join(root, '.haxe/4.3.7');
  const paths = [haxe];
  if (existsSync(path.join(neko, 'neko'))) {
    paths.push(neko);
    environment.NEKOPATH = neko;
    environment.LD_LIBRARY_PATH = [neko, environment.LD_LIBRARY_PATH].filter(Boolean).join(path.delimiter);
  }
  environment.PATH = [...paths, process.env.PATH].join(path.delimiter);
  environment.HAXE_STD_PATH = path.join(haxe, 'std');
  environment.HAXELIB_PATH = path.join(root, '.haxelib');
  environment.HXCPP_COMPILE_THREADS = process.env.HXCPP_COMPILE_THREADS ?? '1';
  return environment;
}
