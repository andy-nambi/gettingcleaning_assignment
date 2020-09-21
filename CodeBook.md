Getting and Cleaning Data Project Codebook :
##########################################################################################################################################################################################################################################################################

The below codebook describes the contents of the summarydata.txt file created by the run_analysis.R script in the github repo. 



Subject : Identifier of subject who carried out activity 
        integer :1 to 30  
Activity : Activity undertaken by subject                                    
        Factor w/ 6 levels :
        1 WALKING
        2 WALKING_UPSTAIRS
        3 WALKING_DOWNSTAIRS
        4 SITTING
        5 STANDING
        6 LAYING

Variables : All variables are averages of corresponding feature vectors ( acceleration and velocity measurements for each subject and activity) by activity and subject.All values are numeric with upto 5 decimals. 

        Total Body Acceleration mean along 3 axes:
          tBodyAcc.mean...X.Average                  
          tBodyAcc.mean...Y.Average                  
          tBodyAcc.mean...Z.Average                   
        Total Body Acceleration standard deviation along 3 axes:
          tBodyAcc.std...X.Average                    
          tBodyAcc.std...Y.Average                   
          tBodyAcc.std...Z.Average                   
        Total Gravity Acceleration mean along 3 axes:
          tGravityAcc.mean...X.Average                
          tGravityAcc.mean...Y.Average                
          tGravityAcc.mean...Z.Average                
        Total Gravity standard deviation mean along 3 axes:
          tGravityAcc.std...X.Average                 
          tGravityAcc.std...Y.Average                 
          tGravityAcc.std...Z.Average                
        Total Body Acceleration jerk mean along 3 axes:
          tBodyAccJerk.mean...X.Average              
          tBodyAccJerk.mean...Y.Average              
          tBodyAccJerk.mean...Z.Average              
        Total Body Acceleration jerk standar deviation mean along 3 axes:
          tBodyAccJerk.std...X.Average               
          tBodyAccJerk.std...Y.Average               
          tBodyAccJerk.std...Z.Average                
        Total Body Gyro Acceleration mean along 3 axes:
          tBodyGyro.mean...X.Average                  
          tBodyGyro.mean...Y.Average                  
          tBodyGyro.mean...Z.Average                 
        Total Body Gyro Acceleration Standard deviation along 3 axes:
          tBodyGyro.std...X.Average                 
          tBodyGyro.std...Y.Average                   
          tBodyGyro.std...Z.Average                   
        Total Body Gyro jerk Acceleration mean along 3 axes:
          tBodyGyroJerk.mean...X.Average             
          tBodyGyroJerk.mean...Y.Average              
          tBodyGyroJerk.mean...Z.Average             
        Total Body Gyro Acceleration jerk Standard deviation along 3 axes:
          tBodyGyroJerk.std...X.Average               
          tBodyGyroJerk.std...Y.Average              
          tBodyGyroJerk.std...Z.Average              
        Total Body Acceleration magnitude mean: 
          tBodyAccMag.mean...Average                 
        Total Body Acceleration magnitude standard deviation: 
          tBodyAccMag.std...Average               
        Total Gravity Acceleration magnitude mean:
          tGravityAccMag.mean...Average              
        Total Gravity Acceleration magnitude standard deviation:
          tGravityAccMag.std...Average               
        Total Acceleration Jerk magnitude mean:
          tBodyAccJerkMag.mean...Average             
        Total Acceleration Jerk magnitude standard deviation:
          tBodyAccJerkMag.std...Average              
        Total Gyroscopic magnitude mean:
          tBodyGyroMag.mean...Average                 
        Total Gyroscopic magnitude standard deviation:
          tBodyGyroMag.std...Average                 
        Total Gyroscopic Jerk magnitude mean:
          tBodyGyroJerkMag.mean...Average            
        Total Gyroscopic Jerk magnitude standard deviation:
          tBodyGyroJerkMag.std...Average             
        Free Body Acceleration mean along 3 axes:
          fBodyAcc.mean...X.Average                  
          fBodyAcc.mean...Y.Average                   
          fBodyAcc.mean...Z.Average                  
        Free Body Acceleration standard deviation along 3 axes:
          fBodyAcc.std...X.Average                   
          fBodyAcc.std...Y.Average                    
          fBodyAcc.std...Z.Average                  
        Free Body Acceleration mean frequency along 3 axes:
          fBodyAcc.meanFreq...X.Average              
          fBodyAcc.meanFreq...Y.Average              
          fBodyAcc.meanFreq...Z.Average               
        Free Body Acceleration jerk mean along 3 axes:
          fBodyAccJerk.mean...X.Average               
          fBodyAccJerk.mean...Y.Average            
          fBodyAccJerk.mean...Z.Average               
        Free Body Acceleration jerk standard deviation along 3 axes:
          fBodyAccJerk.std...X.Average                
          fBodyAccJerk.std...Y.Average               
          fBodyAccJerk.std...Z.Average               
        Free Body Acceleration jerk mean frequency along 3 axes:
          fBodyAccJerk.meanFreq...X.Average          
          fBodyAccJerk.meanFreq...Y.Average          
          fBodyAccJerk.meanFreq...Z.Average           
        Free Body gyroscopic mean along 3 axes:
          fBodyGyro.mean...X.Average                 
          fBodyGyro.mean...Y.Average                  
          fBodyGyro.mean...Z.Average                 
        Free Body gyroscopic standard deviation along 3 axes:
          fBodyGyro.std...X.Average                  
          fBodyGyro.std...Y.Average                  
          fBodyGyro.std...Z.Average                 
        Free Body gyroscopic mean frequency along 3 axes:
          fBodyGyro.meanFreq...X.Average              
          fBodyGyro.meanFreq...Y.Average              
          fBodyGyro.meanFreq...Z.Average             
          fBodyAccMag.mean...Average                 
          fBodyAccMag.std...Average                 
          fBodyAccMag.meanFreq...Average             
          fBodyBodyAccJerkMag.mean...Average          
          fBodyBodyAccJerkMag.std...Average          
          fBodyBodyAccJerkMag.meanFreq...Average     
          fBodyBodyGyroMag.mean...Average          
          fBodyBodyGyroMag.std...Average             
          fBodyBodyGyroMag.meanFreq...Average        
          fBodyBodyGyroJerkMag.mean...Average        
          fBodyBodyGyroJerkMag.std...Average        
          fBodyBodyGyroJerkMag.meanFreq...Average    
          angle.tBodyAccMean.gravity..Average        
          angle.tBodyAccJerkMean..gravityMean..Average
          angle.tBodyGyroMean.gravityMean..Average   
          angle.tBodyGyroJerkMean.gravityMean..Average
          angle.Y.gravityMean..Average                
          angle.Z.gravityMean..Average  
          
License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
        