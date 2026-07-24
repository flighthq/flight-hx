import { existsSync } from 'node:fs';
import { spawnSync } from 'node:child_process';
import path from 'node:path';
import process from 'node:process';

const executable = path.join(process.cwd(), '.haxe', '4.3.7', process.platform === 'win32' ? 'haxe.exe' : 'haxe');
if (!existsSync(executable)) {
  process.stderr.write('The repository-local Haxe compiler is missing. Run npm run setup first.\n');
  process.exit(1);
}

const environment = {
  ...process.env,
  HAXE_STD_PATH: path.join(process.cwd(), '.haxe', '4.3.7', 'std'),
};
const arguments_ = process.argv.slice(2);
const result = spawnSync(executable, arguments_, { env: environment, stdio: 'inherit' });
if (result.error) throw result.error;
process.exit(result.status ?? 1);
