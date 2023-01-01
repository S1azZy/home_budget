# frozen_string_literal: true

RSpec.describe Documents::ExpenseOperations::CreateService do
  subject(:service) { described_class.new(person, params) }

  describe "#call" do
    subject(:result) { service.call }

    let(:person) { create(:person) }
    let(:person_wallet) { create(:person_wallet, person:) }
    let(:category) { create(:category) }
    let(:amount) { 10_000 }
    let(:transaction_time) { Time.zone.now }
    let(:comment) { "comment" }
    let(:event) { nil }

    before do
      create(:person_currency, person: person, currency: person_wallet.currency)
    end

    context "when params is correct" do
      let(:params) do
        {
          person_wallet_id: person_wallet.id,
          currency_id: person_wallet.currency_id,
          category_id: category.id,
          amount: amount,
          transaction_time: transaction_time.to_s,
          comment: comment,
          event: event
        }
      end

      it "creates document" do
        expect { result }.to change(Documents::ExpenseOperation, :count).by(1)
      end

      context "when event is provided" do
        let(:event) { "post_document" }
        let(:post_service) { instance_double(Documents::ExpenseOperations::PostService) }

        before do
          allow(Documents::ExpenseOperations::PostService).to receive(:new).and_return(post_service)
          allow(post_service).to receive(:call)
        end

        it "change document status" do
          expect { result }.to change(Documents::ExpenseOperation.posted, :count).by(1)
        end

        it "invoke post service" do
          result

          expect(post_service).to have_received(:call)
        end
      end
    end
  end
end
