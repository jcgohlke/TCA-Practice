//
//  TwoCountersView.swift
//  TCA-Practice
//
//  Created by Joben Gohlke on 4/26/21.
//

import SwiftUI

struct TwoCountersView: View {
  var body: some View {
    Form {
      Section(header: Text("Two Counters")) {
        HStack {
          Text("Counter 1")
          
          Spacer()
        }
        
        HStack {
          Text("Counter 2")
          
          Spacer()
        }
      }
    }
  }
}

struct TwoCountersView_Previews: PreviewProvider {
  static var previews: some View {
    TwoCountersView()
  }
}
