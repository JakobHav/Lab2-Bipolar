#import "@preview/lilaq:0.5.0" as lq

#let (vi, vb, ic, ib) = lq.load-txt(read("LTSpice/2.2.1.charactristics.txt"), delimiter: "\t", skip-rows: 1)


#let bbeta = ()
#for (ic, ib) in ic.zip(ib) {
  bbeta.push(ic / ib)
}

#let ib = ib.map(v => v * 1000000)
#let ic = ic.map(v => v * 1000)

// beta = ic/ib
#show: lq.theme.skyline

#figure(caption: [Simulated base current over base-emitter voltage])[
  #lq.diagram(
    width: 80%,
    height: 22%,
    // title: [],
    xlabel: [*$V_(B E)$* [V]],
    ylabel: [*$I_B$* [$mu$A]],
    legend: (position: left + top),
    xlim: (-0.01, 0.8),
    ylim: (-0, 110),

    cycle: (
      it => {
        set lq.style(stroke: (paint: blue.darken(-20%).transparentize(20%), dash: "solid", thickness: 2pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: blue.darken(20%), dash: "dashed", thickness: 1pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: green.darken(20%), dash: "dotted", thickness: 1pt))
        it
      },
    ),


    lq.plot(vb, ib, mark: ".", mark-size: 0pt),
    // lq.plot(vd_si, i_si, mark: ".", label: [1N4148 (Si Diode)], mark-size: 0pt),
    // lq.plot(vd_z, i_z, mark: ".", label: [ZD3V9 (Zener Diode)], mark-size: 0pt),
  )
]


#show: lq.theme.skyline
#show: lq.set-grid(
  stroke: black.transparentize(90%) + 0.55pt,
  stroke-sub: black.transparentize(80%) + 0.1pt,
  sub: true,
)
#figure(caption: [Simulated $beta "and" I_C "over" I_B$])[
  #lq.diagram(
    width: 80%,
    height: 22%,
    // title: [],
    xlabel: [*$I_B$* [$mu$A]],
    ylabel: [*$beta$* ],
    legend: (position: right + bottom),
    // xlim: (-1, 26),
    ylim: (-800, 1710),
    //
    //
    yaxis: (
      mirror: false,
      exponent: 0,
      subticks: 4,
    ),
    lq.yaxis(
      position: right,
      label: [*$I_C$* [mA]],
      lq.plot(ib, ic, mark: ".", label: [$I_C$], mark-size: 0pt),
    ),

    cycle: (
      it => {
        set lq.style(stroke: (paint: red.darken(-20%).transparentize(20%), dash: "densely-dashed", thickness: 1.5pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: green.darken(10%), dash: "solid", thickness: 1.3pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: green.darken(20%), dash: "dotted", thickness: 1.5pt))
        it
      },
    ),

    lq.plot(ib, bbeta, mark: ".", label: [#sym.beta], mark-size: 0pt),

    // lq.plot(vd_si, i_si, mark: ".", label: [1N4148 (Si Diode)], mark-size: 0pt),
    // lq.plot(vd_z, i_z, mark: ".", label: [ZD3V9 (Zener Diode)], mark-size: 0pt),
  )
] <beta>

#let (v0, i0, v1, i1, v2, i2, v3, i3, v4, i4, v5, i5) = lq.load-txt(
  read("assets/2.2.1.bipolar_step_sim.txt"),
  delimiter: "\t",
  skip-rows: 1,
)

#show: lq.theme.skyline

#let i0 = i0.map(v => v * 1000)
#let i1 = i1.map(v => v * 1000)
#let i2 = i2.map(v => v * 1000)
#let i3 = i3.map(v => v * 1000)
#let i4 = i4.map(v => v * 1000)
#let i5 = i5.map(v => v * 1000)

#figure(caption: [Simulated current through $R_C$ plotted over collector-emitter voltage])[
  #lq.diagram(
    width: 80%,
    height: 23%,
    // title: [],
    xlabel: [*$V_(C E)$* [V]],
    ylabel: [*$I_C$* [mA]],
    legend: (position: right + top),
    // xlim: (-0.2, 7),
    // ylim: (-0, 110),

    cycle: (
      it => {
        set lq.style(stroke: (paint: white.darken(0%).transparentize(20%), dash: "solid", thickness: 1.3pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: orange.darken(0%), dash: "solid", thickness: 1.2pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: red.darken(0%), dash: "solid", thickness: 1.2pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: yellow.darken(5%), dash: "solid", thickness: 1.5pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: green.darken(0%), dash: "solid", thickness: 1.2pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: blue.darken(0%), dash: "solid", thickness: 1.2pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: purple.darken(0%).transparentize(20%), dash: "solid", thickness: 1.3pt))
        it
      },
    ),


    lq.plot(v0, i0, mark: ".", label: [#h(-20pt)$I_B [mu"A"]$], mark-size: 0pt),
    lq.plot(v5, i5, mark: ".", label: [42.9], mark-size: 0pt),
    lq.plot(v4, i4, mark: ".", label: [33.0], mark-size: 0pt),
    lq.plot(v3, i3, mark: ".", label: [23.1], mark-size: 0pt),
    lq.plot(v2, i2, mark: ".", label: [13.2], mark-size: 0pt),
    lq.plot(v1, i1, mark: ".", label: [3.6], mark-size: 0pt),
    lq.plot(v0, i0, mark: ".", label: [0.0], mark-size: 0pt),
  )
]
