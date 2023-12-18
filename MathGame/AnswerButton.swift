
import SwiftUI

struct AnswerButton: View {
    var number: Int
    
    var body: some View {
        Text("\(number)")
            .frame(width: 110, height: 110)
            .font(.system(size: 40, weight: .bold))
            .foregroundColor(Color.white) // цвет
            .background(Color.blue) //задний план
            .clipShape(Circle())
            .padding()
    }
}

