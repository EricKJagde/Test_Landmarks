enum ViewModelState: Equatable {
    case notStarted
    case inProgress
    case success
    case failure(Error)

    static func ==(lhs: ViewModelState, rhs: ViewModelState) -> Bool {
        switch (lhs, rhs) {
        case (.failure(let a), .failure(let b)):
            return a.localizedDescription == b.localizedDescription
        case (.notStarted, .notStarted):
            return true
        case (.inProgress, .inProgress):
            return true
        case (.success, .success):
            return true
        default:
            return false
        }
    }
}
