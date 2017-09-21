using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace kodex.Models
{
    public class BookReview : Post
    {
        public bool IsAudioBook { get; set; }
        public string BookTitle { get; set; }
        public string Author { get; set; }
        public string Isbn { get; set; }
        public DateTime BookPubDate { get; set; }
        public string BookCoverUrl { get; set; }
        public string OpenLibraryUrl { get; set; }
        public string GoodreadsBookUrl { get; set; }
        public string GoodreadsReviewUrl { get; set; }
        public int Rating { get; set; }
    }
}
