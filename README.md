# Code Book
xtest : Contains the X_test file data
ytest : Contains the y_test file data
subtest : Contains the subject_test file data
xtrain : Contains the X_train file data
ytrain : Contains the y_train file data
subtrain : Contains the subject_train file data
act : Contains the activity_label file data
f : Contains the features file data
features_req:boolean vector having the list of where std() or mean() pattern is found in the features tables
testdata:contains xtest , ytest and subtest
traindata : contains xtrain, ytrain and subtrain
data3 : contains the testdata and traindata
actlabel : contains subject , id and activity_labels
measurelabel : contains all the labels other than actlabels
mdata : contains the melted data based on actlabels and measurelabel
fdata : has the tidy data
# Working of the script
First the X_test data is loaded in xtest followed by ytest and subtest. Then X_train data is loaded in xtrain followed by ytrain and subtrain.Then activity_labels are loaded followed by features. Then I find the rows where features match "std()" or "mean()" and store it in features_req .Then I add activity labels to the ytest and ytrain data.After that names of subtest and subtrain are given.
Then column bind is applied to xtest,ytest,subtest.Similarly it is performed for the trained data set.Then both the trained and test data set are merged together.Then this data is melted based on ids and measured values.Then the tidy set is created with the required for average calculation.
