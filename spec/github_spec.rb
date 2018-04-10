RSpec.describe Sample::Github do
  context '#search' do
    it 'can show parameters' do
      params = Sample::Github.search :all
      expect(params).not_to be_empty
    end

    it 'can be done successfully' do
      response = Sample::Github.search q: 'basecamp'
      expect(response).not_to include('total_count' => 0)
      expect(response).not_to include('items' => [])
    end
  end
end
