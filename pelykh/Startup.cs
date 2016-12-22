using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(pelykh.Startup))]
namespace pelykh
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
