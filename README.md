# Getting-Cleaning-Data_Course-Project
Course Project repository for Week 4 in the Getting and Cleaning Data course hosted by John Hopkins University on Coursera

**ReadMe for run_analysis.R**
This R script provides instructions for the data processing that was done to the Human Activity Recognition Using Smartphones 
dataset. 
This script sets the working directory and opens the relevant datasets for the assignment.
It then assigns names to the columns in the dataset, and adds identifier columns.
The training and test datasets were then merged, and the columns containing summary mean and sd data were selected
The dataset is then further summarized. The average of each columns are taken, grouped by subject id and activity id
