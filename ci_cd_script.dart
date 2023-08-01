import 'dart:io';

void main() {
  final command = 'melos bootstrap';
  final result = Process.runSync('powershell', ['-Command', command]);

  print(result.stdout);
  print(result.stderr);
  print(result.exitCode);
}
