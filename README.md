# COVID-19 Data Analysis 📊🦠

## 📅 Date: May 21, 2025  
**Author:** Inavola Reishekesh Reddy

---

## 📌 Project Overview

This project focuses on analyzing global COVID-19 data to identify which countries reported the highest number of **positive cases relative to the number of tests conducted**. The analysis is performed using the R programming language with libraries such as `dplyr`, `tibble`, and `tidyverse`.

---

## 🔍 Objective

**Main Question:**  
> *Which countries have reported the highest number of positive COVID-19 cases in relation to the number of tests conducted?*

---

## 📁 Dataset

- Source file: `covid19.csv`
- Original dataset includes state-level and daily-level COVID data.
- The dataset was **reduced by 65%** by filtering only records where `Province_State == "All States"` to analyze **country-level** cumulative data.

---

## 🧪 Methodology

1. **Data Loading & Exploration**
   - Viewed dimensions, structure, and summary of the dataset.
   - Extracted column names and checked data types.

2. **Filtering**
   - Filtered to include only entries for `"All States"` to focus on country-level data.
   - Selected relevant columns: `Date`, `Country_Region`, `daily_tested`, `daily_positive`, `active`, `hospitalizedCurr`.

3. **Aggregation**
   - Grouped data by `Country_Region`.
   - Summed daily metrics to calculate total tested, positive, active, and hospitalized cases for each country.

4. **Analysis**
   - Identified **Top 10** countries based on the number of tests.
   - Calculated **positivity rate**: `positive / tested`.
   - Extracted **Top 3 countries** with the highest positivity rates.

---

## 🌍 Key Findings

Top 3 countries with the **highest ratio of positive cases per test conducted**:
1. **United Kingdom** (0.11)
2. **United States** (0.10)
3. **Turkey** (0.08)

---

## 🗂️ Project Structure

```r
covid_df                  # Raw dataset
covid_df_all_states       # Filtered to only 'All States' (country-level)
covid_df_all_states_daily # Selected key columns
covid_top_10              # Top 10 countries by number of tests
positive_tested_top_3     # Top 3 countries by positive/tested ratio

# Lists:
dataframe_list      # Stores all dataframes used
matrices_list       # Stores matrix of top 3 countries
vector_list         # Stores vectors used (column names, country names)
data_structure_list # Contains all above lists
covid_analysis_list # Final list with question, answer, and data structures
