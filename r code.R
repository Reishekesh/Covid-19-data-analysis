library(tibble)
library(tidyverse)
library(dplyr)
# COVID-19 Data Analysis

# our analysis moto "Which countries have reported the highest number of positive cases
# in relation to the number of tests conducted?"

covid_df <- read.csv("C:\\Users\\Lenovo\\OneDrive\\Desktop\\R Projects\\covid19.csv")
head(covid_df)
dim(covid_df)
vector_cols <- colnames(covid_df)
vector_cols
typeof(vector_cols)
class(vector_cols)
summary(covid_df)
str(covid_df)
#glimpse(covid_df)

# filtering countries by all states

covid_df_all_states <- covid_df[covid_df$Province_State == "All States",]
covid_df$Province_State = NULL

# Filtering data related to daily measures
#covid_df_all_states_daily <- covid_df_all_states[c("Date", "Country_Region", "active", "hospitalizedCurr", "daily_tested", "daily_positive")]
# alternative way
covid_df_all_states_daily <- covid_df_all_states %>% select(Date, Country_Region, active, hospitalizedCurr, daily_tested, daily_positive)

# using group-by function to group all the countries
covid_df_all_states_daily_sum <- covid_df_all_states_daily %>% group_by(Country_Region) %>% 
  summarize(tested = sum(daily_tested), 
            positive = sum(daily_positive),
            active = sum(active),
            hospitalized = sum(hospitalizedCurr)) %>% arrange(desc(tested))

covid_top_10 <- head(covid_df_all_states_daily_sum,10)
covid_top_10 <- as.data.frame(covid_top_10)
covid_top_10

countries <- covid_top_10$Country_Region
tested_cases <- covid_top_10$tested
positive_cases <- covid_top_10$positive
active_cases <- covid_top_10$active
hospitalized_cases <- covid_top_10$hospitalized

# assigning country names to vectors of tested cases,and positive cases, hospitalized cases

names(tested_cases) <- countries
names(positive_cases) <- countries
names(active_cases) <- countries
names(hospitalized_cases) <- countries

top_posit_test <- positive_cases/tested_cases 
top_posit_test <- sort(top_posit_test, decreasing=TRUE)

# top 3 countries with positive cases by tested cases
positive_tested_top_3 <- head(top_posit_test,3)

# creating vector of the top 3 countries

united_kingdom <- c(0.11, 1473672, 166909, 0, 0)
united_states <- c(0.10, 17282363, 1877179, 0, 0)
turkey <- c(0.08, 2031192, 163941, 2980960, 0)

covid_mat <- rbind(united_kingdom,united_states, turkey)
colnames(covid_mat) <- c("Ratio","tested","positive","active","hospitalized")
covid_mat

question <- "Which countries have had the highest number of positive cases against the number of tests?"
answer <- c("Positive tested cases" = positive_tested_top_3)

# Creating list that store's data structures
dataframe_list <- list(covid_df, covid_df_all_states, covid_df_all_states_daily,covid_top_10)

# Creating list that contains all the matrices used for the covid-19 project
matrices_list <- list(covid_mat)

# Creating list that contains all the vectors used for covid-19 project
vector_list <- list(vector_cols ,countries)

# storing all the created list in one list
data_structure_list <- list(dataframe_list,matrices_list,vector_list)

# displaying second element of a list
covid_analysis_list <- list(question, answer,data_structure_list)
covid_analysis_list[[2]]
