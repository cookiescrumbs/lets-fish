class CreateFishery
  attr_reader :model

  def initialize(params)
    @params = params
    @model = Fishery.new(permited_params)
  end
    
  def create?
    @model.save
  end

  private

  def permited_params
    @params.require(:fishery).permit(:name, contact_details_attributes: [ :name, :telephone, :mobile, :email, :website], address_attributes: [ :postcode, :street, :line2, :region, :country ])
  end

end