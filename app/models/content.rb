class Content < ActiveRecord::Base
  def file
    self["sid"] + File.extname(self["name"])
  end
end
