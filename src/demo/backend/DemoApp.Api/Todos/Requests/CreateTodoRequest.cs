namespace DemoApp.Api.Todos.Requests;

public record CreateTodoRequest(string Description, DateTime? DueDate) {
    public Todo ToEntity() => new(Description, DueDate);
}