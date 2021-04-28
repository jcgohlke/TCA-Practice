//
//  TwoCountersView.swift
//  TCA-Practice
//
//  Created by Joben Gohlke on 4/26/21.
//

import ComposableArchitecture
import SwiftUI

struct TwoCountersState: Equatable {
  var counter1 = CounterState()
  var counter2 = CounterState()
}

enum TwoCountersAction {
  case counter1(CounterAction)
  case counter2(CounterAction)
}

struct TwoCountersEnvironment {}

let twoCountersReducer = Reducer<TwoCountersState, TwoCountersAction, TwoCountersEnvironment>
  .combine(
    counterReducer.pullback(
      state: \TwoCountersState.counter1,
      action: /TwoCountersAction.counter1,
      environment: { _ in CounterEnvironment(mainQueue: DispatchQueue.main.eraseToAnyScheduler()) }
    ),
    counterReducer.pullback(
      state: \TwoCountersState.counter2,
      action: /TwoCountersAction.counter2,
      environment: { _ in CounterEnvironment(mainQueue: DispatchQueue.main.eraseToAnyScheduler()) }
    )
  )

struct TwoCountersView: View {
  let store: Store<TwoCountersState, TwoCountersAction>
  
  var body: some View {
    Form {
      Section(header: Text("Two Counters")) {
        HStack {
          Text("Counter 1")
          
          Spacer()
          
          CounterView(
            store: self.store.scope(
              state: { $0.counter1 },
              action: TwoCountersAction.counter1
            )
          )
            .buttonStyle(BorderlessButtonStyle())
        }
        
        HStack {
          Text("Counter 2")
          
          Spacer()
          
          CounterView(
            store: self.store.scope(
              state: { $0.counter2 },
              action: TwoCountersAction.counter2
            )
          )
            .buttonStyle(BorderlessButtonStyle())
        }
      }
    }
  }
}

struct TwoCountersView_Previews: PreviewProvider {
  static var previews: some View {
    TwoCountersView(
      store: Store(
        initialState: TwoCountersState(),
        reducer: twoCountersReducer,
        environment: TwoCountersEnvironment()
      )
    )
  }
}
