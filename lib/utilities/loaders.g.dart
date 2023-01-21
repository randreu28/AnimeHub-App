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
