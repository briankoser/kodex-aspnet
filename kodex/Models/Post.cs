using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace kodex.Models
{
    public class Post
    {
        const int ExcerptMaxLength = 100;

        public Guid Id { get; set; }
        [Required(ErrorMessage = "Title required")]
        public string Title { get; set; }
        public string Body { get; set; }
        public string Description { get; set; }
        public DateTimeOffset DatePublished { get; set; }
        public DateTimeOffset DateLastUpdated { get; set; }
        public bool IsPublic { get; set; }
        public bool IsDeleted { get; set; }

        public string Slug
        {
            get
            {
                return Title.ToLower().Replace(" ", "-");
            }
        }

        public string Excerpt
        {
            get
            {
                return Body.Take(ExcerptMaxLength).ToString();
            }
        }

        //public string Category { get; set; }
        //public List<string> Tags { get; set; }
        //public List<string> Author { get; set; }
        //public string Via { get; set; }
        //"links": [{"rel": "self", "href": "http://koser.us/article/2016/01/03/2/adulthood"}, {"rel": "allPrev", "href": "http://koser.us/article/2016/01/03/1/test-article"}, {"rel": "allNext", "href": "http://koser.us/note/2016/01/03/3/test-note"}, {"rel": "categoryPrev", "href": "http://koser.us/article/2016/01/03/1/test-article"}, {"rel": "categoryNext", "href": "http://koser.us/article/2016/01/03/4/test-article-two"}]}
        //public List<Comments> Comments { get; set; }
    }
}
