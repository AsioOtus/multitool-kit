extension Formatters.Dictionary {
    public protocol PDefault {
        func format (_ dictionary: Dictionary<AnyHashable, Any>) -> String
    }
}
