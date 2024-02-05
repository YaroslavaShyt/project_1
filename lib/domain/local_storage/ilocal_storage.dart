abstract interface class ILocalStorage{
  Future<void> save(String key, dynamic data);
  Future<dynamic> read(String key);
  Future<void> delete(String key);
  Future<void> deleteAll();
}