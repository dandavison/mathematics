Title: Quotient Groups
Slug: quotient-groups
date: 2016-12-18

$$
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\C}{\mathbb{C}}
\newcommand{\Rx}{\R^\times}
\newcommand{\mat}[4]{\begin{bmatrix}#1 & #2\\#3 & #4\\ \end{bmatrix}}
\newcommand{\smat}[4]{\tiny{\mat{#1}{#2}{#3}{#4}}}
\newcommand{\cvec}[2]{\begin{pmatrix}#1\\#2\end{pmatrix}}
\newcommand{\scvec}[2]{\tiny{\cvec{#1}{#2}}}
\newcommand{\GL}{\mathrm{GL}}
\newcommand{\GLR}[1]{\mathrm{GL}_{#1}(\R)}
\newcommand{\GLC}[1]{\mathrm{GL}_{#1}(\C)}
\newcommand{\1}{{-1}}
\renewcommand{\bar}{\overline}
\newcommand{\textstack}[2]{
  \left(\begin{array}{c}
    \text{#1}  \\
    \text{#2}
  \end{array}\right)
}
$$

### Modular arithmetic

The canonical example of a quotient group comes from "modular arithmetic" on
the integers. For example, consider the integers, mod 4. This means that every
integer is mapped to whatever its remainder is after dividing by 4. The
integers mod 4 is a group, which contains 4 elements: $\{\bar 0, \bar 1, \bar
2, \bar 3\}$. So $5 \rightarrow \bar 1$, $14 \rightarrow \bar 2$, $-1
\rightarrow \bar 3$, etc.

We said that the integers mod 4 are a group, so what is the group operation?
The answer is that we define an addition law on the elements: for example,
$\bar 1 + \bar 3 = \bar{1 + 3} = \bar 4 = \bar 0$. In words, to find the result
of combining $\bar 1$ with $\bar 3$, you first add $1$ and $3$ as usual to get
4, then see where $4$ is mapped to, and that's the answer. This corresponds to
the fairly familiar notion that e.g. $5 + 23 = 28 = 0$ (mod 4), but it is a bit
subtle/slippery, and it helps to pause and consider exactly what's going on.

Let's be explicit about what $\bar 1$ actually is: it's the set of all integers
that have $1$ as their remainder when divided by $4$. So, $5 \in \bar 1$ for
example. What we've just done is define an addition operation on these *sets*
(as opposed to addition of integers). The operation works as follows. To add
$\bar 2$ and $\bar 3$, you do the following:

1. Take any number that has remainder $2$ (mod $4$) and any number that has
   remainder $3$ (mod $4$).
2. Add them together using normal integer addition and find the remainder (mod
   $4$) of the result.

There are two important points here.

Firstly, we didn't need anything beyond what we had to come up with this
operation: it uses the addition operation that's *already defined* on the main
group to define an operation on the subsets.

Secondly, it is only well-defined if you always get the same answer regardless
of which integers you pick in step (1). In this case that is true.

So we have an example of a "quotient group": $\{\bar 0, \bar 1, \bar 2, \bar
3\}$ under this addition operation. Let's recap and start putting this in group
theoretic terminology.

TODO: What's going on with multiplication? This seems to be preserved as well
by the map that sends integers to their equivalence group / coset.

### A quotient group is a group of cosets

$\bar 0$ (mod $4$) is the following subset of the integers $\Z$ under addition:
$\{\ldots, -12, -8, -4, 0, 4, 8, 12, \ldots\}$. It's not only a subset, but a
*subgroup* (it contains the identity element $0$, every element has an additive
inverse, and addition stays within the subset). It is written as $4\Z$ (or in
general, $n\Z$ for mod $n$). However, we will often use $H$ for a subgroup, so
let's call it $H$.

$\bar 1 = \{\ldots, -11, -7, -3, 1, 5, 9, 13, \ldots\}$ is not a subgroup of
$\Z$ because it does not contain the identity element. What it is is a *coset*
of the subgroup $H$: the set comprising all the results you get by adding $1$
to elements of $H$. We can write this as $1 + H$. In fact, it's usually written
$1H$; we just have to remember that the operation here is additive rather than
multiplicative.

Of course, $\bar 2$ and $\bar 3$ are cosets defined in the same way. $\{\bar 0,
\bar 1, \bar 2, \bar 3\}$ are the only distinct cosets: for example, $\bar 4 =
4+H$ is exactly the same set of integers as $\bar 0$. Similarly, $5 + H = \bar
1$, etc.

So we arrived at the integers mod $4$ quotient group as follows:

1. We started with the group of integers under addition, $\Z^+$.
2. We identified a subgroup $H$.
3. We identified the cosets of $H$: $\{H, 1+H, 2+H, 3+H\}$
4. We defined an operation on the cosets: $(i+H) + (j+H) = (i+j)+H$.
5. We noted that it was only well-defined because
  $$
  \textstack{any number with}{remainder $i$} +
  \textstack{any number with}{remainder $j$} =
  \textstack{a number with the same}{remainder as $i+j$}.
  $$

Note that (3) and (4) can equally be written like this, which is how it's
likely to be written write when considering subgroups and cosets more
abstractly:

(3). We identified the cosets of $H$: $\{H, 1H, 2H, 3H\}$

(4). We defined an operation on the cosets: $(iH) + (jH) = (ij)H$.


### Notational digression

The integers mod $4$ is written $\Z/4\Z$. It's an example of a quotient
group. You read that as $(\text{some group}) / (\text{some subgroup})$. In this
case the group is the integers under addition, and the subgroup is $4Z =
\{\ldots, -12, -8, -4, 0, 4, 8, 12, \ldots\}$[ref]In this context, $4\Z$ always
means multiplication, even if the group operation is addition! So it's the set
$\{4z|z \in \Z\}$. It is *not* the same as the coset $4 + \Z = \{4+z|z \in
\Z\}$. This is a well-established notational inconsistency. [/ref]. In general,
one writes $G/H$ to refer to the quotient group of "$G$ mod $H$".


### A second example of a quotient group

Here's an example of a (simple) problem from an undergraduate textbook on group theory:

> Identify the quotient group $\R^\times/P$, where $P$ denotes the subgroup of
> positive real numbers.

What does this mean and how does one do it? Well, let's try to follow the same
steps as for the integers mod $4$ example above.

Our starting group is the non-zero real numbers under multiplication $\Rx$:
this plays the role of $\Z^+$ in the modular arithmetic example. And the
subgroup is the positive real numbers $P$.

What are the cosets of $P$? To get one example of a coset, you pick a number
$x$ from the main group, and you form a set by combining $x$ with each element
of the subgroup $P$ in turn. So that's the set $\{xp|p \in P\}$. We can see
that we're either going to get all the positive reals (if $x$ is positive), or
all the negative reals (if $x$ is negative). So the set of cosets has those two
sets as its elements: $\{P, -1P\}$.

OK, so we've done steps (1)-(3). Now, what's the group operation that's going
to combine two cosets and produce another coset? Well, in the integers mod $4$
example, we used the standard addition of integers to define the result of
adding cosets $i+H$ and $j+H$ to be the coset $(i+j)+H$. The analogous
definition here would be to use the standard multiplication of real numbers to
say that $(xP)(yP) = (xy)P$. That's going to lead us to the following
intuitively reasonable multiplication table:

$$
\begin{array}{ c|cc }
 ~   & P   & -1P \\
 \hline
 P   & P   & -1P \\
 -1P & -1P & P \\
\end{array}
$$

And we conclude that the quotient group is isomorphic to the group of size 2
(there's only one -- the one with this multiplication table).

The only question is (5): is the operation on cosets well-defined? In this
case, the answer is yes: for example, any positive number $x \in P$, multiplied
by any negative number $y \in -1P$, is going to give a negative number $xy \in
-1P$.[ref]We can prove it easily here because the group is commutative:
$(xP)(yP) = (Px)(yP) = P(xy)P = (xy)PP = (xy)P$. In addition to commutativity
those steps make use of associativity and closure.[/ref].


### Quotient groups of arbitrary groups

What about in general? If we have a subgroup, can we just identify the cosets
of the subgroup, and define a composition law on them using the composition law
from the main group? Will it always be well-defined in the sense answered
above? The answer is: yes if and only if the subgroup is "normal".

A normal subgroup $H$ is defined to be a subgroup that is closed under
conjugation. This means that you can take any element $g$ of the main group,
form the product $ghg^\1$ using any element $h$ of the subgroup, and the result
will always be in the subgroup. One can prove that if and only if this is true,
then the composition of cosets is well-defined, in which case the prescription
above for forming a quotient group can be followed (find the cosets of $H$,
define the operation on the cosets).

So, if you need to find a quotient group of some subgroup, you need to show
that the subgroup is normal. There are two ways of doing that:

1. Show that it is closed under conjugation.
2. Show that it is the kernel of a homomorphism.



### First isomorphism theorem

[https://theoremoftheweek.wordpress.com/2010/05/20/theorem-26-the-first-isomorphism-theorem/ | Cambridge Theorem of the Week blog ]

Every normal subgroup is the kernel of the homomorphism that sends a group element to its coset.

Can two "different" homomorphisms share the same kernel?

Let $f: G \rightarrow G'$ be a homomorphism with kernel $N$. $e \in N$,
therefore every $g \in G$ is in some coset $gN$, so the set of cosets
partitions the domain. What about the image? Consider two elements $gn_1$ and
$gn_2$ of the same coset. These both get sent to the same value, since
$f(gn_i) = f(g)f(n_i) = f(g)$.

So is it possible to have homomorphisms $f$ and $\varphi$ with the same kernel
$N$ but with $f(g) \neq \varphi(g)$ for some $g \in G$? If that were true


----------------------------------------------------------------------------
