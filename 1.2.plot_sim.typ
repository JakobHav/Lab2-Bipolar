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

#figure(caption: "Simulated input characteristics")[
  #lq.diagram(
    width: 100%,
    height: 33%,
    // title: [],
    xlabel: [*$V_(B E)$* [V]],
    ylabel: [*$I_B$* [#sym.mu A]],
    legend: (position: left + top),
    xlim: (0, 0.9),
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

#figure(caption: "Simulated input characteristics")[
  #lq.diagram(
    width: 100%,
    height: 33%,
    // title: [],
    xlabel: [*$I_B$* [$mu$A]],
    ylabel: [*$beta$* ],
    legend: (position: right + bottom),
    // xlim: (0, 0.9),
    // ylim: (-0, 110),
    //
    //
    yaxis: (mirror: false),
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
        set lq.style(stroke: (paint: green.darken(10%), dash: "solid", thickness: 1.5pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: green.darken(20%), dash: "dotted", thickness: 1pt))
        it
      },
    ),

    lq.plot(ib, bbeta, mark: ".", label: [#sym.beta], mark-size: 0pt),

    // lq.plot(vd_si, i_si, mark: ".", label: [1N4148 (Si Diode)], mark-size: 0pt),
    // lq.plot(vd_z, i_z, mark: ".", label: [ZD3V9 (Zener Diode)], mark-size: 0pt),
  )
]
