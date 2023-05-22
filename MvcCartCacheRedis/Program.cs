using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using MvcCartCacheRedis.Context;
using MvcCartCacheRedis.Repositories;
using MvcCartCacheRedis.Services;
using StackExchange.Redis;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
string dbConnectionString = builder.Configuration.GetConnectionString("LibrosDB");
string redisConnectionString = builder.Configuration.GetConnectionString("RedisCache");

builder.Services.AddDbContext<DataContext>(options => options.UseSqlServer(dbConnectionString));

builder.Services.AddTransient<RepositoryCart>();
builder.Services.AddTransient<ServiceCart>();

builder.Services.AddStackExchangeRedisCache(options =>
{
    options.Configuration = redisConnectionString;
});

builder.Services.AddSingleton<IConnectionMultiplexer>(ConnectionMultiplexer.Connect(redisConnectionString));

builder.Services.AddControllersWithViews();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
