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
