enum Status {
  success('success'),
  error('error');

  ///the json property holds the strign value of the enum status
  ///in the transformer we will check whether the
  const Status(this.json);
  final String json;
}

extension StatusX on String {
  Status get status {
    return Status.values.firstWhere(
      (element) => element.json == this,
      orElse: () => throw Exception('No status type defined for $this'),
    );
  }
}
