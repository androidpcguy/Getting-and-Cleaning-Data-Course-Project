# README for Course Project
Course Project for Getting and Cleaning Data class on Coursera

This repository contains the Samsung Data files provided by UCI as well as a script that cleans the datasets and creates one tidy dataset.

###Repo heirarchy:
- `./clean_data/`: Folder where cleaned data will be created and written to
- `./scripts/`: Folder that contains run_analysis.R script that cleans data
- `./data/`: Directory with data for analysis
- `./CodeBook.md`: File describing all variables in tidy dataset.

**IMPORTANT**: Data folders `test/` and `train/` must be inside a folder `data/` inside the working directory. `dplyr` package is required to run analysis script.

###How script works
1. Respective training and testing datasets are read into data frames using `read.table` command. Files that are read in are `X_train.txt` and `X_test.txt`.
2. Names of measurements are read in and column names are set for training and testing data frames.
3. Subject IDs are read in to their respective data frames and are added to the front of the data frames.
4. Activity labels are added after activity codes are read into the respective data frames.
5. The `training_data` and `testing_data` data frames are now merged with `by=intersect(names(x), names(y))` (default).
6. The data are subsetted to include only `-mean()`, `-std()`, and `-meanFreq()` measurements using the `grep` command.
7. The resulting data frame is now grouped by `Subject_ID` and `Activity` and `summarize_each` function is applied with the `mean` function.
8. Output file is written out using `write.table` function with `row.names = FALSE`.
