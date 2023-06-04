//
//  DiceView.swift
//  DiceRoller
//
//  Created by Ruslan Alekyan on 30.05.2023.
//

import SwiftUI
                                                                    // Цвет в Dark/Light Mode
struct DiceView: View {
    let number: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .aspectRatio(1, contentMode: .fit)
            Text(number, format: .number)                           // Увеличить размер шрифта
                .foregroundColor(.black)
                .font(.largeTitle)
        }
    }
}


struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView(number: 1)
    }
}
