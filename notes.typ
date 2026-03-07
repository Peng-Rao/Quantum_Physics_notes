#import "@local/simple-note:0.0.1": *
#import "lib.typ" as czbloch
#show: simple-note.with(
  title: [
    Quantum Physics
  ],
  date: datetime(year: 2026, month: 2, day: 24),
  authors: (
    (
      name: "Rao",
      github: "https://github.com/Peng-Rao",
      homepage: "https://github.com/Peng-Rao",
    ),
  ),
  affiliations: (
    (
      id: "1",
      name: "Politecnico di Milano",
    ),
  ),
  // cover-image: "./figures/polimi_logo.png",
)
#set math.cases(gap: 1em)
#let ket(content) = $lr(|#content chevron.r)$
#let bra(content) = $lr(chevron.l #content|)$
#let braket(bra-content, ket-content) = $lr(chevron.l #bra-content|#ket-content chevron.r)$

= Quantum State
Quantum states are identified by vectors in complex vector spaces.

Vectors will be denoted by kets, for example the elements of a vector space $cal(H)$ are written authors
$
  bra(v) in cal(H)
$

== State of a Quantum System
=== Scalar Product
The vector space structure automatically implements the *superposition principle*, which states that any linear combination of quantum states with complex coefficients defines a new, valid quantum state of the system.

We define the scalar product between two vectors $bra(u)$ and $ket(v)$ as
$
  ket(u), ket(v) arrow.bar braket(u, v)
$

The notation above simply indicates that the scalar product is a function that takes two vectors and returns a complex number. It satisfies the following properties:
+ Complex conjugate $ forall ket(u), ket(v) in cal(H), braket(u, v) = braket(v, u)^* $
+ linearity $ forall ket(u), ket(v), ket(w) in cal(H), forall alpha, beta in CC, bra(u) [alpha ket(v) + beta ket(w)] = alpha braket(u, v) + beta braket(u, w) $
Vector spaces equipped with a scalar product are called *Hilbert spaces*.

=== Norm
The norm of a vector $ket(v)$ is given by the scalar product of the vector with itself:
$
  norm(v)^2 = braket(v, v)
$

=== Orthogonality
Two vectors $ket(u)$ and $ket(v)$ are said to be *orthogonal* if $braket(u, v)=0$. Two subspaces $cal(H_1), cal(H_2)$ are said to be orthogonal if all vectors in $cal(H_1)$ are orthogonal to all vectors in $cal(H_2)$.

=== Operators
An operator is a function that acts on a vector and returns a vector
$
  hat(O): cal(H) arrow cal(H) \
  ket(v) arrow.bar ket(w) = hat(O) ket(v)
$
In quantum mechanics we will deal with linear operators. A linear operator satisfies
$
  hat(O) (c_1 ket(v_1) + c_2 ket(v_2)) = c_1 hat(O) ket(v_1) + c_2 hat(O) ket(v_2)
$
where $c_1, c_2$ are complex numbers.

=== Commutator
The commutator of two operators is
$
  [hat(O)_1 hat(O)_2] = hat(O)_1 hat(O)_2 - hat(O)_2 hat(O)_1
$
In general the commutator does NOT vanish; it defines an *operator* acting on quantum states:
$
  [hat(O)_1 hat(O)_2] ket(psi) = (hat(O)_1 hat(O)_2 - hat(O)_2 hat(O)_1) ket(psi)
$

=== Bases
The vectors in a given set ${ket(e_k): k=1, dots, n}$ are called linearly independent if
$
  sum_k c_k ket(e_k) = ket(0) quad c_k = 0, forall k
$
None of the vectors in the set can be written as a linear combination of the others.

A basis is a set of linearly independent vectors in $cal(H)$ such that any vector in $cal(H)$ can be expressed as a linear combination of basis vectors. If we denote $cal(B)={ket(e_k): k = 1, dots, n}$
$
  forall ket(v) in cal(H), exists {v_k} in CC, ket(v) = sum_k v_k ket(e_k)
$
We will often work with orthonormal bases, so that for any pair of vectors in the basis
$
  braket(e_k, e_l) = delta_k l
$
where $delta_k$ is the Kronecker delta, which is 1 if $k=l$ and 0 otherwise.

The coordinates of a vector $v_k$ in the basis can be obtained by *projecting* the vector onto the basis vectors:
$
  v_k = braket(e_k, v)
$
and therefore we can write
$
  ket(v) = sum_k braket(e_k, v) ket(e_k) = sum_k ket(e_k) braket(e_k, v)
$
Because of commutativity of scalar multiplication.

The norm of a vector $ket(v)$ can be computed in terms of its coordinates in an orthonormal basis as
$
  norm(v)^2 = sum_k |braket(e_k, v)|^2 = sum_k |v_k|^2
$

We define by
$
  hat(cal(P))_k = ket(e_k) bra(e_k)
$
the projector on a state $ket(e_k)$. And projector has the following properties:
$
  hat(cal(P))^2_k = hat(cal(P))_k quad hat(cal(P))_k hat(cal(P))_ell = 0, forall k eq.not ell
$
Having chosen an orthonormal basis $cal(B)$, any vector is uniquely identified by its coordinates. A vector $ket(v)$ can be represented as a column vector of its coordinates in the basis $cal(B)$:
$
  ket(v) arrow vec(braket(e_1, v), braket(e_2, v), dots, braket(e_n, v))
$

The same vector $ket(v)$ can be expanded in different bases, assume a second basis $cal(B)'={ket(e_k ')}$, the coordinates of the vector in the new basis are given by
$
  ket(v) = sum_k v_k ket(e_k) = sum_k v'_k ket(e_k ')
$
the coordinates $ket(v_k ')$ can be expressed
$
  v'_k = braket(e_k ', v)
$
and use the completeness of $cal(B)$ ($sum_l ket(e_l) bra(e_l) = I$)
$
  v_k ' = & sum_l braket(e_k ', e_l) braket(e_l, v) \
        = & sum_l U_(k l) v_l
$
where $U_(k l) = braket(e_k ', e_l)$ is the change of basis matrix. The same relation in terms of column vectors can be written as
$
  vec(v'_1, v'_2, dots) = mat(U_(1 1), U_(1 2), dots; U_(2 1), U_(2 2), dots; dots.v, dots.v, dots.down) vec(v_1, v_2, dots)
$

We define the matrix elements of an operator $hat(O)$ between two basis vectors as
$
  O_(k l) = braket(e_k, hat(O)|e_l)
$
After having chosen a basis in $cal(H)$, a linear operator can be represented as a matrix.
$
  hat(O) arrow mat(O_(1 1), O_(1 2), dots; O_(2 1), O_(2 2), dots; dots.v, dots.v, dots.down)
$
The matrix element of an operator $hat(O)$ between the states $ket(psi)$ and $ket(phi)$ is the scalar product
$
  braket(psi, hat(O)|phi)
$
=== Tensor Product
Let us consider two vector spaces $cal(H)_1$ and $cal(H)_2$. For any pair of vectors, $ket(v^((1))) in cal(H)$ and $ket(v^((2))) in cal(H)_2$, we can define the *tensor product*
$
  ket(v^((1)) v^((2))) = ket(v^((1))) ket(v^((2))) = ket(v^((2))) ket(v^((1)))
$
Under these conditions, the set of linear combinations of the vectors
$
  {ket(v^((1))) ket(v^((2))): ket(v^((1))) in cal(H)_1, ket(v^((2))) in cal(H)_2}
$
*spans* a vector space called the *tensor product* of $cal(H)_1$ and $cal(H)_2$, denoted by $cal(H)_1 times.o cal(H)_2$.

Given a basis $cal(B)_1 = {ket(e_k^((1))): k=1, dots, n_1}$ for $cal(H)_1$ and a basis $cal(B)_2 = {ket(e_l^((2))): l=1, dots, n_2}$ for $cal(H)_2$, the set $cal(B)={ket(e_k^((1))) ket(e_l^((2))): k=1, dots, n_1; l=1, dots, n_2}$ is a basis in $cal(H)$.
$
  forall ket(psi) in cal(H), exists {psi_k l} in CC, ket(psi) = sum_(k l) c_(k l) ket(e_k^((1))) ket(e_l^((2)))
$
The dimension of the tensor product is the product of the dimensions of the two vector spaces:
$
  dim(cal(H)_1 times.o cal(H)_2) = dim(cal(H)_1) times dim(cal(H)_2)
$

== Two State System
We can illustrate the concepts introduced so far by considering a two state system. Given a basis $cal(B) = {ket(0), ket(1)}$, any state in $cal(H)$ can be written as a linear combination of the basis vectors:
$
  ket(psi) = alpha ket(0) + beta ket(1)
$
where $alpha, beta in CC$ are complex numbers.

Denoting by $phi$ the relative phase between $alpha$ and $beta$, we can parametrize the state of the system in terms of two angles:
$
  alpha = cos(theta/2) quad beta = e^(i phi) sin(theta/2)
$
The parametrization above allows us to identify the quantum states with the points on the surface of a two-dimensional unit sphere, called the *Bloch sphere*:
#figure(
  czbloch.bloch(
    phi: 45deg, //
    theta: 30deg,
    state-color: red,
    length: 4cm,
  ),
)

#pagebreak()


= Obervables
For a quantum system in a state described by some complex vector $ket(v)$, the outcome of measurements of the observable $hat(O)$ is a stochastic variable. The theory can predict:
+ the probability distribution function (pdf), that describes the possible results of the measurement and their respective frequencies
+ the state of the system after the measurement.

== Position Operator
The $abs(psi(x))^2$ describes the probability density of finding the system in the state $ket(psi)$ at position $x$. So the position $x$ is a real stochastic variable with pdf $abs(psi(x))^2$. The mean value of the position of the system is therefore
$
  chevron.l x chevron.r = integral d x abs(psi(x))^2 x
$

== Generic Observables
We define an *observable* to be a quantity that can be measured in an experiment. In quantum mechanics each observable $O$ is associated with a _linear operator_ $hat(O)$ acting in the Hilbert space of physical states:
$
  hat(O): cal(H) & arrow cal(H) \
        ket(psi) & arrow.bar ket(phi) = hat(O) ket(psi)
$
*The measurement is NOT associated with acting with the operator on the state.*

For any quantum state $ket(psi)$, if you perform a large number of repeated measurements on the physical quantity $O$, the statistical mean value obtained will exactly equal the _expectation value_ of the operator $O$ in that state:
$
  chevron.l O chevron.r = braket(psi, hat(O)|psi)
$

== Observing Obervables
The theoretical framework of quantum mechanics allows us to predict:
+ the possible outcomes of the measurements above;
+ the probability of obtaining each of these possible outcomes.

== Eigenvalues and Eigenstates
The possible outcomes of experiments $O_k$, are the eigenvalues of the operator $hat(O)$, that is the solutions of the equation
$
  hat(O) ket(psi_k) = O_k ket(psi_k)
$
where $ket(psi_k)$ is the *eigenstate* associated with the eigenvalue $O_k$.

#pagebreak()

== Hermitian Operators
We must require that the operators that represent observables have only real eigenvalues, since we want to identify the eigenvalues with the possible results of measurements. We can guarantee this if we only use *Hermitian operators* to represent observables.

Let us define first the Hermitian conjugate $hat(O)^dagger$ of an operator $hat(O)$.
Let $ket(psi)$ and $ket(phi)$ be arbitrary states in $cal(H)$, then
$
  braket(phi, hat(O)^dagger|psi) = braket(psi, hat(O)|phi)^*
$
An operator $hat(O)$ is *Hermitian* if
$
  hat(O) = hat(O)^dagger
$

Hermitian operators obey properties that are important for building the logical framework of quantum mechanics.

+ Hermitian operators have real eigenvalues. The eigenvalue equation is $ hat(O) ket(psi_k) = O_k ket(psi_k), k = 1, dots, n $ $ket(psi_k)$ are the eigenfunctions of $hat(O)$, $O_k$ are eigenvalues. The we have $ hat(O) = hat(O)^dagger arrow.double.long O_k in RR $
+ The eigenstates of a Hermitian operator that belong to different eigenvalues are orthogonal.
+ If $hat(O)$ is a Hermitian operator acting on a vector space $cal(H)$, there exists an orthogonal basis of $cal(H)$ made up of eigenvectors of $hat(O)$. Every vector $ket(psi)$ can be expanded as $ ket(psi) = sum_k c_k ket(psi_k) $ where $c_k$ are complex coefficients, compted by taking the projection of $ket(psi)$ onto the state $ket(psi_k)$: $ c_k = braket(psi_k, psi) $
+ The commutator of two Hermitian operators is anti-Hermitian. While this property is trivial to prove, it is useful to keep in mind as a way to check your results. Every time you compute a commutator of Hermitian operators, you have a sanity check of your answer.

#pagebreak()

== Spectral Decomposition
Given the decomposition
$
  ket(psi) = sum_k c_k ket(psi_k)
$
the probability of finding the
nondegenerate eigenvalue $O_k$ when measuring $O$ in the state described by normalized vector $ket(psi)$ is given by
$
  p_k = |c_k|^2
$
Clearly the sum of probabilities should be properly normalized and therefore
$
  sum_k p_k = sum_k |c_k|^2 = 1
$

In the case where the eigenvalue $O_k$ is g-fold degenerate, the probability of $O_k$ being the result of a measurement of the observable $O$ in the state $ket(psi)$ is obtained by summing over the contributions from the whole subspace spun by the degenerate eigenvectors.
$
  p_k = sum_(n=1)^g |c_k^((n))|^2 = sum_(n=1)^g |braket(psi_k^((n)), psi)|^2
$

== Collapse of the State Vector
Immediately after a measurement that gave the result $O_k$, where $O_k$ is a nondegenerate eigenvalue, the system is in the state $ket(psi_k)$, the eigenvector of $hat(O)$ associated with the eigenvalue $O_k$. The state vector has been *projected* onto the eigenstate by the process of performing the measurement.

Immediately after a measurement yielding the value $O_k$, the state of the system is transformed according to
$
  ket(psi) arrow.bar 1 / sqrt(braket(psi, hat(cal(P))_k|psi)) hat(cal(P))_k ket(psi) = ket(psi_k)
$
This is sometimes referred to as the collapse of the state vector.
