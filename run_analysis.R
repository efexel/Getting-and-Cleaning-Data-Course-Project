# Getting and Cleaning Data Course Project

##### Configuration and setup
## Uncomment and set if you prefer a different working directory
setwd("~/Desktop/Coursera/Data\ Science/3\ -\ Getting\ and\ Cleaning\ Data/Course\ Project/")
input_data_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
output_file_name <- "tidy.txt"

# Require/install prerequisites
load_prerequisites <- function(packages){
    for(package in packages) {
        if (!require(package, character.only = TRUE))
          install.packages(package)
        require(package, character.only = TRUE)
    }
}

# Given a URL pointing to a zip file, checks to see if the file, or extracted
# folder from the file exists in the current directory, and if not, downloads
# and extracts it.  Returns the directory name.
get_extract_file <- function(url){
    file = basename(URLdecode(url))
    datadir <- gsub(".zip", "", file)
    if(!file.exists(datadir)) {
        message(sprintf("Did not find '%s' directory", datadir))
        if(!file.exists(file)){
            msg = sprintf("Downloading '%s' from %s...", file, url)
            message(msg)
            download.file(url=url, destfile=file, mode="w", method="curl")
            if(!file.exists(file)){
                message(sprintf("Error %s", msg))
                quit(1)
            } else {
                # Keep a record of when this data was downloaded
                fc <- file(sprintf("%s-date-downloaded.txt", datadir))
                writeLines(date(), fc)
                close(fc)
            }
        } else {
            message("Found zip file...")
        }
        message("Unzipping file...")
        unzip(file)
    }
    return(datadir)
}

# Extracts only the measurements on the mean and standard deviation for each
# measurement from the test and train data sets, returning a merged data set.
merge_data_sets <- function(datadir){
    ## Requirements 1-4 are handled in this function.  For purposes of
    ## efficiency, they are not handled in numeric order.

    ## Import and clean up feature names for readability and use as variables
    # Title case the m and d in mean()/std(), remove parens and trailing - if
    # present.  Use perl's regex syntax in order to title case mean/std to
    # Mean/Std for readability as column names
    features <- gsub("-(m|s)(.*)\\(\\)-?",
                     read.table(sprintf("%s/features.txt", datadir))[,2],
                     replacement="\\U\\1\\L\\2", perl=TRUE)

    ## Requirement #2: Extracts only the measurements on the mean and standard
    ## deviation for each measurement.
    # Create vector of indices of columns containing 'Mean' or 'Std'.  We
    # can use this later to filter the data for both data sets.
    # We are only extracting the original measurements for time/frequency.
    output_features <- features[grep("^(f|t).*(Mean|Std)", features)]

    ## Read activity labels
    activity_labels <- read.table(sprintf("%s/activity_labels.txt", datadir),
                                  col.names = c("id", "name"))

    # Loop through the test and train data sets.  For each data set, read the
    # data from the 3 files (subject_%s.txt, X_%s.txt, and y_%s.txt), append
    # the activity, names, and merge the 3 files into a single data frame
    # named after the source data set.
    for (source in c("test", "train")){
        message(sprintf("Processing %s data...", source))
        ## Requirement #4: Appropriately labels the data set with descriptive
        ## variable names. This is satisfied by the col.names parameters to
        ## read.table below
        subject <- read.table(
            sprintf("%s/%s/subject_%s.txt", datadir, source, source),
            col.names = "subject_id")
        # Note: Data is filtered here as per requirement #2, using the
        # output_features vector created above.
        data <- read.table(
            sprintf("%s/%s/X_%s.txt", datadir, source, source),
            col.names = features, check.names = FALSE)[,output_features]
        activities <- read.table(
            sprintf("%s/%s/y_%s.txt", datadir, source, source),
            col.names = "activity_id")

        ## Requirement #3: Uses descriptive activity names to name the
        ## activities in the data set.
        # Add activity names to activities data frame
        activities$activity_name <- activity_labels$name[
            match(activities$activity_id, activity_labels$id)]
        # Create a variable named train or test that contains the frames
        # above merged into a single frame
        assign(source, cbind(subject, activities, data))
    }
    ## Requirement #1: Merges the training and the test sets to create one
    ## data set.
    message("Merging data sets...")
    return(rbind(train, test))
}

# Create tidy data set
create_tidy_set <- function(datadir, output_file_name) {
    # Requirement 5 is satisfied by this function

    # First handle requirements 1-4...
    data <- merge_data_sets(datadir)

    # Output column names for use by the CodeBook
    #fc <- file("CodeBook.columns.txt")
    #writeLines(colnames(data), fc)
    #close(fc)

    ## Requirement #5: From the data set in step 4, creates a second,
    ## independent tidy data set with the average of each variable for each
    ## activity and each subject.

    message("Pivoting data...")
    # Pivot the values of the data into individual rows, keeping the
    # identifier columns passed as id intact, resulting in a data frame
    # containing the following columns:
    #   "subject_id", "activity_id", "activity_name", "variable", "value"
    pivoted_data <- melt(data, id = c(
                         "subject_id", "activity_id", "activity_name"))
    message("Creating tidy data set...")
    # Output the mean of all the values for each variable
    tidy <- dcast(pivoted_data,
                  subject_id + activity_name ~ variable, mean)
    # write the tidy data out to a file in the current working directory
    message(sprintf("Writing tidy data set to '%s'...", output_file_name))
    write.table(tidy, file = output_file_name)
}

load_prerequisites(c("data.table", "reshape2"))
datadir <- get_extract_file(input_data_url)
create_tidy_set(datadir, output_file_name)
