//
//  TabsView.swift
//  TCA-Practice
//
//  Created by Joben Gohlke on 4/27/21.
//

import ComposableArchitecture
import SwiftUI

struct TabsView: View {
  var body: some View {
    TabView {
      CounterDemoView(
        store: Store(
          initialState: CounterState(),
          reducer: counterReducer,
          environment: CounterEnvironment(mainQueue: DispatchQueue.main.eraseToAnyScheduler())
        )
      )
      .tabItem {
        Image(systemName: "plusminus")
        Text("Simple Counter")
      }
      
      TwoCountersView(
        store: Store(
          initialState: TwoCountersState(),
          reducer: twoCountersReducer,
          environment: TwoCountersEnvironment()
        )
      )
      .tabItem {
        Image(systemName: "plus.square.on.square")
        Text("Combine+Pullback")
      }
      
      UsingBindingsView(
        store: Store(
          initialState: UsingBindingsState(),
          reducer: usingBindingsReducer,
          environment: UsingBindingsEnvironment()
        )
      )
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
