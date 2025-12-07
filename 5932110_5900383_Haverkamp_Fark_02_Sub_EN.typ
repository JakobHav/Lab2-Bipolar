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
diagram in LTSpice, @fig2 shows the Voltage difference from Base to Emitter, when we slowly ramp up the input voltage $V_i$, which is connected to the base end of the transistor.
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

At currents $I_B lt.approx 0.15$ $mu$A, $beta$ does not approximate a single number, but instead jumps a lot, the maximum value being 1641.45 and the minimum -715.27, which happens due to small numbers in the divisor ($I_B$). For slightly higher currents $I_B > 0.15$ $mu$A, the value for $beta approx 325$.

As seen in @beta, $beta$ is not constant, instead slowly going from $beta approx 325$ at the beginning to $beta approx 260$ at the end. The effect is seen not only in the graph of beta itself, but also in the fact that $I_C$ flattens when plotted over $I_B$.

#let leftt = 68%

#table(
  columns: (65%, 31%),
  stroke: 0pt,
  inset: 0pt,
  gutter: 4%,
  [
    As seen in @tab1, the early voltages for different values of $I_B$ are all very similar, around 61 V. One observable trend  is that for higher $I_B$ values, the early voltages slightly decreases.

    It is also visible that for $I_B = 0.0$, the value does not make a lot of sense, and is difficult to calculate better, as $I_C$ is close to 0V.

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

We successfully simulated the BC547B bipolar characteristics. In the input characteristics we could see it producing a diode curve. We could see the bipolar amplifying the base current by a factor of $beta approx 260-325$, going down for bigger $I_B$ values. We also noticed the $I_C$ over $V_(C E)$ curve getting steeper with bigger $I_B$ values and measured an early voltage of $V_E approx 61 V$.

== 2.2.2. Measurement

=== Introduction

In this section, we measured the values we simulated earlier. To calculate $I_B$ we measured the voltage drop over the resistor $R_41$ and did the same with $I_C$ and $R_31$ (@fig5). We used that to calculate $beta$ as well as the early voltages at different base currents.

=== Circuit Diagrams:

#figure(caption: [Schematic of the _BJT characteristics_ circuit])[
  #image("assets/2.2.2.circuit.jpg", width: 65%)
] <fig5>

=== Plots:

#include "1.2.plot_real.typ"

=== Text Questions:

In @fig7 we connected a hand-multimeter between pins 1 and 2 of _JP8_ to measure $I_C$ as a function of $I_B$. Due to the limited amount of measurements (n=20), the curve is a little wobbly.

$beta$ is, different to the simulation, not getting lower over time (and therefore $I_C$ is not getting less steep), instead staying around $beta approx 630$.

#let leftt = 68%
#table(
  columns: (65%, 31%),
  stroke: 0pt,
  inset: 0pt,
  gutter: 4%,
  [
    The relevant early voltages calculated form measurements in @tab2 are quite similar to each other, around 105-110 V.

    Similar to the simulation, the measured early voltages for $I_B approx 0.0$ $mu$A and $I_B approx 0.24$ $mu$A are not realistic, because $I_C$ is close to 0 A.

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

Most characteristics were similar to the simulation, however we could not see beta getting lower over time. We measured the early voltage to be $V_E approx 105-110$. The input characteristics look very similar to the simulation, again producing a diode curve.





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
=== Plots:

#include "1.3.plot_real.typ"

=== Text Questions:

We calculated phase shift of $R_48$ to be $Phi(R_48) approx 168.02 degree$ \ #h(50pt)and phase shift of $R_51$ to be $Phi(R_51) approx 176.45 degree$.

To calculate the amplification gain for the given system, we calculated the gain between the maximum input and output voltage (so the difference in amplitudes):

$
  "Amplification" R_48 = 20 dot log_10(max(V_"out") / max(V_"int"))approx 20 dot log_10((1.592 space"V") / (0.015 space "V")) approx 40.51 "dB"
$
$
  "Amplification" R_51 = 20 dot log_10(max(V_"out") / max(V_"int"))approx 20 dot log_10((0.843 space "V") / (0.015 space "V")) approx 34.62 "dB"
$

With the spectrum analysis, we got amplification values of:
$ R_48": " 41.69 "dB" \ R_51": " 36.33 "dB" $

With the small signal analysis, we calculated the gain and phase shift at 10kHz to be: $ R_48": " 41.15 "dB and" 168.48 degree \ R_51": " 35.53 "dB and" 176.11#sym.degree $

All calculated values are very similar, also in the graph.

=== Conclusion

The amplification of the common emitter amplifier with $R_48 approx 41$ dB and with $R_51 approx 35$ dB.

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

=== Introduction

Section 2.4.2. is about a bipolar current source, which we used to power light-emitting diodes.

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

=== Text Questions:

The collector current is $I_C =$ 16.29 mA for $V_i = 2.5$ V and $I_C = 39.19$ mA for $V_i = 5$V

When connected one at a time, the red LED shines brightly with current $I_C =$ 32.16 mA. The yellow LED is also bright with $I_C =$ 32.26 mA.

The green LED is a little less bright with $I_C =$ 32.27 mA and blue LED is unpleasently bright, but not enough to cause permanent eye-damage, with $I_C =$ 32.17 mA.

---

With the Zener diode, the red LED is, again, shining bright with $I_C =$ 36.75 mA, just like the yellow LED, which is also bright and has a current of $I_C =$ 36.77 mA.

The green LED is quite dim with $I_C =$ 36.69 mA and the blue LED is again unpleasently bright with $I_C =$ 36.67 mA.

=== Conclusion

