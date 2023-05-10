import Foundation

enum LoggingLevel: Int {
    case off
    case debug
    case info
    case warning
    case error
    case fatal

    var label: String {
        switch self {
        case .off:
            return "Off"
        case .debug:
            return "Debug, Info, Warnings, Errors"
        case .info:
            return "Info, Warnings, Errors"
        case .warning:
            return "Warnings, Errors"
        case .error:
            return "Errors and Fatal Errors"
        case .fatal:
            return "Fatal Errors only"
        }
    }

    var emoji: String {
        switch self {
        case .off:
            return ""
        case .debug:
            return "🔵"
        case .info:
            return "🟢"
        case .warning:
            return "🟠"
        case .error:
            return "🔴"
        case .fatal:
            return "🔴"
        }
    }

    var prefix: String {
        switch self {
        case .off:
            return "Off"
        case .debug:
            return "Debug"
        case .info:
            return "Info"
        case .warning:
            return "Warning"
        case .error:
            return "Error"
        case .fatal:
            return "Fatal Error"
        }
    }
    
    var consolePrefix: String {
        switch self {
        case .off:
            return "Off"
        case .debug:
            return "Debug  "
        case .info:
            return "Info   "
        case .warning:
            return "Warning"
        case .error:
            return "Error  "
        case .fatal:
            return "Fatal  "
        }
    }

    // This is the value in derwent
    var configValue: Int {
        switch self {
        case .off:
            //  Don’t log anything at all.
            return 0
        case .debug:
            // With DEBUG, you start to include more granular, diagnostic information.
            // Getting into “noisy” territory and furnishing more information than you’d want in normal production situations.
            // You’re providing detailed diagnostic information for fellow developers.
            return 4
        case .info:
            // INFO messages correspond to normal application behavior and milestones.
            // You probably won’t care too much about these entries during normal operations, but they provide the skeleton of what happened.
            // A service started or stopped, saved a job etc
            return 3
        case .warning:
            // To indicate that you might have a problem and that you’ve detected an unusual situation.
            // Maybe you were trying to invoke a service and it failed a couple of times before connecting on an automatic retry.
            // It’s unexpected and unusual, but no real harm done, and it’s not known whether the issue will persist or recur.  Someone should investigate warnings.
            return 2
        case .error:
            return 1
            // An error is a serious issue and represents the failure of something important going on in your application.  Unlike FATAL, the application itself isn’t going down the tubes.
            // Here you’ve got something like dropped network connections or the inability to access a file or service.  This will require someone’s attention probably sooner than later, but the application can limp along.
        case .fatal:
            // Fatal represents truly catastrophic situations, as far as your application is concerned.
            // Your application is about to abort to prevent some kind of corruption or serious problem, if possible.
            return 1
            // Other options to add ALL and TRACE
        }
    }

    init?(configValue: Int?) {
        switch configValue {
        case LoggingLevel.error.configValue: self = .error
        case LoggingLevel.warning.configValue: self = .warning
        case LoggingLevel.info.configValue: self = .info
        case LoggingLevel.debug.configValue: self = .debug
        case LoggingLevel.fatal.configValue: self = .fatal
        default: self = .off
        }
    }
}
