#import "@preview/lilaq:0.5.0" as lq
#let (t, vi, vo) = lq.load-txt(read("assets/2.3.2.CEA_C1.out.txt"), delimiter: "\t", skip-rows: 24)
// #let (_, vi_st, vd_st) = lq.load-txt(read("assets/BAT41_real_neu.txt"), delimiter: "\t", skip-rows: 20)
// #let (_, vi_si, vd_si) = lq.load-txt(read("assets/1N4148_real_neu.txt"), delimiter: "\t", skip-rows: 20)

#let max_vi = 0
#let max_vo = 0

#for i in vi {
  if i > max_vi {
    max_vi = i
  }
}

#for i in vo {
  if i > max_vo {
    max_vo = i
  }
}

#let db = 20 * calc.log(max_vi / max_vo)

// #panic(db)

#show: lq.theme.skyline

#figure(caption: [])[
  #lq.diagram(
    width: 80%,
    height: 27%,
    // title: [],
    xlabel: [* * []],
    ylabel: [* * []],
    legend: (position: left + top),
    // xlim: (-5, 1),
    // ylim: (-0, 4),

    cycle: (
      it => {
        set lq.style(fill: red.darken(20%).transparentize(20%))
        it
      },
      it => {
        set lq.style(fill: blue.darken(20%), stroke: (thickness: 1pt, dash: "dashed"))
        it
      },
      it => {
        set lq.style(fill: green.darken(20%), stroke: (thickness: 1pt, dash: "dotted"))
        it
      },
    ),


    lq.plot(t, vi, mark: ".", label: [BAT41 #h(1pt) (Schottky Diode)], mark-size: 0pt),
    // lq.plot(
    //   vd_si,
    //   i_si,
    //   stroke: (paint: blue.darken(20%), thickness: .7pt, dash: "dashed"),
    //   mark: ".",
    //   label: [1N4148 (Si Diode)],
    //   mark-size: 0pt,
    // ),
    // lq.plot(vd_z, i_z, mark: ".", label: [ZD3V9 (Zener Diode)], mark-size: 0pt),
  )
]
