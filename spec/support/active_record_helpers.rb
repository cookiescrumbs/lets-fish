module ActiveRecordHelpers
  def waters
    @waters ||= Water.all
  end
end
