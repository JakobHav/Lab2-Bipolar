#import "@preview/lilaq:0.5.0" as lq

#let (freq, ch1, phase) = lq.load-txt(read("assets/2.3.2.ac_R_48.txt"), delimiter: ",", skip-rows: 1)
#let (freq2, ch1_2, phase2) = lq.load-txt(
  read("assets/2.3.2.ac_R_51.txt"),
  delimiter: ",",
  skip-rows: 1,
)

#let freq = freq.map(x => x * 1e-6)
#let freq2 = freq2.map(x => x * 1e-6)

#show: lq.theme.skyline

#figure(
  caption: [Simulated phase and amplification of the common emitter amplifier for a frequency of  1kHz-100MHz on a $"log"_2$ scale. $R_48= 220 space Omega space$ and $space R_51 = 680 space Omega$ ],
)[
  #lq.diagram(
    width: 80%,
    height: 24%,
    // title: [],
    xlabel: [*Frequency* [MHz]],
    ylabel: [*Amplification* [dB]],
    legend: (position: right + bottom, dx: -0pt, dy: -0pt, stroke: none),
    xlim: (0.0008, 100 * 1.16),
    ylim: (0, 45),
    xscale: lq.scale.log(base: 2),

    xaxis: (
      exponent: 0,
      // subticks: 10,
      ticks: (
        (.001, ".001"),
        (.0025, ".0025"),
        (.005, ".005"),
        (.01, ".01"),
        (.025, ".025"),
        (.05, ".05"),
        (.1, ".1"),
        (.25, ".25"),
        (.5, ".5"),
        (1, "1"),
        (2.5, "2.5"),
        (5, "5"),
        (10, "10"),
        (25, "25"),
        (50, "50"),
        (100, "100"),
      ),
    ),
    yaxis: (
      mirror: false,
      exponent: 0,
      subticks: 4,
    ),

    cycle: (
      it => {
        set lq.style(fill: blue.darken(-20%).transparentize(0%), stroke: (thickness: 1pt))
        it
      },
      it => {
        set lq.style(fill: red.darken(-20%).transparentize(0%), stroke: (thickness: 1pt))
        it
      },
      it => {
        set lq.style(fill: blue.darken(20%).transparentize(30%), stroke: (thickness: 1pt, dash: "dashed"))
        it
      },
      it => {
        set lq.style(fill: red.darken(20%).transparentize(30%), stroke: (thickness: 1pt, dash: "dashed"))
        it
      },
    ),


    lq.plot(freq, ch1, mark: ".", label: [Amp. $R_48$], mark-size: 0pt),
    lq.plot(freq2, ch1_2, mark: ".", label: [Amp. $R_51$], mark-size: 0pt),
    lq.yaxis(
      position: right,
      label: [*Phase* [deg]],
      lq.plot(freq, phase, mark: ".", label: [Phase $R_48$], mark-size: 0pt),
      lq.plot(freq2, phase2, mark: ".", label: [Phase $R_51$], mark-size: 0pt),
      lim: (-150, 200),
    ),
  )
] <fig10>
