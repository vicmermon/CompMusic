remotes::install_github('jaburgoyne/compmus')
library(tidyverse)
library(spotifyr)
library(compmus)

polaris <-
  get_tidy_audio_analysis("1PEPcLm2QEo0HCRIhQjPq1") |>
  select(segments) |>
  unnest(segments) |>
  select(start, duration, pitches)

polaris |>
  mutate(pitches = map(pitches, compmus_normalise, "euclidean")) |>
  compmus_gather_chroma() |> 
  ggplot(
    aes(
      x = start + duration / 2,
      width = duration,
      y = pitch_class,
      fill = value
    )
  ) +
  geom_tile() +
  labs(x = "Time (s)", y = NULL, fill = "Magnitude") +
  theme_minimal() +
  scale_fill_viridis_c()