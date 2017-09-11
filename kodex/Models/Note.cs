using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace kodex.Models
{
    public class Note : Post
    {
        public string Image { get; set; }
        public string Url { get; set; }
    }
}
