# Codebook for Tidy Dataset from UCI HAR Dataset

## Overview
This codebook describes the variables and summaries in the `tidydata.txt` dataset, generated from the UCI Human Activity Recognition (HAR) Dataset. The dataset contains average measurements of mean and standard deviation for various signals, grouped by activity and subject. The data is derived from accelerometer and gyroscope signals collected from 30 subjects performing 6 activities.

## Dataset Source
The UCI HAR Dataset is publicly available and contains sensor data from smartphone accelerometers and gyroscopes. The original measurements are normalized to the range [-1, 1] and are unitless.

## Data Processing
The R script processes the dataset as follows:
1. Merges training and test datasets (`X_test.txt`, `X_train.txt`, etc.).
2. Extracts measurements for mean (`mean()`) and standard deviation (`std()`).
3. Labels activities with descriptive names (e.g., "WALKING", "SITTING").
4. Groups data by activity and subject, calculating the mean of each measurement.
5. Outputs the tidy dataset to `tidydata.txt`.

## Variables
The `tidydata.txt` dataset contains 68 variables: 2 grouping variables (`activities`, `subjects`) and 66 measurement variables (averages of mean and standard deviation signals). Below is a description of each variable.

### Grouping Variables
| Variable Name | Description | Type | Values/Range |
|---------------|-------------|------|--------------|
| `activities`  | The activity performed by the subject | Factor | WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING |
| `subjects`    | Identifier for the subject | Integer | 1 to 30 |

### Measurement Variables
The remaining 66 variables are averages of mean and standard deviation measurements from the original dataset, calculated for each activity and subject. These measurements are derived from time-domain and frequency-domain signals (e.g., accelerometer and gyroscope data). Each variable is numeric and represents the mean of a signal’s mean or standard deviation, normalized to [-1, 1] (unitless).

**Variable Naming Convention**:
- Names start with `t` (time-domain) or `f` (frequency-domain).
- Include signal type (e.g., `BodyAcc` for body acceleration, `GravityAcc` for gravity acceleration).
- Indicate axis (`X`, `Y`, or `Z`) or `Mag` (magnitude).
- End with `mean()` or `std()` to denote the measurement type.
- Example: `tBodyAcc-mean()-X` is the average of the mean body acceleration in the X-axis.

**List of Measurement Variables**:
The 66 variables are those from the original `features.txt` that match `mean()` or `std()` (e.g., via `grep("mean\\(\\)|std\\(\\)", features_names)`). Examples include:
- `tBodyAcc-mean()-X`, `tBodyAcc-mean()-Y`, `tBodyAcc-mean()-Z`
- `tBodyAcc-std()-X`, `tBodyAcc-std()-Y`, `tBodyAcc-std()-Z`
- `tGravityAcc-mean()-X`, `tGravityAcc-mean()-Y`, `tGravityAcc-mean()-Z`
- `fBodyAcc-mean()-X`, `fBodyAcc-std()-X`, etc.
- (Full list available in `UCI HAR Dataset/features.txt`, filtered for `mean()` and `std()`).

**Units**: All measurement variables are normalized to [-1, 1] and are unitless, as per the UCI HAR Dataset documentation.

## Summaries Calculated
- For each combination of `activities` and `subjects`, the dataset calculates the **mean** of each of the 66 mean and standard deviation measurements.
- Example: For subject 1 performing WALKING, the value of `tBodyAcc-mean()-X` is the average of all `tBodyAcc-mean()-X` measurements for that subject and activity.

## Additional Notes
- The dataset is tidy: each row represents a unique activity-subject pair, and each column represents a variable.
- Missing values, if any, are handled by `na.rm = TRUE` in the mean calculations.
- The output file (`tidydata.txt`) is a space-separated text file without row names.

For more details on the original dataset, refer to `UCI HAR Dataset/README.txt`.