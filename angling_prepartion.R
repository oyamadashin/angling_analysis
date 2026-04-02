# パッケージ読み込み----

library(tidyverse)


# データインポート
df <- read_csv("angling_data_2025.csv")

# date----
## レベルを設定
df$date <- factor(
  df$date,
  levels = c("9月27日_プレ", "10月4日", "10月5日", "10月17日", "10月19日", "10月24日"),
  ordered = TRUE
)

# v1_sex----
## レベルを設定
df$v1_sex <- factor(
  df$v1_sex,
  levels = c("男性", "女性"),
  ordered = TRUE
)

# v3_residence----
## レベル設定
df$v3_residence <- factor(
  df$v3_residence,
  levels = c("網走市内", "道内", "道外"),
  ordered = TRUE
)


# v4_fishing_experience_years----
## レベル設定
df$v4_fishing_experience_years <- factor(
  df$v4_fishing_experience_years,
  levels = c("5年未満", "5年以上10年未満", "10年以上20年未満", "20年以上"),
  ordered = TRUE
)

# v5_fishing_days_this_season----
## レベル設定
df$v5_fishing_days_this_season <- factor(
  df$v5_fishing_days_this_season,
  levels = c("5日未満", "5日以上10日未満", "10日以上30日未満", "50日以上"),
  ordered = TRUE
)

# v6_fishing_days_last_season----
## レベル設定
df$v6_fishing_days_last_season <- factor(
  df$v6_fishing_days_last_season,
  levels = c("昨シーズンは来ていない", "5日未満", "5日以上10日未満", "10日以上30日未満", "50日以上"),
  ordered = TRUE
)
