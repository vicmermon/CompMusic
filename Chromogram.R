library(tidyverse)
library(spotifyr)
library(compmus)


###### Chromogram of sk8r boi

movies <-
  get_tidy_audio_analysis("00Mb3DuaIH1kjrwOku9CGU") |>
  select(segments) |>
  unnest(segments) |>
  select(start, duration, pitches)

movies |>
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
  labs(x = "Time (s)", y = NULL, fill = "Magnitude", title = "\"movies for guys\" by Jane Remover", subtitle = "Three songs in one") +
  theme_minimal() +
  scale_fill_viridis_c() +
  theme(plot.title = element_text(face="bold", size=8), plot.subtitle = element_text(size=6), axis.title = element_text(size=6), axis.text = element_text(size=6) , legend.title = element_text(size=6), legend.key.size = unit(0.3, 'cm'), legend.text = element_text(size=5))

###### Chromogram of Movies for guys

movies <-
  get_tidy_audio_analysis("1urgZoAjz91vFqPEokA1OR") |>
  select(segments) |>
  unnest(segments) |>
  select(start, duration, pitches)

movies |>
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
  labs(x = "Time (s)", y = NULL, fill = "Magnitude", title = "\"movies for guys\" by Jane Remover", subtitle = "Three songs in one") +
  theme_minimal() +
  scale_fill_viridis_c() +
  theme(plot.title = element_text(face="bold", size=8), plot.subtitle = element_text(size=6), axis.title = element_text(size=6), axis.text = element_text(size=6) , legend.title = element_text(size=6), legend.key.size = unit(0.3, 'cm'), legend.text = element_text(size=5))


##### Chromogram of second hand embarassment

hand <-
  get_tidy_audio_analysis("7tVMsJriHeO3DoPV1d7L1j") |>
  select(segments) |>
  unnest(segments) |>
  select(start, duration, pitches)

hand |>
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
  labs(x = "Time (s)", y = NULL, fill = "Magnitude", title = "\"second hand embarassment\" by underscores", subtitle = "Key change in a pop-punk inspired song") +
  theme_minimal() +
  scale_fill_viridis_c() +
  theme(plot.title = element_text(face="bold", size=8), plot.subtitle = element_text(size=6), axis.title = element_text(size=6), axis.text = element_text(size=6) , legend.title = element_text(size=6), legend.key.size = unit(0.3, 'cm'), legend.text = element_text(size=5))


##### Cepstrogram of fractal song

fractal <-
  get_tidy_audio_analysis("7LTJ2alkzEumlU6bPEMm9e") |> # Change URI.
  compmus_align(bars, segments) |>                     # Change `bars`
  select(bars) |>                                      #   in all three
  unnest(bars) |>                                      #   of these lines.
  mutate(
    pitches =
      map(segments,
          compmus_summarise, pitches,
          method = "rms", norm = "euclidean"              # Change summary & norm.
      )
  ) |>
  mutate(
    timbre =
      map(segments,
          compmus_summarise, timbre,
          method = "rms", norm = "euclidean"              # Change summary & norm.
      )
  )

fractal |>
  compmus_gather_timbre() |>
  ggplot(
    aes(
      x = start + duration / 2,
      width = duration,
      y = basis,
      fill = value
    )
  ) +
  geom_tile() +
  labs(x = "Time (s)", y = NULL, fill = "Magnitude") +
  scale_fill_viridis_c() +                              
  theme_classic()




##### Cepstrogram of ivy

ivy <-
  get_tidy_audio_analysis("1cwzdiwLNCP58LSRcXG02z") |> # Change URI.
  compmus_align(bars, segments) |>                     # Change `bars`
  select(bars) |>                                      #   in all three
  unnest(bars) |>                                      #   of these lines.
  mutate(
    pitches =
      map(segments,
          compmus_summarise, pitches,
          method = "rms", norm = "euclidean"              # Change summary & norm.
      )
  ) |>
  mutate(
    timbre =
      map(segments,
          compmus_summarise, timbre,
          method = "rms", norm = "euclidean"              # Change summary & norm.
      )
  )

ivy |>
  compmus_gather_timbre() |>
  ggplot(
    aes(
      x = start + duration / 2,
      width = duration,
      y = basis,
      fill = value
    )
  ) +
  geom_tile() +
  labs(x = "Time (s)", y = NULL, fill = "Magnitude") +
  scale_fill_viridis_c() +                              
  theme_classic()

##### Cepstrogram of TRASH CAT

cat <-
  get_tidy_audio_analysis("0dHVuAAePHd3Jpi9xVM2iy") |> # Change URI.
  compmus_align(bars, segments) |>                     # Change `bars`
  select(bars) |>                                      #   in all three
  unnest(bars) |>                                      #   of these lines.
  mutate(
    pitches =
      map(segments,
          compmus_summarise, pitches,
          method = "rms", norm = "euclidean"              # Change summary & norm.
      )
  ) |>
  mutate(
    timbre =
      map(segments,
          compmus_summarise, timbre,
          method = "rms", norm = "euclidean"              # Change summary & norm.
      )
  )

cat |>
  compmus_gather_timbre() |>
  ggplot(
    aes(
      x = start + duration / 2,
      width = duration,
      y = basis,
      fill = value
    )
  ) +
  geom_tile() +
  labs(x = "Time (s)", y = NULL, fill = "Magnitude", title = "\"Trash Cat\" by Worst Timing", subtitle = "I don't think we need government.") +
  scale_fill_viridis_c() +                              
  theme_classic()
