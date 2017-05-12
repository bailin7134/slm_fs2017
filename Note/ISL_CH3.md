# Note - Introduction to Statistical Learning
## Chapter 3 Linear Regression
<font size=3>

questions to be addressed:
1. is there a relationship?
2. how strong the relationship is?
3. how accurately can we estimate the effect?
4. how accurately can we predict?
5. is the relationship linear?
6. is there synergy among the features?

<kbd>synergy effect / interaction effect</kbd>
</font>

### <font color=#0099ff>3.1 Simple Linear Regression</font>
<font size=3>

The ideal model is
$$Y\approx \beta_0+\beta_1 X$$
The estimate model is
$$\hat{y} = \hat{\beta}_0+\hat{\beta}_1x$$
coefficients / parameters: $\beta_0$ is intercept, $\beta_1$ is slope.
</font>

#### <font color=#0099ff>3.1.1 Estimating the Coefficients</font>
<font size=3>

minimizing the <kbd>least square</kbd> criterion.
<kbd>residual sum of suqares (RSS)</kbd> is $RSS = e_1^2+e_2^2+...+e_1^n$ or equivalently as $RSS=(y_1-\hat{\beta}_0-\hat{\beta}_1x_1)^2+(y_2-\hat{\beta}_0-\hat{\beta}_1x_2)^2+...+(y_n-\hat{\beta}_0-\hat{\beta}_1x_n)^2$

Applying least square approach, also called <kbd>least square coefficient estimation</kbd>
$$\hat{\beta}_1=\frac{\sum^n_{i=1}(x_i-\bar{x})(y_i-\bar{y})}{\sum^n_{i=1}(x_i-\bar{x})^2}$$
$$\hat{\beta}_0=\bar{y}-\hat{\beta}_1\bar{x}$$
</font>

#### <font color=#0099ff>3.1.2 Assessing the Accuracy of the Coefficient Estimates</font>
<font size=3>

<kbd>population regression line</kbd>, the best linear approximation to the true relationship
$$Y=\beta_0+\beta_1X+\epsilon$$
<kbd>least square line</kbd>
$$\hat{y} = \hat{\beta}_0+\hat{\beta}_1x$$
<kbd>bias</kbd>
<kbd>unbiased</kbd>: if using sample mean $\hat{\mu}$ to estimate the population mean $\mu$, this estimation is unbiased.

<kbd>standard error</kbd> of $\hat{\mu}$ also called $SE(\hat{\mu})$, is used to represent how accurately when using sample mean $\hat{\mu}$ to estimate the population mean $\mu$. where $\sigma$ is the standard deviation of each of the realizations$y_i$ of $Y$.
$$Var(\hat{\mu})=SE(\hat{\mu})^2=\frac{\sigma^2}{n}$$
Standard error of $\hat{\beta}_0$ and $\hat{\beta}_0$ are: where $\sigma^2=Var(\epsilon)$
$$SE(\hat{\beta_0})^2=\sigma^2[\frac{1}{n}+\frac{\bar{x}}{\sum^n_{i=1}(x_i-\bar{x})^2}]$$
$$SE(\hat{\beta}_1)^2=\frac{\sigma^2}{\sum^n_{i=1}(x_i-\bar{x})^2}$$
These fomulas is strictly valid based on the assumption that errors $\epsilon_i$ for each observation are uncorrelated with common variance $\sigma^2$.
<kbd>Residual standard error</kbd> $RSE = \sqrt{RSS/(n-2)}$, can also be used to compute the confidence intervals. $95\%$ confidence interval for $\beta_x$ approximately takes the form
$$\hat{\beta}_x \pm 2\cdot SE(\hat{\beta_x})$$

<kbd>hypothesis tests</kbd>:
The most common hypothesis test involves testing the <kbd>null hypothesis</kbd> of *$H_0$: There is no relationship between X and Y ($\beta_1=0$)* versus the <kbd>alternative hypothesis</kbd> *$H_a$: There is some relationship between X and Y($\beta_1\neq0$)*. $$\beta_1$ must be large enough in absolute value in order for us to reject the null hypothesis.

<kbd>t-statistic</kbd> give by
$$t=\frac{\hat{\beta}_1-0}{SE(\hat{\beta}_1)}$$
which measures the number of standard deviations that $\beta_1$ is away from 0.
Assuming $\beta_1=0$, we call this probability the <kbd>p-value</kbd>. A small p-value indicates that there is an association between the predictor and the response. Or we reject the null hypothesis.
</font>

#### <font color=#0099ff>3.1.3 Assessing the Accuracy of the Model</font>
<font size=3>

Once comfirming there is a relationship between X and Y. Thenext question is, how accurate the model is. Two related quantities are **Residual standard error(RSE)** and **R-statistic**.

<kbd>Residual standard error(RSE)</kbd>
Due to the existed $\epsilon$, even if knowing the true regression line, we are not able to prefectly predict Y from X.
$$RSE=\sqrt{\frac{1}{n-2}RSS}=\sqrt{\frac{1}{n-2}\sum^n_{i=1}(y_i-\hat{y}_i)^2}$$
<kbd>R-statistic</kbd>
</font>

### <font color=#0099ff>3.2 Multiple Linear Regression</font>
#### <font color=#0099ff>3.2.1 Estimating the Regression Coefficients</font>
#### <font color=#0099ff>3.2.2 Some Important Questions</font>
### <font color=#0099ff>3.3 Other Considerations in the Regression Model</font>
#### <font color=#0099ff>3.3.1 Qualitative Predictors</font>
#### <font color=#0099ff>3.3.2 Extensions of the Linear Model</font>
#### <font color=#0099ff>3.3.3 Potential Problems</font>
### <font color=#0099ff>3.4 The Marketing Plan</font>
### <font color=#0099ff>3.5 Comparison of Linear Regression with K-Nearest Neighbors</font>
### <font color=#0099ff>3.6 Lab: Linear Regression</font>
#### <font color=#0099ff>3.6.1 Libraries</font>
#### <font color=#0099ff>3.6.2 Simple Linear Regression</font>
#### <font color=#0099ff>3.6.3 Multiple Linear Regression</font>
#### <font color=#0099ff>3.6.4 Interaction Terms</font>
#### <font color=#0099ff>3.6.5 Non-linear Transformations of the Predictors
#### <font color=#0099ff>3.6.6 Qualitative Predictors</font>
#### <font color=#0099ff>3.6.7 Writing Functions</font>
### <font color=#0099ff>3.7 Exercises</font>
