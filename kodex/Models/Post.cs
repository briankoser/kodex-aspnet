using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace kodex.Models
{
    public class Post
    {
        public long Id { get; set; }
        public string Title { get; set; }
        public string Body { get; set; }
        public string Description { get; set; }
        public DateTime DatePublished { get; set; }
        public DateTime DateLastUpdated { get; set; }

        //public string Category { get; set; }
        //public List<string> Tags { get; set; }
        //public List<string> Author { get; set; }
        //public string Via { get; set; }
    }
}
