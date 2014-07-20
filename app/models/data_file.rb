# class DataFile < ActiveRecord::Base
#   def self.save(upload)
#     name =  upload['datafile'].original_filename
#     directory = "public/data"
#     # create the file path
#     path = File.join(directory, name)
#     # write the file
#     File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
#   end
# end

# The above function will take CGI object upload and will extract uploaded file name using helper function original_filename and finally it will store uploaded file into "public/data" directory. You can call helper function content_type to know media type of the uploaded file.

# Here File is a ruby object and join is a helper function will concatenate directory name alongwith file name and will return full file path.

# Next, to open a file in write mode we are using open helper function provided by File object. Further we are reading data from the passed data file and writing into output file.
