import SwiftUI

struct SectionView: View {
    let title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .padding()
            
            Text("Section content will be added later")
                .foregroundColor(.gray)
            
            Spacer()
        }
        .navigationTitle(title)
    }
} 