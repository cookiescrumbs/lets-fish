module Homepage
  def fisheries_with_waters(limit:)
    Fishery.includes(:waters).where.not('waters.id' => nil).limit(limit)
  end
end