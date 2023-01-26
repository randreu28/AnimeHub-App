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

String _$parseJsonToAnimeHash() => r'6dd91426ccf5528428eb08aaf0305086c8d282c5';

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

String _$loadAnimeHash() => r'99f6734fed0b4e2a30e24fe75c5706a6097e77ba';

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

String _$loadTopAnimesHash() => r'e2a18433f0bde0bc12a6514f69ffc38acb65fec5';

/// See also [loadTopAnimes].
final loadTopAnimesProvider = AutoDisposeFutureProvider<List<Anime>>(
  loadTopAnimes,
  name: r'loadTopAnimesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loadTopAnimesHash,
);
typedef LoadTopAnimesRef = AutoDisposeFutureProviderRef<List<Anime>>;
String _$loadRandomAnimeHash() => r'80edef08e27ee728e4ecf3b3189dad9bbeeab028';

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
    r'3380b57e64e9ab24c7e5a6b359825797025a94d2';

/// See also [loadUpcomingSeasons].
final loadUpcomingSeasonsProvider = AutoDisposeFutureProvider<List<Anime>>(
  loadUpcomingSeasons,
  name: r'loadUpcomingSeasonsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loadUpcomingSeasonsHash,
);
typedef LoadUpcomingSeasonsRef = AutoDisposeFutureProviderRef<List<Anime>>;
String _$loadAnimeSearchHash() => r'2029005e4a43c14b02f9613e2c03cfd7f3ca0ba6';

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

String _$loadRandomCompletedAnimeHash() =>
    r'10e83522550cb9bd404b86712f694fda3e266e4e';

/// See also [loadRandomCompletedAnime].
final loadRandomCompletedAnimeProvider = AutoDisposeFutureProvider<int>(
  loadRandomCompletedAnime,
  name: r'loadRandomCompletedAnimeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loadRandomCompletedAnimeHash,
);
typedef LoadRandomCompletedAnimeRef = AutoDisposeFutureProviderRef<int>;
String _$loadUserHash() => r'caba9226cd92604772da8dca4c6bd96a024d3280';

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
    r'ab305ac522c3ee1bedebb1b1bda336eabdef6874';

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

String _$loadStatusIDsHash() => r'a4e36078ca2267d032dbf5dca8af6898d6383c4a';

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

String _$loadFavoriteIDsHash() => r'cc5b51fc4dbc7c0f99111a4af862bf6e34803171';

/// See also [loadFavoriteIDs].
final loadFavoriteIDsProvider = AutoDisposeFutureProvider<List<int>>(
  loadFavoriteIDs,
  name: r'loadFavoriteIDsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loadFavoriteIDsHash,
);
typedef LoadFavoriteIDsRef = AutoDisposeFutureProviderRef<List<int>>;
String _$loadGenresHash() => r'd4618728b8977bc9f89b62da122ddf7cb543cad2';

/// See also [loadGenres].
final loadGenresProvider = AutoDisposeFutureProvider<Map<String, int>>(
  loadGenres,
  name: r'loadGenresProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loadGenresHash,
);
typedef LoadGenresRef = AutoDisposeFutureProviderRef<Map<String, int>>;
