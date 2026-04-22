namespace HelloWorld.Console.Tests;

using HelloWorld.ConsoleApp;
using Xunit;

/// <summary>
/// Contains unit tests for the <see cref="Greeter" /> class.
/// </summary>
public class GreeterTests
{
    /// <summary>
    /// Verifies that the greeting matches the expected hello-world output.
    /// </summary>
    [Fact]
    public void GetGreeting_ReturnsHelloWorld()
    {
        var result = Greeter.GetGreeting();

        Assert.Equal("Hello, World!", result);
    }
}
