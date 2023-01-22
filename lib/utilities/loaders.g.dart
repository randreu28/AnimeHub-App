// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loaders.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String _$loadIsFavoriteHash() => r'6d52be3b6bbce871ce8eb42598f497876dc91d7c';

/// See also [loadIsFavorite].
class LoadIsFavoriteProvider extends AutoDisposeFutureProvider<bool> {
  LoadIsFavoriteProvider({
    required this.animeID,
  }) : super(
          (ref) => loadIsFavorite(
            ref,
            animeID: animeID,
          ),
          from: loadIsFavoriteProvider,
          name: r'loadIsFavoriteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loadIsFavoriteHash,
        );

  final int animeID;

  @override
  bool operator ==(Object other) {
    return other is LoadIsFavoriteProvider && other.animeID == animeID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, animeID.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef LoadIsFavoriteRef = AutoDisposeFutureProviderRef<bool>;

/// See also [loadIsFavorite].
final loadIsFavoriteProvider = LoadIsFavoriteFamily();

class LoadIsFavoriteFamily extends Family<AsyncValue<bool>> {
  LoadIsFavoriteFamily();

  LoadIsFavoriteProvider call({
    required int animeID,
  }) {
    return LoadIsFavoriteProvider(
      animeID: animeID,
    );
  }

  @override
  AutoDisposeFutureProvider<bool> getProviderOverride(
    covariant LoadIsFavoriteProvider provider,
  ) {
    return call(
      animeID: provider.animeID,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'loadIsFavoriteProvider';
}

String _$loadStatusHash() => r'fb389d4d4f581bb3180d606da339de136d56c7f0';

/// See also [loadStatus].
class LoadStatusProvider extends AutoDisposeFutureProvider<AnimeStatus> {
  LoadStatusProvider({
    required this.animeID,
  }) : super(
          (ref) => loadStatus(
            ref,
            animeID: animeID,
          ),
          from: loadStatusProvider,
          name: r'loadStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loadStatusHash,
        );

  final int animeID;

  @override
  bool operator ==(Object other) {
    return other is LoadStatusProvider && other.animeID == animeID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, animeID.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef LoadStatusRef = AutoDisposeFutureProviderRef<AnimeStatus>;

/// See also [loadStatus].
final loadStatusProvider = LoadStatusFamily();

class LoadStatusFamily extends Family<AsyncValue<AnimeStatus>> {
  LoadStatusFamily();

  LoadStatusProvider call({
    required int animeID,
  }) {
    return LoadStatusProvider(
      animeID: animeID,
    );
  }

  @override
  AutoDisposeFutureProvider<AnimeStatus> getProviderOverride(
    covariant LoadStatusProvider provider,
  ) {
    return call(
      animeID: provider.animeID,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'loadStatusProvider';
}

String _$parseJsonToAnimeHash() => r'c14dee40a55a7a6e70211c3fd1d13abd3f0cb167';

/// See also [parseJsonToAnime].
class ParseJsonToAnimeProvider extends AutoDisposeFutureProvider<Anime> {
  ParseJsonToAnimeProvider({
    required this.json,
    required this.animeID,
    required this.hasDbData,
  }) : super(
          (ref) => parseJsonToAnime(
            ref,
            json: json,
            animeID: animeID,
            hasDbData: hasDbData,
          ),
          from: parseJsonToAnimeProvider,
          name: r'parseJsonToAnimeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$parseJsonToAnimeHash,
        );

  final dynamic json;
  final int animeID;
  final bool hasDbData;

  @override
  bool operator ==(Object other) {
    return other is ParseJsonToAnimeProvider &&
        other.json == json &&
        other.animeID == animeID &&
        other.hasDbData == hasDbData;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, json.hashCode);
    hash = _SystemHash.combine(hash, animeID.hashCode);
    hash = _SystemHash.combine(hash, hasDbData.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef ParseJsonToAnimeRef = AutoDisposeFutureProviderRef<Anime>;

/// See also [parseJsonToAnime].
final parseJsonToAnimeProvider = ParseJsonToAnimeFamily();

class ParseJsonToAnimeFamily extends Family<AsyncValue<Anime>> {
  ParseJsonToAnimeFamily();

  ParseJsonToAnimeProvider call({
    required dynamic json,
    required int animeID,
    required bool hasDbData,
  }) {
    return ParseJsonToAnimeProvider(
      json: json,
      animeID: animeID,
      hasDbData: hasDbData,
    );
  }

  @override
  AutoDisposeFutureProvider<Anime> getProviderOverride(
    covariant ParseJsonToAnimeProvider provider,
  ) {
    return call(
      json: provider.json,
      animeID: provider.animeID,
      hasDbData: provider.hasDbData,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'parseJsonToAnimeProvider';
}

String _$loadAnimeHash() => r'b56d970c822376b8588e0aee21dc134159e8ab7a';

/// See also [loadAnime].
class LoadAnimeProvider extends AutoDisposeFutureProvider<Anime> {
  LoadAnimeProvider({
    required this.animeID,
    required this.hasDbData,
  }) : super(
          (ref) => loadAnime(
            ref,
            animeID: animeID,
            hasDbData: hasDbData,
          ),
          from: loadAnimeProvider,
          name: r'loadAnimeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loadAnimeHash,
        );

  final int animeID;
  final bool hasDbData;

  @override
  bool operator ==(Object other) {
    return other is LoadAnimeProvider &&
        other.animeID == animeID &&
        other.hasDbData == hasDbData;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, animeID.hashCode);
    hash = _SystemHash.combine(hash, hasDbData.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef LoadAnimeRef = AutoDisposeFutureProviderRef<Anime>;

/// See also [loadAnime].
final loadAnimeProvider = LoadAnimeFamily();

class LoadAnimeFamily extends Family<AsyncValue<Anime>> {
  LoadAnimeFamily();

  LoadAnimeProvider call({
    required int animeID,
    required bool hasDbData,
  }) {
    return LoadAnimeProvider(
      animeID: animeID,
      hasDbData: hasDbData,
    );
  }

  @override
  AutoDisposeFutureProvider<Anime> getProviderOverride(
    covariant LoadAnimeProvider provider,
  ) {
    return call(
      animeID: provider.animeID,
      hasDbData: provider.hasDbData,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'loadAnimeProvider';
}

String _$loadTopAnimesHash() => r'ba3c75a9b5b5866b403ef72d0f99758203b10c98';

/// See also [loadTopAnimes].
final loadTopAnimesProvider = AutoDisposeFutureProvider<List<Anime>>(
  loadTopAnimes,
  name: r'loadTopAnimesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loadTopAnimesHash,
);
typedef LoadTopAnimesRef = AutoDisposeFutureProviderRef<List<Anime>>;
String _$loadRandomAnimeHash() => r'82d96583adcf22e76e0e16da1ee9ecba2104a636';

/// See also [loadRandomAnime].
final loadRandomAnimeProvider = AutoDisposeFutureProvider<Anime>(
  loadRandomAnime,
  name: r'loadRandomAnimeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loadRandomAnimeHash,
);
typedef LoadRandomAnimeRef = AutoDisposeFutureProviderRef<Anime>;
String _$loadUpcomingSeasonsHash() =>
    r'6a361b937d2db0e47219cb9377a5e586d6366fdb';

/// See also [loadUpcomingSeasons].
final loadUpcomingSeasonsProvider = AutoDisposeFutureProvider<List<Anime>>(
  loadUpcomingSeasons,
  name: r'loadUpcomingSeasonsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loadUpcomingSeasonsHash,
);
typedef LoadUpcomingSeasonsRef = AutoDisposeFutureProviderRef<List<Anime>>;
String _$loadAnimeSearchHash() => r'98406b4f63d42236c0512068fd2162ed63603e3b';

/// See also [loadAnimeSearch].
class LoadAnimeSearchProvider extends AutoDisposeFutureProvider<List<Anime?>> {
  LoadAnimeSearchProvider({
    required this.query,
    required this.genresID,
  }) : super(
          (ref) => loadAnimeSearch(
            ref,
            query: query,
            genresID: genresID,
          ),
          from: loadAnimeSearchProvider,
          name: r'loadAnimeSearchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loadAnimeSearchHash,
        );

  final String query;
  final List<int>? genresID;

  @override
  bool operator ==(Object other) {
    return other is LoadAnimeSearchProvider &&
        other.query == query &&
        other.genresID == genresID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);
    hash = _SystemHash.combine(hash, genresID.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef LoadAnimeSearchRef = AutoDisposeFutureProviderRef<List<Anime?>>;

/// See also [loadAnimeSearch].
final loadAnimeSearchProvider = LoadAnimeSearchFamily();

class LoadAnimeSearchFamily extends Family<AsyncValue<List<Anime?>>> {
  LoadAnimeSearchFamily();

  LoadAnimeSearchProvider call({
    required String query,
    required List<int>? genresID,
  }) {
    return LoadAnimeSearchProvider(
      query: query,
      genresID: genresID,
    );
  }

  @override
  AutoDisposeFutureProvider<List<Anime?>> getProviderOverride(
    covariant LoadAnimeSearchProvider provider,
  ) {
    return call(
      query: provider.query,
      genresID: provider.genresID,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'loadAnimeSearchProvider';
}

String _$loadRandomWatchingAnimeHash() =>
    r'c89b67295eca9519fc75493793c2f02626630d78';

/// See also [loadRandomWatchingAnime].
final loadRandomWatchingAnimeProvider = AutoDisposeFutureProvider<int>(
  loadRandomWatchingAnime,
  name: r'loadRandomWatchingAnimeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loadRandomWatchingAnimeHash,
);
typedef LoadRandomWatchingAnimeRef = AutoDisposeFutureProviderRef<int>;
String _$loadUserHash() => r'5e2a902f2a4decef2e1549c030c22784ded42e6b';

/// See also [loadUser].
class LoadUserProvider extends AutoDisposeFutureProvider<User> {
  LoadUserProvider({
    required this.username,
  }) : super(
          (ref) => loadUser(
            ref,
            username: username,
          ),
          from: loadUserProvider,
          name: r'loadUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loadUserHash,
        );

  final String username;

  @override
  bool operator ==(Object other) {
    return other is LoadUserProvider && other.username == username;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, username.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef LoadUserRef = AutoDisposeFutureProviderRef<User>;

/// See also [loadUser].
final loadUserProvider = LoadUserFamily();

class LoadUserFamily extends Family<AsyncValue<User>> {
  LoadUserFamily();

  LoadUserProvider call({
    required String username,
  }) {
    return LoadUserProvider(
      username: username,
    );
  }

  @override
  AutoDisposeFutureProvider<User> getProviderOverride(
    covariant LoadUserProvider provider,
  ) {
    return call(
      username: provider.username,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'loadUserProvider';
}

String _$loadRecommendationsHash() =>
    r'd14bd3438d4d879a592c45aa045eb9a043d05f48';

/// See also [loadRecommendations].
class LoadRecommendationsProvider
    extends AutoDisposeFutureProvider<List<Anime>> {
  LoadRecommendationsProvider({
    required this.animeID,
  }) : super(
          (ref) => loadRecommendations(
            ref,
            animeID: animeID,
          ),
          from: loadRecommendationsProvider,
          name: r'loadRecommendationsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loadRecommendationsHash,
        );

  final int animeID;

  @override
  bool operator ==(Object other) {
    return other is LoadRecommendationsProvider && other.animeID == animeID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, animeID.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef LoadRecommendationsRef = AutoDisposeFutureProviderRef<List<Anime>>;

/// See also [loadRecommendations].
final loadRecommendationsProvider = LoadRecommendationsFamily();

class LoadRecommendationsFamily extends Family<AsyncValue<List<Anime>>> {
  LoadRecommendationsFamily();

  LoadRecommendationsProvider call({
    required int animeID,
  }) {
    return LoadRecommendationsProvider(
      animeID: animeID,
    );
  }

  @override
  AutoDisposeFutureProvider<List<Anime>> getProviderOverride(
    covariant LoadRecommendationsProvider provider,
  ) {
    return call(
      animeID: provider.animeID,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'loadRecommendationsProvider';
}

String _$loadStatusIDsHash() => r'640be8b93755543c3dec24fdbf380011ba7951a9';

/// See also [loadStatusIDs].
class LoadStatusIDsProvider extends AutoDisposeFutureProvider<List<int>> {
  LoadStatusIDsProvider({
    required this.status,
  }) : super(
          (ref) => loadStatusIDs(
            ref,
            status: status,
          ),
          from: loadStatusIDsProvider,
          name: r'loadStatusIDsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loadStatusIDsHash,
        );

  final AnimeStatus status;

  @override
  bool operator ==(Object other) {
    return other is LoadStatusIDsProvider && other.status == status;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef LoadStatusIDsRef = AutoDisposeFutureProviderRef<List<int>>;

/// See also [loadStatusIDs].
final loadStatusIDsProvider = LoadStatusIDsFamily();

class LoadStatusIDsFamily extends Family<AsyncValue<List<int>>> {
  LoadStatusIDsFamily();

  LoadStatusIDsProvider call({
    required AnimeStatus status,
  }) {
    return LoadStatusIDsProvider(
      status: status,
    );
  }

  @override
  AutoDisposeFutureProvider<List<int>> getProviderOverride(
    covariant LoadStatusIDsProvider provider,
  ) {
    return call(
      status: provider.status,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'loadStatusIDsProvider';
}
