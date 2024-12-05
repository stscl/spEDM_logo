
``` r
set.seed(123)
fig1 = ggplot2::ggplot(data.frame(x = rnorm(5e5),y = rnorm(5e5)), 
                       ggplot2::aes(x = x, y = y)) +
  ggplot2::geom_hex(bins = 30, show.legend = F) +
  ggplot2::scale_fill_gradient(low = "#212d2c", high = "#ffffff") + 
  ggplot2::coord_fixed() + 
  ggplot2::theme_void() +
  ggplot2::theme(
    plot.background = ggplot2::element_rect(fill = "transparent", 
                                            color = "transparent"),
    panel.background = ggplot2::element_rect(fill = "transparent", 
                                             color = "transparent")
  ) +
  ggview::canvas(width = 600, height = 550, units = 'px')
ggview::save_ggplot(fig1,'./bg.png',dpi = 100, bg = 'transparent')

ccm = figpatch::fig('./CCM1.png')
ccm = ggimage::ggbackground(ccm, './bg.png')
ggplot2::ggsave("./ccm_binding.png", ccm,
                width = 3.25, height = 3.25, 
                dpi = 100)

library(showtext)
showtext_auto(enable = TRUE)
font_add("ShineTypewriter", regular = "./ShineTypewriter-lgwzd.ttf")
library(hexSticker)
library(magick)

sticker(
  subplot = "./ccm_binding.png",
  s_x = 0.995,
  s_y = 0.920,
  s_width = .6,
  s_height = .6,
  package = "spEDM",
  p_family = "ShineTypewriter",
  p_size = 18.5,
  p_x = 1.00,
  p_y = 1.525,
  p_color = "#a9fdff",
  dpi = 300,
  asp = 1,
  h_size = 2.25,
  h_color = "#24e2be",
  h_fill = "#212d2c",
  white_around_sticker = F,
  url = "https://stscl.github.io/spEDM",
  u_color = "#a9fdff",
  u_size = 5.25,
  filename = "spEDM_logo.png"
)

image_read('./spEDM_logo.png') |> 
  image_resize("240x278")|> 
  image_write('./spEDM_logo.png')
```

![](./spEDM_logo.png)

**Special thanks to [my girlfriend](https://github.com/layeyo) for her
invaluable help in designing the core EDM figure.**
