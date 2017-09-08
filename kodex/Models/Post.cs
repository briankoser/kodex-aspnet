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
        public string FirstParagraph
        {
            get
            {
                return Body.Take(50).ToString();
            }
        }

        //public string Category { get; set; }
        //public List<string> Tags { get; set; }
        //public List<string> Author { get; set; }
        //public string Via { get; set; }
        //"links": [{"rel": "self", "href": "http://koser.us/article/2016/01/03/2/adulthood"}, {"rel": "allPrev", "href": "http://koser.us/article/2016/01/03/1/test-article"}, {"rel": "allNext", "href": "http://koser.us/note/2016/01/03/3/test-note"}, {"rel": "categoryPrev", "href": "http://koser.us/article/2016/01/03/1/test-article"}, {"rel": "categoryNext", "href": "http://koser.us/article/2016/01/03/4/test-article-two"}]}
    }
}
