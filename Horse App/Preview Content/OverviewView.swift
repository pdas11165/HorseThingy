import SwiftUI

struct OverviewView: View {
    @State private var sections: [SectionStatus] = [
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
    
    var body: some View {
        List {
            ForEach($sections) { $section in
                VStack(alignment: .leading) {
                    HStack {
                        Text(section.title)
                            .font(.headline)
                        Spacer()
                        Text(section.isApplicable ? "Applicable" : "Not Applicable")
                        Toggle("", isOn: $section.isApplicable)
                            .labelsHidden()
                    }
                }
                .padding(.vertical, 8)
            }
        }
        .navigationTitle("Include in report")
    }
}

struct SectionStatus: Identifiable {
    let id = UUID()
    let title: String
    var isApplicable = false
    var isNotApplicable = false
}

#Preview {
    NavigationView {
        OverviewView()
    }
} 
