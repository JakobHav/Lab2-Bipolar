#import "@preview/lilaq:0.5.0" as lq

#let (r1, i1) = lq.load-txt(
  read("LTSpice/2.4.1.2.5v100.txt"),
  delimiter: "\t",
  skip-rows: 1,
)
#let (r2, i2) = lq.load-txt(
  read("LTSpice/2.4.1.2.5v200.txt"),
  delimiter: "\t",
  skip-rows: 1,
)
#let (r3, i3) = lq.load-txt(
  read("LTSpice/2.4.1.5v100.txt"),
  delimiter: "\t",
  skip-rows: 1,
)
#let (r4, i4) = lq.load-txt(
  read("LTSpice/2.4.1.5v200.txt"),
  delimiter: "\t",
  skip-rows: 1,
)

#let i1 = i1.map(i => i * 1000)
#let i2 = i2.map(i => i * 1000)
#let i3 = i3.map(i => i * 1000)
#let i4 = i4.map(i => i * 1000)


#show: lq.theme.skyline

#figure(caption: [Current through $R_L$ with different values for $R_L$])[
  #lq.diagram(
    width: 80%,
    height: 23%,
    // title: [],
    xlabel: [*$R_(L)$* [$Omega$]],
    ylabel: [*$I_(C)$* [mA]],
    legend: (position: right + top),
    xlim: (1e-6 / 2, 10e5),
    // ylim: (-0, 110),
    xscale: "log",

    cycle: (
      it => {
        set lq.style(stroke: (paint: white.darken(0%).transparentize(20%), dash: "solid", thickness: 1.3pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: red.darken(-10%), dash: "solid", thickness: 1.5pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: blue.darken(-30%), dash: "densely-dashed", thickness: 1.5pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: green.darken(0%), dash: "dashed", thickness: 1.5pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: yellow.darken(10%), dash: "dotted", thickness: 1.5pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: blue.darken(0%), dash: "densely-dashed", thickness: 1.5pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: purple.darken(0%).transparentize(20%), dash: "solid", thickness: 1.3pt))
        it
      },
    ),


    lq.plot(
      r1,
      i1,
      mark: ".",
      label: [#h(-12.7pt)
        $V_i [V] | R_E [Omega]$],
      mark-size: 0pt,
    ),
    lq.plot(r2, i2, mark: ".", label: [2.5 | 200], mark-size: 0pt),
    lq.plot(r1, i1, mark: ".", label: [2.5 | 100], mark-size: 0pt),

    lq.plot(r4, i4, mark: ".", label: [5 #h(7.5pt) | 200], mark-size: 0pt),
    lq.plot(r3, i3, mark: ".", label: [5 #h(7.5pt) | 100], mark-size: 0pt),
  )
]
