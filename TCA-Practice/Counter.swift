//
//  Counter.swift
//  TCA-Practice
//
//  Created by Joben Gohlke on 4/26/21.
//

import ComposableArchitecture
import Foundation

struct CounterState: Equatable {
  var count = 0
}

enum CounterAction: Equatable {
  case decrementButtonTapped
  case incrementButtonTapped
}

struct CounterEnvironment {
  var mainQueue: AnySchedulerOf<DispatchQueue>
}

let counterReducer = Reducer<CounterState, CounterAction, CounterEnvironment> { state, action, environment in
  switch action {
    case .decrementButtonTapped:
      state.count -= 1
      return Effect(value: CounterAction.incrementButtonTapped)
        .delay(for: 1, scheduler: environment.mainQueue)
        .eraseToEffect()
    case .incrementButtonTapped:
      state.count += 1
      return .none
  }
}
