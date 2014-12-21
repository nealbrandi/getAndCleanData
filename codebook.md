## Code Book For tidy.txt

### Content Derivation

The dataset tidy.txt is a secondary summarization of the merged Human Activity Recognition (HAR) project conducted by Reyes-Ortiz, Anguita, Ghio and Oneto at the Smartlab for Non Linear Complex Systems, University of Genova, Genoa Italy.

It contains 79 mean computations of the smoothed results of the original HAR research grouped by subject and activity.  There were 30 subjects in the original study identified by integer values (1:30)  with each individual performing 6 standard activities.  

The original research smoothed accelerometer and gyroscope 3-axial raw signals produced 30 individual subjects wearing a wasteband mounted smart phone while performing 6 standardized activities.  The raw data was captured a a constant rate of 50 Hz and then filtered using:

<b>A median filter and
<b>A 3rd order low pass Butterworth filter with a corner frequency of 20 Hz

The raw acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These refined signal data were then used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

### Column Definitions

<b>subjectId</b>: A unique integer with a range of 1 to 30 representing individual subjects
<b>activity</b>: A factor with 6 levels translated from the original research.  Levels:
<ol>
<li>WALKING</li>
<li>WALKING_UPSTAIRS</li>
<li>WALKING_DOWNSTAIRS</li>
<li>SITTING</li>
<li>STANDING</li>
<li>LAYING</li>
</ol>
<b>feature</b>: The remaining 79 columns are the mean of selected smoothed sensor data produced by the original research.  To enable transparency and direct lineage back to the original research the column names are taken from the features with the identical names in the original work.  The pattern is explained in the section above.
