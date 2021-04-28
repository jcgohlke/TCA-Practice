//
//  CounterDemoView.swift
//  TCA-Practice
//
//  Created by Joben Gohlke on 4/26/21.
//

import SwiftUI

struct CounterView: View {
  var body: some View {
    Text("Counter")
  }
}

struct CounterDemoView: View {
  var body: some View {
    Form {
      Section(header: Text("A simple counter")) {
        CounterView()
      }
    }
  }
}

struct CounterView_Previews: PreviewProvider {
  static var previews: some View {
    CounterDemoView()
  }
}
