namespace SingleQubit {
    // To use elements from a namespace, you need to use the `import` keyword to
    // access them.
    import Std.Diagnostics.*;

    @EntryPoint()
    operation PauliGatesUsage() : Unit {
        // This allocates a qubit for us to work with.
        use q = Qubit();
        DumpMachine();

        X(q);
        DumpMachine();

        Reset(q);
    }
}