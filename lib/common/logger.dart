import 'package:logger/logger.dart';

Logger _logger = Logger(); // Private default logger

Logger get logger => _logger;
set logger(Logger newLogger) => _logger = newLogger;
