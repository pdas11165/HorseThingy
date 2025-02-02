import SwiftUI
import UIKit

struct HorseDetailView: View {
    let horse: Horse
    @State private var healthChecklist: [String: Bool] = [
        "Visible Marks on the body": false,
        "Abnormal Posture": false,
        "Feeding": false,
        "Hair Trimmed": false
    ]
    @State private var images: [UIImage] = []
    @State private var videos: [URL] = []
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(horse.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Text(horse.breed)
                    .font(.largeTitle)
                    .bold()
                Text("Age: \(horse.time) years old")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Divider()
                
                Text("Health Checklist")
                    .font(.headline)
                ForEach(healthChecklist.keys.sorted(), id: \ .self) { key in
                    HStack {
                        Text(key)
                        Spacer()
                        Button(action: {
                            healthChecklist[key]?.toggle()
                        }) {
                            Image(systemName: healthChecklist[key] == true ? "checkmark.circle.fill" : "xmark.circle.fill")
                                .foregroundColor(healthChecklist[key] == true ? .green : .red)
                        }
                    }
                }
                
                Divider()
                
                Text("Upload Photos & Videos")
                    .font(.headline)
                Button("Add Photo") {
                    
                }
                Button("Add Video") {
                    
                }
            }
            .padding()
        }
        .navigationTitle(horse.breed)
    }
}
