using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(week2project.Startup))]
namespace week2project
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
