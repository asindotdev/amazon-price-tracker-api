// Plan and Remaining Credits – C# example (.NET 6+, top-level statements)
// Usage: dotnet new console -n Example && copy this file to Program.cs, then ASIN_API_KEY=your-key dotnet run
using System.Text;
using System.Text.Json;

var apiKey = Environment.GetEnvironmentVariable("ASIN_API_KEY") ?? throw new InvalidOperationException("Set ASIN_API_KEY");
using var http = new HttpClient { Timeout = TimeSpan.FromSeconds(120) };
http.DefaultRequestHeaders.Add("Authorization", "Bearer " + apiKey);

var query = "";
var response = await http.SendAsync(new HttpRequestMessage(new HttpMethod("GET"), "https://www.asin.dev/api/v1/account" + (query.Length > 0 ? "?" + query : "")));
if (!response.IsSuccessStatusCode)
{
    Console.Error.WriteLine($"HTTP {(int)response.StatusCode}: {await response.Content.ReadAsStringAsync()}");
    return;
}

using var doc = JsonDocument.Parse(await response.Content.ReadAsStringAsync());
Console.WriteLine(JsonSerializer.Serialize(doc, new JsonSerializerOptions { WriteIndented = true }));
