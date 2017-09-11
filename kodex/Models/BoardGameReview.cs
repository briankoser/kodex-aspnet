using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace kodex.Models
{
    public class BoardGameReview : Post
    {
        public string Rating { get; set; }
        public string BoardGameGeekId { get; set; }
        public string BoxImageUrl { get; set; }
    }
}
