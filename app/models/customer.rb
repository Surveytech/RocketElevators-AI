class Customer < ApplicationRecord
    has_one :user
    has_one :address
    has_many :building

    after_create :dropbox_file

    private 

    def dropbox_file

        #dbx = Dropbox::Client.new('FhuKAHEcOXsAAAAAAAAAAcst4lCatrvUE1ZDplH3l6Z7EVSoqT1vfGyCoMrURZjR')
            
        begin
            folder = dbx.create_folder("/#{self.company_email}") # => Dropbox::FolderMetadata
        rescue => exception
            
        end

        file = dbx.upload("/#{self.company_email}/file1.txt", "file body") # => Dropbox::FileMetadata

    end

end
