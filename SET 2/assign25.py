#import diamonds.csv and experiment with it
#using lasso regression and ridge regression and others as well
#to predict the price of a diamond

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression
from sklearn.linear_model import Lasso
from sklearn.linear_model import Ridge
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error
from sklearn.metrics import r2_score
from sklearn.preprocessing import MinMaxScaler

#read in the data
df = pd.read_csv('diamonds.csv')

#drop the index column
df = df.drop('Unnamed: 0', axis=1)

#label encode using library
from sklearn.preprocessing import LabelEncoder
le = LabelEncoder()
df['cut'] = le.fit_transform(df['cut'])
df['color'] = le.fit_transform(df['color'])
df['clarity'] = le.fit_transform(df['clarity'])

#normalise the dataset
scaler = MinMaxScaler()
df = pd.DataFrame(scaler.fit_transform(df), columns=df.columns)

#split the data into train and test
train, test = train_test_split(df, test_size=0.2)

#split the data into X and y
X_train = train.drop('price', axis=1)
y_train = train['price']
X_test = test.drop('price', axis=1)
y_test = test['price']

#instantiate the models
lasso = Lasso(alpha=0.1)
ridge = Ridge(alpha=0.1)
LinearRegression = LinearRegression()

#fit the models
LinearRegression.fit(X_train, y_train)
lasso.fit(X_train, y_train)
ridge.fit(X_train, y_train)

#predict the models
y_pred = LinearRegression.predict(X_test)
y_pred_lasso = lasso.predict(X_test)
y_pred_ridge = ridge.predict(X_test)

#calculate the RMSE
rmse = np.sqrt(mean_squared_error(y_test, y_pred))
rmse_lasso = np.sqrt(mean_squared_error(y_test, y_pred_lasso))
rmse_ridge = np.sqrt(mean_squared_error(y_test, y_pred_ridge))

#print the RMSE
print('RMSE for Linear Regression: ', rmse)
print('RMSE for Lasso: ', rmse_lasso)
print('RMSE for Ridge: ', rmse_ridge)

#calculate the R2
r2 = r2_score(y_test, y_pred)
r2_lasso = r2_score(y_test, y_pred_lasso)
r2_ridge = r2_score(y_test, y_pred_ridge)

#print the R2
print('R2 for Linear Regression: ', r2)
print('R2 for Lasso: ', r2_lasso)
print('R2 for Ridge: ', r2_ridge)

