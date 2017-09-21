using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace kodex.Helpers
{
    public class Sexagesimal
    {
        public string IntegerToSexagesimal(int number)
        {
            const string sexagesimalAlphabet = "0123456789ABCDEFGHJKLMNPQRSTUVWXYZ_abcdefghijkmnopqrstuvwxyz";
            int sexagesimalIndex;
            string sign = "";
            string result = "";

            if (number == 0) { return "0"; }

            if (number < 0)
            {
                number = -number;
                sign = "-";
            }

            while (number > 0)
            {
                sexagesimalIndex = number % 60;
                result = sexagesimalAlphabet[sexagesimalIndex] + result;
                number = (number - sexagesimalIndex) / 60;
            }

            return sign + result;
        }

        public int SexagesimalToInteger(string sexagesimal)
        {
            int c;
            int i;
            int j = sexagesimal.Length;
            int m = 1;
            int n = 0;

            if (sexagesimal.Substring(0, 1) == "-")
            {
                m = -1;
                j -= 1;
                sexagesimal = sexagesimal.Substring(1, j);
            }

            //        for ($i = 0; $i <$j; $i += 1) { // iterate from first to last char of sexagesimal
            //$c = ord(sexagesimal[$i]); //  put current ASCII of char into $c
            //            if ($c >= 48 && $c <= 57) { $c =$c - 48; }
            //else if ($c >= 65 && $c <= 72) { $c -= 55; }
            //else if ($c === 73 || $c === 108) { $c = 1; } // typo cap I lower l to 1
            //else if ($c >= 74 && $c <= 78) { $c -= 56; }
            //else if ($c === 79) { $c = 0; } // error correct typo capital O to 0
            //else if ($c >= 80 && $c <= 90) { $c -= 57; }
            //else if ($c === 95 || $c === 45) { $c = 34; } // _ and dash - to _
            //else if ($c >= 97 && $c <= 107) { $c -= 62; }
            //else if ($c >= 109 && $c <= 122) { $c -= 63; }
            //else { break; } // treat all other noise as end of number
            //            if (!js() && function_exists('bcadd'))
            //            {
            //  $n = bcadd(bcmul(60, $n), $c);
            //            }
            //            else
            //            {
            //  $n = 60 *$n + $c;
            //            }
            //        }
            return n * m;
        }
    }
}
