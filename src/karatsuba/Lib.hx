package karatsuba;

class Lib {
    static inline private function getUnit(v:String, index:Int):Int {
        var len = v.length;

        if(index < 0 || index >= len) {
            return 0;
        }

        return v.charCodeAt(len - 1 - index) - '0'.code;
    }

    static inline private function powInt(v:String, n:Int) {
        for(i in 0...n) {
            v += '0';
        }

        return Std.parseInt(v);
    }

    static public function multiply(a:String, b:String):String {
        if(a.length < 2 && b.length < 2) {
            var va = a.charCodeAt(0) - '0'.code;
            var vb = b.charCodeAt(0) - '0'.code;
            return Std.string(va * vb);
        } else {
            if(a.length & 1 == 1) {
                a = '0' + a;
            }

            if(b.length & 1 == 1) {
                b = '0' + b;
            }

            while(a.length != b.length) {
                if(a.length < b.length) {
                    a = '0' + a;
                } else {
                    b = '0' + b;
                }
            }

            var len = a.length;
            var halfLen = Std.int(len / 2);
            var aa = a.substr(0, halfLen);
            var ab = a.substr(halfLen);
            var ba = b.substr(0, halfLen);
            var bb = b.substr(halfLen);
            var b = multiply(aa, ba);
            var c = multiply(ab, bb);
            var da = Std.string(Std.parseInt(aa) + Std.parseInt(ab));
            var db = Std.string(Std.parseInt(ba) + Std.parseInt(bb));
            var e = multiply(da, db);
            var f = Std.string(Std.parseInt(e) - Std.parseInt(b) - Std.parseInt(c));
            {
                var result = "";
                var i = 0;
                var x = powInt(b, len);
                var y = powInt(f, halfLen);
                var z = powInt(c, 0);
                var sum = x + y + z;
                result  = Std.string(sum);
                return result;
            }
        }

        return "Error";
    }
}
