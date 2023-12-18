


import SwiftUI

struct FirstView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                NavigationLink(destination: SecondView()) {
                    Text("Новая игра")
                        .bold()
                        .frame(width: 150, height: 50)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.white, lineWidth: 1)
                        )
                        .shadow(radius: 5)
                }
                
                Spacer()

                NavigationLink(destination: ResultsView()) {
                    Text("Результаты")
                        .bold()
                        .frame(width: 150, height: 50)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.white, lineWidth: 1)
                        )
                        .shadow(radius: 5)
                }
                .padding(.bottom, 20)
                
                .navigationTitle("Меню")

                Spacer()

                Image(systemName: "gamecontroller.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.blue)
                    .padding(.bottom, 30)
            }
            .background(Color.white.edgesIgnoringSafeArea(.all))
        }
    }
}

