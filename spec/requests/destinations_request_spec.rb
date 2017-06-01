require 'rails_helper'

describe 'destinations' do
  it "can return all destinations" do
    Destination.create(name: "Denver", zip: "80203", description: "mountains", image_url: "den.url")
    Destination.create(name: "St. Louis", zip: "63109", description: "a cool place", image_url: "stl.url")
    Destination.create(name: "San Francisco", zip: "90210", description: "golden gate bridge", image_url: "sf.url")

    get '/api/v1/destinations'

    expect(response).to be_success

    destinations = JSON.parse(response.body)

    expect(destinations.count).to eq(3)
    expect(destinations.first["id"]).to eq(Destination.first.id)
  end

  it "can return one destination" do
    Destination.create(name: "Denver", zip: "80203", description: "mountains", image_url: "den.url")

    get "/api/v1/destinations/#{Destination.last.id}"
    expect(response).to be_success

    destination = JSON.parse(response.body)

    expect(destination).to be_a(Hash)
    expect(destination["id"]).to eq(Destination.last.id)
  end

  it "can update existing destination" do
    Destination.create(name: "Denver", zip: "80203", description: "mountains", image_url: "den.url")

    put "/api/v1/destinations/#{Destination.last.id}?name=Denver2"

    expect(response).to be_success

    destination = JSON.parse(response.body)

    expect(destination).to be_a(Hash)
    expect(destination["name"]).to eq("Denver2")
  end

  it "can create new destination" do
    post "/api/v1/destinations?name=st.louis&description=arch"

    expect(response).to be_success

    destination = JSON.parse(response.body)

    expect(destination).to be_a(Hash)
    expect(destination["message"]).to eq("Successfully created destination.")
    expect(destination["destination"]["name"]).to eq("st.louis")
  end

  it "can delete exisiting destination" do
    Destination.create(name: "Denver", zip: "80203", description: "mountains", image_url: "den.url")

    delete "/api/v1/destinations/#{Destination.last.id}"

    expect(response).to be_success

    expect(Destination.count).to eq(0)
  end
end