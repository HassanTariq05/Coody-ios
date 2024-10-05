import SwiftUI

struct SearchByFilterView: View {
    @Binding var showFilterView: Bool
    @State private var minPrice: Double = 150
    @State private var maxPrice: Double = 1500

    let buttons: [String] = ["All", "Burger", "Pizza", "Breakfast", "Salad", "Lunch Dinner", "Toast", "Miltea", "Noodle", "Coke"]
    
    let ratings: [String] = ["2.0", "3.0", "4.0", "5.0"]
    
    var body: some View {
        VStack(spacing: 35) {
            HStack {
                Button(action: {showFilterView.toggle()}) {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .scaledToFit()
                        .foregroundStyle(.black)
                        .fontWeight(.medium)
                }
                Spacer()
                Text("Filter")
                    .font(.custom("Roboto", size: 16))
                    .fontWeight(.medium)
                Spacer()
                Button(action: {
                    minPrice = 150
                    maxPrice = 1500
                }) {
                    Text("Reset")
                        .font(.custom("Roboto", size: 16))
                        .foregroundStyle(.red)
                        .fontWeight(.medium)
                }
            }

            VStack(spacing: 10) {
                HStack {
                    Text("Price Range")
                        .font(.custom("Roboto", size: 20))
                        .foregroundStyle(.black)
                        .fontWeight(.medium)
                    Spacer()
                }
                
                Slider(
                    value: $maxPrice,
                    in: minPrice...1500,
                    step: 10
                )
                .tint(.red)
                HStack {
                    Text("Min: $\(Int(minPrice))")
                    Spacer()
                    Text("Max: $\(Int(maxPrice))")
                }
            }
            VStack(spacing: 10) {
                HStack {
                    Text("Categories")
                        .font(.custom("Roboto", size: 20))
                        .foregroundStyle(.black)
                        .fontWeight(.medium)
                    Spacer()
                }
                
                WrappingHStackForCategories(buttons: buttons)
            }
            
            VStack(spacing: 10) {
                HStack {
                    Text("Restaurant Score")
                        .font(.custom("Roboto", size: 20))
                        .foregroundStyle(.black)
                        .fontWeight(.medium)
                    Spacer()
                }
                
                WrappingHStackForRating(buttons: ratings)
            }
            Spacer()
            CustomButton(title: "Apply",backgroundColor: .red, foregroundColor: .white)
            
        }
        .padding()
    }
}

struct WrappingHStackForCategories: View {
    let buttons: [String]

    @State private var totalWidth = CGFloat.zero

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(computeWrappedLines(buttons: buttons), id: \.self) { line in
                HStack(spacing: 10) {
                    ForEach(line, id: \.self) { buttonTitle in
                        Button(action: {}) {
                            HStack {
                                Text(buttonTitle)
                                    .foregroundStyle(Color.gray)
                            }
                            .frame(height: 34)
                            .padding(.horizontal, 10)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                        }
                    }
                }
            }
        }
    }
    
    private func computeWrappedLines(buttons: [String]) -> [[String]] {
        var lines: [[String]] = [[]]
        var currentLineWidth: CGFloat = 0
        let maxWidth: CGFloat = UIScreen.main.bounds.width - 40
        
        for button in buttons {
            let buttonWidth = buttonSize(for: button).width + 40
            
            if currentLineWidth + buttonWidth > maxWidth {
                lines.append([button])
                currentLineWidth = buttonWidth
            } else {
                lines[lines.count - 1].append(button)
                currentLineWidth += buttonWidth
            }
        }
        return lines
    }

    private func buttonSize(for text: String) -> CGSize {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 16)
        return label.intrinsicContentSize
    }
}

struct WrappingHStackForRating: View {
    let buttons: [String]

    @State private var totalWidth = CGFloat.zero

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(computeWrappedLines(buttons: buttons), id: \.self) { line in
                HStack(spacing: 10) {
                    ForEach(line, id: \.self) { buttonTitle in
                        Button(action: {}) {
                            HStack {
                                Text(buttonTitle)
                                    .foregroundStyle(Color.gray)
                                Image(systemName: "star")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .foregroundStyle(.gray)
                            }
                            .frame(height: 34)
                            .padding(.horizontal, 10)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                        }
                    }
                }
            }
        }
    }
    
    private func computeWrappedLines(buttons: [String]) -> [[String]] {
        var lines: [[String]] = [[]]
        var currentLineWidth: CGFloat = 0
        let maxWidth: CGFloat = UIScreen.main.bounds.width - 40
        
        for button in buttons {
            let buttonWidth = buttonSize(for: button).width + 40
            
            if currentLineWidth + buttonWidth > maxWidth {
                lines.append([button])
                currentLineWidth = buttonWidth
            } else {
                lines[lines.count - 1].append(button)
                currentLineWidth += buttonWidth
            }
        }
        return lines
    }

    private func buttonSize(for text: String) -> CGSize {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 16)
        return label.intrinsicContentSize
    }
}

//#Preview {
//    SearchByFilterView(showFilterView: $showFilterView)
//}
