using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using DemoApp.Api;
using DemoApp.Api.Todos.Requests;

namespace DemoApp.Api.Todos;

[Route("[controller]")]
[ApiController]
public class TodosController(ApplicationContext context) : ControllerBase
{
    private readonly ApplicationContext _context=context;

    [HttpGet]
    public async Task<ActionResult> Fetch() => Ok(await _context.Todos.AsNoTracking().ToListAsync());

    [HttpGet("{id}")]
    public async Task<ActionResult> Get(int id) => Ok(await _context.Todos.AsNoTracking().FirstOrDefaultAsync(w => w.Id == id));

    [HttpPost]
    public async Task<IActionResult> Post([FromBody] CreateTodoRequest request) {
        var todo = request.ToEntity();
        var result = await _context.AddAsync(todo);
        await _context.SaveChangesAsync();
        return CreatedAtAction(nameof(Get), new { id = result.Entity.Id }, result.Entity);
    }

    [HttpPatch("{id}")]
    public async Task<IActionResult> Complete(int id, [FromBody] CompleteTodoRequest request) {
        var todo = await _context.Todos.FirstOrDefaultAsync(w => w.Id == id);
        if (todo == null) return NotFound();
        todo.Complete(request.Completed);
        await _context.SaveChangesAsync();
        return Ok(todo);
    }
}
