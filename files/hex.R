library(ggplot2)
library(hexSticker)

set.seed(2025)
n <- 100
x <- runif(n)
y <- rbinom(n, 1, plogis(qlogis(0.01) + 10 * x))

dat <- data.frame(
  y,
  x
)

p <- ggplot(dat, aes(x = x, y = y)) +
  geom_point(
    position = position_jitter(height = 0.05),
    size = 1,
    alpha = 0.3,
    color = "white"
  ) +
  stat_smooth(
    method = "lm",
    se = FALSE,
    color = scales::alpha("firebrick", 0.5),
    lwd = 0.5,
    lty = "dashed",
    alpha = 0.5
  ) +
  stat_smooth(
    method = "glm",
    method.args = list(family = binomial(link = "logit")),
    se = FALSE,
    color = "dodgerblue",
    lwd = 1.5
  ) +
  theme_void() +
  coord_fixed(ratio = 0.8) +
  ylim(c(-0.1, 1.1)) +
  theme_transparent()

sticker(
  p,
  package = "GLMw",
  p_size = 8,
  s_x = 1,
  s_y = .75,
  s_width = 1.3,
  s_height = 1,
  h_fill = "#9F2B68",
  h_color = scales::alpha("white", 0),
  p_color = scales::alpha("white", 1),
  filename = "files/hex.svg"
)
