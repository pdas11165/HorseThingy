import SwiftUI

class AppState: ObservableObject {
    @Published var sections: [SectionStatus] = [
        SectionStatus(title: "Duty of Care"),
        SectionStatus(title: "Facilities and Housing"),
        SectionStatus(title: "Feed and Water"),
        SectionStatus(title: "Health Management"),
        SectionStatus(title: "Feedlot Management"),
        SectionStatus(title: "Husbandry Practices"),
        SectionStatus(title: "Reproductive Management"),
        SectionStatus(title: "Transportation"),
        SectionStatus(title: "Change or End of Career"),
        SectionStatus(title: "Euthanasia")
    ]
    
    var applicableSections: [SectionStatus] {
        sections.filter { $0.isApplicable }
    }
} 