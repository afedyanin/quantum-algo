namespace Kata {

import Std.Convert.ComplexAsComplexPolar;
import Std.Math.*;

    @EntryPoint()
    function main() : Unit {
        let x = Complex(5., 4.);
        let val = ComplexAsComplexPolar(x);
        Message($"mag={val.Magnitude} arg={val.Argument}");
    }
}