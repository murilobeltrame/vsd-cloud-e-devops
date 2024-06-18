namespace DemoApp.Api.Todos;

public class Todo
{
    public int Id { get; }
    public string Description { get; private set; }
    public DateTime? DueDate {get; private set;}
    public bool Completed { get; private set; }

    public Todo(string description, DateTime? dueDate)
    {
        Description = description;
        DueDate = dueDate;
        Completed = false;
    }

    public Todo Complete(bool complete) {
        Completed = complete;
        return this;
    }

    private Todo () {}
}