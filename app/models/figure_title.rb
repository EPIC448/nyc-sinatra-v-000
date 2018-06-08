class FigureTitle < ActiveRecord::Base
  belongs_to :figure
  belongs_to :title
end

#this is created using Rake -T... Make sure it installed in your Gemfile
