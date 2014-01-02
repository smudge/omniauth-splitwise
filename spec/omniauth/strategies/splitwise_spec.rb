require 'spec_helper'

describe "OmniAuth::Strategies::Splitwise" do
  subject do
    OmniAuth::Strategies::Splitwise.new(nil, @options || {})
  end

  context 'client options' do
    it 'has correct Splitwise site' do
      subject.options.client_options.site.should eq('https://secure.splitwise.com')
    end

    it 'has correct request token path' do
      subject.options.client_options.request_token_path.should eq('/api/v3.0/get_request_token')
    end

    it 'has correct access token path' do
      subject.options.client_options.access_token_path.should eq('/api/v3.0/get_access_token')
    end

    it 'has correct authorize path' do
      subject.options.client_options.authorize_path.should eq('/authorize')
    end
  end

  context '#uid' do
    before :each do
      subject.stub(:user_data) { { 'id' => '123', "other_data" => 012345 } }
    end

    it 'returns the id from user_data' do
      subject.uid.should eq('123')
      subject.info["id"].should eq("123")
      subject.info["other_data"].should eq(012345)
    end
  end
end
