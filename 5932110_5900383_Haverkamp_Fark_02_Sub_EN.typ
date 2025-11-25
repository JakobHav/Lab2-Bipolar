#import "@preview/lilaq:0.5.0" as lq

#set page(background: image("assets/frontpage.jpg"))
#v(206pt)
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

=== Circuit Diagrams:

=== Plots:

=== Text Questions:

- At Values below

=== Conclusion:

= 2.2.2. Measurement

== Circuit Diagrams:

#figure(caption: [Schematic of the _BJT characteristics_ circuit])[
  #image("assets/2.2.2.circuit.jpg", width: 70%)
]
=== Plots:

== Text Questions:

=== Conclusion






= 2.3. Common Emitter Amplifier

== 2.3.1 Simulation

=== Circuit Diagrams:

=== Plots:
#include "1.2.plot_sim.typ"

=== Text Questions:

=== Conclusion:

= 2.3.2. Measurement

== Circuit Diagrams:

#figure(caption: [Schematic of the _BJT Amplifier_ circuit])[
  #image("assets/2.3.2.circuit.jpg", width: 70%)
]
=== Plots:

#include "1.2.plot_real.typ"

== Text Questions:

=== Conclusion






= 2.4. Current source

== 2.4.1 Simulation

=== Circuit Diagrams:

=== Plots:
#include "1.3.plot_sim.typ"

=== Text Questions:

=== Conclusion:

= 2.4.2. Measurement

== Circuit Diagrams:


#figure(caption: [Schematic of the _BJT current source_ circuit])[
  #image("assets/2.4.2.circuit.jpg", width: 70%)
]
#figure(caption: [Schematic of the _diode charactieristics_ circuit])[
  #image("assets/2.4.2.circuit2.jpg", width: 70%)
]
#figure(caption: [Schematic of the _LED characteristics_ circuit])[
  #image("assets/2.4.2.circuit3.jpg", width: 70%)
]

=== Plots:
#include "1.3.plot_real.typ"

== Text Questions:

=== Conclusion
