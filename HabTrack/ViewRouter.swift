//
//  ViewRouter.swift
//  HabTrack
//
//  Created by AL3 on 4/2/21.
//

import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .habits
}

enum Page{
    case habits
    case settings
    case addhabit
}
