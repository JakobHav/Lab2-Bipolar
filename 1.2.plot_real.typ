#import "@preview/lilaq:0.5.0" as lq
#let (t, vbe, diff) = lq.load-txt(read("assets/2.2.2.bipolar_real_C1_Vbe.txt"), delimiter: "\t", skip-rows: 24)

#let diff = diff.map(x => 1000000 * x / 120000)

#show: lq.theme.skyline

#figure(caption: [Measured base current over base-emitter voltage])[
  #lq.diagram(
    width: 70%,
    height: 22%,
    // title: [],
    xlabel: [*$V_(B E)$* [V]],
    ylabel: [*$I_B$* [$mu$A]],
    legend: (position: left + top),
    // xlim: (-5, 1),
    ylim: (-0, 32),

    cycle: (
      it => {
        set lq.style(stroke: (paint: blue.darken(-20%).transparentize(20%), thickness: 1.5pt, dash: "solid"))
        it
      },
    ),


    lq.plot(vbe, diff, mark: ".", mark-size: 0pt),
  )
]

#let (vi, ic, ib) = lq.load-txt(read("assets/2.2.2.m.bipolar.txt"), delimiter: ",", skip-rows: 1)

#let ib = ib.map(x => 1000 * x / 120000)

#let bbeta = ()
#for (ic, ib) in ic.zip(ib) {
  bbeta.push(ic / ib)
}

#let ib = ib.map(x => 1000 * x)


#show: lq.theme.skyline
#show: lq.set-grid(
  stroke: black.transparentize(90%) + 0.55pt,
  stroke-sub: black.transparentize(80%) + 0.1pt,
  sub: true,
)
#figure(caption: [Measured $beta "and" I_C "over" I_B$])[
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
]

#let (_, ic0, vce0) = lq.load-txt(read("assets/2.2.2.u.bipolar_C1.diff_0V.txt"), delimiter: "\t", skip-rows: 24)
#let (_, ic1, vce1) = lq.load-txt(read("assets/2.2.2.u.bipolar_C1.diff_0.5V.txt"), delimiter: "\t", skip-rows: 24)
#let (_, ic2, vce2) = lq.load-txt(read("assets/2.2.2.u.bipolar_C1.diff_1V.txt"), delimiter: "\t", skip-rows: 24)
#let (_, ic3, vce3) = lq.load-txt(read("assets/2.2.2.u.bipolar_C1.diff_1.5V.txt"), delimiter: "\t", skip-rows: 24)
#let (_, ic4, vce4) = lq.load-txt(read("assets/2.2.2.u.bipolar_C1.diff_2V.txt"), delimiter: "\t", skip-rows: 24)

#show: lq.theme.skyline

#let ic0 = ic0.map(v => 1000 * v / 200)
#let ic1 = ic1.map(v => 1000 * v / 200)
#let ic2 = ic2.map(v => 1000 * v / 200)
#let ic3 = ic3.map(v => 1000 * v / 200)
#let ic4 = ic4.map(v => 1000 * v / 200)
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


    lq.plot(vce0, ic0, mark: ".", label: [#h(-20pt)$I_B [mu"A"]$], mark-size: 0pt),
    // lq.plot(v5, i5, mark: ".", label: [42.9], mark-size: 0pt),
    lq.plot(vce4, ic4, mark: ".", label: [33.0], mark-size: 0pt),
    lq.plot(vce3, ic3, mark: ".", label: [23.1], mark-size: 0pt),
    lq.plot(vce2, ic2, mark: ".", label: [13.2], mark-size: 0pt),
    lq.plot(vce1, ic1, mark: ".", label: [3.6], mark-size: 0pt),
    lq.plot(vce0, ic0, mark: ".", label: [0.0], mark-size: 0pt),
  )
]
