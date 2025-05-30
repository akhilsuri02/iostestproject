//
//  CharactersListItemView.swift
//  RickyBuggy
//

import SwiftUI

struct CharactersListItemView: View {
    @ObservedObject private var viewModel: CharactersListItemViewModel
    
    init(viewModel: CharactersListItemViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            CharacterPhoto(data: viewModel.characterImageData)
                .aspectRatio(1, contentMode: .fill)
                .frame(height: UIScreen.main.bounds.height / 5)
                .cornerRadius(5)
            
            VStack(alignment: .leading) {
                Spacer()
                
                HStack(alignment: .center) {
                    Text(viewModel.title)
                        .titleStyle()
                                                            
                    Spacer()
                }
                
                Spacer()

                HStack(spacing: 16) {
                    VStack(alignment: .leading, spacing: 4) {
                        // FIXME: 6 - Make URL tappable
                        // fixed
                        // fixed
                        
                        Link(destination: URL(string: viewModel.url) ?? URL(string: "about:blank")!) {
                            Text(viewModel.url)
                                .foregroundColor(.blue) // Make it look like a link
                                .underline()            // Underline it for typical link appearance
                        }
                        .contentShape(Rectangle()) // Defines the tappable area of the Link explicitly
                        .onTapGesture {
                            // An empty onTapGesture here "claims" the tap for the Link
                            // preventing the parent NavigationLink from intercepting it.
                            // The Link's default action (opening URL) will then fire.
                        }
                        .disabled(URL(string: viewModel.url) == nil)
//                        Text(viewModel.url)

                        Text(viewModel.created)
                            .contentsStyle()
                    }
                }
                
                Spacer()
            }
        }
    }
}

// MARK: - Preview

struct characterListCell_Previews: PreviewProvider {
    static var previews: some View {
        CharactersListItemView(viewModel: CharactersListItemViewModel(character: .dummy))
            .frame(maxHeight: UIScreen.main.bounds.height / 5)
    }
}
