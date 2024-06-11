using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SimpleAspNet.Models;

namespace SimpleAspNet.Controllers;

public class TodoController(ApplicationContext context): Controller {

    private readonly ApplicationContext _context = context;

    public async Task<IActionResult> Index() {
        var todos = await _context.Todos.AsNoTracking().ToListAsync();
        return View(todos);
    }
}