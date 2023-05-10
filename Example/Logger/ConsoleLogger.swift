import Foundation

class ConsoleLogger: LoggingCompatible {

    // MARK: - Methods
    func setLoggingLevelToDefault() {
        #if DEBUG
        loggingLevel = LoggingLevel.debug
        #else
        if Constants.App.isTestBuild {
            loggingLevel = LoggingLevel.debug
        }
        else {
            loggingLevel = LoggingLevel.debug
        }
        #endif
    }

    let timeFormatter = DateFormatter()
    
    // MARK: - Lifecycle
    init() {
        setLoggingLevelToDefault()
        timeFormatter.dateFormat = "HH:mm:ss"
    }

    func setJobId(_ jobId: Int?, file: String, function: String, line: Int) {
        log(message: "JobId set to: \(jobId ?? 0)", logLevel: .info, file: file, function: function, line: line)
    }

    func setSearchDigest(_ searchDigest: String?, file: String, function: String, line: Int) {
        log(message: "setSearchDigest set to: \(searchDigest ?? "nil")", logLevel: .info, file: file, function: function, line: line)
    }

    var loggingLevel = LoggingLevel.debug

    func log(message: String, logLevel: LoggingLevel, file: String, function: String, line: Int) {
        if logLevel.configValue <= logger.consoleLogger.loggingLevel.configValue {
            write(message: message, logLevel: logLevel, file: file, function: function, line: line)
        }
    }
    
    private func write(message: String, logLevel: LoggingLevel, file: String, function: String, line: Int) {
        let logTime = Date()
        let logDateFormatted = timeFormatter.string(from: logTime)
        let fileName = URL(fileURLWithPath: file).lastPathComponent
        let messageWithLocation = "\(logDateFormatted) \(logLevel.emoji) \(logLevel.consolePrefix) [\(fileName):\(line) \(function)] \(message)"
        print(messageWithLocation)
    }

}
