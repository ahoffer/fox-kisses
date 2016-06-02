
# Machine Learning with R

## Outline
- Big data versus data
- Some opinions about big data
- What is R?
- Machine learning
- The Iris data frame
- UCI ML Repository
- Leaf Data Set
- PCA
- How do we do better?

## Big Data versus Data
Before there was big data, there was just data.  Big Data is just data that can’t fit into the memory of one computer. 
In practice, you do the same things to big data as you to do data:

1. Get data
1. Explore data
1. _Munge_ and Partition the data
1. Train (machine learing)
1. Predict (machine learnign)
1. Evaluate
1. Profit!

We will step through the process with small data sets and the R statistical programming language.

## Some Opinions about Big Data
Why big data now?
- Data is now cheap. It used to be expensive to conduct experiments, surveys, censuses, sensors telemetry, and other sources of data. 
- Computing resources are cheap.

Why big data at all?
- Small data gets you 95% of the way there. It is like finding veins of gold in a mine.
- Big data is is like low grade ore— it takes a lot of processing to get anything valuable from it.
- Big data helps you squeak out the extra couple of percent ROI, or conversion rate, or voter response.
- Physicists have been doing this for a long time. Custom software. Even custom hardware: CERN, LIGO

Why all the hype?
- New business models mean new businesses (social networks, fraud-detection-as-a-service, …)
- Marketers see a great opportunity to sell tons of hardware and software (Oracle, IBM)
- Most is most big data is about targeted marketing

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
  - Inherently single-threaded (but can call out to binaries)
  
## Machine Learning
- Classification and Regression
- Positives and Negatives, False and True
- Bias versus variance, weak/strong learners, over/under fit

## The Iris Data Set
- Working with data frames in R
- Getting more info: class, dim, str, summary
- Accessing rows and columns
- Partitioning the Data
- Define the model
- Fit the model to the training data
- Confusion matrix
- Other measurements of performance (accuracy, sensitivity, specificity, kappa)

## UCI ML Repository
- Browse
- Download 
- Read

## UCI Leaf Dataset 
- Load and prepare the data
- Trellis plot of high dimensional data
- Random Forest
- Confusion Matrix in Excel

## PCA
- Principal component analysis
- Trellis plot of low dimensional data
- Using the PCA data to train classifier

## How do we do better?
- Feature selection
- Algorithms
- Big data
