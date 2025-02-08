namespace Kata {

import Std.Math.*;

    // модуль комплексного числа
    function ComplexModulus(x : Complex) : Double {
            let (a, b) = (x.Real, x.Imag);
            return Sqrt(a * a + b * b);
    }

    // e в комлексной степени
    function ComplexExponent(x : Complex) : Complex {
        Complex(E()^x.Real * Cos(x.Imag), E()^x.Real * Sin(x.Imag))
    }

    // реальное число в комплексной степени
    function ComplexExpReal(r : Double, x : Complex) : Complex {
        if AbsD(r) < 1e-9 {
            return Complex(0., 0.);
        }

        let ra = r^x.Real;
        let lnr = Log(r);
        return Complex(ra * Cos(x.Imag * lnr), ra * Sin(x.Imag * lnr));
    }

    // перевод в полярные координаты
    function ComplexToComplexPolar(x : Complex) : ComplexPolar {
        let (a, b) = (x.Real, x.Imag);
        return ComplexPolar(Sqrt(a * a + b * b), ArcTan2(b, a));
    }

    // перевод из полярных координат
    function ComplexPolarToComplex(x : ComplexPolar) : Complex {
        let (r, theta) = (x.Magnitude, x.Argument);
        return Complex(r * Cos(theta), r * Sin(theta));
    }

    // умножение в полярных координатах 
    function ComplexPolarMult(x : ComplexPolar, y : ComplexPolar) : ComplexPolar {
        mutable theta = x.Argument + y.Argument;
        if theta > PI() {
            set theta -= 2.0 * PI();
        }
        if theta <= -PI() {
            set theta += 2.0 * PI();
        }
        return ComplexPolar(x.Magnitude * y.Magnitude, theta);
    }

    @EntryPoint()
    function main() : Unit {
        let x = Complex(5., 4.);
        let val = ComplexExponent(x);
        Message($"mod={val.Real};{val.Imag}");
    }

}