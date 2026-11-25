# frozen_string_literal: true

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

    it 'has correct authorization scheme' do
      expect(subject.client.options[:auth_scheme]).to eq(:request_body)
    end
  end

  describe 'user response' do
    it 'extracts the user from the API response' do
      user = { 'id' => 123, 'email' => 'mc@example.org' }
      response = instance_double(OAuth2::Response, parsed: { 'user' => user })
      token = instance_double(OAuth2::AccessToken)
      allow(subject).to receive(:access_token).and_return(token) # rubocop:disable RSpec/SubjectStub
      allow(token).to receive(:get).with('/api/v3.0/get_current_user').and_return(response)

      expect(subject.uid).to eq(123)
      expect(subject.info['email']).to eq('mc@example.org')
      expect(subject.extra['id']).to eq(123)
      expect(token).to have_received(:get).once
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
