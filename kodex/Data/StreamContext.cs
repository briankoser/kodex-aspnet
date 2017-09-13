using kodex.Models;
using Microsoft.EntityFrameworkCore;
using kodex.ViewModels;

namespace kodex.Data
{
    public class StreamContext : DbContext
    {
        public StreamContext(DbContextOptions<StreamContext> options)
            : base(options)
        {
        }

        public DbSet<Post> Posts { get; set; }
        public DbSet<BookReview> BookReviews { get; set; }
        public DbSet<StreamViewModel> StreamViewModels { get; set; }
    }
}