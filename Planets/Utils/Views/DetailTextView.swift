//
//  DetailTextView.swift
//  Planets
//
//  Created by Nadeeshan Jayawardana on 2022-05-27.
//

import SwiftUI

@ViewBuilder
func detailTextView(title: String, value: String) -> HStack<TupleView<(Text, Text)>> {
    HStack {
        Text("\(title) :")
            .font(.system(size: 15))
            .fontWeight(.bold)
        Text(value)
    }
}
