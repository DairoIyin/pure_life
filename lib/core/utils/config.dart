enum Environment { stage, prod }

class AppConfig {
  AppConfig._();
  static Environment environment = Environment.stage;
  static String baseUrl = 'BASE_URL';
  static Future<void> init(
      {Environment environment = Environment.stage}) async {
    AppConfig.environment = environment;
    AppConfig.setEnvironment(environment);
  }

  static void setEnvironment(Environment environment) {
    AppConfig.environment = environment;
    switch (environment) {
      case Environment.stage:
        baseUrl = 'https://staging-api.fusionintel.io';
        break;
      case Environment.prod:
        baseUrl = 'https://api.purelifehealth.io';
        break;
    }
  }
}
