//
//  CustomSegmentedControl.swift
//  NFTio
//
//  Created by Dariy Kutelov on 21.04.23.
//

import SwiftUI

public struct CustomSegmentedControl<SelectionValue, Content>: View where SelectionValue: Hashable, Content: View {
    
    @Binding public var selection: SelectionValue
    @Namespace var namespace
    
    private let content: Content
    public init(selection: Binding<SelectionValue>,
                @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    public var body: some View {
        HStack(spacing: 0) {
            content
        }
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .padding(1)
        .background(
            RoundedRectangle(cornerRadius: 5)
                .fill(Color(Constants.Colors.charcoal))
                .opacity(0.15)
        )
        .frame(idealHeight: 16)
        .environment(\.selectedSegmentTag, $selection)
        .environment(\.segmentedControlNamespace, namespace)
    }
}

private struct SelectedSegmentTagKey: EnvironmentKey {
    static var defaultValue: Any?
}

public extension EnvironmentValues {
    var selectedSegmentTag: Any? {
        get { self[SelectedSegmentTagKey.self] }
        set { self[SelectedSegmentTagKey.self] = newValue }
    }
}

public extension View {
    func segmentedControlItemTag<SelectionValue: Hashable>(_ tag: SelectionValue) -> some View {
        return SegmentedControlItemContainer(tag: tag, content: self)
    }
}
