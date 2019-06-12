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

            var len = Std.int(Math.max(a.length, b.length));
            var ha = Std.int(a.length / 2);
            var hb = Std.int(b.length / 2);
            var aa = a.substr(0, ha);
            var ab = a.substr(ha);
            var ba = b.substr(0, hb);
            var bb = b.substr(hb);
            var b = multiply(aa, ba);
            var c = multiply(ab, bb);
            var da = Std.string(Std.parseInt(aa) + Std.parseInt(ab));
            var db = Std.string(Std.parseInt(ba) + Std.parseInt(bb));
            var e = multiply(da, db);
            var f = Std.string(Std.parseInt(e) - Std.parseInt(b) - Std.parseInt(c));
            // trace("b=" + b);
            // trace("c=" + c);
            // trace("e=" + e);
            // trace("f=" + f);
            {
                var result = "";
                var i = 0;
                var x = powInt(b, len);
                var y = powInt(f, ha);
                var z = powInt(c, 0);
                var sum = x + y +z;
                result  = Std.string(sum);
                // trace(result);
                return result;
            }
        }

        return "Error";
    }
}
