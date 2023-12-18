




import SwiftUI

struct ResultsView: View {
    let resultsData: [Double] = [10, 20, 15, 25, 30, 18, 22] 

    var body: some View {
        VStack {
            Text("Результаты прошлых матчей")
                .font(.title)
                .padding()

            // Ваш код для отображения результатов (можете использовать ForEach для списка результатов)

            Spacer()
        }
        .navigationTitle("Результаты")
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}
