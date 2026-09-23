import 'package:flutter-bloc/errors/repository_error.dart';
import 'package:talker/talker.dart';

abstract class Repository {
  final Talker talker;

  const Repository({
    required this.talker,
  });

  Future<T> safeCode<T>(Future<T> Function() block) async {
    try {
      return await block();
    } catch (error) {
      throw RepositoryError(error);
    }
  }
}

extension RepositoryStream<T> on Stream<T> {
  Stream<T> safeCode() => handleError((error) => RepositoryError(error));
}
