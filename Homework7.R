library(tidyverse)
library(spotifyr)

# Track info from the tracks in the Hyperpop playlist
hyper <- get_playlist_audio_features("", "37i9dQZF1DX7HOk71GPfSw")
classic <- get_playlist_audio_features("", "37i9dQZF1DXakZCf7SV1CS")
sleepy <- get_playlist_audio_features("", "1darBgHtPFeoXVS1qvXhUD")

corpus <-
  bind_rows(
    hyper |> mutate(category = "Hyperpop"),
    classic |> mutate(category = "Hyperpop Classic"),
    sleepy |> mutate(category = "Sleepy Zone"),
  )

corpus |>
  ggplot(aes(x = valence, y = energy, size = tempo, color = category)) +
  geom_jitter(alpha = 0.8,) +
  facet_wrap(~category) +
  scale_color_brewer(
    type = "qual",
    palette = "Spectral",
    guide = "none",
  ) +
  scale_size_continuous(
    trans = "reverse",
    labels = waiver(),
    name ="BPM"

  )

install.packages("flexdashboard")
 
 

