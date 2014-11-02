describe "Home page", type: :request do
  
  it "has a page route" do
    visit '/'
    expect(page.status_code).to eql 200
  end

end