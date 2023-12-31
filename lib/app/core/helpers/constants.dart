class Constants {
  Constants._();

  static const envBaseUrl = 'http://localhost:3000/meu_ponto/api';
  // static const envBaseUrl = 'http://localhost:3000/meu_ponto';
  static const restClientConnectTimeout = 90000;
  static const restClientReceiveTimeout = 90000;

  static const localStorageAccessTokenKey = 'LOCAL_STORAGE_ACCESS_TOKEN_KEY';
  static const localStorageRefreshTokenKey = 'LOCAL_STORAGE_REFRESH_TOKEN_KEY';
  static const localStorageUserLoggedDataKey =
      'LOCAL_STORAGE_USER_LOGGED_DATA_KEY';

  static const restClientAuthRequiredKey = 'auth_required';

  static const clientSession = 'CLIENT_SESSION';

  static const identidadeSession = 'IDENTIDADE_SESSION';

  static const urlIdentidadeAPI =
      'https://identidade.apps.dtcn.detran.ce.gov.br/identidade';
  static const identifierIdentidade =
      'APk9ThjW0DZupFCg-PZzKG7TfhollukjAvX2EjpN0ys';
  static const secretIdentidade = 'qb2_cAOZ7zBoAN79R8PHiEiTymqeZvMdIgy1VV2aLN8';
}
