module Sample
  RSpec.describe Github do
    context '#search' do
      it 'can show parameters' do
        params = Github.search :all
        expect(params).not_to be_empty
      end

      it 'can be done successfully' do
        response = Github.search q: 'basecamp'
        expect(response).not_to include('total_count' => 0)
        expect(response).not_to include('items' => [])
      end
    end
  end
end
