import Foundation
import UsersDomainInterface
import UtilityModule

public final class AppState: ObservableObject {
    public init(sceneFlow: SceneFlow, authority: AuthorityType) {
        self.sceneFlow = sceneFlow
        self.authority = authority
    }

    @Published public var sceneFlow: SceneFlow
    @Published public var authority: AuthorityType
}
