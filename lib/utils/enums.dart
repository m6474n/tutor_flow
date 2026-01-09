

enum EnvKey {
  projectURL('SUPABASE_PROJECT_URL'),
  databasePassword('DATABASE_PASSWORD'),
  publisherKey('SUPABASE_PUBLISHER_KEY');

  final String key;
  const EnvKey(this.key);
}