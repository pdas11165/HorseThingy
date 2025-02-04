import SwiftUI

struct OverviewView: View {
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
            List {
                ForEach($appState.sections) { $section in
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
    OverviewView()
        .environmentObject(AppState())
} 
