require 'rails_helper'

describe Upload do
  it { should have_attached_file(:image) }
  it { should validate_attachment_content_type(:image)
    .allowing('image/jpg')
    .rejecting('text/plain', 'text/xml', 'image/png') }
end
