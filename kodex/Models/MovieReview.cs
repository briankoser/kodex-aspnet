using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace kodex.Models
{
    public class MovieReview : Post
    {
        public int Rating { get; set; }
        public int ReleaseYear { get; set; }
        public string PosterUrl { get; set; }
        public DateTime ViewDate { get; set; }
        public string TheMovieDbUrl { get; set; }
        public string LetterboxdMovieUrl { get; set; }
        public string LetterboxdReviewUrl { get; set; }
        public string Platform { get; set; } // create platform table
    }
}
