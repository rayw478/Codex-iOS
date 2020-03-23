//
//  ProductList.swift
//  Codex iOS
//
//  Created by Raymond Wong on 2020-03-22.
//  Copyright © 2020 Raymond Wong. All rights reserved.
//

import SwiftUI

struct ProductList: View {
    @State var searchValue: String = ""
    var body: some View {
        VStack(){
            TextField("Search", text: $searchValue)
                .padding()
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Spacer()
        }
    }
}

struct ProductList_Previews: PreviewProvider {
    static var previews: some View {
        ProductList()
    }
}
