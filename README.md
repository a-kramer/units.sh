# units.sh

This script prints the results of units in a more understandable way.

The units program has many features and knows many units. The language
it picks when talking about units does not appeal to me. This is an
interactive example:

```sh
$ units
Currency exchange rates from exchangerate-api.com (USD base) on 2024-02-18 
Consumer price index data from US BLS, 2024-02-18 
7235 units, 125 prefixes, 134 nonlinear units

You have: cm
You want: inch
	* 0.39370079
	/ 2.54
```

Here we can read that I have `1 cm` and if I want inches, I have to
multiply with `0.3937...` or divide by `2.54`. Let's do this very literally:

```
 1 cm / 2.54 = 0.3937 cm
```

So, following this kind of language strictly does not lead to the
desired result.


Unit conversions, in my opinion, have to be represented as equations:

```sh
$ ./units.sh cm inches
       cm = 0.39370079 * inches
2.54 * cm = inches
```

So, now we see that `2.54` centimeters _are_ `1 inch`. This I find
much more correct (in presentation). If you have multiple of one of
the sides, just write that factor in front of both sides (e.g.:
`3*2.54*cm = 3*inches`), or type it in directly, units will balance
out the equation and give you the missing factor to make the two units
you provide equal:

```sh
$ ./units.sh "1.6 kg m/s" "N s"
        1.6 kg m/s = 1.6 * N s
0.625 * 1.6 kg m/s = N s
```

My hypothesis here is that all people who struggle with unit conversions
think about conversion as "multiplying with some number" and the same
people will stop struggling once they think of them as _equations_.

It may be that you cannot hold an equation in your head without
writing it down, just like some cannot have an internal visual
representation of objects
([aphantasia](https://en.wikipedia.org/wiki/Aphantasia)). In that
case, always write it down.


