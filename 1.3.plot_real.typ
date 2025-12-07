#import "@preview/lilaq:0.5.0" as lq
#let (t, vi, vo) = lq.load-txt(read("assets/2.3.2.CEA_C1.out.txt"), delimiter: "\t", skip-rows: 24)

#let (freq, ch1, ch2, phase) = lq.load-txt(read("assets/2.3.2.network.48.txt"), delimiter: "\t", skip-rows: 30)

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

#let amp = ()
#for (out, inn) in ch1.zip(ch2) {
  amp.push(out - inn)
}

#let freq = freq.map(x => x * 1e-3)

#show: lq.theme.skyline

#figure(
  caption: [Phase and amplification of the commom emitter amplifier for  1Hz-100kHz on a $"log"_2$ scale. $R_48= 220 space Omega space$ and $space R_51 = 680 space Omega$ ],
)[
  #lq.diagram(
    width: 100%,
    height: 27%,
    // title: [],
    xlabel: [*Frequency* [kHz]],
    ylabel: [*Amplification* [dB]],
    legend: (position: left + horizon, dy: 10pt, stroke: none),
    xlim: (0.5 / 1000, 100 * 1.4),
    // xscale: "log",
    xscale: lq.scale.log(base: 2),

    xaxis: (
      exponent: 0,
      // subticks: 10,
      ticks: (
        (.001, ".001"),
        (.0021, ".0021"),
        (.005, ".005"),
        (.01, ".01"),
        (.021, ".021"),
        (.05, ".05"),
        (.1, ".1"),
        (.21, ".21"),
        (.5, ".5"),
        (1, "1"),
        (2.1, "2.1"),
        (5, "5"),
        (10, "10"),
        (21.5, "21.5"),
        (50, "50"),
        (100, "100"),
      ),
    ),
    yaxis: (
      mirror: false,
      exponent: 0,
      subticks: 4,
    ),
    lq.yaxis(
      position: right,
      label: [*Phase* [deg]],
      lq.plot(freq, phase, mark: ".", label: [Phase $R_48$], mark-size: 0pt),
    ),

    cycle: (
      it => {
        set lq.style(fill: blue.darken(-30%).transparentize(20%))
        it
      },
      it => {
        set lq.style(fill: blue.darken(30%), stroke: (thickness: 1pt, dash: "dashed"))
        it
      },
      it => {
        set lq.style(fill: red.darken(-30%).transparentize(20%))
        it
      },
      it => {
        set lq.style(fill: red.darken(30%), stroke: (thickness: 1pt, dash: "dashed"))
        it
      },
    ),


    lq.plot(freq, amp, mark: ".", label: [Amp. $R_48$], mark-size: 0pt),
  )
]
