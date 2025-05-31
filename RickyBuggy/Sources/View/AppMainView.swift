//
//  AppMainView.swift
//  RickyBuggy
//

import SwiftUI

struct AppMainView: View {
    // FIXME: 13 - fix issue with re-invoking network request on tapping show list/hide list
    @ObservedObject var viewModel: AppMainViewModel = AppMainViewModel()
    
    var body: some View {
        NavigationView {
            characterListView
                .navigationTitle(Text("Characters"))
                .navigationBarTitleDisplayMode(.inline)
                // FIXME: 7 - Fix issue with glitching toolbar on entering details view
                // fixed
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        sortButton
                    }
                }
        }
        .actionSheet(isPresented: $viewModel.showsSortActionSheet) {
            sortActionSheet
        }
    }
}

// MARK: - View

private extension AppMainView {
    @ViewBuilder var characterListView: some View {
        if viewModel.characters.isEmpty == false {
            CharactersListView(characters: $viewModel.characters, sortMethod: $viewModel.sortMethod)
        } else if viewModel.characterErrors.isEmpty == false {
            FetchRetryView(errors: viewModel.characterErrors, onRetry: {
                viewModel.requestData()
            })
        } else {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
        }
    }

    var sortButton: some View {
        Button(action: viewModel.setShowsSortActionSheet) {
            Text("Choose Sorting")
        }
    }
    
    // FIXME: 8 - Fix action sheet only appearing once, in other words - after it gets opened and closed, it cannot be opened again
    // fixed
    var sortActionSheet: ActionSheet {
        ActionSheet(
            title: Text("Sort method"),
            message: Text("Choose sorting method"),
            buttons: [
                .default(Text("Episodes Count")) {
                    viewModel.setSortMethod(.episodesCount);
                    viewModel.showsSortActionSheet = false;
                },
                .default(Text("Name")) {
                    viewModel.setSortMethod(.name);
                    viewModel.showsSortActionSheet = false;
                },
                .cancel(Text("Cancel")){
                    viewModel.showsSortActionSheet = false;
                },
            ]
        )
    }
}

// MARK: - Preview

struct AppMainView_Previews: PreviewProvider {
    static var previews: some View {
        AppMainView()
    }
}
