//
//  TabsView.swift
//  TCA-Practice
//
//  Created by Joben Gohlke on 4/27/21.
//

import SwiftUI

struct TabsView: View {
  var body: some View {
    TabView {
      CounterDemoView()
      .tabItem {
        Image(systemName: "plusminus")
        Text("Simple Counter")
      }
      
      TwoCountersView()
      .tabItem {
        Image(systemName: "plus.square.on.square")
        Text("Combine+Pullback")
      }
      
      UsingBindingsView()
      .tabItem {
        Image(systemName: "arrowtriangle.right.fill.and.line.vertical.and.arrowtriangle.left.fill")
        Text("Using Bindings")
      }
    }
  }
}

struct TabsView_Previews: PreviewProvider {
  static var previews: some View {
    TabsView()
  }
}
