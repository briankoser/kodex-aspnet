using kodex.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace kodex.ViewModels
{
    public class StreamViewModel
    {
        // Post
        public Guid Id { get; set; }
        public string Title { get; set; }
        public string Body { get; set; }
        public string Description { get; set; }
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}")]
        public DateTimeOffset DatePublished { get; set; }
        public DateTimeOffset DateLastUpdated { get; set; }
        public string Excerpt
        {
            get
            {
                return String.Join(" ", Body.Split().Take(50).ToArray());
            }
        }

        // Review
        public int Rating { get; set; }

        // Board Game Review
        public string BoardGameGeekGameId { get; set; }
        public string BoxImageUrl { get; set; }

        // Book Review
        public bool IsAudioBook { get; set; }
        public string BookTitle { get; set; }
        public string BookAuthor { get; set; }
        public string Isbn { get; set; }
        public DateTime BookDatePublished { get; set; }
        public string BookCoverUrl { get; set; }
        public string OpenLibraryUrl { get; set; }
        public string GoodreadsBookUrl { get; set; }
        public string GoodreadsReviewUrl { get; set; }

        // Movie Review
        public int ReleaseYear { get; set; }
        public string PosterUrl { get; set; }
        public DateTime DateViewed { get; set; }
        public string TheMovieDbUrl { get; set; }
        public string LetterboxdMovieUrl { get; set; }
        public string LetterboxdReviewUrl { get; set; }

        // Note
        public string Image { get; set; }
        public string NoteUrl { get; set; }

        // Photo Album
        public DateTime BeginDate { get; set; }
        public DateTime EndDate { get; set; }
        public string CdnFolderUrl { get; set; }
        public string CdnZipUrl { get; set; }

        // Recipe
        public List<Ingredient> Ingredients { get; set; }
        [NotMapped]
        public List<string> Directions { get; set; }
        public string Yield { get; set; }
        public string Comments { get; set; }

        // Video
        public string VideoUrl { get; set; }



        public StreamViewModel()
        {
        }

        public StreamViewModel(Post post)
        {
            Id = post.Id;
            Title = post.Title;
            Body = post.Body;
            Description = post.Description;
            DatePublished = post.DatePublished;
            DateLastUpdated = post.DateLastUpdated;
        }

        public StreamViewModel(BoardGameReview boardGameReview)
        {
            Id = boardGameReview.Id;
            Title = boardGameReview.Title;
            Body = boardGameReview.Body;
            Description = boardGameReview.Description;
            DatePublished = boardGameReview.DatePublished;
            DateLastUpdated = boardGameReview.DateLastUpdated;

            Rating = boardGameReview.Rating;
            BoardGameGeekGameId = boardGameReview.BoardGameGeekGameId;
            BoxImageUrl = boardGameReview.BoxImageUrl;
        }

        public StreamViewModel(BookReview bookReview)
        {
            Id = bookReview.Id;
            Title = bookReview.Title;
            Body = bookReview.Body;
            Description = bookReview.Description;
            DatePublished = bookReview.DatePublished;
            DateLastUpdated = bookReview.DateLastUpdated;

            Rating = bookReview.Rating;
            IsAudioBook = bookReview.IsAudioBook;
            BookTitle = bookReview.BookTitle;
            BookAuthor = bookReview.Author;
            Isbn = bookReview.Isbn;
            BookDatePublished = bookReview.BookDatePublished;
            OpenLibraryUrl = bookReview.OpenLibraryUrl;
            GoodreadsBookUrl = bookReview.GoodreadsBookUrl;
            GoodreadsReviewUrl = bookReview.GoodreadsReviewUrl;
        }

        public StreamViewModel(MovieReview movieReview)
        {
            Id = movieReview.Id;
            Title = movieReview.Title;
            Body = movieReview.Body;
            Description = movieReview.Description;
            DatePublished = movieReview.DatePublished;
            DateLastUpdated = movieReview.DateLastUpdated;

            Rating = movieReview.Rating;
            ReleaseYear = movieReview.ReleaseYear;
            PosterUrl = movieReview.PosterUrl;
            DateViewed = movieReview.DateViewed;
            TheMovieDbUrl = movieReview.TheMovieDbUrl;
            LetterboxdMovieUrl = movieReview.LetterboxdMovieUrl;
            LetterboxdReviewUrl = movieReview.LetterboxdReviewUrl;
            Platform = movieReview.Platform;
        }

        public StreamViewModel(Note note)
        {
            Id = note.Id;
            Title = note.Title;
            Body = note.Body;
            Description = note.Description;
            DatePublished = note.DatePublished;
            DateLastUpdated = note.DateLastUpdated;

            Image = note.Image;
            NoteUrl = note.Url;
        }

        public StreamViewModel(PhotoAlbum photoAlbum)
        {
            Id = photoAlbum.Id;
            Title = photoAlbum.Title;
            Body = photoAlbum.Body;
            Description = photoAlbum.Description;
            DatePublished = photoAlbum.DatePublished;
            DateLastUpdated = photoAlbum.DateLastUpdated;

            BeginDate = photoAlbum.BeginDate;
            EndDate = photoAlbum.EndDate;
            CdnFolderUrl = photoAlbum.CdnFolderUrl;
            CdnZipUrl = photoAlbum.CdnZipUrl;
        }

        public StreamViewModel(Recipe recipe)
        {
            Id = recipe.Id;
            Title = recipe.Title;
            Body = recipe.Body;
            Description = recipe.Description;
            DatePublished = recipe.DatePublished;
            DateLastUpdated = recipe.DateLastUpdated;

            Ingredients = recipe.Ingredients;
            Directions = recipe.Directions;
            Yield = recipe.Yield;
            Comments = recipe.Comments;
        }

        public StreamViewModel(Video video)
        {
            Id = video.Id;
            Title = video.Title;
            Body = video.Body;
            Description = video.Description;
            DatePublished = video.DatePublished;
            DateLastUpdated = video.DateLastUpdated;

            VideoUrl = video.Url;
        }
    }
}
