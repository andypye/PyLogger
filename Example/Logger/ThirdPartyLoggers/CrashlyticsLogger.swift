// Commented out for now, until decide whether to make firebase part of this

//import Foundation
//import FirebaseCrashlytics
//
//class CrashlyticsLogger: LoggingCompatible {
//
//    // MARK: Properties
//    // This is the debug detail associated with a crash
//    var loggingLevel = LoggingLevel.debug
//
//    // MARK: Computed Properties
//    // Level at which we log non-fatals, ie important errors only
//    var nonFatalErrorLogLevel: LoggingLevel {
//        if Constants.App.isTestBuild {
//            return LoggingLevel.warning
//        } else {
//            return LoggingLevel.error
//        }
//    }
//
//    // MARK: - Lifecycle
//    init() {
//        setLoggingLevelToDefault()
//    }
//
//    // MARK: - Methods
//    func setLoggingLevelToDefault() {
//        #if DEBUG
//        loggingLevel = LoggingLevel.debug
//        #else
//        if Constants.App.isTestBuild {
//            loggingLevel = LoggingLevel.debug
//        }
//        else {
//            loggingLevel = LoggingLevel.debug
//        }
//        #endif
//    }
//
//    func log(message: String, logLevel: LoggingLevel, file: String, function: String, line: Int) {
//        if logLevel.configValue <= loggingLevel.configValue {
//            writeDebugInfo(message: message, logLevel: logLevel, file: file, function: function, line: line)
//        }
//        if logLevel.configValue <= nonFatalErrorLogLevel.configValue {
//            writeNonFatalError(message: message, logLevel: logLevel, file: file, function: function, line: line)
//        }
//    }
//
//    private func writeDebugInfo(message: String, logLevel: LoggingLevel, file: String, function: String, line: Int) {
//        let logDate = Date()
//        let fileName = URL(fileURLWithPath: file).lastPathComponent
//        let messageWithLocation = "\(logDate) \(logLevel.emoji) \(logLevel.prefix.uppercased() ): [\(fileName):\(line) \(function)]  \(message)"
//        Crashlytics.crashlytics().log("\(messageWithLocation)")
//    }
//
//    private func writeNonFatalError(message: String, logLevel: LoggingLevel, file: String, function: String, line: Int) {
//        let logDate = Date()
//        let fileName = URL(fileURLWithPath: file).lastPathComponent
//        let messageWithLocation = "\(logDate) \(logLevel.emoji) \(logLevel.prefix.uppercased() ): [\(fileName):\(line) \(function)]  \(message)"
//        let userInfo = ["message" : messageWithLocation]
//        let error = NSError(domain: "\(fileName).\(function)", code: -1001, userInfo: userInfo)
//        Crashlytics.crashlytics().record(error: error) // , withAdditionalUserInfo: userInfo)
//    }
//
//    func setJobId(_ jobId: Int?, file: String, function: String, line: Int) {
//        Crashlytics.crashlytics().setCustomValue(jobId ?? 0, forKey: Constants.Crashlytics.Keys.jobId)
//    }
//
//    func setSearchDigest(_ searchDigest: String?, file: String, function: String, line: Int) {
//        Crashlytics.crashlytics().setCustomValue(searchDigest, forKey: Constants.Crashlytics.Keys.searchDigest)
//    }
//}
//
//extension Constants {
//    struct Crashlytics {
//        struct Keys {
//            static let jobId = "job_id"
//            static let searchDigest = "latest_search_digest"
//        }
//    }
//}
//
////TODO: make these conform to LoggingMechanism Protocol
