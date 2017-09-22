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
            int current;
            int sign = 1;
            int result = 0;

            if (sexagesimal.Substring(0, 1) == "-")
            {
                sign = -1;
                sexagesimal = sexagesimal.Substring(1);
            }

            for (int i = 0; i < sexagesimal.Length; i += 1) // iterate from first to last char of sexagesimal
            {
                current = (int)sexagesimal[i]; //  put current ASCII of char into current
                if (current >= 48 && current <= 57) { current = current - 48; }
                else if (current >= 65 && current <= 72) { current -= 55; }
                else if (current == 73 || current == 108) { current = 1; } // error correct typo cap I, lower l to 1
                else if (current >= 74 && current <= 78) { current -= 56; }
                else if (current == 79) { current = 0; } // error correct typo capital O to 0
                else if (current >= 80 && current <= 90) { current -= 57; }
                else if (current == 95 || current == 45) { current = 34; } // error correct _ and - to _
                else if (current >= 97 && current <= 107) { current -= 62; }
                else if (current >= 109 && current <= 122) { current -= 63; }
                else { break; } // treat all other noise as end of number

                result = 60 * result + current;
            }
            return result * sign;
        }
    }
}
