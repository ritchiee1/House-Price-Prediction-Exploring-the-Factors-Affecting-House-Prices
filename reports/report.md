### R Markdown Report 
----
title: "House Price Prediction: Exploring the Factors Affecting House Prices Report"
author: "Jetevu Richard"
date: "`r Sys.Date()`"
---

## Introduction
This report summarizes the analysis performed on the house pricing dataset to predict house prices and identify influencing factors.

## Data Overview
- **Source:** Kaggle
- **Key Variables:** Number of bedrooms, bathrooms, square footage, etc.

## Data Cleaning
- Removed irrelevant columns (e.g., `id`, `zipcode`).
- Processed date information for better insights.
- Handled missing values and scaled numeric features.

## Key Findings
- **Strong Correlations:** Identified variables such as `sqft_living`, `grade`, and `bathrooms` are significantly correlated with house prices.
- **Visualization Insights:** Pair plots show interactions between key variables.

## Model Performance
- **Model:** Linear regression model fitted on training data.
- **RMSE:** The model achieved a Root Mean Squared Error (RMSE) of `221932.5`.

## Recommendations
i highly suggest exploring more advanced modeling techniques to improve predictive accuracy.

## Conclusion
The analysis provides a foundation for understanding the factors that influence house prices, with potential for further refinement through advanced modeling.

```markdown
