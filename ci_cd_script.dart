import 'dart:io';

void main() {
  final command = 'melos ls';

  // final result = Process.runSync('sh', ['-c', command], runInShell: true);
  final result = Process.runSync('cmd.exe', ['/c', command], runInShell: true);
  // final result = Process.runSync('powershell', ['-Command', command]);

  print(result.stdout);
  print(result.stderr);
  print(result.exitCode);
}
