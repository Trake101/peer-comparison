require 'spec_helper'

describe Api::V1::ComparisonsController do
  
    it "should return 422 code with error msg via json if unit_id param not specified" do
      get :new, number_of_peers: "10", format: :json
            
      json = JSON.parse(response.body)
      expect(json['status']).to eq(422)
      expect(json['errors']).to eq("invalid number of params")
    end

    it "should return 422 code with error msg via json if number_of_peers param not specified" do
      get :new, unit_id: "123456", format: :json
            
      json = JSON.parse(response.body)
      expect(json['status']).to eq(422)
      expect(json['errors']).to eq("invalid number of params")
    end

    it "should return 422 code with error msg via json if unit_id is blank" do
      @institution = create(:institution)
      @institution.unit_id = "654321"

      get :new, unit_id: "", number_of_peers: 10, format: :json
            
      json = JSON.parse(response.body)
      expect(json['status']).to eq(422)
      expect(json['errors']).to eq("Invalid or blank IPEDS id (unit_id)")
    end

    it "should return 422 code with error msg via json if unit_id is invalid" do
      @institution = create(:institution)
      #@institution.unit_id = "654321"

      get :new, unit_id: "1234567894", number_of_peers: 10, format: :json
            
      json = JSON.parse(response.body)
      expect(json['status']).to eq(422)
      expect(json['errors']).to eq("Invalid or blank IPEDS id (unit_id)")
    end

    it "should return a 200 status code in response to a valid request" do
      @institution = create(:institution)
      create(:institution, unit_id: "123456")
      create(:institution, unit_id: "223456")
      create(:institution, unit_id: "323456")
      create(:institution, unit_id: "423456")
      create(:institution, unit_id: "523456")

      get :new, unit_id: @institution.unit_id, number_of_peers: 10, format: :json
     
      expect(response.status).to eq(200)
    end

    it "should adjust number_of_peers param to value between 1 and 50" do
      #TODO
    end
end

=begin
describe Api::V1::ComparisonsController, "required parameters" do

	it 'requires unit_id and number_of_peers parameters' do

		get '/api/v1/comparisons/new?unit_id=441900&number_of_peers=3'

		expect(response).to be_success
	end

  it 'responds with correct copmarison group' do
    #FactoryGirl.create_list(:message, 10)
ges
    get 

    expect(response).to be_success            # test for the 200 status-code
    json = JSON.parse(response.body)
    expect(json['comparisons'].length).to eq(10) # check to make sure the right amount of comparisons are returned
  end

end
=end