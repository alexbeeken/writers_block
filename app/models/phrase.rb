# Phrase is a table containing:
#   1. The words returned from Clairfai API (:words)
#   2. The finished sentence which will be displayed. (:content)

class Phrase < ActiveRecord::Base
  belongs_to :upload
end
