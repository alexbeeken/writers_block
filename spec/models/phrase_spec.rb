require 'rails_helper'

describe Phrase do
  it { should belong_to :upload }
end
