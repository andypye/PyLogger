import Foundation

var logger = Logger.shared

class Logger {

    var loggingLevel = LoggingLevel.debug
    var consoleLogger: LoggingCompatible = ConsoleLogger()
    var crashlyticsLogger: LoggingCompatible?
    static let shared = Logger()

    // // MARK: - methods
    private init(crashlyticsLogger: LoggingCompatible? = nil) {
        self.crashlyticsLogger = crashlyticsLogger
        setLoggingLevelToDefault()
    }

    func setCrashlyticsLogger(crashlyticsLogger: LoggingCompatible) {
        self.crashlyticsLogger = crashlyticsLogger
    }

    func setLoggingLevelToDefault() {
        #if DEBUG
        loggingLevel = LoggingLevel.debug
        consoleLogger.loggingLevel = LoggingLevel.debug
        crashlyticsLogger?.loggingLevel = LoggingLevel.debug
        #else
        if Constants.App.isTestBuild {
            loggingLevel = LoggingLevel.warning
            consoleLogger.loggingLevel = LoggingLevel.warning
            crashlyticsLogger?.loggingLevel = LoggingLevel.debug
        }
        else {
            loggingLevel = LoggingLevel.error
            consoleLogger.loggingLevel = LoggingLevel.warning
        }
        #endif
        consoleLogger.setLoggingLevelToDefault()
        crashlyticsLogger?.setLoggingLevelToDefault()
    }

    func debug(_ message: String, _ file: String = #file, function: String = #function, line: Int = #line) {
        log(message: message, logLevel: LoggingLevel.debug, file: file, function: function, line: line)
    }

    func info(_ message: String, _ file: String = #file, function: String = #function, line: Int = #line) {
        log(message: message, logLevel: LoggingLevel.info, file: file, function: function, line: line)
    }

    func warning(_ message: String, _ file: String = #file, function: String = #function, line: Int = #line) {
        log(message: message, logLevel: LoggingLevel.warning, file: file, function: function, line: line)
    }

    func error(_ message: String, _ file: String = #file, function: String = #function, line: Int = #line) {
        log(message: message, logLevel: LoggingLevel.error, file: file, function: function, line: line)
        StoredValues.userExperienceScore -= 1
    }

    func seriousError(_ message: String, _ file: String = #file, _ function: String = #function, line: Int = #line) {
        log(message: "SERIOUS ERROR: \(message)", logLevel: LoggingLevel.error, file: file, function: function, line: line)
        StoredValues.userExperienceScore -= 5
    }

    func fatalError(_ message: String, _ file: String = #file, function: String = #function, line: Int = #line) {
        log(message: message, logLevel: LoggingLevel.fatal, file: file, function: function, line: line)
        StoredValues.userExperienceScore -= 20
    }

    func deinitDebug(_ file: String = #file, function: String = #function, line: Int = #line) {
        log(message: "deinit", logLevel: LoggingLevel.debug, file: file, function: function, line: line)
    }

    func networking(request: URLRequest, logLevel: LoggingLevel, file: String = #file, function: String = #function, line: Int = #line) {
        let method = request.httpMethod ?? "nil"
        let path = request.url?.absoluteString ?? "nil"
        let fullMessage: String = buildMessage(lines: ["API call: \(method) URL: \(path)"])
        log(message: fullMessage, logLevel: logLevel, file: file, function: function, line: line)
    }

    func log(message: String, logLevel: LoggingLevel, file: String = #file, function: String = #function, line: Int = #line) {
        consoleLogger.log(message: message, logLevel: logLevel, file: file, function: function, line: line)
        crashlyticsLogger?.log(message: message, logLevel: logLevel, file: file, function: function, line: line)
    }

    // MARK: - Specific set ids
    func setJobId(_ jobId: Int?, file: String = #file, function: String = #function, line: Int = #line) {
        crashlyticsLogger?.setJobId(jobId, file: file, function: function, line: line)
        consoleLogger.setJobId(jobId, file: file, function: function, line: line)
    }

    func setSearchDigest(_ searchDigest: String?, file: String = #file, function: String = #function, line: Int = #line)  {
        crashlyticsLogger?.setSearchDigest(searchDigest, file: file, function: function, line: line)
        consoleLogger.setSearchDigest(searchDigest, file: file, function: function, line: line)
    }

    func buildMessage(lines: [String]) -> String {
        var message: String = ""
        for line in lines {
            if message.isEmpty == true {
                message = "\(line.trimmed)"
            } else {
                message = "\(message.trimmed)\n\(line.trimmed)"
            }
        }
        return message
    }
    
}
