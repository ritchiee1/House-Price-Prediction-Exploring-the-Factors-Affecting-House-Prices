library(ggplot2)
library(GGally)

data <- read.csv("C:/Users/hp/OneDrive/Documents/datasets/house pricing datasets/data_house.csv")
head(data)
str(data)

colSums(is.na(data))

summary(data)
data_clean <- data[, !colnames(data) %in% c("id", "zipcode", "lat", "long")]
data_clean$date <- as.Date(data_clean$date, format = "%Y%m%d")
data_clean$year_sold <- format(data_clean$date, "%Y")
data_clean$month_sold <- format(data_clean$date, "%m")

scaled_data <- data_clean
scaled_data$price <- scale(data$price)
scaled_data$sqft_living <- scale(data$sqft_living)
scaled_data$bathrooms <- scale(data$bathrooms)

summary(data_clean)
correlation_matrix <- cor(data_clean[, c("price", "sqft_living", "grade", "bathrooms")])
print(correlation_matrix)

pairplot <- ggpairs(data_clean[, c("price", "sqft_living", "grade", "bathrooms")])
print(pairplot)

train_index <- sample(1:nrow(data_clean), 0.8 * nrow(data_clean))
train_data <- data_clean[train_index, ]
test_data <- data_clean[-train_index, ]

model <- lm(price ~ ., data = train_data)

predictions <- predict(model, newdata = test_data)
residuals <- test_data$price - predictions
mse <- mean(residuals^2)
rmse <- sqrt(mse)
cat("Root Mean Squared Error (RMSE):", rmse, "\n")
