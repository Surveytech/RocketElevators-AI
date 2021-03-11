require 'dropbox'

# dbx = Dropbox::Client.new('')

# folder = dbx.create_folder('/folder_Felix') # => Dropbox::FolderMetadata
# folder.id # => "id:a4ayc_80_OEAAAAAAAAAXz"
# folder.name # => "myfolder"
# folder.path_lower # => "/myfolder"

# file = dbx.upload('/folder_Felix/file.txt', 'file body') # => Dropbox::FileMetadata
# file.size # => 9
# file.rev # => a1c10ce0dd78

# file, body = dbx.download('/folder_Felix/file.txt') # => Dropbox::FileMetadata, HTTP::Response::Body
# body.to_s # => "file body"

# dbx.delete('/myfolder/file.txt') # => Dropbox::FileMetadata
