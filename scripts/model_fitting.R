# Load libraries
library(ggplot2)
library(GGally)

# Load data
data <- read.csv("data/data_house.csv")

# Data Preparation and Cleaning
data_clean <- data[, !colnames(data) %in% c("id", "zipcode", "lat", "long")]
data_clean$date <- as.Date(data_clean$date, format = "%Y%m%d")
data_clean$year_sold <- format(data_clean$date, "%Y")
data_clean$month_sold <- format(data_clean$date, "%m")

# Feature Scaling
scaled_data <- data_clean
scaled_data$price <- scale(data$price)
scaled_data$sqft_living <- scale(data$sqft_living)
scaled_data$bathrooms <- scale(data$bathrooms)

# Exploratory Data Analysis
summary(data_clean)
correlation_matrix <- cor(data_clean[, c("price", "sqft_living", "grade", "bathrooms")])
print(correlation_matrix)

# Visualization using Pair Plot
pairplot <- ggpairs(data_clean[, c("price", "sqft_living", "grade", "bathrooms")])
print(pairplot)

# Data Splitting
train_index <- sample(1:nrow(data_clean), 0.8 * nrow(data_clean))
train_data <- data_clean[train_index, ]
test_data <- data_clean[-train_index, ]

# Model Fitting
model <- lm(price ~ ., data = train_data)

# Model Evaluation
predictions <- predict(model, newdata = test_data)
residuals <- test_data$price - predictions
mse <- mean(residuals^2)
rmse <- sqrt(mse)
cat("Root Mean Squared Error (RMSE):", rmse, "\n")

