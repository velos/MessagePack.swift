extension MessagePackValue: ArrayLiteralConvertible {
    public init(arrayLiteral elements: MessagePackValue...) {
        self = .array(elements)
    }
}

extension MessagePackValue: BooleanLiteralConvertible {
    public init(booleanLiteral value: Swift.Bool) {
        self = .bool(value)
    }
}

extension MessagePackValue: DictionaryLiteralConvertible {
    public init(dictionaryLiteral elements: (MessagePackValue, MessagePackValue)...) {
        var dict = [MessagePackValue : MessagePackValue](minimumCapacity: elements.count)
        for (key, value) in elements {
            dict[key] = value
        }

        self = .map(dict)
    }
}

extension MessagePackValue: ExtendedGraphemeClusterLiteralConvertible {
    public init(extendedGraphemeClusterLiteral value: Swift.String) {
        self = .string(value)
    }
}

extension MessagePackValue: FloatLiteralConvertible {
    public init(floatLiteral value: Swift.Double) {
        self = .double(value)
    }
}

extension MessagePackValue: IntegerLiteralConvertible {
    public init(integerLiteral value: Int64) {
        self = .int(value)
    }
}

extension MessagePackValue: NilLiteralConvertible {
    public init(nilLiteral: ()) {
        self = .nil
    }
}

extension MessagePackValue: StringLiteralConvertible {
    public init(stringLiteral value: Swift.String) {
        self = .string(value)
    }
}

extension MessagePackValue: UnicodeScalarLiteralConvertible {
    public init(unicodeScalarLiteral value: Swift.String) {
        self = .string(value)
    }
}
