//
//  Property.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/06.
//

public typealias Property<A> = ImplicitlyUnwrappedOptional<_Property<A>>

public struct _Property<A> {
    
    private let get: () -> A
    private let set: (A) -> ()
    
    internal init(get: @escaping () -> A, set: @escaping (A) -> ()) {
        self.get = get
        self.set = set
    }
    
    public var value: A {
        get { return get() }
        set { set(newValue) }
    }
    
}
