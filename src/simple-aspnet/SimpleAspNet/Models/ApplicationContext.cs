using Microsoft.EntityFrameworkCore;

namespace SimpleAspNet.Models;

public class ApplicationContext(DbContextOptions<ApplicationContext> options) : DbContext(options) {
    public DbSet<Todo> Todos { get; set; }
}