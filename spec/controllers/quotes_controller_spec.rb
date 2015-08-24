require 'rails_helper'

RSpec.describe QuotesController, type: :controller do
  render_views

  describe '#new' do
    specify 'that the page loads successfully' do
      get :new
      expect(response).to be_success
      expect(response).to render_template('new')
    end
  end

  describe '#create' do
    context 'valid attributes' do
      let(:attrs) { attributes_for(:quote) }

      specify 'that a quote is created' do
        expect { post :create, quote: attrs }.to change { Quote.count }.by(1)
      end

      specify 'that the user is redirected' do
        post :create, quote: attrs
        expect(response).to redirect_to(quote_url(Quote.last))
      end
    end

    context 'invalid attributes' do
      let(:attrs) { { age: '', trip_days: '' } }

      specify 'that a quote is NOT created' do
        expect { post :create, quote: attrs }.to_not change { Quote.count }
      end

      specify 'that the form is rendered again' do
        post :create, quote: attrs
        expect(response).to render_template('new')
      end
    end
  end

  describe '#show' do
    let(:quote) { create(:quote) }

    specify 'that the show page loads successfully' do
      get :show, id: quote.id
      expect(response).to render_template('show')
    end
  end


end
