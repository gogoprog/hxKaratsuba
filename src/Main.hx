class Main {
    static function main() {
#if sys
        Sys.println("karatsuba!");
        var args = Sys.args();

        if(args.length < 2) {
            Sys.println("Usage: karatsuba OPERAND OPERAND");
        } else {
            var a = args[0];
            var b = args[1];
            var r = karatsuba.Lib.multiply(a, b);
            Sys.println(r);
        }
#else
        var r = karatsuba.Lib.multiply("25", "63");
        trace(r);
        var a = "2531";
        var b = "1467";
        var r = karatsuba.Lib.multiply(a, b);
        trace(r);
        var r = karatsuba.Lib.multiply("31", "67");
        trace(r);
#end
    }
}
