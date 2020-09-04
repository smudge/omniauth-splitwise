require 'spec_helper'

describe "OmniAuth::Strategies::Splitwise" do
  subject do
    OmniAuth::Strategies::Splitwise.new(nil)
  end

  context 'client options' do
    it 'has correct provider name' do
      subject.options.name eq('splitwise')
    end

    it 'has correct Splitwise site' do
      subject.options.client_options.site.should eq('https://secure.splitwise.com/')
    end

    it 'has correct callback uri' do
      subject.callback_path.should eq('/auth/splitwise/callback')
    end

    it 'has correct token path' do
      subject.client.options[:token_url].should eq('/oauth/token')
    end

    it 'has correct authorize path' do
      subject.client.options[:authorize_url].should eq('/oauth/authorize')
    end
  end

  context '#uid' do
    before :each do
      subject.stub(
        raw_info: {
          'id' => '123',
          'first_name' => 'Marie',
          'last_name' => 'Curie',
          'email' => 'mc@example.org',
          'other_data' => 0o12345,
        },
      )
    end

    it 'returns the id from user_data' do
      subject.uid.should eq('123')
      subject.info['first_name'].should eq('Marie')
      subject.info['last_name'].should eq('Curie')
      subject.info['email'].should eq('mc@example.org')
      subject.extra['other_data'].should eq(0o12345)
    end
  end
end
