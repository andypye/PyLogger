import Foundation

@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T

    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

struct StoredValues {
    @UserDefault("has_seen_app_introduction", defaultValue: false)
    static var hasSeenAppIntroduction: Bool

    @UserDefault("call_count", defaultValue: 0)
    static var feedbackTriggeringActionCount: Int

    @UserDefault("review_show_count", defaultValue: 0)
    static var feedbackAskedCount: Int

    @UserDefault("feedbackGivenCount", defaultValue: 0)
    static var feedbackGivenCount: Int

    @UserDefault("last_review_request_shown", defaultValue: nil)
    static var feedbackAskedDate: Date?

    @UserDefault("user_experience_score", defaultValue: 0)
    static var userExperienceScore: Int

    @UserDefault("DEACTIVATED_A_NOTIFICATION", defaultValue: false)
    static var deactivatedAnAlert: Bool

    static var debugDescription: String {
        return """
        feedbackTriggeringActionCount :\(feedbackTriggeringActionCount)
        feedbackAskedCount :\(feedbackAskedCount)
        feedbackGivenCount :\(feedbackGivenCount)
        feedbackAskedDate :\(feedbackAskedDate?.description ?? "nil")
        poorUserExperienceScore :\(userExperienceScore)
        """
    }
}
