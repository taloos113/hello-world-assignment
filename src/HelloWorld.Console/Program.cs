namespace HelloWorld.ConsoleApp;

/// <summary>
/// Contains the application entry point for the hello-world console program.
/// </summary>
public static class Program
{
    /// <summary>
    /// Runs the application and writes the greeting to the console.
    /// </summary>
    public static void Main()
    {
        Console.WriteLine(Greeter.GetGreeting());
    }
}
