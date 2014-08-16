Objective
---

Write a program that prints out a multiplication table of the first 10 prime numbers.

The program must run from the command line and print one table to STDOUT.

The first row and column of the table should have the 10 primes, with each cell containing the product of the primes for the corresponding row and column.

Notes
---
* Consider complexity. How fast does your code run? How does it scale?
*  Consider cases where we want N primes.
* Do not use the Prime class from `stdlib` (write your own code).
* Write tests. Try to demonstrate TDD/BDD.

Response
---
The purpose of this project to collect a code sample to be discussed at the next interview with FC. 

In gathering requirement with Amy, she mentioned that there would be no algorithm questions in the next interview, and that FC was more of a ruby shop, than a rails shop. 

When coding this challenge, extensibility and testability were higher considerations than speed of prime generation. 

The primes are generated from the `Eratosthenes` class which uses the Sieve of Eratosthenes. While faster prime number sieves have been discovered in the past 2208 years, [Atkin](http://en.wikipedia.org/wiki/Sieve_of_Atkin) and [Sundaram](http://en.wikipedia.org/wiki/Sieve_of_Sundaram), Eratosthenes has the best tradeoffs between speed and code complexity.

The `Table` class has a class method, `::fancy_table` that generates the table. Additionally are the `math` and `max_cell_width` methods that can be overridden to create tables for other mathematical operations; addition, powers, subtraction, etc. 

The file `bin/primes_plus_table.rb` demonstrates where `math` and `max_cell_width` are overridden to create an addition table. 

In `/spec` are the tests for the `Table` and `Eratosthenes` class. The tests for `Table` check that the shape, header, and first column conform to the Objective. Tests for `Eratosthenes` check all the primes under 100, then 1000.


Demo
---
`ruby bin/primes_multiplication_table.rb`

```
     2    3    5    7    11   13   17   19   23   29   
     ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  
2  | 4    6    10   14   22   26   34   38   46   58   
3  | 6    9    15   21   33   39   51   57   69   87   
5  | 10   15   25   35   55   65   85   95   115  145  
7  | 14   21   35   49   77   91   119  133  161  203  
11 | 22   33   55   77   121  143  187  209  253  319  
13 | 26   39   65   91   143  169  221  247  299  377  
17 | 34   51   85   119  187  221  289  323  391  493  
19 | 38   57   95   133  209  247  323  361  437  551  
23 | 46   69   115  161  253  299  391  437  529  667  
29 | 58   87   145  203  319  377  493  551  667  841
```