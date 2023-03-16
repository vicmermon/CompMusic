
library(tidyverse)
library(spotifyr)
library(compmus)
library(plotly)
library(dplyr)

hyper <- get_playlist_audio_features("", "4fg8XveWZ4xQatc4mHLsyb")
classic <- get_playlist_audio_features("", "3WWGBxHe4bAyKFq1DAnszd")
feed <- get_playlist_audio_features("", "7oEgNy93qnlcm361HgrXrN")
sound <-get_playlist_audio_features("", "7DrJ92Lc9UaVB1rKM2UGsg")


loud <-
  bind_rows(
    hyper |> mutate(category = "Hyperpop (Spotify editorial)"),
    classic |> mutate(category = "Hyperpop Classics (Spotify editorial)"),
    feed |> mutate(category = "feedBack (Spotify editorial)"),
    sound |> mutate(category = "The Sound of Hyperpop"),
  )


ggplot(loud, aes(x = energy, y = loudness, alpha = tempo, color = category, text = track.name)) +
  geom_point(size = 2, fill = "black", ) +
  guides(alpha = guide_legend(override.aes = list(alpha = 0.2))) +
  scale_color_brewer(
    type = "qual",
    palette = "Spectral",
    name = "Playlist"
  ) +
  scale_alpha_continuous(
    guide = "none"
  ) +
  xlab("Energy") +
  ylab("Loudness")

ggplotly()
