using Microsoft.EntityFrameworkCore;
using DemoApp.Api.Todos;

namespace DemoApp.Api;

public class ApplicationContext: DbContext {
    public ApplicationContext(DbContextOptions options): base(options) {}

    public DbSet<Todo> Todos { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder) {
        modelBuilder.ApplyConfiguration(new TodoConfiguration());
        base.OnModelCreating(modelBuilder);
    }
}