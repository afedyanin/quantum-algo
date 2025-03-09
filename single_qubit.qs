namespace SingleQubit {
    // To use elements from a namespace, you need to use the `import` keyword to
    // access them.
    import Std.Diagnostics.*;

    @EntryPoint()
    operation PauliGatesUsage() : Unit {

        use q = Qubit();

        Message("|0> state:");
        DumpMachine();

        X(q);
        Message("X Gate:");
        DumpMachine();

        Z(q);
        Message("Z Gate:");
        DumpMachine();

        Reset(q);

        Y(q);
        Message("Y Gate:");
        DumpMachine();        
        let result = M(q);
        Message($"Y Gate: {result}");

        Reset(q);
    }
}