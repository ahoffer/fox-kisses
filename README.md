# Introduction to Machine Learning with R

This presentation is a non-theoretical introduction to machine learning. The presentation is intended to last about an hour. We start with a discussion of the biggest buzzwords in this field: data science, machine learning, and big data. We will have a high-level look at each one and why all three tend to come up in the same conversations. 

We will spend the majority of the time solving a classification problem using the programming language R. Classification is a common machine learning task where a model is "trained" to identity something. We will use a machine learning library for R to train a decision tree to classify different species of plants. 

Finally, we will talk about machine learning and R resources, big data, and how to tackle big data with a little computer. 

## Outline

- Data Science
- What is R?
- Machine learning
- The Iris data set
- The leaf data set
- How do we do better?
- Big data
- Resources

## Data Science
To be a real a data scientist you _should_ know about statistical distributions, hypothesis testing, linear regression, and design-of-experiments.
  
The advent of machine learning has significantly lowered the barrier to data science. Even if you _should_ know about one-tailed t-tests and the Poisson distribution, you don't _have to_ to know.

1. Get data
1. Explore and visualize data
1. _Munge_ and partition the data
1. Train (machine learning)
1. Predict (machine learning)
1. Evaluate
1. Profit!

We will step through the process with small data sets and the R statistical programming language.

<hr>

## What is R?
 - A interactive computing environment 
  - For *statisticians*, by *statisticians*
 - A bizarre chimera of different paradigms and code that spans 40 years
	- Is it a scripting language? Yes.
	- Is it a domain specific language? Yes.
	- Is it a functional programming language? More “yes” than “no”.
	- Is it object-oriented? More “no” than “yes”.
	- Is it ______? The answer is always “partially” or “yes, if you want it to be that”.

 - What else is R?
	- An almost limitless collection of packages to do almost anything
	- Programming by recipe
	- Inherently single-threaded (but often calls DLLs for speed)
  
## Machine Learning
- Classification and Regression
- Positives and Negatives, False and True
- Bias versus variance, weak/strong learners, over/under fit

## The Iris Data Set
- The *caret* package
- Working with data frames in R
- Getting more info: class, dim, str, summary
- Accessing rows and columns
- Visualizing the data
- Partitioning the Data
- Define the model
- Fit the model to the training data
- Confusion matrix
- Other measurements of performance (accuracy, sensitivity, specificity, kappa)
- Guessing

## How do we do better?
- Feature selection (Boruta package)
- Algorithms (Deep learning, GBM, GLM)
- More data (more data = more signal)

## What now?

### Introduction Machine Learning
 - Andrew Ng's Machine Learning course is amazingly good and highly recommended https://www.coursera.org/learn/machine-learning
 - Broad survey of supervised and unsupervised learning algorithms.  https://dzone.com/refcardz/machine-learning-predictive
 
### Learning R
  - Of the zillion "Intro to R" resources, I recommend:
  https://cran.r-project.org/doc/manuals/R-intro.pdf
  - Learn R online at Coursera
  - Or Learn R online at DataCamp 
  - Or ditch R and learn Python Pandas! http://pandas.pydata.org/
  
### Competitions and Challenges
  - Kaggle. Great place to get started.
  - Driven Data (https://www.drivendata.org/competitions/)

###(Big Data Discussion)
[See big data slides](BigData.html)
  
### But wait! I want to do big data in R, dammit
Before there was *big data* there was just *data*. Big Data is just data that can’t fit into the memory of one computer. In practice, you do the same things to big data as you to do data by sampling  your big data down to a small dataset. 

```
$ wc -l bigdata.csv
     5000000000 bigdata.csv
     
$ shuf bigdata.csv | head -n 100000 > smalldata.csv
```

If there is signal to be found in `bigdata.csv`, there is likely signal to be found in `smalldata.csv`. You are now ready to mine data. ;-)