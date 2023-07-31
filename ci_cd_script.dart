import 'dart:io';
void main() {
  final command = 'melos bootstrap';
 
  final result = Process.runSync('cmd.exe', ['/c', command], runInShell: true);
  print(result.stdout);
  print(result.stderr);
  print(result.exitCode);
}