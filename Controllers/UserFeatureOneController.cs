using Microsoft.AspNetCore.Mvc;

namespace MVCwithDocker.Controllers
{
    public class UserFeatureOneController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
