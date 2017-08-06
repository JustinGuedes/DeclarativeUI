//
//  Property.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/06.
//

public typealias Property<T> = ImplicitlyUnwrappedOptional<_Property<T>>

public struct _Property<T> {
    
    private let get: () -> T
    private let set: (T) -> ()
    
    internal init(get: @escaping () -> T, set: @escaping (T) -> ()) {
        self.get = get
        self.set = set
    }
    
    public var value: T {
        get { return get() }
        set { set(newValue) }
    }
    
}
