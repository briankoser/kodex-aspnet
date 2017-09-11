using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace kodex.Models
{
    public class PhotoAlbum : Post
    {
        public DateTime BeginDate { get; set; }
        public DateTime EndDate { get; set; }
        public string CdnFolderUrl { get; set; }
        public string CdnZipUrl { get; set; }
    }
}
