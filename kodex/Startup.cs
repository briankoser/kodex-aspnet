using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using kodex.Data;

namespace kodex
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddDbContext<StreamContext>(opt => opt.UseInMemoryDatabase("Posts"));
            services.AddMvc();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseBrowserLink();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
            }

            app.UseStaticFiles();

            app.UseMvc(routes =>
            {
                //routes.MapRoute(
                //    name: "author",
                //    template: "{author}/{category}/{year}/{month}/{day}/{count}/{slug}",
                //    defaults: new { controller = "stream", action = "author" });

                //routes.MapRoute(
                //    name: "category",
                //    template: "{category}/{year}/{month}/{day}/{count}/{slug}",
                //    defaults: new { controller = "stream" });

                //   /2016/04/05/1 - will be expanded to /{category}/2016/04/05/1/optional-slug; id is base 60 digit count of post from that day
                /// SSSn - short url expands to full url, all characters are base 60

                routes.MapRoute(
                    name: "stream",
                    template: "{year:int}/{month:range(1,12)}/{day:range(1,31)}/{id}/{slug?}",
                    defaults: new { controller = "stream" });
                
                routes.MapRoute(
                    name: "default",
                    template: "{controller=Home}/{action=Index}/{id?}");
            });
        }
    }
}
