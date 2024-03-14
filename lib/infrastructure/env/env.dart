enum ENV {
  dev(baseURL: "https://devbe.bahaso.com/api/v2"),
  prod(baseURL: "https://devbe.bahaso.com/api/v2");

  final String baseURL;

  const ENV({required this.baseURL});

  static ENV current = ENV.dev;

  static void setEnv(ENV env) => current = env;
}
