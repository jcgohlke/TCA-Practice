//
//  CounterDemoView.swift
//  TCA-Practice
//
//  Created by Joben Gohlke on 4/26/21.
//  Derived from Case Studies in Pointfree's TCA GitHub repo: https://github.com/pointfreeco/swift-composable-architecture/tree/main/Examples/CaseStudies/SwiftUICaseStudies
//

import ComposableArchitecture
import SwiftUI

struct CounterView: View {
  let store: Store<CounterState, CounterAction>
  
  var body: some View {
    WithViewStore(self.store) { viewStore in
      HStack {
        Button(action: {
          viewStore.send(.decrementButtonTapped)
        }, label: {
          Image(systemName: "minus.circle")
        })
        
        Text("\(viewStore.count)")
        
        Button(action: {
          viewStore.send(.incrementButtonTapped)
        }, label: {
          Image(systemName: "plus.circle")
        })
      }
    }
  }
}

struct CounterDemoView: View {
  let store: Store<CounterState, CounterAction>
  
  var body: some View {
    Form {
      Section(header: Text("A simple counter")) {
        CounterView(store: self.store)
          .buttonStyle(BorderlessButtonStyle()) 
      }
    }
  }
}

struct CounterView_Previews: PreviewProvider {
  static var previews: some View {
    CounterDemoView(
      store: Store(
        initialState: CounterState(),
        reducer: counterReducer,
        environment: CounterEnvironment(
          mainQueue: DispatchQueue.main.eraseToAnyScheduler()
        )
      )
    )
  }
}
