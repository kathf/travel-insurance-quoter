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

  describe '#edit' do
    let(:quote) { create(:quote) }
    specify 'that the page loads successfully' do
      get :edit, id: quote.id
      expect(response).to be_success
      expect(response).to render_template('edit')
    end
  end

  describe '#create' do
    context 'valid attributes' do
      let!(:attrs)   { attributes_for(:quote) }

      specify 'that a quote is created' do
        expect { post :create, quote: attrs }.to change { Quote.count }.by(1)
      end

      specify 'that the user is redirected' do
        post :create, quote: attrs
        expect(response).to redirect_to(quote_url(Quote.last))
      end
    end

    context 'invalid attributes' do
      let(:attrs) { { dob: '', trip_start: '', trip_end: '' } }

      specify 'that' do
        # expect { Authentication.create_with_omniauth!(nil, nil) }.to raise_error
      end

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
    let(:quote) { Quote.create(dob: 35.years.ago, trip_start: 20.days.from_now, trip_end: 40.days.from_now) }
    let(:policy) { create(:policy) }

    before do
      quote.policy_id = policy.id
      quote.save!
    end

    specify 'that the show page loads successfully' do
      get :show, id: quote.id
      expect(response).to be_success
      expect(response).to render_template('show')
    end
  end

  describe '#update' do
    context 'valid attributes' do
      let!(:quote)  { Quote.create(dob: 40.years.ago, trip_start: 67.days.from_now, trip_end: 68.days.from_now) }
      let(:attrs)   { { dob: 35.years.ago, trip_start: 20.days.from_now, trip_end: 40.days.from_now } }

      specify 'that a quote is updated' do
        expect { put :update, id: quote.id, quote: attrs }.to change { Quote.find(quote.id).dob }
      end

      specify 'that the user is redirected' do
        put :update, quote: attrs, id: quote.id
        expect(response).to redirect_to(quote_url(quote.id))
      end
    end

    context 'invalid attributes' do
      let!(:quote) { create(:quote) }
      let(:attrs) { { dob: '', trip_start: '', trip_end: '' } }

      specify 'that a quote is NOT updated' do
        expect { post :update, id: quote.id, quote: attrs }.to_not change { quote.dob }
      end

      specify 'that the form is rendered again' do
        post :update, id: quote.id, quote: attrs
        expect(response).to render_template('edit')
      end
    end

  end

end
