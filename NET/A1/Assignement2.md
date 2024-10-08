### Test Your Knowledge:

1. **When to use `String` vs `StringBuilder` in C#?**
   - Use `String` when dealing with a small number of immutable text changes (since `String` is immutable, creating a new string every time it's modified).
   - Use `StringBuilder` when performing multiple modifications to a string (e.g., concatenations, appends) as it’s mutable and more efficient for repeated changes.

2. **What is the base class for all arrays in C#?**
   - `System.Array` is the base class for all arrays in C#.

3. **How do you sort an array in C#?**
   - You can sort an array using `Array.Sort()` method.
   ```csharp
   int[] arr = { 3, 1, 4, 1, 5, 9 };
   Array.Sort(arr);
   ```

4. **What property of an array object can be used to get the total number of elements in an array?**
   - The `Length` property is used to get the total number of elements in an array.

5. **Can you store multiple data types in `System.Array`?**
   - No, `System.Array` stores elements of a single data type. If you want to store multiple types, you can use an array of `object`.

6. **What’s the difference between the `System.Array.CopyTo()` and `System.Array.Clone()`?**
   - `CopyTo()` copies elements to another existing array starting from a particular index.
   - `Clone()` creates a shallow copy of the array (a new array instance with the same elements).

---

### Practice Arrays:

1. **Copying an Array:**
   ```csharp
   using System;

   class Program
   {
       static void Main()
       {
           // Original array
           int[] originalArray = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
           
           // Create a new array of the same length
           int[] copiedArray = new int[originalArray.Length];

           // Copy the values using a loop
           for (int i = 0; i < originalArray.Length; i++)
           {
               copiedArray[i] = originalArray[i];
           }

           // Print both arrays to verify
           Console.WriteLine("Original Array: " + string.Join(", ", originalArray));
           Console.WriteLine("Copied Array: " + string.Join(", ", copiedArray));
       }
   }
   ```

2. **Grocery List Management Program:**
   ```csharp
   using System;
   using System.Collections.Generic;

   class Program
   {
       static void Main()
       {
           List<string> items = new List<string>();

           while (true)
           {
               Console.WriteLine("Enter command (+ item, - item, or -- to clear):");
               string input = Console.ReadLine();

               if (input.StartsWith("+"))
               {
                   items.Add(input.Substring(2));
               }
               else if (input.StartsWith("-"))
               {
                   items.Remove(input.Substring(2));
               }
               else if (input == "--")
               {
                   items.Clear();
               }

               Console.WriteLine("Current list: " + string.Join(", ", items));
           }
       }
   }
   ```

3. **Find All Prime Numbers in a Range:**
   ```csharp
   using System;
   using System.Collections.Generic;

   class Program
   {
       static void Main()
       {
           int[] primes = FindPrimesInRange(10, 50);
           Console.WriteLine("Primes: " + string.Join(", ", primes));
       }

       static int[] FindPrimesInRange(int startNum, int endNum)
       {
           List<int> primes = new List<int>();

           for (int i = startNum; i <= endNum; i++)
           {
               if (IsPrime(i))
               {
                   primes.Add(i);
               }
           }

           return primes.ToArray();
       }

       static bool IsPrime(int num)
       {
           if (num < 2) return false;

           for (int i = 2; i <= Math.Sqrt(num); i++)
           {
               if (num % i == 0) return false;
           }

           return true;
       }
   }
   ```

4. **Rotate an Array and Sum:**
    ```csharp
    using System;
    using System.Linq;

    class Program
    {
        static void Main()
        {
            // Read input array and k
            int[] array = Console.ReadLine().Split().Select(int.Parse).ToArray();
            int k = int.Parse(Console.ReadLine());

            int[] sumArray = new int[array.Length];

            for (int r = 1; r <= k; r++)
            {
                int[] rotatedArray = new int[array.Length];

                for (int i = 0; i < array.Length; i++)
                {
                    // Perform rotation
                    rotatedArray[(i + r) % array.Length] = array[i];
                }

                // Sum the rotated arrays
                for (int i = 0; i < array.Length; i++)
                {
                    sumArray[i] += rotatedArray[i];
                }
            }

            // Output the result
            Console.WriteLine(string.Join(" ", sumArray));
        }
    }
    ```


5. **Find Longest Sequence of Equal Elements:**
    ```csharp
    using System;

    class Program
    {
        static void Main()
        {
            // Read input array
            int[] array = Array.ConvertAll(Console.ReadLine().Split(), int.Parse);

            int longestLength = 1;
            int longestElement = array[0];
            int currentLength = 1;

            // Traverse the array to find the longest sequence
            for (int i = 1; i < array.Length; i++)
            {
                if (array[i] == array[i - 1])
                {
                    currentLength++;
                }
                else
                {
                    currentLength = 1;
                }

                // Update longest sequence if found
                if (currentLength > longestLength)
                {
                    longestLength = currentLength;
                    longestElement = array[i];
                }
            }

            // Output the result
            for (int i = 0; i < longestLength; i++)
            {
                Console.Write(longestElement + " ");
            }
        }
    }
    ```
7. **Find the Most Frequent Number**
    ```csharp
    using System;
    using System.Collections.Generic;
    using System.Linq;

    class Program
    {
        static void Main()
        {
            // Input sequence of numbers
            int[] numbers = { 4, 1, 1, 4, 2, 3, 4, 4, 1, 2, 4, 9, 3 };  // Example input
            
            // Dictionary to store the frequency of each number
            Dictionary<int, int> frequencyMap = new Dictionary<int, int>();
            
            // Calculate the frequency of each number
            foreach (int number in numbers)
            {
                if (frequencyMap.ContainsKey(number))
                {
                    frequencyMap[number]++;
                }
                else
                {
                    frequencyMap[number] = 1;
                }
            }

            // Find the maximum frequency
            int maxFrequency = frequencyMap.Values.Max();
            
            // Find the leftmost number with the maximum frequency
            int mostFrequentNumber = numbers.First(n => frequencyMap[n] == maxFrequency);

            // Output the result
            Console.WriteLine($"The number {mostFrequentNumber} is the most frequent (occurs {maxFrequency} times).");
        }
    }

    ```
---

### Practice Strings:

1. **Reverse String - Two Methods:**
   ```csharp
   using System;

   class Program
   {
       static void Main()
       {
           // First method: Using char array
           string input = "sample";
           char[] charArray = input.ToCharArray();
           Array.Reverse(charArray);
           string reversedString = new string(charArray);
           Console.WriteLine(reversedString);  // Output: elpmas

           // Second method: Using a for-loop
           for (int i = input.Length - 1; i >= 0; i--)
           {
               Console.Write(input[i]);
           }
       }
   }
   ```

2. **Reverse Words in a Sentence:**
   ```csharp
   using System;
   using System.Linq;

   class Program
   {
       static void Main()
       {
           string sentence = "C# is not C++, and PHP is not Delphi!";
           string[] words = sentence.Split(new char[] { ' ', '.', ',', '!', '?' }, StringSplitOptions.RemoveEmptyEntries);
           string reversedSentence = string.Join(" ", words.Reverse());
           Console.WriteLine(reversedSentence);
       }
   }
   ```

3. **Extract Palindromes:**
   ```csharp
   using System;
   using System.Linq;

   class Program
   {
       static void Main()
       {
           string text = "Hi,exe? ABBA! Hog fully a string: ExE. Bob";
           string[] words = text.Split(new char[] { ' ', ',', '.', '!', '?' }, StringSplitOptions.RemoveEmptyEntries);

           var palindromes = words.Where(w => w.SequenceEqual(w.Reverse()))
                                  .Distinct()
                                  .OrderBy(w => w);

           Console.WriteLine(string.Join(", ", palindromes));
       }
   }
   ```

4. **URL Parsing:**
   ```csharp
   using System;

   class Program
   {
       static void Main()
       {
           string url = "https://www.apple.com/iphone";
           ParseUrl(url);
       }

       static void ParseUrl(string url)
       {
           Uri uri = new Uri(url);
           Console.WriteLine($"[protocol] = \"{uri.Scheme}\"");
           Console.WriteLine($"[server] = \"{uri.Host}\"");
           Console.WriteLine($"[resource] = \"{uri.AbsolutePath.Trim('/')}\"");
       }
   }
   ```
