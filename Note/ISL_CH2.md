# Note - Introduction to Statistical Learning
## Chapter 2 Statistical Learning

### <font color=#0099ff>2.1 What Is Statistical Learning?</font>

<font size=3>

**Example**: TV, radio, newspaper -> sales

**Goal**: to develop an accurate model that can be used to predict sales on the basis of the three media budgets.

TV, radio, newspaper: predictor / independent variable / feature / variable  (X)
sales: response / dependent variable (Y)

> General form $Y = f(X)+\epsilon​$. $f​$ is some fixed but unkown function of $X_1​$,$X_2​$,...,$X_p​$ and $\epsilon​$ is a random error term, which is indenpendent of $X​$ and has mean zero.

</font>

#### <font color=#0099ff>2.1.1 Why Estimate f ?</font>
<font size=3>

Two reasons: <kbd>prediction</kbd> and <kbd>inference</kbd>

<kbd>Prediction</kbd>: input $X$ are readily available but $Y$ cannot be easily obtained. Focus on $Y$'s value. Treat $f$ as black box.
$$\hat{Y} = \hat{f}(X)$$
$$\underbrace{E(Y-\hat{Y})^2}_{\text{expected value}} = E[f(X)+\epsilon-\hat{f}(X)]^2=\underbrace{[f(X)-\hat{f}(X)]^2}_{\text{Reducible}}+\underbrace{Var(\epsilon)}_{\text{Irreducible}}$$
The accuracy of $\hat{Y}$ as a prediction of $Y$ depends on two quantities, reducible error and irriducible error.

<kbd>Inference</kbd>: how $Y$ is affected by the change of $X$. Focus on the fucntion $f$ instead of $Y$.

</font>

#### <font color=#0099ff>2.1.2 How Do We Estimate f ?</font>
<font size=3>

We observed a set of $n$ different data points <kbd>training data</kbd>. Goal is to find a function $\hat{f}$, such that $Y\approx \hat{f}(X)$ for any $(X,Y)$. Most statistical leanring methods is either <kbd>parametric</kbd> or <kbd>non-parametric</kbd>

<kbd>parametric</kbd>: 1. make assumption of function $f$, e.g. *liear model*; 2. use training data to fit/train the model, e.g. *(ordinary) least square*. **Advantage** is simplifed the problem of estimate $f$ to a set of parameters, $\beta_1,...,\beta_n$; **Disadvantage** is difficult to choose a match model.

<kbd>non-parametric</kbd>: estimate of $f$ that get close to data points as possible without being too rough or wiggly. **Advantage** is getting avoid the assumtion of function $f$; **Disadvantage** is not simplify the problem, so need a very large number of data points to obtain an accurate estimate for $f$.

</font>

#### <font color=#0099ff>2.1.3 The Trade-Off Between Prediction Accuracy and Model Interpretability</font>
<font size=3>

![Model flexibility v.s. interpretability](figures/figure1.PNG)

</font>

#### <font color=#0099ff>2.1.4 Supervised Versus Unsupervised Learning</font>
<font size=3>


</font>

#### <font color=#0099ff>2.1.5 Regression Versus Classification Problems</font>
### <font color=#0099ff>2.2 Assessing Model Accuracy</font>
#### <font color=#0099ff>2.2.1 Measuring the Quality of Fit</font>
#### <font color=#0099ff>2.2.2 The Bias-Variance Trade-Off</font>
#### <font color=#0099ff>2.2.3 The Classification Setting</font>
### <font color=#0099ff>2.3 Lab: Introduction to R</font>
#### <font color=#0099ff>2.3.1 Basic Commands</font>
#### <font color=#0099ff>2.3.2 Graphics</font>
#### <font color=#0099ff>2.3.3 Indexing Data</font>
#### <font color=#0099ff>2.3.4 Loading Data</font>
#### <font color=#0099ff>2.3.5 Additional Graphical and Numerical Summaries</font>
### <font color=#0099ff>2.4 Exercises</font>


<!--
This is example of changing color and size
<font face="黑体">我是黑体字</font>
<font face="微软雅黑">我是微软雅黑</font>
<font face="STCAIYUN">我是华文彩云</font>
<font color=#0099ff size=7 face="黑体">color=#0099ff size=72 face="黑体"</font>
<font color=#00ffff size=72>color=#00ffff</font>
<font color=gray size=72>color=gray</font>
<font color=gray>color=gray</font>
-->
