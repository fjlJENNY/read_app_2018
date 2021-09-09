// 全局 config

class Config {
  // 系统环境
  static const Env env = Env.develop;

  static const String sentryDsn =
      "https://d3eaa304ec4b4e3b97061c6f6b4127ff@o877289.ingest.sentry.io/5951591";
}

enum Env {
  develop,
  product,
}
