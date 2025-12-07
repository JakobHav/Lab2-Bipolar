#import "@preview/lilaq:0.5.0" as lq

#set page(background: image("assets/frontpage.jpg"))
#v(208pt)
#h(105pt)
Jakob Haverkamp
#h(155pt)
5932110

#h(105pt)
Milan Fark
#h(186pt)
5900383

#set page(background: [])

#import "@local/ufr-sheet-universal:0.1.0": conf

#show: doc => conf(
  doc,
  subject: "Electronics Laboratory",
  date: "01.12.2025",
  prof: "Prof. Dr. Hans Zappe",
  semester: "WS 25/26",
  title: "Lab 2 - Bipolars",
  header_start: 2,
  name: "jh1444, mf643",
  left_header: [Jakob Haverkamp \ Milan Fark \ jh1444, #h(5pt)mf643],
)
#counter(page).update(1)
#set text(
  lang: "en",
  size: 11pt,
)

#set figure(numbering: "1")
#show ref: set text(fill: blue)


= 2.2 Bipolar Characteristics

== 2.2.1 Simulation

=== Introduction
Our goal was to simulate the behaviour of a BC547B bipolar. @fig1 shows the circuit
diagram in LTSpice, @fig2 shows the Voltage difference from Base to Emitter, when we slowly ramp up the input voltage, which is connected to the base end of the transistor.
In @beta, we determined $beta$ (the current gain), and plotted it and $I_C$ over $I_B$.
To figure out the early voltages of the bipolar, we plotted $I_C$ over $V_(C E)$ and calculated, where $I_C$ is zero, see @fig4.

=== Circuit Diagrams:

#figure(caption: [LTSpice circuit diagram with \
  instructions for both the first (bottom) and second (top) task])[
  #image("assets/2.2.1.circuit.jpg", width: 39%)
] <fig1>

=== Plots:
#include "1.2.plot_sim.typ"

=== Text Questions:

At currents $I_B lt.approx 0.15$ $mu$A, $beta$ does not approximate a single number, but instead jumps a lot, the max value being 1641.45 and the minimum -715.27, which happens due to really small numbers in the divisor ($I_B$). For slightly currents $I_B > 0.15$ $mu$A, the value for $beta approx 325$.

As we can see in @beta, $beta$ is not constant, instead it slowly goes from $beta approx 325$ at the beginning to $beta approx 260$ at the end. We can not only see the effect in the graph of beta itself, but also in the fact that $I_C$ slowly flattens when plotted over $I_B$.

#let leftt = 68%

#table(
  columns: (65%, 31%),
  stroke: 0pt,
  inset: 0pt,
  gutter: 4%,
  [
    As we can see in @tab1, the early voltages for different values for $I_B$ are all very similar, around 61 V. One trend we can observe however is that for higher $I_B$ values, the early voltages slightly shrink.

    Also, we can see that for $I_B = 0.0$, our value does not make a lot of sense, and it is very difficult to calculate better, as $I_C$ is so close to 0V for the entire time.

  ],

  [
    #figure(caption: "Early Voltages")[

      #table(
        columns: 2,
        stroke: 0.25pt,
        inset: 5pt,
        align: horizon,
        table.header([$I_B [mu A]$], [Early voltage [V]]),
        [0.0], [0.618],

        [3.6], [61.088],
        [13.2], [60.972],
        [23.1], [60.919],
        [33.0], [60.883],
        [42.9], [60.857],
      )

    ]<tab1>


  ],
)
#v(-20pt)
=== Conclusion:

We successfully simulated the BC547B bipolar characteristics. In the input characteristics we could see it producing a diode curve. We could see the bipolar amplifing the base current by a factor of $beta approx 260-325$, going down for bigger $I_B$ values. We also noticed the $I_C$ over $V_(C E)$ curve getting steeper with bigger $I_B$ values and measured an early voltage of $V_E approx 61 V$.

== 2.2.2. Measurement

=== Introduction

In this section, we measured the values we simulated earlier. To calculate $I_B$

=== Circuit Diagrams:

#figure(caption: [Schematic of the _BJT characteristics_ circuit])[
  #image("assets/2.2.2.circuit.jpg", width: 65%)
]

=== Plots:

#include "1.2.plot_real.typ"

=== Text Questions:

In @fig7 we connected a hand-multimeter between pins 1 and 2 of _JP8_ to measure $I_C$ as a function of $I_B$. Due to so little measured values (n=20), the curve is a little wobbly.

Also, we can *not* see $beta$ getting lower over time (and therefore could not see $I_C$ getting less steep), which is different to the simulation.

#let leftt = 68%
#table(
  columns: (65%, 31%),
  stroke: 0pt,
  inset: 0pt,
  gutter: 4%,
  [
    Our measured early voltages in @tab2 are quite similar to each other, around 105-110 V.

    Similar to the simulation, the measured early voltages for $I_B approx 0.0$ $mu$A and $I_B approx 0.24$ $mu$A are not realistic, because $I_C$ is so close to 0 mA.

  ],

  [
    #figure(caption: "Early Voltages")[

      #table(
        columns: 2,
        stroke: 0.25pt,
        inset: 5pt,
        align: horizon,
        table.header([$I_B [mu A]$], [Early voltage [V]]),
        [0.0], [13.690],
        [0.24], [12.081],
        [2.81], [105.100],
        [6.71], [109.670],
        [10.59], [104.432],
      )

    ]<tab2>


  ],
)





=== Conclusion

Most characteristics were similar to the simulation,





= 2.3. Common Emitter Amplifier

== 2.3.1 Simulation

=== Introduction

=== Circuit Diagrams:

#figure(caption: [LTSpice circuit diagram for the common emitter amplifier])[
  #image("assets/2.3.1.circuit.jpg", width: 62%)
]

=== Plots:

#include "1.3.plot_sim.typ"

=== Text Questions:

=== Conclusion:

= 2.3.2. Measurement

=== Introduction

=== Circuit Diagrams:

#figure(caption: [Schematic of the _BJT Amplifier_ circuit])[
  #image("assets/2.3.2.circuit.jpg", width: 70%)
]
// === Plots:

// #include "1.3.plot_real.typ"

=== Text Questions:

To calculate the amplification gain, we calulated: $20 dot log_10(V_"in" / V_"out") approx$ 40.51 dbV

(i)
Amplification of 41.69 dbV


=== Conclusion






= 2.4. Current source

== 2.4.1 Simulation

=== Introduction
The goal was to simulate and characterize a bipolar-based current source.

=== Circuit Diagrams:

#figure(caption: [LTSpice circuit diagram with $R_E = 200 Omega$ and $V_i$ = 2.5V])[
  #image("assets/2.4.1.circuit.jpg", width: 35%)
]
=== Plots:
#include "1.4.plot_sim.typ"

=== Text Questions:

(g)
#table(
  columns: 3,
  inset: 5pt,
  stroke: 0.5pt,
  align: horizon,
  table.header([*$V_i$* [V]], [*$R_E$* [$Omega$]], [*$I_(C(max))$* [mA]]),
  [2.5], [200], [09.98],
  [2.5], [100], [17.72],
  [5], [200], [21.27],
  [5], [100], [42.21],
)


(h)
#table(
  columns: 3,
  inset: 5pt,
  stroke: 0.5pt,
  align: horizon,
  table.header([*$V_i$* [V]], [*$R_E$* [$Omega$]], [*$I_(C(max))$* [mA]]),
  [2.5], [200], [794.33],
  [2.5], [100], [398.11],
  [5], [200], [251.19],
  [5], [100], [125.89],
)

=== Conclusion:

= 2.4.2. Measurement

=== Circuit Diagrams:


#figure(caption: [Schematic of the _BJT current source_ circuit])[
  #image("assets/2.4.2.circuit.jpg", width: 45%)
]
#figure(caption: [Schematic of the _diode charactieristics_ circuit])[
  #image("assets/2.4.2.circuit2.jpg", width: 60%)
]
#figure(caption: [Schematic of the _LED characteristics_ circuit])[
  #image("assets/2.4.2.circuit3.jpg", width: 60%)
]

=== Plots:
#include "1.4.plot_real.typ"

=== Text Questions:

(d)

2.5V -> 16.29 mA \
5V -> 39.19 mA

(e)

The red led is shining bright w 32.16 mA.

The yellow led is also bright w 32.26 mA.

The green led is a little less bright w 32.27 mA.

The blue led is unpleasently bright but not enough to cause permanent eye-damage at 32.17 mA

---

The red led is shining bright w 36.75 mA.

The yellow led is also bright w 36.77 mA.

The green led is quite dim w 36.69 mA.

The blue led is again unpleasently bright at 36.67 mA

=== Conclusion

