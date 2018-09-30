class AttachmentUploader < Shrine
    plugin :determine_mime_type, analyzer: :mime_types
    Attacher.validate do
        validate_max_size 3.megabyte, message: "is too large (max is 3 MB)"
        validate_mime_type_inclusion ['image/jpg', 'image/jpeg', 'image/png']
    end
end