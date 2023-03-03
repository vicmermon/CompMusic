library(tidyverse)
library(spotifyr)
library(plotly)
library(dplyr)

# Track info from the tracks in the Hyperpop playlist
hyper <- get_playlist_audio_features("", "4fg8XveWZ4xQatc4mHLsyb")
classic <- get_playlist_audio_features("", "3WWGBxHe4bAyKFq1DAnszd")
sleepy <- get_playlist_audio_features("", "1hUOz9Cb5ELjJrLytD0n1b")
perfect <- get_playlist_audio_features("", "6MXc6iTKELyEL62ahBY2i2")
music2 <- get_playlist_audio_features("", "1GPov4sutwV2VRK7TB2y22")
feed <- get_playlist_audio_features("", "7oEgNy93qnlcm361HgrXrN")
umru <- get_playlist_audio_features("", "1Gh40BPKoYlLfQaGAisWjo")

corpus <-
  bind_rows(
    hyper |> mutate(category = "Hyperpop (Spotify editorial)"),
    classic |> mutate(category = "Hyperpop Classics (Spotify editorial)"),
    sleepy |> mutate(category = "Sleepy Zone (Community selection)"),
    perfect |> mutate(category = "Perfect Music Friday (Label picks)"),
    music2 |> mutate(category = "Music2 (Personal picks)"),
    feed |> mutate(category = "feedBack (Spotify editorial)"),
    umru |> mutate(category = "umru's Hard Listening (Artist picks)")
  )

  ggplot(corpus, aes(x = energy, y = loudness, alpha = tempo, color = category, text = track.name)) +
  geom_point(size = 2, fill = "black") +

  scale_color_brewer(
    type = "qual",
    palette = "Spectral",
    name = "Playlist"
    ) +
    scale_alpha_continuous(
      guide = "none"
    )
    
ggplotly()


ggplot(corpus, aes(x=tempo)) +
  geom_histogram()

ggplotly()
