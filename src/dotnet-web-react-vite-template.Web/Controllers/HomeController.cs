using Microsoft.AspNetCore.Mvc;

namespace dotnet_web_react_vite_template.Web.Controllers;

[Route("api/[controller]")]
[ApiController]
public class HomeController : ControllerBase
{
    // GET: api/home/name
    [HttpGet("name")]
    public ActionResult<string> GetName() => "Test";
}
