extension MessagePackValue {
    public init() {
        self = .nil
    }

    public init(_ value: Swift.Bool) {
        self = .bool(value)
    }

    public init<S: SignedInteger>(_ value: S) {
        self = .int(numericCast(value))
    }

    public init<U: UnsignedInteger>(_ value: U) {
        self = .uInt(numericCast(value))
    }

    public init(_ value: Swift.Float) {
        self = .float(value)
    }

    public init(_ value: Swift.Double) {
        self = .double(value)
    }

    public init(_ value: Swift.String) {
        self = .string(value)
    }

    public init(_ value: [MessagePackValue]) {
        self = .array(value)
    }

    public init(_ value: [MessagePackValue : MessagePackValue]) {
        self = .map(value)
    }

    public init(_ value: Data) {
        self = .binary(value)
    }
}
