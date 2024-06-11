namespace SimpleAspNet.Models;

public class Todo {
    public int Id { get; private set; }
    public string? Description { get; private set; }
    public bool Complete { get; private set; } = false;
    public DateTime? DueDate { get; private set; }

    public Todo(string description, bool complete = false, DateTime? dueDate = null)
    {
        Description = description;
        Complete = complete;
        DueDate = dueDate;
    }

    private Todo(){}
}
