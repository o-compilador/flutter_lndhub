// TODO remove me
// ignore_for_file: public_member_api_docs

enum AccountType {
  common,
  test,
  core,
}

extension AccountTypeValue on AccountType {
  static const accountTypes = {
    AccountType.common: 'common',
    AccountType.core: 'core',
    AccountType.test: 'test',
  };

  String get value => accountTypes[this]!;
}
