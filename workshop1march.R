library(tidyverse)
library(spotifyr)
library(compmus)

####### HOLLYWOOD BABY
baby <-
  get_tidy_audio_analysis("48ElaQLYuOaybqagIlPxpU") |> # Hollywood Baby
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
baby |>
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

####### SPOILED LITTLE BRAT
brat <-
  get_tidy_audio_analysis("724utiMbqUfT1g3tqbfQYu") |> # 
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
brat |>
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

###### SELF SIMILARITY DRY LAND

dry <-
  get_tidy_audio_analysis("7j7nOY7xZ7fpSVAKT4qz4b") |> # 
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

dry |>
  compmus_self_similarity(timbre, "cosine") |> 
  ggplot(
    aes(
      x = xstart + xduration / 2,
      width = xduration,
      y = ystart + yduration / 2,
      height = yduration,
      fill = d
    )
  ) +
  geom_tile() +
  coord_fixed() +
  scale_fill_viridis_c(guide = "none") +
  theme_classic() +
  labs(x = "", y = "")

# Dry land 2001 by underscores is an example of a hyperpop song with an unusual structure,
# the song starts as a bass centered pop songs about tornados, and seemengly transitions
# into a 7 minute long ambient piece. With this self-similarity plot I wanted to see this ambient
# section appears in the plot. We can distinguish two clear sections: Before and after 150 seconds.
# Before this timestamp, the song retains its pop structure, and we can see some patterns that repeat
#   during this time and delineate this type of songwriting characterized by verses and choruses.
# From 150secs on, we can see the appearance of a new pattern: Several parallel lines emerge and
# sustain through time. This is clearly the start of the ambient section, with looping guitar
# patterns that repeat until the 7 minute mark. It is interesting to see how a song with such an
# unconventional stucture can be bundled up in a collection of pop songs characterized with short
# song durations and more overall pop influenced sturctures thought the whole track. This ambient
# section is an example of how the "hyperpop" sound goes beyond pop: These artists are not afraid
# to experiment and include an ambient section to their silly pop song, which clearly caught the eyes
# of the music industry.

### SELF SIMILARITY TORR, THE POP STRUCTURE (SELFDESTRUCT)

torr <-
  get_tidy_audio_analysis("0JEViMA9EhoTE501kxvJMU") |> # 
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

torr |>
  compmus_self_similarity(timbre, "cosine") |> 
  ggplot(
    aes(
      x = xstart + xduration / 2,
      width = xduration,
      y = ystart + yduration / 2,
      height = yduration,
      fill = d
    )
  ) +
  geom_tile() +
  coord_fixed() +
  scale_fill_viridis_c(guide = "none") +
  theme_classic() +
  labs(x = "", y = "")

The prefix "Hyper" slapped into the "pop" umbrella genre implies a clear pop influence into this type the hyerpop genre. One of the attributes that make pop music, popular, its the structure of the song. That's why, for this self-similarity plot I decided to see if a typical hyperpop song follows the classic pops structure of Verse-chorus-verse-chorus-bridge-chorus.

This is selfdestruct by torr. When I first created this plot, the pop stucture was clear at to me first sight. There's a relatively easy to discern structure (a diagonal line) that repeats three time across the song-. While listening to the trakc I realized that this is the chorus, and the sections inbetween are verses. Right before the 100 seconds mark we can see a greener section that underlies the bridge, a section of pop songs characterized by changes in chord progression, lyrics and in timbre. After this, the chorus comes back one last time, incorporating new elements that weren't there in its previous itterations.

Overall, this plot helped me understand what Spotify means by "Hyperpop": If we strip down other elements such as sound design, we are left what essentialy is a pop song. 
