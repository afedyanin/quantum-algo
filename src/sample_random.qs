﻿namespace Quantum.QSharpSampleApp {

    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    
    operation HelloQ () : Unit {
        Message("Hello quantum world!");
    }

    operation GenerateRandomBit() : Result {
        // Allocate a qubit.
        use q = Qubit();
        // Put the qubit to superposition.
        H(q);
        // It now has a 50% chance of being measured 0 or 1.
        // Measure the qubit value.
        let result = M(q);
        // Reset the qubit before releasing it.
        Reset(q);
        // Return the result of the measurement.
        return result;
    }

    operation SampleRandomNumberInRange(max : Int) : Int {
        mutable output = 0; 
        repeat {
            mutable bits = []; 
            for idxBit in 1..BitSizeI(max) {
                set bits += [GenerateRandomBit()]; 
            }
            set output = ResultArrayAsInt(bits);
        } until (output <= max);
        return output;
    }

    @EntryPoint()
    operation SampleRandomNumber() : Int {
        let max = 50;
        Message($"Sampling a random number between 0 and {max}: ");
        return SampleRandomNumberInRange(max);
    }
}


