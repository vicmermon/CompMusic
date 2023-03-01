library(tidyverse)
library(spotifyr)
library(plotly)

# Track info from the tracks in the Hyperpop playlist
hyper <- get_playlist_audio_features("", "37i9dQZF1DX7HOk71GPfSw")
classic <- get_playlist_audio_features("", "37i9dQZF1DXakZCf7SV1CS")
sleepy <- get_playlist_audio_features("", "1darBgHtPFeoXVS1qvXhUD")
perfect <- get_playlist_audio_features("", "6oaHLB9qwLOo0RVpU2gGJ5")

corpus <-
  bind_rows(
    hyper |> mutate(category = "Hyperpop"),
    classic |> mutate(category = "Hyperpop Classics"),
    sleepy |> mutate(category = "Sleepy Zone"),
    perfect |> mutate(category = "Perfect Music Friday"),
  )

  ggplot(corpus, aes(x = tempo, y = energy, size = valence, color = category )) +
  geom_jitter() +
  
  scale_color_brewer(
    type = "qual",
    palette = "Spectral",
    name = "Playlist"
  
  ) + ggtitle("Common characteristics in hyperpop songs")  +
 
    + scale_fill_viridis_c() + theme_classic() +

ggplotly()
 

