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
  date: "12.11.2025",
  prof: "Prof. Dr. Hans Zappe",
  semester: "WS 25/26",
  title: "Lab 1 - Diodes",
  name: "jh1444, nr254",
  header_start: 2,
  left_header: [Jakob Haverkamp \ Milan Fark \ jh1444, #h(5pt)mf643],
)
#counter(page).update(1)
#set text(
  lang: "en",
  size: 11pt,
)

= 2.2 Bipolar Characteristics

== 2.2.1 Simulation

The goal was to simulate the behaviour of a BC547B bipolar.

=== Circuit Diagrams:

#figure(caption: [LTSpice circuit diagram with \
  instructions for both the first (bottom) and second (top) task])[
  #image("assets/2.2.1.circuit.jpg", width: 50%)
]

=== Plots:
#include "1.2.plot_sim.typ"

=== Text Questions:

(d) the very first values are $beta approx$ -1, then there are really high values up to 1700 and low values to -700, which happen due to really small numbers in the divisor. For slightly higher voltages, the value for $beta approx 320$.

(f)
Beta is not constant as we can see in #text(blue)[@beta], instead it slowly goes from $beta approx 320$ to $beta approx 260$.

(i)
#v(-10pt)
#let leftt = 50%

#table(
  columns: (leftt, 100% - leftt),
  stroke: 0pt,
  [
    #figure(caption: "Early Voltages")[

      #table(
        columns: 2,
        stroke: 0.25pt,
        inset: 5pt,
        align: horizon,
        table.header([$I_B [mu A]$], [Early voltage [V]]),
        [0.0],
        [0.618#footnote[This value is difficult to calculate, as $I_C$ is so close to 0V for the entire time wehen $I_B approx 0V$.]],

        [3.6], [-61.009],
        [13.2], [-39.105],
        [23.1], [-23.927],
        [33.0], [-16.814],
        [42.9], [-12.803],
      )

    ]<tab1>


  ],
  [
    The bigger $I_B$, the bigger the early voltage, as seen in #text(blue)[@tab1].

  ],
)

=== Conclusion:

We successfully simulated the BC547B bipolar characteristics under different voltages and calculated its early voltages.

= 2.2.2. Measurement

== Circuit Diagrams:

#figure(caption: [Schematic of the _BJT characteristics_ circuit])[
  #image("assets/2.2.2.circuit.jpg", width: 70%)
]

=== Plots:

#include "1.2.plot_real.typ"

== Text Questions:

=== Conclusion






= 2.3. Common Emitter Amplifier

== 2.3.1 Simulation

=== Circuit Diagrams:


=== Plots:
#include "1.3.plot_sim.typ"

=== Text Questions:

=== Conclusion:

= 2.3.2. Measurement

== Circuit Diagrams:

#figure(caption: [Schematic of the _BJT Amplifier_ circuit])[
  #image("assets/2.3.2.circuit.jpg", width: 70%)
]
=== Plots:

#include "1.3.plot_real.typ"

== Text Questions:

=== Conclusion






= 2.4. Current source

== 2.4.1 Simulation

The goal was to simulate and characterize a bipolar-based current source.

=== Circuit Diagrams:

#figure(caption: [LTSpice circuit diagram with $R_E = 200 Omega$ and $V_i$ = 2.5V])[
  #image("assets/2.4.1.circuit.jpg", width: 50%)
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

=== Conclusion:

= 2.4.2. Measurement

== Circuit Diagrams:


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

== Text Questions:


=== Conclusion

