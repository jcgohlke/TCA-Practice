//
//  UsingBindingsView.swift
//  TCA-Practice
//
//  Created by Joben Gohlke on 4/27/21.
//

import ComposableArchitecture
import SwiftUI

struct UsingBindingsState: Equatable {
  var sliderValue = 0.5
  var stepCount = 10
  var toggleIsOn = false
}

enum UsingBindingsAction {
  case sliderValueChanged(Double)
  case stepCountChanged(Int)
  case toggleChange(isOn: Bool)
}

struct UsingBindingsEnvironment {}

let usingBindingsReducer = Reducer<UsingBindingsState, UsingBindingsAction, UsingBindingsEnvironment> { state, action, _ in
  switch action {
    case let .sliderValueChanged(value):
      state.sliderValue = value
      return .none
    case let .stepCountChanged(count):
      state.sliderValue = .minimum(state.sliderValue, Double(count))
      state.stepCount = count
      return .none
    case let .toggleChange(isOn):
      state.toggleIsOn = isOn
      return .none
  }
}

struct UsingBindingsView: View {
  let store: Store<UsingBindingsState, UsingBindingsAction>
  
  var body: some View {
    WithViewStore(self.store) { viewStore in
      Form {
        Section(header: Text("Using Bindings")) {
          Toggle(
            isOn: viewStore.binding(get: { $0.toggleIsOn }, send: UsingBindingsAction.toggleChange)
          ) {
            Text("Disable other controls")
          }
          
          Stepper(
            value: viewStore.binding(
              get: { $0.stepCount },
              send: UsingBindingsAction.stepCountChanged
            )) {
            Text("Max slider value: \(viewStore.stepCount)")
              .font(Font.body.monospacedDigit())
          }
          .disabled(viewStore.toggleIsOn)
          
          HStack {
            Text("Slider value: \(Int(viewStore.sliderValue))")
              .font(Font.body.monospacedDigit())
            
            Slider(
              value: viewStore.binding(
                get: { $0.sliderValue },
                send: UsingBindingsAction.sliderValueChanged
              ),
              in: 0...Double(viewStore.stepCount
              )
            )
          }
          .disabled(viewStore.toggleIsOn)
        }
      }
    }
  }
}

struct UsingBindingsView_Previews: PreviewProvider {
  static var previews: some View {
    UsingBindingsView(
      store: Store(
        initialState: UsingBindingsState(),
        reducer: usingBindingsReducer,
        environment: UsingBindingsEnvironment()
      )
    )
  }
}
