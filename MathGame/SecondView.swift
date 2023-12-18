import SwiftUI

struct StyledTimerView: View {
    @Binding var secondsRemaining: Int

    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 3)
                            .opacity(0.3)
                            .foregroundColor(.blue)

                        Circle()
                            .trim(from: 0.0, to: CGFloat(secondsRemaining) / 60.0)
                            .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                            .foregroundColor(.blue)
                            .rotationEffect(Angle(degrees: -90))

                        Text("\(secondsRemaining)")
                            .font(.footnote)
                            .foregroundColor(.blue)
                            .bold()
                    }
                    .frame(width: 40, height: 40)
                    .padding(EdgeInsets(top: -210, leading: 0, bottom: 0, trailing: 10))
                }
                Spacer()
            }
            Spacer()
        }
    }
}

struct SecondView: View {
    @State private var correctAnswer = 0
    @State private var choiseArray: [Int] = [0, 1, 2, 3]
    @State private var firstNumber = 0
    @State private var secondNumber = 0
    @State private var diapazon = 200
    @State public  var score = 0
    @State private var secondsRemaining = 60
    @State private var timer: Timer?
    @State private var showingResult = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                StyledTimerView(secondsRemaining: $secondsRemaining)

                Text("\(firstNumber) + \(secondNumber)")
                    .font(.largeTitle)
                    .bold()

                HStack {
                    ForEach(0..<2) { index in
                        Button {
                            answerIsCorrect(answer: choiseArray[index])
                            generateNum()
                        } label: {
                            AnswerButton(number: choiseArray[index])
                        }
                    }
                }

                HStack {
                    ForEach(2..<4) { index in
                        Button {
                            answerIsCorrect(answer: choiseArray[index])
                            generateNum()
                        } label: {
                            AnswerButton(number: choiseArray[index])
                        }
                    }
                }

                Text("Счет: \(score)")
                    .font(.headline)
                    .bold()
            }
            .onAppear {
                startTimer()
                generateNum()
            }
            .alert(isPresented: $showingResult) {
                Alert(
                    title: Text("Конец игры"),
                    message: Text("Ваш Счет: \(score)"),
                    dismissButton: .default(Text("Ок")) {
                        // Вернуться к FirstView
                        presentationMode.wrappedValue.dismiss()
                    }
                )
            }
        }
    }

    func answerIsCorrect(answer: Int) {
        let isCorrect = answer == correctAnswer ? true : false

        if isCorrect {
            self.score += 1
        } else {
            self.score -= 1
        }
    }

    func generateNum() {
        firstNumber = Int.random(in: 0...(diapazon / 2))
        secondNumber = Int.random(in: 0...(diapazon / 2))
        var list = [Int]()
        correctAnswer = firstNumber + secondNumber

        for _ in 0...2 {
            list.append(Int.random(in: 0...diapazon))
        }

        list.append(correctAnswer)
        choiseArray = list.shuffled()
    }

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if secondsRemaining > 0 {
                secondsRemaining -= 1
            } else {
                endGame()
            }
        }
    }

    func endGame() {
        timer?.invalidate()
        showingResult = true
    }
}
