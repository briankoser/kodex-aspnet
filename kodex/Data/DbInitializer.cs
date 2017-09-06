using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using kodex.Models;

namespace kodex.Data
{
    public static class DbInitializer
    {
        public static void Initialize(PostContext context)
        {
            context.Database.EnsureCreated();

            // Look for any posts
            if (context.Posts.Any())
            {
                return; // DB has been seeded
            }

            var posts = new Post[]
            {
                new Post { Title = "Adulthood", Description = "Brian Koser reflects on adulthood and maturity.", DatePublished = new DateTime(2014, 3, 11), DateLastUpdated = new DateTime(2014, 5, 21), Body = "Chil­dren are al­ways watch­ing their par­ents. I re­mem­ber watch­ing my dad as he watched the nightly news on TV. I would sit there and think, “Why would you watch the news when you could watch car­toons? When I’m an adult, I’m go­ing to stay up late and watch car­toons.” That was many moons ago. The older I get, the more I look back at my past self and re­al­ize how im­ma­ture I was (I Cor. 13:11). But I’ve never thought that I was im­ma­ture; it’s al­ways past Brian that was im­ma­ture.Of course, a few years later, I re­al­ize that what I thought was ma­ture was still young and im­ma­ture(this time I re­ally am ma­ture though!). The same goes with “old”. There’s a di­rect cor­re­la­tion be­tween my age and my de­f­i­n­i­tion of “old”. I re­mem­ber in grade school think­ing high school­ers were old.Now I lump high school­ers in to the “kids” des­ig­na­tion.The same cy­cle with col­lege stu­dents and col­lege grad­u­ates.Now my de­f­i­n­i­tion of old is “has grand­chil­dren”, but I’m pretty sure I’ll be chang­ing that de­f­i­n­i­tion even­tu­ally. I as­sume that this cy­cle con­tin­ues your whole life.You never feel old, but you al­ways feel ma­ture. You never feel like you know ex­actly what to do next.And yet, some­where along the way you be­come an adult, though there’s not a day where you wake up and think, “Now I’m an adult.” When I was plan­ning my last va­ca­tion, I stopped and thought, “This is some­thing my par­ents did. When they were my age.My par­ents were just like me.” And it hit me: adults just make it up as they go along. No­body knows ex­actly what to do next; every­one gives it their best shot, but no­body knows.And you might never feel like an adult: be­cause you thought adults were so dif­fer­ent from you, you ex­pected to feel dif­fer­ently when it hap­pened to you. But you won’t.Every­one is just mak­ing it up as they go along. But I am an adult.I make de­ci­sions.I plan va­ca­tions.I’m re­spon­si­ble for peo­ple other than my­self.I can choose whether to watch the news or car­toons.And now that I’ve reached that point, now that I am an adult, now that I can choose…I stay up late and watch car­toons.Be­cause why would you watch the news when you could watch car­toons ? 😉" },
                new Post { Title = "Book Review: Anathem", Description = "Brian Koser reviews the book Anathem by Neal Stephenson", DatePublished = new DateTime(2016, 04, 28), DateLastUpdated = new DateTime(2016, 04, 28), Body = "Wow. In Anathem, Stephen­son imag­ines a world where sci­en­tists and philoso­phers live in monas­ter­ies like me­dieval monks. I’ll avoid spoil­ers here be­cause a lot of the fun of the book is dis­cov­ery, but the world-build­ing is top-notch. The story it­self is bril­liant. Within the plot, a large por­tion is mind-stretch­ing phi­los­o­phy, sci­ence, and math dis­cus­sions be­tween the char­ac­ters. I can un­der­stand why some­one would think this bor­ing, but I was fas­ci­nated. I can’t re­mem­ber the last book I de­voured so quickly or en­joyed so thor­oughly. A def­i­nite fu­ture re-read, which is the high­est com­pli­ment I can pay in a world filled with so many books I’ve yet to read." }
            };

            foreach (Post p in posts)
            {
                context.Posts.Add(p);
            }

            context.SaveChanges();
        }
    }
}