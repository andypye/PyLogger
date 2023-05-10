import Foundation

protocol LoggingCompatible {
    var loggingLevel: LoggingLevel { get set }
    // MARK: General
    func log(message: String, logLevel: LoggingLevel, file: String, function: String, line: Int)

    // MARK: - Setting meta data
    func setJobId(_ jobId: Int?, file: String, function: String, line: Int)
    func setSearchDigest(_ searchDigest: String?, file: String, function: String, line: Int)
    func setLoggingLevelToDefault()
}
