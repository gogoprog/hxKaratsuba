class Main {
    static private function test(a:Int, b:Int):Bool {
        trace("Multiplying " + a + " by " + b);
        var r1 = a * b;
        var r2 = Std.parseInt(karatsuba.Lib.multiply(Std.string(a), Std.string(b)));

        if(r1 != r2) {
            throw "Test failed! " + r2 + " instead of " + r1;
            return false;
        }

        return true;
    }

    static function main() {
        test(31, 67);
        test(2531, 1467);

        for(i in 0...100) {
            test(Std.random(10000), Std.random(10000));
        }
    }
}
