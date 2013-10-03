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

    it "should adjust number_of_peers param to 1 when negative value supplied" do
      @institution = create(:institution)
      @institution.unit_id = "654321"
      create(:institution, unit_id: "123456")
      create(:institution, unit_id: "223456")
      create(:institution, unit_id: "323456")
      create(:institution, unit_id: "423456")
      create(:institution, unit_id: "523456")
      
      get :new, unit_id: @institution.unit_id, number_of_peers: -1, format: :json
      json = JSON.parse(response.body)
      
      expect(json.count).to eq(1)
    end

    it "should adjust number_of_peers param to 50 when values over 50 supplied" do
      @institution = create(:institution)
      create(:institution, unit_id: "123456")
      create(:institution, unit_id: "223456")
      create(:institution, unit_id: "323456")
      create(:institution, unit_id: "423456")
      create(:institution, unit_id: "523456")
      create(:institution, unit_id: "123456")
      create(:institution, unit_id: "223456")
      create(:institution, unit_id: "323456")
      create(:institution, unit_id: "423456")
      create(:institution, unit_id: "523456")
      create(:institution, unit_id: "123456")
      create(:institution, unit_id: "223456")
      create(:institution, unit_id: "323456")
      create(:institution, unit_id: "423456")
      create(:institution, unit_id: "523456")
      create(:institution, unit_id: "123456")
      create(:institution, unit_id: "223456")
      create(:institution, unit_id: "323456")
      create(:institution, unit_id: "423456")
      create(:institution, unit_id: "523456")
      create(:institution, unit_id: "123456")
      create(:institution, unit_id: "223456")
      create(:institution, unit_id: "323456")
      create(:institution, unit_id: "423456")
      create(:institution, unit_id: "523456")
      create(:institution, unit_id: "123456")
      create(:institution, unit_id: "223456")
      create(:institution, unit_id: "323456")
      create(:institution, unit_id: "423456")
      create(:institution, unit_id: "523456")
      create(:institution, unit_id: "123456")
      create(:institution, unit_id: "223456")
      create(:institution, unit_id: "323456")
      create(:institution, unit_id: "423456")
      create(:institution, unit_id: "523456")
      create(:institution, unit_id: "123456")
      create(:institution, unit_id: "223456")
      create(:institution, unit_id: "323456")
      create(:institution, unit_id: "423456")
      create(:institution, unit_id: "523456")
      create(:institution, unit_id: "123456")
      create(:institution, unit_id: "223456")
      create(:institution, unit_id: "323456")
      create(:institution, unit_id: "423456")
      create(:institution, unit_id: "523456")
      create(:institution, unit_id: "123456")
      create(:institution, unit_id: "223456")
      create(:institution, unit_id: "323456")
      create(:institution, unit_id: "423456")
      create(:institution, unit_id: "523456")
      create(:institution, unit_id: "123456")
      create(:institution, unit_id: "223456")
      create(:institution, unit_id: "323456")
      create(:institution, unit_id: "423456")
      create(:institution, unit_id: "523456")
      create(:institution, unit_id: "123456")
      create(:institution, unit_id: "223456")
      create(:institution, unit_id: "323456")
      create(:institution, unit_id: "423456")
      create(:institution, unit_id: "523456")

      get :new, unit_id: @institution.unit_id, number_of_peers: 100, format: :json

      json = JSON.parse(response.body)
      
      expect(json.count).to eq(50)
    end
end