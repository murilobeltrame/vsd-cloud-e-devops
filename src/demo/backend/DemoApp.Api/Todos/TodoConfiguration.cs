using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DemoApp.Api.Todos;

public class TodoConfiguration: IEntityTypeConfiguration<Todo>
{
    public void Configure(EntityTypeBuilder<Todo> builder)
    {
        builder.HasKey(k => k.Id);
        builder.Property(p => p.Description)
            .HasMaxLength(255)
            .IsRequired();
    }
}