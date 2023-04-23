//
//  SegmentedControlItemContainer.swift
//  NFTio
//
//  Created by Dariy Kutelov on 21.04.23.
//

import SwiftUI

public struct SegmentedControlItemContainer<SelectionValue, Content>: View
where SelectionValue: Hashable, Content: View {
    @Environment(\.selectedSegmentTag) var selectedSegmentTag
    @Environment(\.segmentedControlNamespace) var segmentedControlNamespace
    @Namespace var namespace
    
    let tag: SelectionValue
    let content: Content
    
    @ViewBuilder public var body: some View {
        content
            .frame(maxWidth: .infinity)
            .padding()
            .contentShape(Rectangle())
            .foregroundColor(isSelected ?
                .white :
                Color(Constants.Colors.primaryText))
            .background(isSelected ? background : nil)
            .onTapGesture {
                select()
            }
            .disabled(isSelected)
    }
    
    private var background: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(Color(Constants.Colors.secondary))
                .padding(.horizontal, -4)
                .matchedGeometryEffect(id: "selection",
        in: segmentedControlNamespace ?? namespace)
    }
    
    private func select() {
        withAnimation(.easeInOut(duration: 0.2)) {
            if let binding = selectedSegmentTag as? Binding<SelectionValue> {
                binding.wrappedValue = tag
            }
        }
    }
    
    private var isSelected: Bool {
        let selectedTag = (selectedSegmentTag as? Binding<SelectionValue>)?.wrappedValue
        return tag == selectedTag
    }
}

public struct SegmentedControlNamespaceKey: EnvironmentKey {
    public static var defaultValue: Namespace.ID?
}

extension EnvironmentValues {
    public var segmentedControlNamespace: Namespace.ID? {
        get { self[SegmentedControlNamespaceKey.self] }
        set { self[SegmentedControlNamespaceKey.self] = newValue }
    }
}
