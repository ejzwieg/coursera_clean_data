Getting and cleaning data course project
===================

Introduction
------------
This repository contains the project for the Getting and Cleaning Data Coursera course.

About the raw data
------------------

The features (561 of them) are unlabeled and can be found in the x_train.txt. 
The activities are in the y_train.txt file.
The test subjects are in the subject_train.txt file.

The test data has the same structure.

About the program and the tidy dataset
-------------------------------------
The run_analysis.R program will merge the test and training sets together.

Column names are added and only columns that have to do with mean and standard deviation are kept.

The program will create a tidy data set containing the means of all the columns per test subject and per activity.


