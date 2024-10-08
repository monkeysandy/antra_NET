### 1. Choosing Data Types:
- A person’s telephone number: `string` (or `long` if only digits are used)
- A person’s height: `float` or `double`
- A person’s age: `int`
- A person’s gender: `enum` (Male, Female, Prefer Not To Answer)
- A person’s salary: `decimal`
- A book’s ISBN: `string` (as ISBN may include dashes or special characters)
- A book’s price: `decimal`
- A book’s shipping weight: `float` or `double`
- A country’s population: `long`
- The number of stars in the universe: `ulong` or `BigInteger` (for extremely large values)
- The number of employees in small or medium businesses: `int` (since it's up to about 50,000)

### 2. Difference Between Value Type and Reference Type Variables:
- **Value types** (like `int`, `bool`, `char`) store their data directly in their memory location. They are allocated on the stack and hold the actual data.
- **Reference types** (like `string`, `class`, `array`) store a reference to the memory location where the actual data is held (on the heap).
  
- **Boxing**: Converting a value type to a reference type (e.g., from `int` to `object`).
- **Unboxing**: Extracting the value type from an object (e.g., from `object` back to `int`).

### 3. Managed and Unmanaged Resources:
- **Managed resources** are handled by the .NET runtime's garbage collector (e.g., memory for objects).
- **Unmanaged resources** are not handled by the garbage collector (e.g., file handles, database connections). These resources need to be explicitly released.

### 4. Purpose of the Garbage Collector in .NET:
The **Garbage Collector (GC)** automatically manages memory in .NET by reclaiming memory occupied by objects that are no longer in use. This helps prevent memory leaks and ensures efficient memory usage.


### Practice Number Sizes and Ranges:
Create a console app that outputs the memory size and range of various number types:
```csharp
Console.WriteLine($"sbyte: {sizeof(sbyte)} bytes, Range: {sbyte.MinValue} to {sbyte.MaxValue}");
Console.WriteLine($"byte: {sizeof(byte)} bytes, Range: {byte.MinValue} to {byte.MaxValue}");
// Continue for short, ushort, int, uint, long, ulong, float, double, decimal
```

### Composite Formatting – Convert Centuries to Time Units:
Write a program that converts centuries into various time units:
```csharp
int centuries = 1;
int years = centuries * 100;
int days = (int)(years * 365.24);
long hours = days * 24;
long minutes = hours * 60;
long seconds = minutes * 60;
long milliseconds = seconds * 1000;
long microseconds = milliseconds * 1000;
long nanoseconds = microseconds * 1000;

Console.WriteLine($"{centuries} centuries = {years} years = {days} days = {hours} hours = {minutes} minutes = {seconds} seconds = {milliseconds} milliseconds = {microseconds} microseconds = {nanoseconds} nanoseconds");
```

### Test Your Knowledge:

1. **Dividing an `int` by 0**: Throws a `DivideByZeroException`.
2. **Dividing a `double` by 0**: Results in `Infinity`.
3. **Overflowing an `int`**: Causes an `OverflowException` in checked contexts or wraps around in unchecked contexts.
4. **x = y++;**: Assigns the value of `y` to `x`, then increments `y`.
   **x = ++y;**: Increments `y`, then assigns the value of `y` to `x`.
5. **Break** exits the loop; **continue** skips the current iteration; **return** exits the method.
6. The three parts of a `for` statement are: initializer, condition, and iterator. All are optional.
7. **=** is an assignment operator; **==** is a comparison operator.
8. **for( ; true; ) ;**: Compiles and runs an infinite loop.
9. **_** in a switch expression is a discard, acting as a default case.
10. To be enumerated by `foreach`, an object must implement `IEnumerable`.

## Practice loops and operators

### 1. FizzBuzz Program

```csharp
for (int i = 1; i <= 100; i++)
{
    if (i % 15 == 0)
        Console.WriteLine("FizzBuzz");
    else if (i % 3 == 0)
        Console.WriteLine("Fizz");
    else if (i % 5 == 0)
        Console.WriteLine("Buzz");
    else
        Console.WriteLine(i);
}
```

### 1-2. What Happens with This Code?

- **What happens when this code executes?**
  The variable `i` is declared as a `byte`, which has a range from 0 to 255. When `i` reaches 255 and attempts to increment to 256, it will overflow and wrap around to 0, causing an infinite loop because `i` will never reach `max` (500). The program will continuously print values from 0 to 255 over and over again.

- **What code could you add to warn about this problem?**
  To avoid this issue, you could add a check or cast `i` to an integer, or simply change the data type of `i` to `int`:
  ```csharp
  int max = 500;
  for (int i = 0; i < max; i++)
  {
      if (i > byte.MaxValue)
      {
          Console.WriteLine("Warning: Overflow detected!");
          break;
      }
      Console.WriteLine(i);
  }
  ```

### 1-3. Random Number Guessing Game

To create a program that generates a random number between 1 and 3 and asks the user to guess, you can use the following code:

```csharp
int correctNumber = new Random().Next(1, 4); // Generates a number between 1 and 3
Console.WriteLine("Guess a number between 1 and 3:");
int guessedNumber = int.Parse(Console.ReadLine());

if (guessedNumber < 1 || guessedNumber > 3)
{
    Console.WriteLine("Your guess is out of range.");
}
else if (guessedNumber < correctNumber)
{
    Console.WriteLine("Too low.");
}
else if (guessedNumber > correctNumber)
{
    Console.WriteLine("Too high.");
}
else
{
    Console.WriteLine("Correct!");
}
```

### 2. Pyramid 
```csharp
// Pyramid pattern program
int rows = 6; // Number of rows for the pyramid

for (int i = 1; i <= rows; i++)
{
    // Inner loop to print spaces
    for (int j = 1; j <= rows - i; j++)
    {
        Console.Write(" ");
    }

    // Inner loop to print stars
    for (int k = 1; k <= (2 * i - 1); k++)
    {
        Console.Write("*");
    }

    // Move to the next line after printing each row
    Console.WriteLine();
}
```

### 3. Random Number Guessing Game:
```csharp
using System;

class Program
{
    static void Main()
    {
        int correctNumber = new Random().Next(1, 4); // Generates a number between 1 and 3
        Console.WriteLine("Guess a number between 1 and 3:");
        int guessedNumber = int.Parse(Console.ReadLine());

        if (guessedNumber < 1 || guessedNumber > 3)
        {
            Console.WriteLine("Your guess is out of range.");
        }
        else if (guessedNumber < correctNumber)
        {
            Console.WriteLine("Too low.");
        }
        else if (guessedNumber > correctNumber)
        {
            Console.WriteLine("Too high.");
        }
        else
        {
            Console.WriteLine("Correct!");
        }
    }
}
```

### 4. Age Calculation and 10,000 Day Anniversary:
```csharp
using System;

class Program
{
    static void Main()
    {
        // Define a birth date
        DateTime birthDate = new DateTime(1990, 1, 1); // Replace with any birthdate
        DateTime today = DateTime.Now;

        // Calculate the age in days
        int ageInDays = (today - birthDate).Days;
        Console.WriteLine($"You are {ageInDays} days old.");

        // Calculate days until the next 10,000 day anniversary
        int daysToNextAnniversary = 10000 - (ageInDays % 10000);
        DateTime nextAnniversary = today.AddDays(daysToNextAnniversary);

        Console.WriteLine($"Your next 10,000 day anniversary is in {daysToNextAnniversary} days, on {nextAnniversary.ToShortDateString()}.");
    }
}
```

### 5. Greeting Based on Time of Day:
```csharp
using System;

class Program
{
    static void Main()
    {
        // Get the current time (or replace with a fixed time for testing)
        DateTime currentTime = DateTime.Now;
        int hour = currentTime.Hour;

        // Greeting logic using only if statements
        if (hour >= 5 && hour < 12)
        {
            Console.WriteLine("Good Morning");
        }
        if (hour >= 12 && hour < 17)
        {
            Console.WriteLine("Good Afternoon");
        }
        if (hour >= 17 && hour < 21)
        {
            Console.WriteLine("Good Evening");
        }
        if ((hour >= 21 && hour <= 23) || (hour >= 0 && hour < 5))
        {
            Console.WriteLine("Good Night");
        }
    }
}
```

### 6. Counting in Different Increments:
```csharp
using System;

class Program
{
    static void Main()
    {
        // Outer loop to handle different increments (1 to 4)
        for (int increment = 1; increment <= 4; increment++)
        {
            // Inner loop to count from 0 to 24 with the current increment
            for (int i = 0; i <= 24; i += increment)
            {
                Console.Write(i);
                if (i < 24) Console.Write(","); // Adds comma between numbers
            }
            Console.WriteLine(); // Move to the next line after each sequence
        }
    }
}
```