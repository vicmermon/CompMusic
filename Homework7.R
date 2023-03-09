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
sound <-get_playlist_audio_features("", "7DrJ92Lc9UaVB1rKM2UGsg")
goop <-get_playlist_audio_features("", "2eHpU1UvXMr8vSrb1p0fRz")
form <-get_playlist_audio_features("", "4w3jVLtbQufq1jCMBzlqOr")


corpus <-
  bind_rows(
    hyper |> mutate(category = "Hyperpop (Spotify editorial)"),
    classic |> mutate(category = "Hyperpop Classics (Spotify editorial)"),
    sleepy |> mutate(category = "Sleepy Zone (Community selection)"),
    perfect |> mutate(category = "Perfect Music Friday (Label picks)"),
    music2 |> mutate(category = "Music2 (Personal picks)"),
    feed |> mutate(category = "feedBack (Spotify editorial)"),
    umru |> mutate(category = "umru's Hard Listening (Artist picks)"),
    sound |> mutate(category = "The Sound of Hyperpop"),
    goop |> mutate(category = "Goop House Artists (Community selection)"),
    form |> mutate(category = "Every FORM All Nighter song")
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


ggplot(corpus, aes(x=tempo, fill = as.factor(category))) +
  geom_density(alpha = 0.5) +
  ggtitle("BPM distribution across playlists")

ggplotly()
