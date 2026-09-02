# パッケージ読み込み----

library(tidyverse)



# データインポート----
data_2024 <- read_csv("angling_data_2024.csv")
data_2025 <- read_csv("angling_data_2025.csv")

# データを結合----
# 結合時に、idが年ごとで区別できるようにしている

df <- bind_rows(
  data_2024,
  data_2025
) |>
  mutate(
    respondent_id = paste0(year, "_", id)
  )

df |>
  group_by(year) |>
  summarise(
    across(
      everything(),
      ~ sum(is.na(.x))
    )
  )


# date----
## レベルを設定
df$date <- factor(
  df$date,
  levels = c("9月27日_プレ", "10月4日", "10月5日", "10月15日", "10月17日", 
             "10月18日","10月19日", "10月24日"),
  ordered = FALSE
)

# v1_sex----
## レベルを設定
df$v1_sex <- factor(
  df$v1_sex,
  levels = c("男性", "女性"),
  ordered = FALSE
)

# v3_residence----
## レベル設定
df$v3_residence <- factor(
  df$v3_residence,
  levels = c("網走市内", "道内", "道外"),
  ordered = FALSE
)


# v4_fishing_experience_years----
## レベル設定
df$v4_fishing_experience_years <- factor(
  df$v4_fishing_experience_years,
  levels = c("5年未満", "5年以上10年未満", "10年以上20年未満", "20年以上"),
  ordered = FALSE
)

# v5_fishing_days_this_season----
## レベル設定
df$v5_fishing_days_this_season <- factor(
  df$v5_fishing_days_this_season,
  levels = c("5日未満", "5日以上10日未満", "10日以上30日未満", "50日以上"),
  ordered = FALSE
)

# v6_fishing_days_last_season----
## レベル設定
df$v6_fishing_days_last_season <- factor(
  df$v6_fishing_days_last_season,
  levels = c("昨シーズンは来ていない", "5日未満", "5日以上10日未満", "10日以上30日未満", "50日以上"),
  ordered = FALSE
)


# v10_is_not_convinced----
# 納得していない、しているを表すダミー変数を作成
df <- df |> mutate(
  v10_is_not_convinced = case_when(
    v10_formulation_procedure == "知っていて、納得している" ~ 0,
    v10_formulation_procedure == "知らないが、納得している" ~ 0,
    v10_formulation_procedure == "知っているが、納得していない" ~ 1,
    v10_formulation_procedure == "知らないし、納得していない" ~ 1,
    TRUE ~ NA_real_
  )
)