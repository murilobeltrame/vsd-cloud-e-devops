using Microsoft.EntityFrameworkCore;
using DemoApp.Api;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddDbContext<ApplicationContext>(options => options.UseSqlServer(builder.Configuration.GetConnectionString("TodosDatabase")));
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
const string defaultPolicy = "__defaultCorsPolicy";
builder.Services.AddCors(options => options.AddPolicy(defaultPolicy, policy => 
    policy
        .WithOrigins("http://*.azurestaticapps.net", "https://*.azurestaticapps.net")
        .SetIsOriginAllowedToAllowWildcardSubdomains()
        .SetIsOriginAllowed(origin => new Uri(origin).IsLoopback)
        .AllowAnyHeader()
        .AllowAnyMethod()));

var app = builder.Build();

app.UseSwagger();
app.UseSwaggerUI();

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.UseCors(defaultPolicy);

using var scope = app.Services.CreateScope();
var db = scope.ServiceProvider.GetRequiredService<ApplicationContext>();
await db.Database.MigrateAsync();

await app.RunAsync();
