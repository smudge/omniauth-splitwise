require 'spec_helper'

describe "OmniAuth::Strategies::Splitwise" do
  subject do
    OmniAuth::Strategies::Splitwise.new(nil)
  end

  context 'client options' do
    it 'has correct provider name' do
      expect(subject.options.name).to eq('splitwise')
    end

    it 'has correct Splitwise site' do
      expect(subject.options.client_options.site).to eq('https://secure.splitwise.com/')
    end

    it 'has correct callback uri' do
      expect(subject.callback_path).to eq('/auth/splitwise/callback')
    end

    it 'has correct token path' do
      expect(subject.client.options[:token_url]).to eq('oauth/token')
    end

    it 'has correct authorize path' do
      expect(subject.client.options[:authorize_url]).to eq('oauth/authorize')
    end
  end

  describe '#uid' do
    before :each do
      allow(subject).to receive(:raw_info).and_return( # rubocop:disable RSpec/SubjectStub
        'id' => '123',
        'first_name' => 'Marie',
        'last_name' => 'Curie',
        'email' => 'mc@example.org',
        'other_data' => 0o12345,
      )
    end

    it 'returns the id from user_data' do
      expect(subject.uid).to eq('123')
      expect(subject.info['first_name']).to eq('Marie')
      expect(subject.info['last_name']).to eq('Curie')
      expect(subject.info['email']).to eq('mc@example.org')
      expect(subject.extra['other_data']).to eq(0o12345)
    end
  end
end
