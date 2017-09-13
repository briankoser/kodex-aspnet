using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace kodex.Models
{
    public class Recipe : Post
    {
        public List<Ingredient> Ingredients { get; set; }
        public List<string> Directions { get; set; }
        public string Yield { get; set; }
        public string Comments { get; set; }
    }

    public class Ingredient
    {
        public long Id { get; set; }
        public string Name { get; set; }
        public int Amount { get; set; }
        public string Unit { get; set; }
        public string Category { get; set; }
    }
}
