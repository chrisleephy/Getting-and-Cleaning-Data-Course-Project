# README: UCI HAR Dataset Analysis

## Project Description
This project processes the UCI Human Activity Recognition (HAR) Dataset to create a tidy dataset. The dataset contains sensor data from smartphones (accelerometer and gyroscope) collected from 30 subjects performing 6 activities (e.g., walking, sitting). The R script merges test and training data, extracts measurements for mean and standard deviation, labels activities descriptively, and computes the average of each measurement for each activity and subject. The result is saved as `tidydata.txt`.

## Dataset
The UCI HAR Dataset is publicly available and includes:
- Test and training data (`X_test.txt`, `X_train.txt`, etc.).
- Activity labels (`activity_labels.txt`).
- Feature names (`features.txt`).
- Subject identifiers (`subject_test.txt`, `subject_train.txt`).

The data represents normalized sensor measurements (unitless, range [-1, 1]) for activities like WALKING, SITTING, and STANDING.

## Analysis Files
- **Input Files**:
  - `UCI HAR Dataset/test/X_test.txt`: Test set measurements.
  - `UCI HAR Dataset/test/y_test.txt`: Test set activity labels.
  - `UCI HAR Dataset/test/subject_test.txt`: Test set subject IDs.
  - `UCI HAR Dataset/train/X_train.txt`: Training set measurements.
  - `UCI HAR Dataset/train/y_train.txt`: Training set activity labels.
  - `UCI HAR Dataset/train/subject_train.txt`: Training set subject IDs.
  - `UCI HAR Dataset/activity_labels.txt`: Activity names (e.g., 1 = WALKING).
  - `UCI HAR Dataset/features.txt`: Names of measurement variables.
- **Script**:
  - `script.R` (or your script’s name): The R script that processes the data.
- **Output File**:
  - `tidydata.txt`: A tidy dataset with averages of mean and standard deviation measurements for each activity and subject.

## Requirements
- **Software**: R (version 4.0 or higher recommended).
- **R Packages**:
  - `tidyverse` (includes `dplyr`, `tibble`, etc.)
  - `dplyr` (for data manipulation)
  - `stringr` (for string processing)
- **Dataset**: Download the UCI HAR Dataset and place it in your working directory with the folder structure `UCI HAR Dataset/`.

## Installation
1. Install R from [CRAN](https://cran.r-project.org/).
2. Install required packages by running in R:
   ```R
   install.packages("tidyverse")
   install.packages("dplyr")
   install.packages("stringr")
   ```
3. Download the UCI HAR Dataset from [UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and unzip it.
4. Place the `UCI HAR Dataset` folder in your R working directory.

## Usage
1. Save the R script (e.g., as `script.R`) in your working directory.
2. Ensure the `UCI HAR Dataset` folder is in the same directory.
3. Open R and set the working directory to the folder containing the script and dataset:
   ```R
   setwd("path/to/your/directory")
   ```
4. Run the script:
   ```R
   source("script.R")
   ```
5. The output file `tidydata.txt` will be created in the working directory.

## Output
- **File**: `tidydata.txt`
- **Content**: A space-separated text file with 68 columns:
  - `activities`: Activity name (e.g., WALKING).
  - `subjects`: Subject ID (1 to 30).
  - 66 columns for average mean and standard deviation measurements (e.g., `tBodyAcc-mean()-X`).
- **Rows**: One row per activity-subject combination.

## Contributing
This is a student project, so contributions are not expected. If you have suggestions, feel free to contact me (add your contact info here if desired).

## License
This project uses the UCI HAR Dataset, which is publicly available. No additional license is specified for this script.


## Additional Notes
- The script assumes the UCI HAR Dataset folder structure is unchanged.
- The output dataset is tidy, with each row representing a unique activity-subject pair and each column a variable.
- For more details on the dataset, see `UCI HAR Dataset/README.txt`.